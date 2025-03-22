package com.pie.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.mail.MessagingException;

import com.pie.model.PMRefrenceModel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pie.dao.AccountDAO;
import com.pie.dao.AddressDao;
import com.pie.dao.AnnualTurnoverDao;
import com.pie.dao.BankDetailsDao;
import com.pie.dao.CompanyContactPersonDao;

import com.pie.dao.CompanyDao;
import com.pie.dao.CompanyDocumentDao;
import com.pie.dao.CustomerDao;
import com.pie.dao.CustomerTestimonialDao;
import com.pie.dao.ExportToDao;
import com.pie.dao.FacilityDao;
import com.pie.dao.FactoryDao;
import com.pie.dao.LogisticDao;
import com.pie.dao.NotificationDao;
import com.pie.dao.OemDao;
import com.pie.dao.ParticipationPermissionDao;
import com.pie.dao.ProductDao;
import com.pie.dao.ProfessionalInformationDao;
import com.pie.dao.ProjectManagerExperienceDao;
import com.pie.dao.ProjectManagerRefrenceDao;
import com.pie.dto.AddressDTO;
import com.pie.dto.CustomerDTO;
import com.pie.email.EmailBody;
import com.pie.entity.Account;
import com.pie.entity.Address;
import com.pie.entity.AnnualTurnover;
import com.pie.entity.BankDetails;
import com.pie.entity.Company;

import com.pie.entity.CompanyContactPerson;
import com.pie.entity.CompanyDocument;
import com.pie.entity.Customer;
import com.pie.entity.CustomerTestimonial;
import com.pie.entity.ExportsTo;
import com.pie.entity.Facility;
import com.pie.entity.Factory;
import com.pie.entity.LogisticServiceProvider;
import com.pie.entity.Notification;
import com.pie.entity.OEMofCompany;
import com.pie.entity.ParticipationPermission;
import com.pie.entity.Product;
import com.pie.entity.ProfessionalInformation;
import com.pie.entity.ProjectManagerExperience;
import com.pie.entity.ProjectManagerRefrence;
import com.pie.model.AnnualTurnoverModel;
import com.pie.model.BuyerDetails;
import com.pie.model.ContactPersonModel;
import com.pie.model.CustomerModel;
import com.pie.model.ExporterModel;
import com.pie.model.FacilityModel;
import com.pie.model.FactoryModel;
import com.pie.model.OemModel;
import com.pie.model.ProductModel;
import com.pie.model.SellerModel;
import com.pie.model.PMDetails;
import com.pie.model.PermissionModel;
import com.pie.util.Constants;
import com.pie.util.EmailSender;
import com.pie.util.NewDateFormatter;
import com.pie.util.StringUtil;
import com.pie.util.USER_ROLES;
import com.pie.util.UploadUtil;

@Service
public class OnBoardingServiceImpl implements OnBoardingService {
	private static final Logger logger = LoggerFactory.getLogger(OnBoardingServiceImpl.class);

	@Autowired
	private AccountDAO accountDAO;

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private NotificationDao notificationDao;

	@Autowired
	private ProfessionalInformationDao professionalInformationDao;

	@Autowired
	private ParticipationPermissionDao participationPermissionDao;

	@Autowired
	private CustomerTestimonialDao customerTestimonialDao;

	@Autowired
	private ProjectManagerExperienceDao projectManagerExperienceDao;

	@Autowired
	private ProjectManagerRefrenceDao projectManagerRefrenceDao;

	@Autowired
	private UploadUtil uploadUtil;

	@Autowired
	private NewDateFormatter dateFormatter;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private LogisticDao logisticDao;

	@Autowired
	private ExportToDao exportToDao;

	@Autowired
	private CompanyDocumentDao companyDocumentDao;

	@Autowired
	private AnnualTurnoverDao annualTurnoverDao;

	@Autowired
	private AddressDao addressDao;

	@Autowired
	private FactoryDao factoryDao;

	@Autowired
	private FacilityDao facilityDao;

	@Autowired
	private CompanyContactPersonDao companyContactPersonDao;

	@Autowired
	private BankDetailsDao bankDetailsDao;

	@Autowired
	private OemDao oemDao;

	@Autowired
	private Environment env;

	@Autowired
	private EscrowService escrowService;

	@Autowired
	private EmailSender emailSender;

	@Override
	public HashMap<String, String> saveBuyerOnboardingDetails(BuyerDetails buyerDetails) {
		HashMap<String, String> response = new HashMap<String, String>();
		try {
			// Save Company
			Company company = new Company();

			Account account = accountDAO.getAccountBasedOnId(buyerDetails.getAccountId());
			company.setAccountId(account.getUserId());

			// company Details
			company.setCompanyName(buyerDetails.getCompanyName());
			company.setCompanyEmail(buyerDetails.getCompanyEmail());
			company.setCompanyPhoneNo(buyerDetails.getCompanyPhone());
			company.setCompanyWebsite(buyerDetails.getCompanyWebsite());
			company.setCompanyIndustry(buyerDetails.getCompanyIndustry());
			company.setCompanyLinkedIn(buyerDetails.getCompanyLinkedInUrl());
			company.setTypeOfCompany(buyerDetails.getCompanyType());
			company.setDeclerationDate(dateFormatter.parseStringDate(buyerDetails.getDeclerationDate()));
			company.setIsNotificationsAllowed(buyerDetails.getGetIsNotificationsAllowed());
			// File Upload Path
			String path = env.getProperty("image.upload.path");

			List<CompanyDocument> companyDocumentsList = new ArrayList<>();
			// Upload Company Logo
			if (buyerDetails.getCompanyLogo() != null && buyerDetails.getCompanyLogo().getSize() != 0) {
				CompanyDocument companyLogo = new CompanyDocument();
				companyLogo.setCompany(company);
				companyLogo.setDate(new Date());
				companyLogo.setDocName(Constants.COMPANY_LOGO);
				companyLogo.setDocPath(uploadUtil.uploadToDirectory(buyerDetails.getCompanyLogo(), path));
				companyDocumentsList.add(companyLogo);
			}

			// Uploading Company Signature
			if (buyerDetails.getCompanySignature() != null && buyerDetails.getCompanySignature().getSize() != 0) {
				CompanyDocument companySignature = new CompanyDocument();
				companySignature.setCompany(company);
				companySignature.setDate(new Date());
				companySignature.setDocName(Constants.SIGNATURE);
				companySignature.setDocPath(uploadUtil.uploadToDirectory(buyerDetails.getCompanySignature(), path));
				companyDocumentsList.add(companySignature);
			}
			if (!companyDocumentsList.isEmpty()) {
				company.setCompanyDocuments(companyDocumentsList);
			}

			company.setBuisnessRegNumber(buyerDetails.getBuisnessRegNumber());
			if (buyerDetails.getCountry().equals(Constants.COUNTRY_US)) {
				company.setTaxIdNumber(buyerDetails.getTaxIdNumber());

			} else {
				company.setGstNo(buyerDetails.getGstNo());

			}
			// Contact Person Details
			CompanyContactPerson companyContactPerson = new CompanyContactPerson();
			companyContactPerson.setContactName(buyerDetails.getContactPersonName());
			companyContactPerson.setContactDesignation(buyerDetails.getContactPersonDesignation());
			companyContactPerson.setContactEmailId(buyerDetails.getContactPersonEmail());
			companyContactPerson.setContactPhoneNo(buyerDetails.getContactPersonPhone());
			companyContactPerson.setCompany(company);
			companyContactPerson.setType(Constants.COMPANY_CONTACT_PERSON);
			company.setCompanyContactPersons(Arrays.asList(companyContactPerson));

			company.setCnergyType(buyerDetails.getUserRole());

			// Save Address
			Address address = new Address();
			address.setAddressLine1(buyerDetails.getStreetAddress());
			address.setCity(buyerDetails.getCity());
			address.setState(buyerDetails.getState());
			address.setCountry(buyerDetails.getCountry());
			address.setPincode(buyerDetails.getPincode());
			address.setCompany(company);
			// Adding in Company
			company.setAddresses((Arrays.asList(address)));

			// Saving Company
			companyDao.save(company);

			// Save AnnualTurnover
			if (buyerDetails.getAnnualTurnoverValue() != null) {
				AnnualTurnover annualTurnover = new AnnualTurnover();
				annualTurnover.setCompany(company);
				annualTurnover.setAddedOn(new Date());
				annualTurnover.setTurnover(buyerDetails.getAnnualTurnoverValue());
				annualTurnover.setFinancialYear(buyerDetails.getTurnoverFinancialYear());
				annualTurnoverDao.save(annualTurnover);
			}

			// Save BankDetails
			if (!StringUtil.isNullOrEmpty(buyerDetails.getCompanyBankName())) {
				BankDetails bankDetails = new BankDetails();
				bankDetails.setBankName(buyerDetails.getCompanyBankName());
				bankDetails.setAccountNo(buyerDetails.getCompanyAccountNumber());
				if (buyerDetails.getCountry().equals(Constants.COUNTRY_US)) {
					bankDetails.setRoutingNumber(buyerDetails.getCompanyRoutingNumber());
				} else {
					bankDetails.setIfscCode(buyerDetails.getCompanyIfscCode());
				}
				bankDetails.setCompanyId(company.getCompanyId());
				bankDetailsDao.save(bankDetails);
			}

			account.setCompanyId(company.getCompanyId());
			account.setIsOnboardingComplete(true);
			accountDAO.update(account);
			sendAccountCreationEmail(account.getFullName(), account.getEmailId(), account.getUserRole());
			creatingNotification(account.getFullName());
			CustomerDTO customerDTO = new CustomerDTO();
			customerDTO.setEmail(account.getEmailId());
			customerDTO.setFirstName(account.getFirstName());
			customerDTO.setLastName(account.getLastName());
			customerDTO.setPhoneNumber(account.getMobileNumber());
			AddressDTO addressDTO = new AddressDTO();
			addressDTO.setCity(address.getCity());
			addressDTO.setCountry(address.getCountry());
			addressDTO.setLine1(address.getAddressLine1());
			addressDTO.setPostCode(address.getPincode());
			addressDTO.setState(address.getState());
			customerDTO.setAddress(addressDTO);
			CustomerDTO savedCustomer = escrowService.createCustomer(customerDTO);
			response.put("status", "true");
			response.put("companyId", company.getCompanyId().toString());
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
			return response;
		}
	}

	@Override
	public HashMap<String, Object> saveSellerCompanyDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Account account = accountDAO.getAccountBasedOnId(sellerModel.getAccountId());
			// Currently Commenting below line, as Back button from onboarding removed, so
			// if back button comes again we need to update existing company else create new
			// company every time.
			// boolean isExistingCompany = account.getCompanyId() != null;
			boolean isExistingCompany = false;
			Company company = getOrCreateCompany(account, sellerModel, isExistingCompany);

			// Update the Account
			account.setIsOnboardingComplete(false);
			account.setCompanyId(company.getCompanyId());
			accountDAO.update(account);

			response.put("status", "true");
			response.put("companyId", company.getCompanyId());
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
			return response;
		}
	}

	private Company getOrCreateCompany(Account account, SellerModel sellerModel, boolean isExistingCompany)
			throws IllegalStateException, IOException {
		Company company = null;
		if (isExistingCompany) {
			company = companyDao.getCompanyWithId(account.getCompanyId());

		}
		// Company company = account.getCompanyId() != null ?
		// companyDao.getCompanyWithId(account.getCompanyId()) : null;
		if (company == null) {
			// Create a new Company
			company = new Company();
			company.setAccountId(account.getUserId());
		}

		// Update the Company details
		company.setCompanyIndustry(sellerModel.getIndustryClassificaiton());
		company.setIndustryExpertise(sellerModel.getIndustryExpertise());
		company.setCompanyName(sellerModel.getCompanyName());
		company.setCompanyEmail(sellerModel.getCompanyEmail());
		company.setCompanyPhoneNo(sellerModel.getCompanyPhone());
		company.setCompanyWebsite(sellerModel.getCompanyWebsite());
		company.setCompanyLinkedIn(sellerModel.getCompanyLinkedInUrl());
		company.setCnergyType(sellerModel.getUserRole());

		if (isExistingCompany) {

			companyDao.update(company);
		} else {
			//Temp till back button implemented
			companyDao.removePastCompanyOfAccountId(account.getUserId());
			companyDao.save(company);
		}

		// Update Company Logo
		updateCompanyLogo(company, sellerModel);

		// Update Contact Persons
		updateContactPersons(company, sellerModel);

		if (!StringUtil.isNullOrEmpty(sellerModel.getStreetAddress())
				&& !StringUtil.isNullOrEmpty(sellerModel.getCity())
				&& !StringUtil.isNullOrEmpty(sellerModel.getPincode())) {

			// Update Address
			updateAddress(company, sellerModel);
		}
		// Set the generated IDs back into the SellerModel

		return company;
	}

	@Override
	public void updateCompanyLogo(Company company, SellerModel sellerModel) throws IllegalStateException, IOException {
		String path = env.getProperty("image.upload.path");
		if (sellerModel.getCompanyLogo() != null && sellerModel.getCompanyLogo().getSize() != 0) {
			String contentType = sellerModel.getCompanyLogo().getContentType();
			if (contentType != null && contentType.startsWith("image/") && !contentType.equals("image/gif")) {
				CompanyDocument companyLogo = null;
				boolean isLogoIdPresent = sellerModel.getCompanyLogoId() != null;
				if (isLogoIdPresent) {
					companyLogo = companyDocumentDao.getCompanyDocumentById(sellerModel.getCompanyLogoId(),
							company.getCompanyId());
					if (companyLogo == null) {
						throw new IllegalArgumentException(
								"Company Logo ID not found: " + sellerModel.getCompanyLogoId());
					}
				}

				if (companyLogo == null) {
					companyLogo = new CompanyDocument();
					companyLogo.setCompany(company);
				}

				companyLogo.setDate(new Date());
				companyLogo.setDocName(Constants.COMPANY_LOGO);
				companyLogo.setDocPath(uploadUtil.uploadToDirectory(sellerModel.getCompanyLogo(), path));
				if (isLogoIdPresent) {
					companyDocumentDao.update(companyLogo);
				} else {
					companyDocumentDao.save(companyLogo);

				}

			} else {
				throw new IllegalStateException("Invalid Company Logo FileType");
			}
		}
	}

	@Override
	public void updateContactPersons(Company company, SellerModel sellerModel) {
		List<Integer> contactPersonIds = new ArrayList<>();

		for (ContactPersonModel contactPersonModel : sellerModel.getContactPersonModels()) {
			if (contactPersonModel != null && contactPersonModel.getId() != null) {
				contactPersonIds.add(contactPersonModel.getId());
			}
		}

		Map<Integer, CompanyContactPerson> existingContactPersons = new HashMap<>();
		if (!contactPersonIds.isEmpty()) {
			List<CompanyContactPerson> existingContactPersonsList = companyContactPersonDao
					.getCompanyContactsByIdList(contactPersonIds, Constants.COMPANY_CONTACT_PERSON);
			existingContactPersons = existingContactPersonsList.stream()
					.collect(Collectors.toMap(CompanyContactPerson::getId, Function.identity()));
		}

		List<CompanyContactPerson> listToUpdateOrAddPerson = new ArrayList<>();

		for (ContactPersonModel contactPersonModel : sellerModel.getContactPersonModels()) {
			if (!StringUtil.isNullOrEmpty(contactPersonModel.getName())
					&& !StringUtil.isNullOrEmpty(contactPersonModel.getDesignation())) {
				CompanyContactPerson companyContactPerson = existingContactPersons.get(contactPersonModel.getId());
				if (companyContactPerson == null) {
					companyContactPerson = new CompanyContactPerson();
					companyContactPerson.setCompany(company);
				}
				companyContactPerson.setContactName(contactPersonModel.getName());
				companyContactPerson.setContactDesignation(contactPersonModel.getDesignation());
				companyContactPerson.setContactEmailId(contactPersonModel.getEmail());
				companyContactPerson.setContactPhoneNo(contactPersonModel.getPhone());
				companyContactPerson.setType(Constants.COMPANY_CONTACT_PERSON);
				listToUpdateOrAddPerson.add(companyContactPerson);
			}

			companyContactPersonDao.saveAll(listToUpdateOrAddPerson);

		}
	}

	@Override
	public void updateAddress(Company company, SellerModel sellerModel) {

		Address address = addressDao.getAddressById(sellerModel.getAddressId());
		boolean isNewAddress = false;
		if (address == null) {
			address = new Address();
			address.setCompany(company);
			isNewAddress = true;
		}

		address.setAddressLine1(sellerModel.getStreetAddress());
		address.setCity(sellerModel.getCity());
		address.setState(sellerModel.getState());
		address.setCountry(sellerModel.getCountry());
		address.setPincode(sellerModel.getPincode());
		if (isNewAddress) {
			addressDao.save(address);
		} else {
			addressDao.update(address);
		}
	}

	// Save Seller Legal Details

	@Override
	public HashMap<String, Object> saveSellerLegalDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		if (sellerModel.getCountry().equals(Constants.COUNTRY_US)) {

			if (StringUtil.isNullOrEmpty(sellerModel.getDunsNumber())) {
				response.put("status", "false");
				response.put("message", "DUNS No. Required");
				return response;
			}

			if (StringUtil.isNullOrEmpty(sellerModel.getTaxIdNumber())) {
				response.put("status", "false");
				response.put("message", "Tax Id No. Required");
				return response;
			}

			if (sellerModel.getW9SubmissionForm() == null || sellerModel.getW9SubmissionForm().isEmpty()) {
				response.put("status", "false");
				response.put("message", "W9 Submission Form Required");
				return response;
			}
		} else {
			if (StringUtil.isNullOrEmpty(sellerModel.getPanNo())) {
				response.put("status", "false");
				response.put("message", "PAN No. Required");
				return response;
			}

			if (StringUtil.isNullOrEmpty(sellerModel.getGstNo())) {
				response.put("status", "false");
				response.put("message", "GST No. Required");
				return response;
			}
		}
		try {
//			Account account = accountDAO.getAccountBasedOnId(sellerModel.getAccountId());
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			Date todayDate = new Date();
			// Update Company Details
			company.setTypeOfCompany(sellerModel.getTypeOfCompany());
			company.setBuisnessRegNumber(sellerModel.getBuisnessRegNumber());
			if (!StringUtil.isNullOrEmpty(sellerModel.getRegistrationDate())) {
				company.setRegisterationDate(dateFormatter.parseStringDate(sellerModel.getRegistrationDate()));
			}
			if (sellerModel.getCountry().equals(Constants.COUNTRY_US)) {

				company.setDunsNumber(sellerModel.getDunsNumber());
				company.setTaxIdNumber(sellerModel.getTaxIdNumber());

				// Update W9 Submission Form
				updateW9SubmissionForm(company, sellerModel);
			} else {
				company.setGstNo(sellerModel.getGstNo());
				company.setPanNo(sellerModel.getPanNo());
			}
			// Update Products
			updateProducts(company, sellerModel);

			company.setIsSupplyingToOEM(sellerModel.getIsSupplyingToOEM());

			if (sellerModel.getIsSupplyingToOEM()) {
				// Update OEM Models
				updateOEMModels(company, sellerModel);
			}

			// Update Major Customers
			updateMajorCustomers(company, sellerModel, todayDate);

			company.setIsLogisticServiceProvider(sellerModel.getIsLogisticServiceProvider());

			if (sellerModel.getIsLogisticServiceProvider()) {
				// Update Logistic Service Providers
				updateLogisticServiceProviders(company, sellerModel);
			}

			company.setIsExporter(sellerModel.getIsExporter());

			if (sellerModel.getIsExporter()) {
				// Update Exporter List
				updateExporterList(company, sellerModel);

			}
			// Update Company
			companyDao.update(company);

//			// Update the Account
//			account.setIsOnboardingComplete(false);
//			accountDAO.update(account);
			response.put("status", "true");
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
			return response;
		}
	}

	@Override
	public Boolean updateCompanyDocumentList(List<CompanyDocument> documentList) {
		return companyDocumentDao.saveAll(documentList);
	}

	@Override
	public Boolean updateProducts(Company company, SellerModel sellerModel) {
		// Get the product IDs mentioned in the SellerModel
		List<Integer> productIds = new ArrayList<>();
		for (ProductModel productModel : sellerModel.getProductsList()) {
			if (productModel != null && productModel.getId() != null) {
				productIds.add(productModel.getId());
			}
		}
		Map<Integer, Product> existingProductsMap = new HashMap<>();
		if (!productIds.isEmpty()) {
			List<Product> existingProducts = productDao.getProductsByIdList(productIds);
			existingProductsMap = existingProducts.stream()
					.collect(Collectors.toMap(Product::getId, Function.identity()));
		}

		// Create or update the products
		List<Product> productsToSave = new ArrayList<>();
		for (ProductModel productModel : sellerModel.getProductsList()) {
			Product product = existingProductsMap.get(productModel.getId());
			if (product == null) {
				product = new Product();
				product.setCompanyId(company.getCompanyId());
			}
			product.setName(productModel.getProductName());
			product.setDescription(productModel.getDescription());
			productsToSave.add(product);
		}

		return productDao.saveAll(productsToSave);
	}

	@Override
	public Boolean updateOEMModels(Company company, SellerModel sellerModel) throws ParseException {
		List<Integer> oemIds = new ArrayList<>();
		for (OemModel oemModel : sellerModel.getOemModels()) {
			if (oemModel != null && oemModel.getId() != null) {
				oemIds.add(oemModel.getId());
			}
		}
		Map<Integer, OEMofCompany> existingOEMsMap = new HashMap<>();
		if (!oemIds.isEmpty()) {
			List<OEMofCompany> existingOEMsList = oemDao.getOemsByIdList(oemIds);

			existingOEMsMap = existingOEMsList.stream()
					.collect(Collectors.toMap(OEMofCompany::getId, Function.identity()));
		}
		List<OEMofCompany> oemsToSave = new ArrayList<>();

		for (OemModel oemModel : sellerModel.getOemModels()) {

			OEMofCompany oem = existingOEMsMap.get(oemModel.getId());
			if (oem == null) {
				oem = new OEMofCompany();
				oem.setCompanyId(company.getCompanyId());
			}
			oem.setSupplyingTo(oemModel.getSupplyingTo());
			oem.setValue(oemModel.getValue());
			oem.setVendorRating(oemModel.getVendorRating());
			oem.setSupplierSince(oemModel.getSupplierSince());
			oemsToSave.add(oem);
		}

		return oemDao.saveAll(oemsToSave);
	}

	@Override
	public Boolean updateMajorCustomers(Company company, SellerModel sellerModel, Date todayDate) {
		List<Integer> customerIds = new ArrayList<>();
		for (CustomerModel customerModel : sellerModel.getMajorCustomers()) {
			if (customerModel != null && customerModel.getId() != null) {
				customerIds.add(customerModel.getId());
			}
		}
		Map<Integer, Customer> existingCustomersMap = new HashMap<>();
		if (!customerIds.isEmpty()) {
			List<Customer> existingCustomersList = customerDao.getCustomersByIdList(customerIds);
			existingCustomersMap = existingCustomersList.stream()
					.collect(Collectors.toMap(Customer::getId, Function.identity()));
		}
		List<Customer> customersToSave = new ArrayList<>();

		for (CustomerModel customerModel : sellerModel.getMajorCustomers()) {
			Customer customer = existingCustomersMap.get(customerModel.getId());
			if (customer == null) {
				customer = new Customer();
				customer.setCompanyId(company.getCompanyId());
				customer.setAddedOn(todayDate);
			}
			customer.setName(customerModel.getName());
			customer.setAddress(customerModel.getAddress());
			customer.setProductSupplied(customerModel.getProductSupplied());
			customersToSave.add(customer);
		}

		return customerDao.saveAll(customersToSave);
	}

	@Override
	public Boolean updateLogisticServiceProviders(Company company, SellerModel sellerModel) {
		List<Integer> providerIds = new ArrayList<>();
		for (CustomerModel providerModel : sellerModel.getLogisticServiceProvider()) {
			if (providerModel != null && providerModel.getId() != null) {
				providerIds.add(providerModel.getId());
			}
		}
		Map<Integer, LogisticServiceProvider> existingProvidersMap = new HashMap<>();
		if (!providerIds.isEmpty()) {

			List<LogisticServiceProvider> existingProviders = logisticDao
					.getLogisticServiceProvidersByIdList(providerIds);

			existingProvidersMap = existingProviders.stream()
					.collect(Collectors.toMap(LogisticServiceProvider::getId, Function.identity()));
		}
		List<LogisticServiceProvider> providersToSave = new ArrayList<>();

		for (CustomerModel providerModel : sellerModel.getLogisticServiceProvider()) {
			LogisticServiceProvider provider = existingProvidersMap.get(providerModel.getId());
			if (provider == null) {
				provider = new LogisticServiceProvider();
				provider.setCompanyId(company.getCompanyId());
			}
			provider.setName(providerModel.getName());
			provider.setAddress(providerModel.getAddress());
			providersToSave.add(provider);
		}

		return logisticDao.saveAll(providersToSave);
	}

	@Override
	public Boolean updateExporterList(Company company, SellerModel sellerModel) {
		List<Integer> exporterIds = new ArrayList<>();
		for (ExporterModel exportModel : sellerModel.getExporterList()) {
			if (exportModel != null && exportModel.getId() != null) {
				exporterIds.add(exportModel.getId());
			}
		}
		Map<Integer, ExportsTo> existingExportsMap = new HashMap<>();
		if (!exporterIds.isEmpty()) {

			List<ExportsTo> existingExports = exportToDao.getExportsToByIdList(exporterIds);
			existingExportsMap = existingExports.stream()
					.collect(Collectors.toMap(ExportsTo::getId, Function.identity()));
		}
		List<ExportsTo> exportsToSave = new ArrayList<>();

		for (ExporterModel exportModel : sellerModel.getExporterList()) {
			ExportsTo export = existingExportsMap.get(exportModel.getId());
			if (export == null) {
				export = new ExportsTo();
				export.setCompanyId(company.getCompanyId());
			}
			export.setProduct(exportModel.getProduct());
			export.setFinancialyear(exportModel.getFinancialYear());
			export.setCountry(exportModel.getCountry());
			export.setValue(exportModel.getValue());
			exportsToSave.add(export);
		}

		return exportToDao.saveAll(exportsToSave);
	}

	@Override
	public void updateW9SubmissionForm(Company company, SellerModel sellerModel)
			throws IllegalStateException, IOException {
		try {
			if (sellerModel.getW9SubmissionForm() != null && sellerModel.getW9SubmissionForm().getSize() != 0) {
				CompanyDocument w9Form = companyDocumentDao.getCompanyDocumentById(sellerModel.getW9SubmissionId(),
						company.getCompanyId());
				boolean isNew = false;
				if (w9Form == null) {
					w9Form = new CompanyDocument();
					w9Form.setCompany(company);
					w9Form.setDocName(Constants.COMPANY_W9SUBMISSION);
					isNew = true;
				}

				w9Form.setDate(new Date());
				w9Form.setDocPath(uploadUtil.uploadToDirectory(sellerModel.getW9SubmissionForm(),
						env.getProperty("image.upload.path")));

				if (isNew) {
					companyDocumentDao.save(w9Form);
				} else {
					companyDocumentDao.update(w9Form);
				}
			}
		} catch (Exception e) {
			logger.info(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

	// Save Seller Financial Details
	@Override
	public HashMap<String, Object> saveSellerFinancialDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		if (sellerModel.getCountry().equals(Constants.COUNTRY_US)) {

			if (StringUtil.isNullOrEmpty(sellerModel.getAccountType())) {
				response.put("status", "false");
				response.put("message", "Account Type Required");
				return response;
			}

			if (StringUtil.isNullOrEmpty(sellerModel.getRoutingNo())) {
				response.put("status", "false");
				response.put("message", "Routing No. Required");
				return response;
			}

		} else {
			if (StringUtil.isNullOrEmpty(sellerModel.getIfscCode())) {
				response.put("status", "false");
				response.put("message", "IFSC code Required");
				return response;
			}

		}
		try {
			// Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			// Update Bank Details
			updateBankDetails(company, sellerModel);
			// Update Annual Turnover
			updateAnnualTurnover(company, sellerModel);

			// Update Company
			companyDao.update(company);

			response.put("status", "true");
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", false);
			response.put("message", e.getLocalizedMessage());
			return response;
		}
	}

	@Override
	public void updateBankDetails(Company company, SellerModel sellerModel) {
		BankDetails bankDetails = bankDetailsDao.getBankDetailById(sellerModel.getBankId());
		boolean isNew = false;
		if (bankDetails == null) {
			bankDetails = new BankDetails();
			bankDetails.setCompanyId(company.getCompanyId());
			isNew = true;
		}

		bankDetails.setBankName(sellerModel.getBankName());
		bankDetails.setAccountNo(sellerModel.getAccountNo());
		if (sellerModel.getCountry().equals(Constants.COUNTRY_US)) {
			bankDetails.setRoutingNumber(sellerModel.getRoutingNo());
			bankDetails.setAccountType(sellerModel.getAccountType());
		} else {
			bankDetails.setIfscCode(sellerModel.getIfscCode());
		}
		if (isNew) {
			bankDetailsDao.save(bankDetails);
		} else {
			bankDetailsDao.update(bankDetails);
		}

	}

	@Override
	public void updateAnnualTurnover(Company company, SellerModel sellerModel) {
		List<Integer> turnoverIds = new ArrayList<>();
		for (AnnualTurnoverModel turnoverModel : sellerModel.getAnnualTurnoverList()) {
			if (turnoverModel != null && turnoverModel.getId() != null) {
				turnoverIds.add(turnoverModel.getId());
			}
		}
		Map<Integer, AnnualTurnover> existingTurnoversMap = new HashMap<>();
		if (!turnoverIds.isEmpty()) {
			List<AnnualTurnover> existingTurnovers = annualTurnoverDao.getAnnualTurnoversByIdList(turnoverIds);

			existingTurnoversMap = existingTurnovers.stream()
					.collect(Collectors.toMap(AnnualTurnover::getId, Function.identity()));
		}
		List<AnnualTurnover> annualTurnoversList = new ArrayList<>();

		// Create or update the turnovers
		for (AnnualTurnoverModel turnoverModel : sellerModel.getAnnualTurnoverList()) {
			AnnualTurnover turnover = existingTurnoversMap.get(turnoverModel.getId());
			if (turnover == null) {
				turnover = new AnnualTurnover();
				turnover.setCompany(company);
				turnover.setAddedOn(new Date());
			}
			turnover.setFinancialYear(turnoverModel.getFinancialYear());
			turnover.setTurnover(turnoverModel.getTurnover());
			annualTurnoversList.add(turnover);
		}
		annualTurnoverDao.saveAll(annualTurnoversList);
	}

	@Override
	public HashMap<String, Object> saveSellerTechnicalDetails(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			List<FactoryModel> factoryList = sellerModel.getFactoryList();

			// Collect all factory IDs
			List<Integer> factoryIds = factoryList.stream().filter(factoryModel -> factoryModel.getId() != null)
					.map(FactoryModel::getId).collect(Collectors.toList());

			// Fetch existing factories in bulk
			Map<Integer, Factory> existingFactoriesMap = new HashMap<>();
			if (!factoryIds.isEmpty()) {
				List<Factory> existingFactories = factoryDao.getFactoriesToByIdList(factoryIds);
				existingFactoriesMap = existingFactories.stream()
						.collect(Collectors.toMap(Factory::getId, Function.identity()));
			}

			for (FactoryModel factoryModel : factoryList) {
				Factory factory = existingFactoriesMap.getOrDefault(factoryModel.getId(), new Factory());
				factory.setCompanyId(sellerModel.getCompanyId());
				factory.setName(factoryModel.getFactoryName());
				factory.setAddress(factoryModel.getAddress());
				factory.setArea(factoryModel.getArea());
				factory.setTotalEmployees(factoryModel.getTotalEmployees());
				factory.setSupervisiors(factoryModel.getSupervisiors());
				factory.setEnggDegreeOrDiploma(factoryModel.getEnggDegreeOrDiploma());
				factory.setSkilledWorkers(factoryModel.getSkilledWorkers());
				factory.setDesignDepartment(factoryModel.getDesignDepartment());
				factory.setQualityAndInspection(factoryModel.getQualityAndInspection());

				List<Facility> facilitiesToSave = new ArrayList<>();

				if (factoryModel.getId() != null) {
					List<Integer> facilityIds = factoryModel.getFacilityList().stream()
							.filter(facilityModel -> facilityModel.getId() != null).map(FacilityModel::getId)
							.collect(Collectors.toList());

					Map<Integer, Facility> existingFacilitiesMap = new HashMap<>();
					if (!facilityIds.isEmpty()) {
						List<Facility> existingFacilities = facilityDao.getFacilitesToByIdAndFactoryIdList(facilityIds,
								factoryModel.getId());
						existingFacilitiesMap = existingFacilities.stream()
								.collect(Collectors.toMap(Facility::getId, Function.identity()));
					}

					for (FacilityModel facilityModel : factoryModel.getFacilityList()) {
						Facility facility = existingFacilitiesMap.get(facilityModel.getId());
						if (facility == null) {
							facility = new Facility();
							facility.setCompanyId(sellerModel.getCompanyId());
							facility.setFactory(factory);
						}
						facility.setDetails(facilityModel.getDetails());
						facility.setRemarks(facilityModel.getRemarks());
						facility.setType(facilityModel.getType());
						facility.setCompanyId(sellerModel.getCompanyId());
						facilitiesToSave.add(facility);
					}
				} else {
					for (FacilityModel facilityModel : factoryModel.getFacilityList()) {
						Facility facility = new Facility();
						facility.setCompanyId(sellerModel.getCompanyId());
						facility.setDetails(facilityModel.getDetails());
						facility.setRemarks(facilityModel.getRemarks());

						facility.setType(
								facilityModel.getType().equalsIgnoreCase("Inspection") ? Constants.FACILITY_INSPECTION
										: Constants.FACILITY_MACHINING);
						facility.setCompanyId(sellerModel.getCompanyId());
						facilitiesToSave.add(facility);
					}

				}
				// Save factory and facilities using the DAO method
				factoryDao.saveFactoryAndFacilities(factory, facilitiesToSave);
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
	public HashMap<String, Object> saveSellerCertificates(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();

		try {
			List<CompanyDocument> companyDocumentsList = new ArrayList<>();
			Date todaDate = new Date();
			Company company = new Company();
			company.setCompanyId(sellerModel.getCompanyId());

			String path = env.getProperty("image.upload.path");

			// Handle ISO Certification
			updateOrSaveCertification(company, sellerModel.getIsoCertificationId(),
					sellerModel.getIsoCertificationFile(), Constants.COMPANY_ISO_CERTIFICATION, companyDocumentsList,
					todaDate, path);

			// Handle AS Certification
			updateOrSaveCertification(company, sellerModel.getAsCertificationId(), sellerModel.getAsCertificationFile(),
					Constants.COMPANY_AS_CERTIFICATION, companyDocumentsList, todaDate, path);

			if (sellerModel.getCountry().equals(Constants.COUNTRY_US)) {
				// Handle OSHA Certification
				updateOrSaveCertification(company, sellerModel.getOshaCertificationId(),
						sellerModel.getOshaCertificationFile(), Constants.COMPANY_OSHA_COMPLIANCE, companyDocumentsList,
						todaDate, path);

				// Handle FDA Registration
				updateOrSaveCertification(company, sellerModel.getFdaRegisterationId(),
						sellerModel.getFdaRegisterationFile(), Constants.COMPANY_FDA_REGISTRATION, companyDocumentsList,
						todaDate, path);

				updateOrSaveCertification(company, sellerModel.getOtherCertificationsId(),
						sellerModel.getOtherCertificationsIndiaFile(), Constants.COMPANY_OTHER_CERTIFICATIONS_US,
						companyDocumentsList, todaDate, path);

			} else {

				updateOrSaveCertification(company, sellerModel.getIndianStandardsComplianceId(),
						sellerModel.getIndianStandardsComplianceFile(), Constants.COMPANY_INDIAN_STANDARDS_COMPLIANCE,
						companyDocumentsList, todaDate, path);

				updateOrSaveCertification(company, sellerModel.getEnvironmentalRegulationsComplianceId(),
						sellerModel.getEnvironmentalRegulationsComplianceFile(),
						Constants.COMPANY_ENVIRONMENTAL_REGULATIONS_COMPLIANCE, companyDocumentsList, todaDate, path);

				updateOrSaveCertification(company, sellerModel.getLaborLawComplianceId(),
						sellerModel.getLaborLawComplianceFile(), Constants.COMPANY_LABOR_LAW_COMPLIANCE,
						companyDocumentsList, todaDate, path);

				updateOrSaveCertification(company, sellerModel.getOtherCertificationsId(),
						sellerModel.getOtherCertificationsIndiaFile(), Constants.COMPANY_OTHER_CERTIFICATIONS_INDIA,
						companyDocumentsList, todaDate, path);

			}

			// Save all documents if there are any
			if (!companyDocumentsList.isEmpty()) {
				companyDocumentDao.saveAll(companyDocumentsList);
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
	public void updateOrSaveCertification(Company company, Integer certificationId, MultipartFile certificationFile,
			String certificationName, List<CompanyDocument> companyDocumentsList, Date todayDate, String path)
			throws IOException {
		CompanyDocument certificationDocument = null;
		if (certificationFile != null && certificationFile.getSize() > 0) {
			if (certificationId != null) {
				certificationDocument = companyDocumentDao.getCompanyDocumentById(certificationId,
						company.getCompanyId());
				if (certificationDocument == null) {
					throw new IllegalArgumentException(certificationName + " ID not found: " + certificationId);
				}
			} else {
				certificationDocument = new CompanyDocument();
				certificationDocument.setCompany(company);
			}

			certificationDocument.setDate(todayDate);
			certificationDocument.setDocName(certificationName);

			certificationDocument.setDocPath(uploadUtil.uploadToDirectory(certificationFile, path));
			// Adding in List to Bulk Save
			companyDocumentsList.add(certificationDocument);
		}

	}

	@Override
	public HashMap<String, Object> saveSellerRefrences(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();

		try {

			List<CompanyDocument> companyDocumentsList = new ArrayList<>();
			List<CustomerTestimonial> testimonialsList = new ArrayList<>();
			Date todayDate = new Date();
			String path = env.getProperty("image.upload.path");

			Company company = companyDao.getCompanyWithId(sellerModel.getCompanyId());
			company.setIsNotificationsAllowed(sellerModel.getGetIsNotificationsAllowed());
			// Check and save project case studies
			if (sellerModel.getProjectCaseStudiesFile() != null && !sellerModel.getProjectCaseStudiesFile().isEmpty()) {
				updateOrSaveCertification(company, sellerModel.getProjectCaseStudiesId(),
						sellerModel.getProjectCaseStudiesFile(), Constants.COMPANY_PROJECT_CASE_STUDY,
						companyDocumentsList, todayDate, path);
			}

			// Check and save signature
			if (sellerModel.getSignatureFile() != null && !sellerModel.getSignatureFile().isEmpty()) {
				updateOrSaveCertification(company, sellerModel.getSignatureId(), sellerModel.getSignatureFile(),
						Constants.SIGNATURE, companyDocumentsList, todayDate, path);
			}

			// Save declaration date in company
			if (sellerModel.getDeclarationDate() != null) {
				company.setDeclerationDate(dateFormatter.parseStringDate(sellerModel.getDeclarationDate()));
			}

			// Handle testimonials
			List<ProductModel> testimonialModels = sellerModel.getTestimonialsList();
			if (testimonialModels != null && !testimonialModels.isEmpty()) {
				List<Integer> testimonialIds = testimonialModels.stream()
						.filter(testimonial -> testimonial.getId() != null).map(ProductModel::getId)
						.collect(Collectors.toList());

				Map<Integer, CustomerTestimonial> existingTestimonialsMap = new HashMap<>();
				if (!testimonialIds.isEmpty()) {
					List<CustomerTestimonial> existingTestimonials = customerTestimonialDao
							.getCustomerTestimonialsByIdList(testimonialIds, company.getCompanyId());
					existingTestimonialsMap = existingTestimonials.stream()
							.collect(Collectors.toMap(CustomerTestimonial::getId, Function.identity()));
				}

				for (ProductModel testimonialModel : testimonialModels) {
					CustomerTestimonial customerTestimonial = existingTestimonialsMap.get(testimonialModel.getId());
					if (customerTestimonial == null) {
						customerTestimonial = new CustomerTestimonial();
						customerTestimonial.setCompany(company);
					}
					customerTestimonial.setDescription(testimonialModel.getDescription());
					testimonialsList.add(customerTestimonial);
				}
			}

			// Save all documents and testimonials
			if (!companyDocumentsList.isEmpty()) {
				companyDocumentDao.saveAll(companyDocumentsList);
			}
			if (!testimonialsList.isEmpty()) {
				customerTestimonialDao.saveAll(testimonialsList);
			}
			companyDao.update(company);
			Account account = accountDAO.getAccountByCompanyId(company.getCompanyId());
			CustomerDTO customerDTO = new CustomerDTO();
			customerDTO.setEmail(account.getEmailId());
			customerDTO.setFirstName(account.getFirstName());
			customerDTO.setLastName(account.getLastName());
			Address address = addressDao.getAddressByCompanyId(sellerModel.getCompanyId());
			AddressDTO addressDTO = new AddressDTO();
			if (address != null) {
				if (!StringUtil.isNullOrEmpty(address.getCity())) {
					addressDTO.setCity(address.getCity());
				}
				if (!StringUtil.isNullOrEmpty(address.getCountry())) {
					addressDTO.setCountry(address.getCountry());
				}
				if (!StringUtil.isNullOrEmpty(address.getAddressLine1())) {
					addressDTO.setLine1(address.getAddressLine1());
				}
				if (!StringUtil.isNullOrEmpty(address.getPincode())) {
					addressDTO.setPostCode(address.getPincode());
				}
				if (!StringUtil.isNullOrEmpty(address.getState())) {
					addressDTO.setState(address.getState());
				}
			}

			customerDTO.setAddress(addressDTO);
			CustomerDTO savedCustomer = escrowService.createCustomer(customerDTO);
			response.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}

		return response;
	}

	@Override
	public HashMap<String, Object> updateOrSavePermissionSignatureFile(SellerModel sellerModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = new Company();
			company.setCompanyId(sellerModel.getCompanyId());
			String path = env.getProperty("image.upload.path");
			PermissionModel permissionModel = sellerModel.getPermissionModel();

			ParticipationPermission participationPermission = participationPermissionDao
					.getParticipationPermissionById(permissionModel.getId());
			if (participationPermission == null) {
				response.put("status", "false");
				response.put("message", "No Permission Found With Id " + permissionModel.getId());
				return response;
			}
			// Handle signature file upload
			if (permissionModel.getSignatureFile() != null && !permissionModel.getSignatureFile().isEmpty()) {
				String signatureUrl = uploadUtil.uploadToDirectory(permissionModel.getSignatureFile(), path);
				participationPermission.setSignatureUrl(signatureUrl);
				participationPermissionDao.update(participationPermission);
			}
			response.put("status", "true");
			return response;
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
			return response;
		}
	}

	@Override
	public HashMap<String, Object> saveSellerPermissions(SellerModel sellerModel, boolean isOnboarding) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = new Company();
			company.setCompanyId(sellerModel.getCompanyId());
			Date todayDate = new Date();
			String path = env.getProperty("image.upload.path");
			PermissionModel permissionModel = sellerModel.getPermissionModel();

			ParticipationPermission participationPermission;
			if (permissionModel.getId() != null) {
				participationPermission = participationPermissionDao
						.getParticipationPermissionById(permissionModel.getId());
				if (participationPermission == null) {
					throw new IllegalArgumentException(
							"Permission Record With ID not found: " + permissionModel.getId());
				}
			} else {
				participationPermission = new ParticipationPermission();
				participationPermission.setCompanyId(sellerModel.getCompanyId());
			}

			// Update permission fields
			participationPermission.setPresentations(permissionModel.getPresentations());
			participationPermission.setNewsletters(permissionModel.getNewsletters());
			participationPermission.setCustomerProfileOnWeb(permissionModel.getCustomerProfileOnWeb());
			participationPermission.setRfp(permissionModel.getRfp());
			participationPermission
					.setOnlineDirectMarketingCampaigns(permissionModel.getOnlineDirectMarketingCampaigns());
			participationPermission.setSponsoredEvents(permissionModel.getSponsoredEvents());
			participationPermission.setCaseStudy(permissionModel.getCaseStudy());
			participationPermission.setWhitePaper(permissionModel.getWhitePaper());
			participationPermission.setBroadcastMedia(permissionModel.getBroadcastMedia());
			participationPermission.setPressAnalysts(permissionModel.getPressAnalysts());
			participationPermission.setCustomerTestimonialLetter(permissionModel.getCustomerTestimonialLetter());
			participationPermission.setCustomerTestimonialVideo(permissionModel.getCustomerTestimonialVideo());
			participationPermission.setSpeakingEngagement(permissionModel.getSpeakingEngagement());
			if (permissionModel.getDeclerationDate() != null) {
				participationPermission
						.setDeclerationDate(dateFormatter.parseStringDate(permissionModel.getDeclerationDate()));
			} else {
				participationPermission.setDeclerationDate(todayDate);
			}
			// Handle signature file upload
			if (permissionModel.getSignatureFile() != null && !permissionModel.getSignatureFile().isEmpty()) {
				String signatureUrl = uploadUtil.uploadToDirectory(permissionModel.getSignatureFile(), path);
				participationPermission.setSignatureUrl(signatureUrl);
			}

			if (permissionModel.getId() == null) {
				participationPermissionDao.save(participationPermission);
			} else {
				participationPermissionDao.update(participationPermission);
			}

			if (isOnboarding) {
				updateOrSaveCompanyCustomerContact(sellerModel, company);
			}
			Account account = accountDAO.getAccountBasedOnId(sellerModel.getAccountId());
			account.setIsOnboardingComplete(true);
			creatingNotification(account.getFullName());
			accountDAO.update(account);
			sendAccountCreationEmail(account.getFullName(), account.getEmailId(), account.getUserRole());
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Override
	public void updateOrSaveCompanyCustomerContact(SellerModel sellerModel, Company company) {
		CompanyContactPerson customerReferencePerson;
		if (sellerModel.getCustomerReferencePersonId() != null) {
			customerReferencePerson = companyContactPersonDao.getCompanyContactByIdAndType(
					sellerModel.getCustomerReferencePersonId(), sellerModel.getCompanyId(),
					Constants.COMPANY_CONTACT_CUSTOMER_REFERENCE);
			if (customerReferencePerson == null) {
				throw new IllegalArgumentException(
						"Customer Reference Person With ID not found: " + sellerModel.getCustomerReferencePersonId());
			}
		} else {
			customerReferencePerson = new CompanyContactPerson();
			customerReferencePerson.setCompany(company);
			customerReferencePerson.setType(Constants.COMPANY_CONTACT_CUSTOMER_REFERENCE);
		}

		customerReferencePerson.setContactName(sellerModel.getCustomerReferencePersonName());
		customerReferencePerson.setContactDesignation(sellerModel.getCustomerReferencePersonJobTitle());
		customerReferencePerson.setContactEmailId(sellerModel.getCustomerReferencePersonEmail());
		customerReferencePerson.setContactPhoneNo(sellerModel.getCustomerReferencePersonPhoneNo());
		customerReferencePerson.setCompanyWebsite(sellerModel.getCustomerReferencePersonCompanyWebsite());
		customerReferencePerson.setCompanyName(sellerModel.getCustomerReferencePersonCompanyName());

		if (sellerModel.getCustomerReferencePersonId() == null) {
			companyContactPersonDao.save(customerReferencePerson);
		} else {
			companyContactPersonDao.update(customerReferencePerson);
		}
	}

	// Getter Methods
	@Override
	public HashMap<String, Object> getSellerCompanyDetails(Integer companyId) {
		HashMap<String, Object> response = new HashMap<>();
		if (companyId == null) {
			response.put("status", "false");
			response.put("message", "No Sufficient Details To Fetch.");
			return response;
		}
		try {
			Company company = companyDao.getCompanyWithId(companyId);
			Account account = accountDAO.getAccountBasedOnId(company.getAccountId());
			SellerModel sellerModel = new SellerModel();
			sellerModel.setFirstName(account.getFirstName());
			sellerModel.setLastName(account.getLastName());
			sellerModel.setPersonalEmail(account.getEmailId());
			sellerModel.setPersonalEmailVerified(account.isEmailVerified());
			sellerModel.setUserCountry(account.getCountry());
			sellerModel.setIndustryClassificaiton(company.getCompanyIndustry());
			sellerModel.setIndustryExpertise(company.getIndustryExpertise());
			sellerModel.setCompanyName(company.getCompanyName());
			sellerModel.setCompanyEmail(company.getCompanyEmail());
			sellerModel.setCompanyPhone(company.getCompanyPhoneNo());
			sellerModel.setCompanyWebsite(company.getCompanyWebsite());
			sellerModel.setCompanyLinkedInUrl(company.getCompanyLinkedIn());

			// Getting Company Logo
			CompanyDocument companyDocument = companyDocumentDao.getDocumentByCompanyIdAndName(companyId,
					Constants.COMPANY_LOGO);
			if (companyDocument != null) {
				sellerModel.setCompanyLogoUrl(companyDocument.getDocPath());
				sellerModel.setCompanyLogoId(companyDocument.getId());
			}
			// Set Contact Persons
			List<CompanyContactPerson> contactPersons = companyContactPersonDao
					.getCompanyContactPersonByCompanyId(companyId, Constants.COMPANY_CONTACT_PERSON);
			mapCompanyContactPersonsToContactPersonModels(contactPersons, sellerModel);

			// Set Address
			Address address = addressDao.getAddressByCompanyId(companyId);
			if (address != null) {
				sellerModel.setAddressId(address.getId());
				sellerModel.setStreetAddress(address.getAddressLine1());
				sellerModel.setCity(address.getCity());
				sellerModel.setState(address.getState());
				sellerModel.setCountry(address.getCountry());
				sellerModel.setPincode(address.getPincode());
			}

			response.put("status", "true");
			response.put("data", sellerModel);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	private void mapCompanyContactPersonsToContactPersonModels(List<CompanyContactPerson> companyContactPersons,
			SellerModel sellerModel) {
		for (CompanyContactPerson contactPerson : companyContactPersons) {
			ContactPersonModel contactPersonModel = new ContactPersonModel();
			contactPersonModel.setId(contactPerson.getId());
			contactPersonModel.setName(contactPerson.getContactName());
			contactPersonModel.setDesignation(contactPerson.getContactDesignation());
			contactPersonModel.setEmail(contactPerson.getContactEmailId());
			contactPersonModel.setPhone(contactPerson.getContactPhoneNo());

			sellerModel.getContactPersonModels().add(contactPersonModel);
		}
	}

	@Override
	public HashMap<String, Object> getSellerLegalDetails(Integer companyId, String country) {
		HashMap<String, Object> response = new HashMap<>();
		if (companyId == null) {
			response.put("status", "false");
			response.put("message", "No Sufficient Details To Fetch.");
			return response;
		}
		try {
			Company company = companyDao.getCompanyWithId(companyId);

			SellerModel sellerModel = new SellerModel();
			sellerModel.setTypeOfCompany(company.getTypeOfCompany());
			sellerModel.setBuisnessRegNumber(company.getBuisnessRegNumber());
			if (company.getRegisterationDate() != null) {
				sellerModel.setRegistrationDate(
						dateFormatter.getStringFormattedDateINYYYYmmDDHyphen(company.getRegisterationDate()));
			}
				sellerModel.setDunsNumber(company.getDunsNumber());
				sellerModel.setTaxIdNumber(company.getTaxIdNumber());
				// Getting Company W9 Form
				CompanyDocument companyDocument = companyDocumentDao.getDocumentByCompanyIdAndName(companyId,
						Constants.COMPANY_W9SUBMISSION);
				if (companyDocument != null) {
					sellerModel.setW9SubmissionUrl(companyDocument.getDocPath());
					sellerModel.setW9SubmissionId(companyDocument.getId());
				}
			
				sellerModel.setPanNo(company.getPanNo());
				sellerModel.setGstNo(company.getGstNo());
			
			sellerModel.setIsSupplyingToOEM(company.getIsSupplyingToOEM());
			sellerModel.setIsExporter(company.getIsExporter());
			sellerModel.setIsLogisticServiceProvider(company.getIsLogisticServiceProvider());

			// Set Products
			List<Product> products = productDao.getAllProductsByCompanyId(companyId);
			for (Product product : products) {
				ProductModel productModel = new ProductModel();
				productModel.setId(product.getId());
				productModel.setProductName(product.getName());
				productModel.setDescription(product.getDescription());
				sellerModel.getProductsList().add(productModel);
			}

			if (company.getIsSupplyingToOEM()) {
				// Set OEM Models
				List<OEMofCompany> oemModels = oemDao.getAllOEMByCompanyId(companyId);
				for (OEMofCompany oem : oemModels) {
					OemModel oemModel = new OemModel();
					oemModel.setId(oem.getId());
					oemModel.setSupplyingTo(oem.getSupplyingTo());
					oemModel.setValue(oem.getValue());
					oemModel.setVendorRating(oem.getVendorRating());
					oemModel.setSupplierSince(oem.getSupplierSince());
					sellerModel.getOemModels().add(oemModel);
				}
			}

			// Set Major Customers
			List<Customer> majorCustomers = customerDao.getAllCustomersByCompanyId(companyId);
			for (Customer customer : majorCustomers) {
				CustomerModel customerModel = new CustomerModel();
				customerModel.setId(customer.getId());
				customerModel.setName(customer.getName());
				customerModel.setAddress(customer.getAddress());
				customerModel.setProductSupplied(customer.getProductSupplied());
				sellerModel.getMajorCustomers().add(customerModel);
			}

			if (company.getIsLogisticServiceProvider()) {
				// Set Logistic Service Providers
				List<LogisticServiceProvider> logisticProviders = logisticDao
						.getAllLogisticProviderByCompanyId(companyId);
				for (LogisticServiceProvider provider : logisticProviders) {
					CustomerModel providerModel = new CustomerModel();
					providerModel.setId(provider.getId());
					providerModel.setName(provider.getName());
					providerModel.setAddress(provider.getAddress());
					sellerModel.getLogisticServiceProvider().add(providerModel);
				}
			}

			if (company.getIsExporter()) {
				// Set Exporters
				List<ExportsTo> exporters = exportToDao.getAllExportsToByCompanyId(companyId);
				for (ExportsTo exporter : exporters) {
					ExporterModel exporterModel = new ExporterModel();
					exporterModel.setId(exporter.getId());
					exporterModel.setProduct(exporter.getProduct());
					exporterModel.setFinancialYear(exporter.getFinancialyear());
					exporterModel.setCountry(exporter.getCountry());
					exporterModel.setValue(exporter.getValue());
					sellerModel.getExporterList().add(exporterModel);
				}
			}
			response.put("status", "true");
			response.put("data", sellerModel);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> getSellerFinancialDetails(Integer companyId, String country) {
		HashMap<String, Object> response = new HashMap<>();
		if (companyId == null) {
			response.put("status", "false");
			response.put("message", "No Sufficient Details To Fetch.");
			return response;
		}
		try {
			SellerModel sellerModel = new SellerModel();

			// Set Bank Details
			BankDetails bankDetails = bankDetailsDao.getBankDetailByCompanyId(companyId);
			if (bankDetails != null) {
				sellerModel.setBankId(bankDetails.getId());
				sellerModel.setBankName(bankDetails.getBankName());
				sellerModel.setAccountNo(bankDetails.getAccountNo());
				sellerModel.setRoutingNo(bankDetails.getRoutingNumber());
				sellerModel.setAccountType(bankDetails.getAccountType());

				sellerModel.setIfscCode(bankDetails.getIfscCode());
				
			}

			// Set Annual Turnovers
			List<AnnualTurnover> turnovers = annualTurnoverDao.getAnnualTurnoversByCompanyId(companyId);
			for (AnnualTurnover turnover : turnovers) {
				AnnualTurnoverModel turnoverModel = new AnnualTurnoverModel();
				turnoverModel.setId(turnover.getId());
				turnoverModel.setFinancialYear(turnover.getFinancialYear());
				turnoverModel.setTurnover(turnover.getTurnover());
				sellerModel.getAnnualTurnoverList().add(turnoverModel);
			}

			response.put("status", "true");
			response.put("data", sellerModel);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> getSellerTechnicalDetails(Integer companyId) {
		HashMap<String, Object> response = new HashMap<>();
		if (companyId == null) {
			response.put("status", "false");
			response.put("message", "No Sufficient Details To Fetch.");
			return response;
		}
		try {
			SellerModel sellerModel = new SellerModel();
			List<Factory> factories = factoryDao.getAllFactoriesByCompanyId(companyId);

			List<FactoryModel> factoryModels = new ArrayList<>();
			List<Integer> factoryIds = factories.stream().map(Factory::getId).collect(Collectors.toList());

			Map<Integer, List<Facility>> facilitiesMap = new HashMap<>();
			if (!factoryIds.isEmpty()) {
				List<Facility> facilities = facilityDao.getFacilitiesByAllFactoryIds(factoryIds);
				facilitiesMap = facilities.stream()
						.collect(Collectors.groupingBy(facility -> facility.getFactory().getId()));
			}

			for (Factory factory : factories) {
				FactoryModel factoryModel = new FactoryModel();
				factoryModel.setId(factory.getId());
				factoryModel.setFactoryName(factory.getName());
				factoryModel.setAddress(factory.getAddress());
				factoryModel.setArea(factory.getArea());
				factoryModel.setTotalEmployees(factory.getTotalEmployees());
				factoryModel.setSupervisiors(factory.getSupervisiors());
				factoryModel.setEnggDegreeOrDiploma(factory.getEnggDegreeOrDiploma());
				factoryModel.setSkilledWorkers(factory.getSkilledWorkers());
				factoryModel.setDesignDepartment(factory.getDesignDepartment());
				factoryModel.setQualityAndInspection(factory.getQualityAndInspection());

				List<FacilityModel> facilityModels = new ArrayList<>();
				List<Facility> factoryFacilities = facilitiesMap.get(factory.getId());
				if (factoryFacilities != null) {
					for (Facility facility : factoryFacilities) {
						FacilityModel facilityModel = new FacilityModel();
						facilityModel.setId(facility.getId());
						facilityModel.setFactoryId(factory.getId());
						facilityModel.setDetails(facility.getDetails());
						facilityModel.setRemarks(facility.getRemarks());
						facilityModel.setType(facility.getType());
						facilityModels.add(facilityModel);
					}
				}
				factoryModel.setFacilityList(facilityModels);
				factoryModels.add(factoryModel);
			}
			sellerModel.setFactoryList(factoryModels);

			response.put("status", "true");
			response.put("data", sellerModel);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> getSellerCertifications(Integer companyId, String country) {
		HashMap<String, Object> response = new HashMap<>();
		if (companyId == null) {
			response.put("status", "false");
			response.put("message", "No Sufficient Details To Fetch.");
			return response;
		}

		try {
			SellerModel sellerModel = new SellerModel();

			List<CompanyDocument> companyDocuments = companyDocumentDao.getCompanyDocumentsByCompanyId(companyId);
			Set<String> documentsToExclude = new HashSet<>();
			documentsToExclude.add(Constants.COMPANY_LOGO);
			documentsToExclude.add(Constants.SIGNATURE);
			documentsToExclude.add(Constants.COMPANY_W9SUBMISSION);

			for (CompanyDocument document : companyDocuments) {
				
				if (documentsToExclude.contains(document.getDocName())) {
					continue;
				}
				switch (document.getDocName()) {
					case Constants.COMPANY_ISO_CERTIFICATION:
						sellerModel.setIsoCertificationId(document.getId());
						sellerModel.setIsoCertificationUrl(document.getDocPath());
						break;
					case Constants.COMPANY_AS_CERTIFICATION:
						sellerModel.setAsCertificationId(document.getId());
						sellerModel.setAsCertificationUrl(document.getDocPath());
						break;
					case Constants.COMPANY_OSHA_COMPLIANCE:
						sellerModel.setOshaCertificationId(document.getId());
						sellerModel.setOshaCertificationUrl(document.getDocPath());
						break;
					case Constants.COMPANY_FDA_REGISTRATION:
						sellerModel.setFdaRegisterationId(document.getId());
						sellerModel.setFdaRegisterationUrl(document.getDocPath());
						break;
					case Constants.COMPANY_OTHER_CERTIFICATIONS_US:
						sellerModel.setOtherCertificationsId(document.getId());
						sellerModel.setOtherCertificationsUrl(document.getDocPath());
						break;
					case Constants.COMPANY_LABOR_LAW_COMPLIANCE:
						sellerModel.setLaborLawComplianceId(document.getId());
						sellerModel.setLaborLawComplianceUrl(document.getDocPath());
						break;
					case Constants.COMPANY_INDIAN_STANDARDS_COMPLIANCE:
						sellerModel.setIndianStandardsComplianceId(companyId);
						sellerModel.setIndianStandardsComplianceUrl(document.getDocPath());
						break;
					case Constants.COMPANY_OTHER_CERTIFICATIONS_INDIA:
						sellerModel.setOtherCertificationsId(companyId);
						sellerModel.setOtherCertificationsUrl(document.getDocPath());
						break;
					case Constants.COMPANY_ENVIRONMENTAL_REGULATIONS_COMPLIANCE:
						sellerModel.setEnvironmentalRegulationsComplianceId(companyId);
						sellerModel.setEnvironmentalRegulationsComplianceUrl(document.getDocPath());
						break;
					default:
						break;
					}
				
				}

			response.put("status", "true");
			response.put("data", sellerModel);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}

		return response;
	}

	@Override
	public HashMap<String, Object> getSellerReferencesDetails(Integer companyId) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			SellerModel sellerModel = new SellerModel();
			Company company = companyDao.getCompanyWithId(companyId);
			if (company == null) {
				throw new IllegalArgumentException("Company ID not found: " + companyId);
			}

			// Set declaration date
			if (company.getDeclerationDate() != null) {
				sellerModel.setDeclarationDate(
						dateFormatter.getStringFormattedDateINYYYYmmDDHyphen(company.getDeclerationDate()));
			}

			List<String> namesList = Arrays.asList(Constants.COMPANY_PROJECT_CASE_STUDY, Constants.SIGNATURE);
			// Fetch company documents
			List<CompanyDocument> companyDocuments = companyDocumentDao.getDocumentByCompanyIdAndNameList(companyId,
					namesList);
			for (CompanyDocument document : companyDocuments) {
				switch (document.getDocName()) {
				case Constants.COMPANY_PROJECT_CASE_STUDY:
					sellerModel.setProjectCaseStudiesId(document.getId());
					sellerModel.setProjectCaseStudiesUrl(document.getDocPath());
					break;
				case Constants.SIGNATURE:
					sellerModel.setSignatureId(document.getId());
					sellerModel.setSignatureUrl(document.getDocPath());
					break;
				default:
					break;
				}
			}

			// Fetch customer testimonials
			List<CustomerTestimonial> testimonials = customerTestimonialDao
					.getAllCustomerTestimonialsByCompanyId(companyId);
			List<ProductModel> testimonialsList = testimonials.stream().map(testimonial -> {
				ProductModel productModel = new ProductModel();
				productModel.setId(testimonial.getId());
				productModel.setDescription(testimonial.getDescription());
				return productModel;
			}).collect(Collectors.toList());
			sellerModel.setTestimonialsList(testimonialsList);

			response.put("status", "true");
			response.put("data", sellerModel);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;

	}

	@Override
	public HashMap<String, Object> getSellerPermissions(Integer companyId) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			SellerModel sellerModel = new SellerModel();

			// Retrieve participation permissions
			ParticipationPermission participationPermission = participationPermissionDao
					.getParticipationPermissionByCompanyId(companyId);
			if (participationPermission != null) {
				PermissionModel permissionModel = new PermissionModel();
				permissionModel.setId(participationPermission.getId());
				permissionModel.setCompanyId(participationPermission.getCompanyId());
				permissionModel.setPresentations(participationPermission.getPresentations());
				permissionModel.setNewsletters(participationPermission.getNewsletters());
				permissionModel.setCustomerProfileOnWeb(participationPermission.getCustomerProfileOnWeb());
				permissionModel.setRfp(participationPermission.getRfp());
				permissionModel
						.setOnlineDirectMarketingCampaigns(participationPermission.getOnlineDirectMarketingCampaigns());
				permissionModel.setSponsoredEvents(participationPermission.getSponsoredEvents());
				permissionModel.setCaseStudy(participationPermission.getCaseStudy());
				permissionModel.setWhitePaper(participationPermission.getWhitePaper());
				permissionModel.setBroadcastMedia(participationPermission.getBroadcastMedia());
				permissionModel.setPressAnalysts(participationPermission.getPressAnalysts());
				permissionModel.setCustomerTestimonialLetter(participationPermission.getCustomerTestimonialLetter());
				permissionModel.setCustomerTestimonialVideo(participationPermission.getCustomerTestimonialVideo());
				permissionModel.setSpeakingEngagement(participationPermission.getSpeakingEngagement());
				permissionModel.setDeclerationDate(dateFormatter
						.getStringFormattedDateINYYYYmmDDHyphen(participationPermission.getDeclerationDate()));
				permissionModel.setSignatureUrl(participationPermission.getSignatureUrl());

				sellerModel.setPermissionModel(permissionModel);
			}

			// Retrieve customer reference contact person
			CompanyContactPerson customerReferencePerson = companyContactPersonDao
					.getCustomerReferenceByCompanyIdAndType(companyId, Constants.COMPANY_CONTACT_CUSTOMER_REFERENCE);
			if (customerReferencePerson != null) {
				sellerModel.setCustomerReferencePersonId(customerReferencePerson.getId());
				sellerModel.setCustomerReferencePersonName(customerReferencePerson.getContactName());
				sellerModel.setCustomerReferencePersonJobTitle(customerReferencePerson.getContactDesignation());
				sellerModel.setCustomerReferencePersonCompanyName(customerReferencePerson.getCompanyName());
				sellerModel.setCustomerReferencePersonEmail(customerReferencePerson.getContactEmailId());
				sellerModel.setCustomerReferencePersonPhoneNo(customerReferencePerson.getContactPhoneNo());
				sellerModel.setCustomerReferencePersonCompanyWebsite(customerReferencePerson.getCompanyWebsite());
			}

			response.put("status", "true");
			response.put("data", sellerModel);
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	// PM Onboarding
	@Override
	public HashMap<String, String> savePmOnboardingDetails(PMDetails pmDetails) {
		HashMap<String, String> response = new HashMap<String, String>();
		try {
			// Save Company
			Company company = new Company();
			Account account = accountDAO.getAccountBasedOnId(pmDetails.getAccountId());
			account.setMobileNumber(pmDetails.getPhone());

			company.setAccountId(account.getUserId());
			company.setCompanyIndustry(pmDetails.getIndustry());
			company.setIndustryExpertise(pmDetails.getExpertise());
			company.setCompanyLinkedIn(pmDetails.getCompanyLinkedInUrl());
			company.setIsNotificationsAllowed(pmDetails.getGetIsNotificationsAllowed());
			company.setCnergyType(pmDetails.getUserRole());

			String path = env.getProperty("image.upload.path");

			List<CompanyDocument> companyDocumentsList = new ArrayList<>();
			Date todayDate = new Date();
			if (pmDetails.getSingatureDocument() != null && !pmDetails.getSingatureDocument().isEmpty()) {
				updateOrSaveCertification(company, pmDetails.getSignatureDocumentId(), pmDetails.getSingatureDocument(),
						Constants.SIGNATURE, companyDocumentsList, todayDate, path);
			}

			// Upload Company document
			if (pmDetails.getRelevantDocuments() != null) {
				CompanyDocument relevantDocument = new CompanyDocument();
				relevantDocument.setCompany(company);
				relevantDocument.setDate(todayDate);
				relevantDocument.setDocName(Constants.PM_RELEVENT_CERITFICATE);
				relevantDocument.setDocPath(uploadUtil.uploadToDirectory(pmDetails.getRelevantDocuments(), path));
				companyDocumentsList.add(relevantDocument);
			}

			// Uploading Company resume
			if (pmDetails.getResume() != null && pmDetails.getResume().getSize() != 0) {
				CompanyDocument resume = new CompanyDocument();
				resume.setCompany(company);
				resume.setDate(todayDate);
				resume.setDocName(Constants.PM_RESUME);
				resume.setDocPath(uploadUtil.uploadToDirectory(pmDetails.getResume(), path));
				companyDocumentsList.add(resume);
			}
			if (!companyDocumentsList.isEmpty()) {
				company.setCompanyDocuments(companyDocumentsList);
			}

			// legal information
			if (pmDetails.getCountry().equalsIgnoreCase(Constants.COUNTRY_IN)) {
				company.setPanNo(pmDetails.getPanNo());
			} else {
				company.setTaxIdNumber(pmDetails.getEINNumber());
			}
			// Save Address
			Address address = new Address();
			address.setAddressLine1(pmDetails.getStreetAddress());
			address.setCity(pmDetails.getCity());
			address.setState(pmDetails.getState());
			address.setCountry(pmDetails.getCountry());
			address.setPincode(pmDetails.getPincode());
			address.setCompany(company);
			// Adding in Company
			company.setAddresses((Arrays.asList(address)));

			companyDao.save(company);
			// management expeirence
			// updateExperience(projectManager, pmDetails);

			ProjectManagerExperience pmExperience = new ProjectManagerExperience();
			pmExperience.setNoOfProjectHandled(pmDetails.getExp_projectsHandled());
			pmExperience.setProjectsComplexity(pmDetails.getExp_projectsComplexity());
			pmExperience.setDescription(pmDetails.getExp_description());
			pmExperience.setAccountId(account.getUserId());
			pmExperience.setCompanyId(company.getCompanyId());

			projectManagerExperienceDao.save(pmExperience);

			ProfessionalInformation pmInfo = new ProfessionalInformation();
			pmInfo.setExperience(pmDetails.getCompanyExperience());
			pmInfo.setCompanyName(StringUtil.convertListToPipeSeparatedString((pmDetails.getCompanyName())));
			pmInfo.setCompanyId(company.getCompanyId());
			professionalInformationDao.save(pmInfo);

			// refrence
			List<ProjectManagerRefrence> refrenceSaveTO = new ArrayList<>();
			for (PMRefrenceModel pm : pmDetails.getPmRefrenceModels()) {
				ProjectManagerRefrence pmReference = new ProjectManagerRefrence();
				pmReference.setName(pm.getName());
				pmReference.setCompanyName(pm.getCompanyName());
				pmReference.setEmail(pm.getEmail());
				pmReference.setPhoneNo(pm.getPhone());
				pmReference.setCompanyId(company.getCompanyId());
				pmReference.setAccountId(account.getUserId());

				refrenceSaveTO.add(pmReference);
			}
			projectManagerRefrenceDao.saveAll(refrenceSaveTO);

			// save company

			account.setCompanyId(company.getCompanyId());
			account.setIsOnboardingComplete(true);
			accountDAO.update(account);
			creatingNotification(account.getFullName());
			sendAccountCreationEmail(account.getFullName(), account.getEmailId(), account.getUserRole());
			response.put("status", "true");
			response.put("companyId", company.getCompanyId().toString());
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
			return response;
		}
	}

	@Override
	public HashMap<String, Object> getBuyerDetails(Integer companyId) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Company company = companyDao.getCompanyWithId(companyId);
			if (company == null) {
				response.put("status", "false");
				response.put("message", "Company not found");
				return response;
			}
			Account account = accountDAO.getAccountBasedOnId(company.getAccountId());

			BuyerDetails buyerDetails = new BuyerDetails();
			buyerDetails.setFirstName(account.getFirstName());
			buyerDetails.setLastName(account.getLastName());
			buyerDetails.setPersonalEmail(account.getEmailId());
			buyerDetails.setPersonalEmailVerified(account.isEmailVerified());
			buyerDetails.setUserCountry(account.getCountry());
			buyerDetails.setCompanyId(company.getCompanyId());
			buyerDetails.setCompanyName(company.getCompanyName());
			buyerDetails.setCompanyEmail(company.getCompanyEmail());
			buyerDetails.setCompanyPhone(company.getCompanyPhoneNo());
			buyerDetails.setCompanyWebsite(company.getCompanyWebsite());
			buyerDetails.setCompanyIndustry(company.getCompanyIndustry());
			buyerDetails.setCompanyLinkedInUrl(company.getCompanyLinkedIn());
			buyerDetails.setCompanyType(company.getTypeOfCompany());

			// Set Contact Person Details
			CompanyContactPerson contactPerson = companyContactPersonDao
					.getCompanyContactPersonByCompanyId(companyId, Constants.COMPANY_CONTACT_PERSON).get(0);
			if (contactPerson != null) {
				buyerDetails.setContactPersonId(contactPerson.getId());
				buyerDetails.setContactPersonName(contactPerson.getContactName());
				buyerDetails.setContactPersonDesignation(contactPerson.getContactDesignation());
				buyerDetails.setContactPersonEmail(contactPerson.getContactEmailId());
				buyerDetails.setContactPersonPhone(contactPerson.getContactPhoneNo());
			}

			// Set Address Details
			Address address = addressDao.getAddressByCompanyId(companyId);
			if (address != null) {
				buyerDetails.setAddressId(address.getId());
				buyerDetails.setStreetAddress(address.getAddressLine1());
				buyerDetails.setCity(address.getCity());
				buyerDetails.setState(address.getState());
				buyerDetails.setCountry(address.getCountry());
				buyerDetails.setPincode(address.getPincode());
			}

			// Set Legal Information
			buyerDetails.setBuisnessRegNumber(company.getBuisnessRegNumber());
			buyerDetails.setTaxIdNumber(company.getTaxIdNumber());
			buyerDetails.setGstNo(company.getGstNo());

			// Set Bank Details
			BankDetails bankDetails = bankDetailsDao.getBankDetailByCompanyId(companyId);
			if (bankDetails != null) {
				buyerDetails.setCompanyBankId(bankDetails.getId());
				buyerDetails.setCompanyBankName(bankDetails.getBankName());
				buyerDetails.setCompanyAccountNumber(bankDetails.getAccountNo());
				if (buyerDetails.getCountry().equals(Constants.COUNTRY_US)) {
					buyerDetails.setCompanyRoutingNumber(bankDetails.getRoutingNumber());
				} else {
					buyerDetails.setCompanyIfscCode(bankDetails.getIfscCode());
				}
			}

			// Set Annual Turnover
			List<AnnualTurnover> annualTurnover = annualTurnoverDao.getAnnualTurnoversByCompanyId(companyId);
			if (annualTurnover != null && annualTurnover.size() > 0) {
				buyerDetails.setAnnualTurnoverId(annualTurnover.get(0).getId());
				buyerDetails.setAnnualTurnoverValue(annualTurnover.get(0).getTurnover());
			}

			List<String> namesList = Arrays.asList(Constants.SIGNATURE, Constants.COMPANY_LOGO);
			// Fetch Company Documents (Logo and Signature)
			List<CompanyDocument> companyDocuments = companyDocumentDao.getDocumentByCompanyIdAndNameList(companyId,
					namesList);
			for (CompanyDocument document : companyDocuments) {
				if (Constants.COMPANY_LOGO.equals(document.getDocName())) {
					buyerDetails.setCompanyLogoId(document.getId());
					buyerDetails.setCompanyLogoUrl(document.getDocPath());
				}
				if (Constants.SIGNATURE.equals(document.getDocName())) {
					buyerDetails.setCompanySignatureId(document.getId());
					buyerDetails.setCompanySignatureUrl(document.getDocPath());
				}
			}

			response.put("status", "true");
			response.put("data", buyerDetails);
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> getPMDetails(Integer companyId) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			PMDetails pmDetails = new PMDetails();
			Company company = companyDao.getCompanyWithId(companyId);
			// Personal Information
			Account account = accountDAO.getAccountBasedOnId(company.getAccountId());
			pmDetails.setName(account.getFullName());
			pmDetails.setEmail(account.getEmailId());
			pmDetails.setPhone(account.getMobileNumber());
			ProfessionalInformation pmInformation = professionalInformationDao
					.getProfessionalInfoByCompanyId(companyId);
			if (pmInformation != null) {
				pmDetails.setCompanyExperience(pmInformation.getExperience());
				pmDetails.setCompanyId(companyId);
				pmDetails.setCompanyName(StringUtil.convertPipeSeparatedStringToList(pmInformation.getCompanyName()));
			}
			// Address
			Address address = addressDao.getAddressByCompanyId(companyId);
			if (address != null) {
				pmDetails.setAddressId(address.getId());
				pmDetails.setStreetAddress(address.getAddressLine1());
				pmDetails.setCity(address.getCity());
				pmDetails.setState(address.getState());
				pmDetails.setCountry(address.getCountry());
				pmDetails.setPincode(address.getPincode());
			}

			// Professional Information

			pmDetails.setIndustry(company.getCompanyIndustry());
			pmDetails.setExpertise(company.getIndustryExpertise());
			pmDetails.setCompanyLinkedInUrl(company.getCompanyLinkedIn());

			// Legal Information
			if (pmDetails.getCountry().equalsIgnoreCase(Constants.COUNTRY_IN)) {
			pmDetails.setGstNo(company.getGstNo());
			}else {
				pmDetails.setEINNumber(company.getTaxIdNumber());
			}
			pmDetails.setPanNo(company.getPanNo());

			// Project Management Experience
			ProjectManagerExperience pmExperiences = projectManagerExperienceDao
					.getPMExperiencesByAccountId(account.getUserId());
			if (pmExperiences != null) {
				pmDetails.setExp_id(pmExperiences.getId());
				pmDetails.setExp_projectsHandled(pmExperiences.getNoOfProjectHandled());
				pmDetails.setExp_projectsComplexity(pmExperiences.getProjectsComplexity());
				pmDetails.setExp_description(pmExperiences.getDescription());
			}
			// Reference
			List<ProjectManagerRefrence> pmReferences = projectManagerRefrenceDao
					.getPMRefrencesByAccountId(account.getUserId());
			List<PMRefrenceModel> pmRefrenceModels = new ArrayList<>();
			for (ProjectManagerRefrence reference : pmReferences) {
				PMRefrenceModel model = new PMRefrenceModel();
				model.setId(reference.getId());
				model.setName(reference.getName());
				model.setCompanyName(reference.getCompanyName());
				model.setEmail(reference.getEmail());
				model.setPhone(reference.getPhoneNo());
				pmRefrenceModels.add(model);
			}
			pmDetails.setPmRefrenceModels(pmRefrenceModels);

			// Resume
			List<CompanyDocument> documentsList = companyDocumentDao.getDocumentByCompanyIdAndNameList(companyId,
					Arrays.asList(Constants.PM_RELEVENT_CERITFICATE, Constants.PM_RESUME, Constants.SIGNATURE));

			for (CompanyDocument document : documentsList) {
				if (document.getDocName().equals(Constants.PM_RESUME)) {
					pmDetails.setResumeId(document.getId());
					pmDetails.setResumeLink(document.getDocPath());
				}
				if (document.getDocName().equals(Constants.PM_RELEVENT_CERITFICATE)) {
					pmDetails.setRelevantDocumentId(document.getId());
					pmDetails.setRelevantDocumentUrl(document.getDocPath());
				}
				if (document.getDocName().equals(Constants.SIGNATURE)) {
					pmDetails.setSignatureDocumentId(document.getId());
					pmDetails.setSingatureDocumentUrl(document.getDocPath());
				}
			}

			response.put("status", "true");
			response.put("data", pmDetails);
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getLocalizedMessage());
		}
		return response;
	}

	// Create Notification For Creating Account
	private void creatingNotification(String fullName) {
		Notification notification = new Notification();
		notification.setAddedForAdmin(true);
		notification.setTitle(
				"A new user, " + fullName + ", has registered on Cnerzy. Please review their account details.");
		notification.setCreatedOn(new Date());
		notification.setIsRead(false);
		notificationDao.save(notification);
	}

	@Async
	private void sendAccountCreationEmail(String name, String email, String userRole) {
		logger.info("sending account creationg email to" + email);
		List<String> linesList = new ArrayList<>();	
		if(userRole.equals(USER_ROLES.PM)) {
			String line1 = "Thank you for your interest in Cnerzy! We've received your application and your account has been successfully created.";
			String line2 = "You can now access our platform to manage and oversee projects effectively.";
			linesList.add(line1);
			linesList.add(line2);
		}else if(userRole.equals(USER_ROLES.BUYER)){
			String line1 = "Thank you for your interest in Cnerzy! We have received your application to create an account and streamline your projects with us.";
			String line2 = "Cnerzy connects you with a vast network of qualified suppliers, providing comprehensive design and manufacturing services. We look forward to welcoming you to the Cnerzy community and assisting you in achieving your manufacturing goals.";
			String line3 = "You will receive a notification once your account has been approved.";
			linesList.add(line1);
			linesList.add(line2);
			linesList.add(line3);
		}else if (userRole.equals(USER_ROLES.SELLER)) {
			String line1 = "Thank you for your interest in Cnerzy! We've received your application and your account has been successfully created. You can now access our platform to explore opportunities and connect with potential buyers.";
			linesList.add(line1);
		}
		try {
			emailSender.sendEmail("Welcome to Cnerzy! Your Account Application is Under Review.",
					EmailBody.generateHtmlEmail(name, linesList), new String[] { email }, null,
					null, "Cnerzy", null);
			logger.info("sent account creationg email to" + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
