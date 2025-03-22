package com.pie.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.pie.dao.AccountDAO;
import com.pie.dao.AddressDao;
import com.pie.dao.AnnualTurnoverDao;
import com.pie.dao.BankDetailsDao;
import com.pie.dao.CompanyContactPersonDao;
import com.pie.dao.CompanyDao;
import com.pie.dao.ProfessionalInformationDao;
import com.pie.dao.ProjectManagerExperienceDao;
import com.pie.dao.ProjectManagerRefrenceDao;
import com.pie.entity.Account;
import com.pie.entity.Address;
import com.pie.entity.AnnualTurnover;
import com.pie.entity.BankDetails;
import com.pie.entity.Company;
import com.pie.entity.CompanyContactPerson;
import com.pie.entity.CompanyDocument;
import com.pie.entity.ProfessionalInformation;
import com.pie.entity.ProjectManagerExperience;
import com.pie.entity.ProjectManagerRefrence;
import com.pie.model.BuyerDetails;
import com.pie.model.PMDetails;
import com.pie.model.PMRefrenceModel;
import com.pie.model.SellerModel;
import com.pie.util.Constants;
import com.pie.util.NewDateFormatter;
import com.pie.util.StringUtil;

@Service
public class ProfileServiceImpl implements ProfileService {
	
	@Autowired
	private VerificationTokenService verificationTokenService;

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private OnBoardingService onBoardingService;
	
	@Autowired
	private AnnualTurnoverDao annualTurnoverDao;

	@Autowired
	private CompanyContactPersonDao companyContactPersonDao;

	@Autowired
	private BankDetailsDao bankDetailsDao;

	@Autowired
	private NewDateFormatter dateFormatter;

	@Autowired
	private Environment env;

	@Autowired
	private AddressDao addressDao;

	@Autowired
	private AccountDAO accountDAO;

	@Autowired
	private ProjectManagerExperienceDao projectManagerExperienceDao;

	@Autowired
	private ProjectManagerRefrenceDao projectManagerRefrenceDao;

	@Autowired
	private ProfessionalInformationDao professionalInformationDao;

	// PM
	@Override
	public HashMap<String, Object> updateOrSavePMPersonalDetails(PMDetails pmDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Account account = accountDAO.getAccountBasedOnId(pmDetails.getAccountId());
			account.setFullName(pmDetails.getName());
			if(!StringUtil.isNullOrEmpty(pmDetails.getEmail()) && !pmDetails.getEmail().equals(account.getEmailId())) {
				account.setEmailId(pmDetails.getEmail());
				account.setEmailVerified(false);
				verificationTokenService.registerVerificationToken(account,true);
			}
			account.setMobileNumber(pmDetails.getPhone());
			accountDAO.update(account);
			Company company = companyDao.getCompanyWithId(pmDetails.getCompanyId());
			company.setCompanyIndustry(pmDetails.getIndustry());
			company.setIndustryExpertise(pmDetails.getExpertise());
			companyDao.update(company);
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updatePMResume(PMDetails pmDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {

			Company company = new Company();
			company.setCompanyId(pmDetails.getCompanyId());
			List<CompanyDocument> pmDocumentsList = new ArrayList<>();
			Date todayDate = new Date();
			String path = env.getProperty("image.upload.path");

			// Upload or Update Resume
			if (pmDetails.getResume() != null && !pmDetails.getResume().isEmpty()) {
				onBoardingService.updateOrSaveCertification(company, pmDetails.getResumeId(), pmDetails.getResume(),
						Constants.PM_RESUME, pmDocumentsList, todayDate, path);
			}
			if (pmDetails.getSingatureDocument() != null && !pmDetails.getSingatureDocument().isEmpty()) {
				onBoardingService.updateOrSaveCertification(company, pmDetails.getSignatureDocumentId(), pmDetails.getSingatureDocument(),
						Constants.SIGNATURE, pmDocumentsList, todayDate, path);
			}

			Boolean isUpdated = onBoardingService.updateCompanyDocumentList(pmDocumentsList);
			response.put("status", isUpdated ? "true" : "false");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateOrSavePMLegalDetails(PMDetails pmDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(pmDetails.getCompanyId());
			company.setGstNo(pmDetails.getGstNo());
			company.setPanNo(pmDetails.getPanNo());
			companyDao.update(company);
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> saveOrUpdatePMExperience(PMDetails pmDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			boolean isUpdate = true;
			ProjectManagerExperience pmExperience = projectManagerExperienceDao
					.getPMExperiencesByIdAndAccountId(pmDetails.getExp_id(), pmDetails.getAccountId());
			if (pmExperience == null) {
				pmExperience = new ProjectManagerExperience();
				pmExperience.setAccountId(pmDetails.getAccountId());
				pmExperience.setCompanyId(pmDetails.getCompanyId());
				isUpdate = false;
			}
			pmExperience.setAccountId(pmDetails.getAccountId());
			pmExperience.setNoOfProjectHandled(pmDetails.getExp_projectsHandled());
			pmExperience.setProjectsComplexity(pmDetails.getExp_projectsComplexity());
			pmExperience.setDescription(pmDetails.getExp_description());
			if (isUpdate) {
				projectManagerExperienceDao.update(pmExperience);
			} else {
				projectManagerExperienceDao.save(pmExperience);
			}
			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> saveOrUpdatePMReference(PMDetails pmDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			// Get the list of IDs from the PMRefrenceModel list
			List<Integer> referenceIds = pmDetails.getPmRefrenceModels().stream().filter(pm -> pm.getId() != null)
					.map(PMRefrenceModel::getId).collect(Collectors.toList());

			Map<Integer, ProjectManagerRefrence> existingReferencesMap = new HashMap<>();
			if (!referenceIds.isEmpty()) {
				List<ProjectManagerRefrence> existingReferences = projectManagerRefrenceDao
						.getPMRefrencesByLsitIdAccountId(referenceIds, pmDetails.getAccountId());
				existingReferencesMap = existingReferences.stream()
						.collect(Collectors.toMap(ProjectManagerRefrence::getId, Function.identity()));
			}

			// Save or update PM references
			List<ProjectManagerRefrence> refrenceSaveTO = new ArrayList<>();
			for (PMRefrenceModel pm : pmDetails.getPmRefrenceModels()) {
				ProjectManagerRefrence pmReference = existingReferencesMap.getOrDefault(pm.getId(),
						new ProjectManagerRefrence());
				pmReference.setAccountId(pmDetails.getAccountId());
				pmReference.setCompanyId(pmDetails.getCompanyId());
				pmReference.setName(pm.getName());
				pmReference.setCompanyName(pm.getCompanyName());
				pmReference.setEmail(pm.getEmail());
				pmReference.setPhoneNo(pm.getPhone());

				refrenceSaveTO.add(pmReference);
			}
			projectManagerRefrenceDao.saveAll(refrenceSaveTO);

			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateOrSavePMAddress(PMDetails pmDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = new Company();
			company.setCompanyId(pmDetails.getCompanyId());
			Address address;
			if (pmDetails.getAddressId() != null) {
				address = addressDao.getAddressById(pmDetails.getAddressId());
				if (address == null) {
					response.put("status", "false");
					response.put("message", "Address not found");
					return response;
				}
			} else {
				address = new Address();
				address.setCompany(company);
			}

			address.setAddressLine1(pmDetails.getStreetAddress());
			address.setCity(pmDetails.getCity());
			address.setState(pmDetails.getState());
			address.setCountry(pmDetails.getCountry());
			address.setPincode(pmDetails.getPincode());

			if (pmDetails.getAddressId() == null) {
				addressDao.save(address);
			} else {
				addressDao.update(address);
			}

			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateOrSavePMProfessionalDetails(PMDetails pmDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			ProfessionalInformation professionalInformation = professionalInformationDao
					.getProfessionalInfoByCompanyId(pmDetails.getCompanyId());
			if (professionalInformation != null) {
				professionalInformation.setExperience(pmDetails.getCompanyExperience());
				professionalInformation
						.setCompanyName(StringUtil.convertListToPipeSeparatedString(pmDetails.getCompanyName()));
				professionalInformationDao.update(professionalInformation);
			}
			Company company = companyDao.getCompanyWithId(pmDetails.getCompanyId());
			company.setCompanyLinkedIn(pmDetails.getCompanyLinkedInUrl());
			companyDao.update(company);
			List<CompanyDocument> companyDocumentsList = new ArrayList<>();
			Date todayDate = new Date();
			String path = env.getProperty("image.upload.path");

			// Upload or Update Company Logo
			if (pmDetails.getRelevantDocuments() != null && !pmDetails.getRelevantDocuments().isEmpty()) {
				onBoardingService.updateOrSaveCertification(company, pmDetails.getRelevantDocumentId(),
						pmDetails.getRelevantDocuments(), Constants.PM_RELEVENT_CERITFICATE, companyDocumentsList, todayDate, path);
			}
			onBoardingService.updateCompanyDocumentList(companyDocumentsList);
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	// Buyer

	@Override
	public HashMap<String, Object> updateOrSaveBuyerCompanyDetails(BuyerDetails buyerDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company;
			if (buyerDetails.getCompanyId() != null) {
				company = companyDao.getCompanyWithId(buyerDetails.getCompanyId());
				if (company == null) {
					response.put("status", "false");
					response.put("message", "Company not found");
					return response;
				}
			} else {
				company = new Company();
			}

			company.setCompanyName(buyerDetails.getCompanyName());
			company.setCompanyEmail(buyerDetails.getCompanyEmail());
			company.setCompanyPhoneNo(buyerDetails.getCompanyPhone());
			company.setCompanyWebsite(buyerDetails.getCompanyWebsite());
			company.setCompanyIndustry(buyerDetails.getCompanyIndustry());
			company.setCompanyLinkedIn(buyerDetails.getCompanyLinkedInUrl());

			if (buyerDetails.getCompanyId() == null) {
				companyDao.save(company);
			} else {
				companyDao.update(company);
			}

			response.put("status", "true");
			response.put("message", "Company details saved successfully");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateOrSaveBuyerCompanyAddressDetails(BuyerDetails buyerDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Address address;
			if (buyerDetails.getAddressId() != null) {
				address = addressDao.getAddressById(buyerDetails.getAddressId());
				if (address == null) {
					response.put("status", "false");
					response.put("message", "Address not found");
					return response;
				}
			} else {
				address = new Address();
			}

			address.setAddressLine1(buyerDetails.getStreetAddress());
			address.setCity(buyerDetails.getCity());
			address.setState(buyerDetails.getState());
			address.setCountry(buyerDetails.getCountry());
			address.setPincode(buyerDetails.getPincode());

			if (buyerDetails.getAddressId() == null) {
				address.setCompany(companyDao.getCompanyWithId(buyerDetails.getCompanyId()));
				addressDao.save(address);
			} else {
				addressDao.update(address);
			}

			response.put("status", "true");
			response.put("message", "Company address details saved successfully");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateOrSaveBuyerContactPersonDetails(BuyerDetails buyerDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			CompanyContactPerson contactPerson;
			if (buyerDetails.getContactPersonId() != null) {
				contactPerson = companyContactPersonDao.getCompanyContactByIdAndType(buyerDetails.getContactPersonId(),
						buyerDetails.getCompanyId(), Constants.COMPANY_CONTACT_PERSON);
				if (contactPerson == null) {
					response.put("status", "false");
					response.put("message", "Contact person not found");
					return response;
				}
			} else {
				contactPerson = new CompanyContactPerson();
				contactPerson.setCompany(companyDao.getCompanyWithId(buyerDetails.getCompanyId()));
				contactPerson.setType(Constants.COMPANY_CONTACT_PERSON);
			}

			contactPerson.setContactName(buyerDetails.getContactPersonName());
			contactPerson.setContactDesignation(buyerDetails.getContactPersonDesignation());
			contactPerson.setContactEmailId(buyerDetails.getContactPersonEmail());
			contactPerson.setContactPhoneNo(buyerDetails.getContactPersonPhone());

			if (buyerDetails.getContactPersonId() == null) {
				companyContactPersonDao.save(contactPerson);
			} else {
				companyContactPersonDao.update(contactPerson);
			}

			response.put("status", "true");
			response.put("message", "Contact person details saved successfully");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateOrSaveBuyerLegalInformation(BuyerDetails buyerDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(buyerDetails.getCompanyId());
			if (company == null) {
				response.put("status", "false");
				response.put("message", "Company not found");
				return response;
			}

			company.setTypeOfCompany(buyerDetails.getTypeOfBusinessEntity());
			company.setBuisnessRegNumber(buyerDetails.getBuisnessRegNumber());
			if (buyerDetails.getCountry().equals(Constants.COUNTRY_US)) {
				company.setTaxIdNumber(buyerDetails.getTaxIdNumber());

			} else {
				company.setGstNo(buyerDetails.getGstNo());

			}

			companyDao.update(company);

			response.put("status", "true");
			response.put("message", "Legal information saved successfully");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateOrSaveBuyerBankDetails(BuyerDetails buyerDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			BankDetails bankDetails;
			if (buyerDetails.getCompanyBankId() != null) {
				bankDetails = bankDetailsDao.getBankDetailById(buyerDetails.getCompanyBankId());
				if (bankDetails == null) {
					response.put("status", "false");
					response.put("message", "Bank details not found");
					return response;
				}
			} else {
				bankDetails = new BankDetails();
				bankDetails.setCompanyId(buyerDetails.getCompanyId());
			}

			bankDetails.setBankName(buyerDetails.getCompanyBankName());
			bankDetails.setAccountNo(buyerDetails.getCompanyAccountNumber());
			
			if (buyerDetails.getCountry().equals(Constants.COUNTRY_US)) {
				bankDetails.setRoutingNumber(buyerDetails.getCompanyRoutingNumber());
			} else {
				bankDetails.setIfscCode(buyerDetails.getCompanyIfscCode());
			}

			if (buyerDetails.getCompanyBankId() == null) {
				bankDetailsDao.save(bankDetails);
			} else {
				bankDetailsDao.update(bankDetails);
			}

			 // Set Annual Turnover
	        if (buyerDetails.getAnnualTurnoverId() != null) {
	            AnnualTurnover annualTurnover = annualTurnoverDao.getAnnualTurnoversById(buyerDetails.getAnnualTurnoverId(), buyerDetails.getCompanyId());
	            if (annualTurnover != null) {
	                annualTurnover.setTurnover(buyerDetails.getAnnualTurnoverValue());
	                annualTurnoverDao.update(annualTurnover);
	            } else {
	            	response.put("status", "false");
					response.put("message", "Annual Turnover not found with this id.");

	            }
	        } else if (buyerDetails.getAnnualTurnoverValue() != null) {
	            AnnualTurnover newAnnualTurnover = new AnnualTurnover();
	            Company company = new Company();
	            company.setCompanyId(buyerDetails.getCompanyId());
	            newAnnualTurnover.setCompany(company);
	            newAnnualTurnover.setTurnover(buyerDetails.getAnnualTurnoverValue());
	            annualTurnoverDao.save(newAnnualTurnover);
	        }
			response.put("status", "true");
			response.put("message", "Bank details & Annual Turnover saved successfully");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> saveOrUpdateBuyerCompanyDocuments(BuyerDetails buyerDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(buyerDetails.getCompanyId());
			if (company == null) {
				response.put("status", "false");
				response.put("message", "Company not found");
				return response;
			}

			List<CompanyDocument> companyDocumentsList = new ArrayList<>();
			Date todayDate = new Date();
			String path = env.getProperty("image.upload.path");

			// Upload or Update Company Logo
			if (buyerDetails.getCompanyLogo() != null && !buyerDetails.getCompanyLogo().isEmpty()) {
				onBoardingService.updateOrSaveCertification(company, buyerDetails.getCompanyLogoId(),
						buyerDetails.getCompanyLogo(), Constants.COMPANY_LOGO, companyDocumentsList, todayDate, path);
			}

			// Upload or Update Company Signature
			if (buyerDetails.getCompanySignature() != null && !buyerDetails.getCompanySignature().isEmpty()) {
				onBoardingService.updateOrSaveCertification(company, buyerDetails.getCompanySignatureId(),
						buyerDetails.getCompanySignature(), Constants.SIGNATURE, companyDocumentsList, todayDate, path);
			}

			Boolean isUpdated = onBoardingService.updateCompanyDocumentList(companyDocumentsList);
			response.put("status", isUpdated ? "true" : "false");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	// Seller

	@Override
	public HashMap<String, Object> updateCompanyDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());

			company.setCompanyIndustry(sellerModel.getIndustryClassificaiton());
			company.setIndustryExpertise(sellerModel.getIndustryExpertise());
			company.setCompanyName(sellerModel.getCompanyName());
			company.setCompanyWebsite(sellerModel.getCompanyWebsite());
			company.setCompanyPhoneNo(sellerModel.getCompanyPhone());
			company.setCompanyEmail(sellerModel.getCompanyEmail());
			company.setCompanyLinkedIn(sellerModel.getCompanyLinkedInUrl());

			companyDao.update(company);

			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateCompanyAddress(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			onBoardingService.updateAddress(company, sellerModel);
			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateContactPersons(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			onBoardingService.updateContactPersons(company, sellerModel);
			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerLegalDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			company.setTypeOfCompany(sellerModel.getTypeOfCompany());
			company.setBuisnessRegNumber(sellerModel.getBuisnessRegNumber());
			if (!StringUtil.isNullOrEmpty(sellerModel.getRegistrationDate())) {
				company.setRegisterationDate(dateFormatter.parseStringDate(sellerModel.getRegistrationDate()));
			}
			if (sellerModel.getCountry().equals(Constants.COUNTRY_US)) {

				company.setDunsNumber(sellerModel.getDunsNumber());
				company.setTaxIdNumber(sellerModel.getTaxIdNumber());
			} else {
				company.setGstNo(sellerModel.getGstNo());
				company.setPanNo(sellerModel.getPanNo());
			}
			companyDao.update(company);
			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}


	@Override
	public HashMap<String, Object> updateSellerOEMAndProductDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			company.setIsSupplyingToOEM(sellerModel.getIsSupplyingToOEM());
			Boolean isProductUpdated = onBoardingService.updateProducts(company, sellerModel);
			Boolean isOEMUpdated = null;
			if(sellerModel.getIsSupplyingToOEM()) {
			isOEMUpdated = onBoardingService.updateOEMModels(company, sellerModel);
			}
			companyDao.update(company);
			response.put("productstatus", isProductUpdated ? "true" : "false");
			response.put("oemstatus", isOEMUpdated ? "true" : "false");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerCustomerDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			Boolean isUpdated = onBoardingService.updateMajorCustomers(company, sellerModel, new Date());
			response.put("status", isUpdated ? "true" : "false");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerExporterAndLogisticDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			company.setIsLogisticServiceProvider(sellerModel.getIsLogisticServiceProvider());
			Boolean isLogisticUpdated = null;
			if(sellerModel.getIsSupplyingToOEM()) {
			isLogisticUpdated = onBoardingService.updateLogisticServiceProviders(company, sellerModel);
			}
			Boolean isExporterUpdated = null;
			company.setIsExporter(sellerModel.getIsExporter());
			if(sellerModel.getIsSupplyingToOEM()) {
			isExporterUpdated = onBoardingService.updateExporterList(company, sellerModel);
			}
			companyDao.update(company);
			response.put("logisticstatus", isLogisticUpdated ? "true" : "false");
			response.put("exporterstatus", isExporterUpdated ? "true" : "false");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerW9Form(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			onBoardingService.updateW9SubmissionForm(company, sellerModel);
			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerBankDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			onBoardingService.updateBankDetails(company, sellerModel);
			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerTurnoverDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			onBoardingService.updateAnnualTurnover(company, sellerModel);
			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerFactoryDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			response = onBoardingService.saveSellerTechnicalDetails(sellerModel);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerCertifications(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			response = onBoardingService.saveSellerCertificates(sellerModel);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerReferences(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			List<CompanyDocument> companyDocumentsList = new ArrayList<>();
			Date todaDate = new Date();
			Company company = new Company();
			company.setCompanyId(sellerModel.getCompanyId());

			String path = env.getProperty("image.upload.path");
			onBoardingService.updateOrSaveCertification(company, sellerModel.getProjectCaseStudiesId(),
					sellerModel.getProjectCaseStudiesFile(), Constants.COMPANY_PROJECT_CASE_STUDY, companyDocumentsList, todaDate, path);
			
			onBoardingService.updateOrSaveCertification(company, sellerModel.getSignatureId(),
					sellerModel.getSignatureFile(), Constants.SIGNATURE, companyDocumentsList, todaDate, path);
			Boolean isUpdated = onBoardingService.updateCompanyDocumentList(companyDocumentsList);
			
			onBoardingService.saveSellerRefrences(sellerModel);
			response.put("status", isUpdated ? "true" : "false");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerCustomerContact(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			onBoardingService.updateOrSaveCompanyCustomerContact(sellerModel, company);
			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerPermission(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			response = onBoardingService.saveSellerPermissions(sellerModel, false);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerPermissionSignature(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			response = onBoardingService.updateOrSavePermissionSignatureFile(sellerModel);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateBuyerPersonalDetails(BuyerDetails buyerDetails) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Account account = accountDAO.getAccountBasedOnId(buyerDetails.getAccountId());
			account.setFullName(getFullName(buyerDetails.getFirstName(), buyerDetails.getLastName()));
			account.setFirstName(buyerDetails.getFirstName());
			account.setLastName(buyerDetails.getLastName());
			if(!StringUtil.isNullOrEmpty(buyerDetails.getPersonalEmail()) && !buyerDetails.getPersonalEmail().equals(account.getEmailId())) {
				account.setEmailId(buyerDetails.getPersonalEmail());
				account.setEmailVerified(false);
				verificationTokenService.registerVerificationToken(account,true);
			}
			if (buyerDetails.getUserCountry().equalsIgnoreCase(Constants.COUNTRY_IN)
					|| buyerDetails.getUserCountry().equalsIgnoreCase(Constants.COUNTRY_US)) {
				account.setCountry(buyerDetails.getUserCountry());
			} else {
				response.put("status", "false");
				response.put("message", "Country Not Available");
				return response;
			}
			accountDAO.update(account);
			response.put("status", "true");
			response.put("data", account);
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> updateSellerPersonalDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Account account = accountDAO.getAccountBasedOnId(sellerModel.getAccountId());
			account.setFirstName(sellerModel.getFirstName());
			account.setLastName(sellerModel.getLastName());
			account.setFullName(getFullName(sellerModel.getFirstName(), sellerModel.getLastName()));
			if(!StringUtil.isNullOrEmpty(sellerModel.getPersonalEmail()) && !sellerModel.getPersonalEmail().equals(account.getEmailId())) {
				account.setEmailId(sellerModel.getPersonalEmail());
				account.setEmailVerified(false);
				verificationTokenService.registerVerificationToken(account,true);
			}
			if (sellerModel.getUserCountry().equalsIgnoreCase(Constants.COUNTRY_IN)
					|| sellerModel.getUserCountry().equalsIgnoreCase(Constants.COUNTRY_US)) {
				account.setCountry(sellerModel.getUserCountry());
			} else {
				response.put("status", "false");
				response.put("message", "Country Not Available");
				return response;
			}
			accountDAO.update(account);
			response.put("status", "true");
			response.put("data", account);
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	
	private String getFullName(String firstName, String lastName) {
		String fullName = firstName;
		if (!StringUtil.isNullOrEmpty(lastName)) {
			fullName += " " + lastName;
		}
		return fullName;
	}

}
