package com.pie.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.pie.entity.Company;
import com.pie.entity.CompanyDocument;
import com.pie.model.BuyerDetails;

import com.pie.model.SellerModel;
import com.pie.model.PMDetails;

public interface OnBoardingService {

	HashMap<String, String> saveBuyerOnboardingDetails(BuyerDetails buyerDetails);

	HashMap<String, Object> saveSellerLegalDetails(SellerModel sellerModel);

	HashMap<String, Object> saveSellerFinancialDetails(SellerModel sellerModel);

	HashMap<String, Object> getSellerCompanyDetails(Integer companyId);

	HashMap<String, Object> getSellerLegalDetails(Integer companyId, String country);

	HashMap<String, Object> getSellerFinancialDetails(Integer companyId, String country);
	
	HashMap<String, String> savePmOnboardingDetails(PMDetails pmDetails);

	HashMap<String, Object> saveSellerTechnicalDetails(SellerModel sellerModel);

	HashMap<String, Object> getSellerTechnicalDetails(Integer companyId);

	HashMap<String, Object> getSellerCertifications(Integer companyId, String country);

	HashMap<String, Object> saveSellerRefrences(SellerModel sellerModel);

	HashMap<String, Object> getSellerReferencesDetails(Integer companyId);

	HashMap<String, Object> getSellerPermissions(Integer companyId);

	void updateCompanyLogo(Company company, SellerModel sellerModel) throws IllegalStateException, IOException;

	void updateAddress(Company company, SellerModel sellerModel);

	void updateContactPersons(Company company, SellerModel sellerModel);

	Boolean updateProducts(Company company, SellerModel sellerModel);

	Boolean updateOEMModels(Company company, SellerModel sellerModel) throws ParseException;

	Boolean updateMajorCustomers(Company company, SellerModel sellerModel, Date todayDate);

	Boolean updateLogisticServiceProviders(Company company, SellerModel sellerModel);

	Boolean updateExporterList(Company company, SellerModel sellerModel);

	void updateW9SubmissionForm(Company company, SellerModel sellerModel) throws IllegalStateException, IOException;

	void updateBankDetails(Company company, SellerModel sellerModel);

	void updateAnnualTurnover(Company company, SellerModel sellerModel);

	void updateOrSaveCertification(Company company, Integer certificationId, MultipartFile certificationFile,
			String certificationName, List<CompanyDocument> companyDocumentsList, Date todayDate, String path)
			throws IOException;

	Boolean updateCompanyDocumentList(List<CompanyDocument> documentList);

	HashMap<String, Object> saveSellerPermissions(SellerModel sellerModel, boolean isOnboarding);

	void updateOrSaveCompanyCustomerContact(SellerModel sellerModel, Company company);

	HashMap<String, Object> updateOrSavePermissionSignatureFile(SellerModel sellerModel);

	HashMap<String, Object> getBuyerDetails(Integer companyId);

	HashMap<String, Object> getPMDetails(Integer companyId);

	HashMap<String, Object> saveSellerCertificates(SellerModel sellerModel);

	HashMap<String, Object> saveSellerCompanyDetails(SellerModel sellerModel);

}
