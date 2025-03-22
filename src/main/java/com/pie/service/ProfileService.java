package com.pie.service;

import java.util.HashMap;

import com.pie.model.BuyerDetails;
import com.pie.model.PMDetails;
import com.pie.model.SellerModel;

public interface ProfileService {

	HashMap<String, Object> updateCompanyDetails(SellerModel sellerModel);

	HashMap<String, Object> updateCompanyAddress(SellerModel sellerModel);

	HashMap<String, Object> updateContactPersons(SellerModel sellerModel);

	HashMap<String, Object> updateSellerLegalDetails(SellerModel sellerModel);

	HashMap<String, Object> updateSellerCustomerDetails(SellerModel sellerModel);

	HashMap<String, Object> updateSellerW9Form(SellerModel sellerModel);

	HashMap<String, Object> updateSellerBankDetails(SellerModel sellerModel);

	HashMap<String, Object> updateSellerTurnoverDetails(SellerModel sellerModel);

	HashMap<String, Object> updateSellerFactoryDetails(SellerModel sellerModel);

	HashMap<String, Object> updateSellerCertifications(SellerModel sellerModel);

	HashMap<String, Object> updateSellerCustomerContact(SellerModel sellerModel);

	HashMap<String, Object> updateSellerPermission(SellerModel sellerModel);

	HashMap<String, Object> updateSellerPermissionSignature(SellerModel sellerModel);

	HashMap<String, Object> saveOrUpdateBuyerCompanyDocuments(BuyerDetails buyerDetails);

	HashMap<String, Object> updateOrSaveBuyerCompanyDetails(BuyerDetails buyerDetails);

	HashMap<String, Object> updateOrSaveBuyerCompanyAddressDetails(BuyerDetails buyerDetails);

	HashMap<String, Object> updateOrSaveBuyerContactPersonDetails(BuyerDetails buyerDetails);

	HashMap<String, Object> updateOrSaveBuyerLegalInformation(BuyerDetails buyerDetails);

	HashMap<String, Object> updateOrSaveBuyerBankDetails(BuyerDetails buyerDetails);

	HashMap<String, Object> updateOrSavePMPersonalDetails(PMDetails pmDetails);

	HashMap<String, Object> updateOrSavePMLegalDetails(PMDetails pmDetails);

	HashMap<String, Object> saveOrUpdatePMExperience(PMDetails pmDetails);

	HashMap<String, Object> saveOrUpdatePMReference(PMDetails pmDetails);

	HashMap<String, Object> updateOrSavePMAddress(PMDetails pmDetails);

	HashMap<String, Object> updateOrSavePMProfessionalDetails(PMDetails pmDetails);

	HashMap<String, Object> updatePMResume(PMDetails pmDetails);

	HashMap<String, Object> updateBuyerPersonalDetails(BuyerDetails buyerDetails);

	HashMap<String, Object> updateSellerPersonalDetails(SellerModel sellerModel);

	HashMap<String, Object> updateSellerReferences(SellerModel sellerModel);

	HashMap<String, Object> updateSellerOEMAndProductDetails(SellerModel sellerModel);

	HashMap<String, Object> updateSellerExporterAndLogisticDetails(SellerModel sellerModel);
}
