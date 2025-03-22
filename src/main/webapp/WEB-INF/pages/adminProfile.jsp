<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CNERZY | Profile</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <!-- for google icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>

<body>

    <!------------- navbar starts here -------------->
   <c:import url="navbar.jsp"></c:import>
    <!------------- navbar ends here -------------->

    <!------------- page content starts here -------------->

    <div class="wrapper">
       <c:import url="sidebar.jsp"></c:import>
        <div class="main-content">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="breadcrumb-row d-flex">
                        <div class="breadcrumb-icon-box">
                            <img class="breadcrumb-icon" src="assets/icons/breadcrumb-arrow.svg" alt="">
                        </div>
                        <div class="breadcrumb-text">
                            My Profile
                        </div>
                    </div>
                    <div class="right-content right-content-profile">
                        <div class="row row-gap-16">
                            <div class="col-12">
                                <div class="section-style-2">
                                    <div class="row row-gap-24">
                                        <div class="col-12">
                                            <h6 class="section-heading">Company Details</h6>
                                        </div>
                                        <div class="col-12 mt-8 mb-8">
                                            <div class="profile-pic-box">
                                                <img class="profile-pic" src="assets/images/profile/user.png"
                                                    alt="" data-bs-toggle="modal" data-bs-target="#view-profile-pic">
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Company Name</h6>
                                            <p class="text">xyz company LLP</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="d-flex">
                                                <h6 class="heading">Email Address</h6><span
                                                    class="ml-8 verification-status">Unverified</span>
                                            </div>
                                            <p class="text">user@company.com</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Phone Number</h6>
                                            <p class="text">+91 12121 2122</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Website</h6>
                                            <p class="text">www.company.com</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Industry</h6>
                                            <p class="text">www.company.com</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">LinkedIn</h6>
                                            <p class="text">linkedIn.com/in/username</p>
                                        </div>
                                    </div>
                                    <img class="icon" src="assets/icons/edit.svg" alt="edit"
                                        data-bs-toggle="modal" data-bs-target="#edit-company-details">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="section-style-2">
                                    <div class="row row-gap-24">
                                        <div class="col-12">
                                            <h6 class="section-heading">Company Address</h6>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Street Address</h6>
                                            <p class="text">A-125, Shahpur Jat</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">City</h6>
                                            <p class="text">Delhi</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">State</h6>
                                            <p class="text">Delhi</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Country</h6>
                                            <p class="text">India</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Pincode</h6>
                                            <p class="text">110049</p>
                                        </div>

                                    </div>
                                    <img class="icon" src="assets/icons/edit.svg" alt="edit"
                                        data-bs-toggle="modal" data-bs-target="#edit-company-address">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="section-style-2">
                                    <div class="row row-gap-24">
                                        <div class="col-12">
                                            <h6 class="section-heading">Contact Person</h6>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Contact Name</h6>
                                            <p class="text">Ashok Singh</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Designation</h6>
                                            <p class="text">Developer</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Email Address</h6>
                                            <p class="text">ashok.s@brainydx.com</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Phone Number</h6>
                                            <p class="text">+91 90265 52789</p>
                                        </div>
                                    </div>
                                    <img class="icon" src="assets/icons/edit.svg" alt="edit"
                                        data-bs-toggle="modal" data-bs-target="#edit-contact-person">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="section-style-2">
                                    <div class="row row-gap-24">
                                        <div class="col-12">
                                            <h6 class="section-heading">Legal Information</h6>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Type of Business Entity</h6>
                                            <p class="text">Partnership</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Business Registration Number(CIN)</h6>
                                            <p class="text">U 52341 MP 2022 PTC 052831</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Tax Identification Number (GSTIN)</h6>
                                            <p class="text">22 AAAAA0000A 1 Z 5</p>
                                        </div>
                                    </div>
                                    <img class="icon" src="assets/icons/edit.svg" alt="edit"
                                        data-bs-toggle="modal" data-bs-target="#edit-legal-information">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="section-style-2">
                                    <div class="row row-gap-24">
                                        <div class="col-12">
                                            <h6 class="section-heading">Financial Information</h6>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Bank Name</h6>
                                            <p class="text">SBI</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Account Number</h6>
                                            <p class="text">38845472800</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">IFSC Code</h6>
                                            <p class="text">SBIN0017333</p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                                            <h6 class="heading">Annual Turnover</h6>
                                            <p class="text">₹ 13 Crore</p>
                                        </div>
                                    </div>
                                    <img class="icon" src="assets/icons/edit.svg" alt="edit"
                                        data-bs-toggle="modal" data-bs-target="#edit-financial-information">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="section-style-2">
                                    <div class="row row-gap-24">
                                        <div class="col-12">
                                            <h6 class="section-heading">Signature</h6>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 col-lg-4">
                                            <img src="assets/images/profile/signature.png" alt="">
                                        </div>

                                    </div>
                                    <img class="icon" src="assets/icons/edit.svg" alt="edit"
                                        data-bs-toggle="modal" data-bs-target="#edit-signature">
                                </div>
                            </div>

                            <div class="col-12 d-flex justify-content-end">
                                <button class="btn-style-1 mt-32" type="button" data-bs-toggle="modal"
                                    data-bs-target="#thank-you-modal">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!------------- page content starts here -------------->


    <!-- Edit Company Detail Popup starts -->
    <div class="modal fade modal-lg custom-edit-modal" id="edit-company-details" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="body">
                    <h3 class="heading">Company Details</h3>
                    <div class="row row-gap-24">
                        <div class="col-12 mt-8 mb-8">
                            <div class="edit-profile-pic-box">
                                <div class="profile-pic-preview-area">
                                    <input type="file" class="file-input" id="profile-pic-input" accept=".png,.jpg,.jpeg"
                                        name="profile-pic" hidden>
                                    <img class="profile-pic" src="assets/images/profile/user.png" alt="">
                                </div>
                                <div class="edit-icon-box">
                                    <img class="icon choose-new-profile-pic" src="assets/icons/edit.svg" alt="edit">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="company_name" class="input-field" placeholder="Company Name"
                                    required autocomplete="on" value="Cnerzy">
                                <label for="compnay_name" class="input-label">Company Name<span
                                        class="required-asterisk">*</span></label>
                                <span id="company_name_err" class="err-text"></span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="email" name="company_email" class="input-field" placeholder="Company Email"
                                    required autocomplete="on" value="user@company.com">
                                <label for="company_email" class="input-label">Company Email<span
                                        class="required-asterisk">*</span></label>
                                <span id="company_email_err" class="err-text"></span>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="company_phone" class="input-field" placeholder="Phone" required
                                    autocomplete="on" value="9026552789">
                                <label for="company_phone" class="input-label">Phone<span
                                        class="required-asterisk">*</span></label>
                                <span id="company_phone_err" class="err-text"></span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="company_website" class="input-field" placeholder="Website"
                                    autocomplete="on" value="www.company.com">
                                <label for="company_website" class="input-label">Website</label>
                                <span id="company_website_err" class="err-text"></span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group select-field-group select-field-group-toggle">
                                <select name="industry" id="industry" class="input-field form-dropdown" required
                                    autocomplete="on">
                                    <option value="" hidden></option>
                                    <option value="Automotive">Automotive</option>
                                    <option value="Aerospace" selected>Aerospace</option>
                                    <option value="Consumer Goods">Consumer Goods</option>
                                    <option value="Electronics & Communications">Electronics & Communications
                                    </option>
                                    <option value="Medical Equipment">Medical Equipment</option>
                                    <option value="Industrial Machinery">Industrial Machinery</option>
                                    <option value="Others">Others</option>
                                </select>
                                <label for="industry" class="input-label">Industry<span
                                        class="required-asterisk">*</span></label>
                                <span id="industry_err" class="err-text"></span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="linkedin_url" class="input-field"
                                    placeholder="LinkedIn Profile URL" autocomplete="on"
                                    value="linkedin.com/in/username">
                                <label for="linkedin_url" class="input-label">LinkedIn Profile URL</label>
                                <span id="linkedin_url_err" class="err-text"></span>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="footer">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                            <div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
                                <button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
                                    aria-label="Close">Cancel</button>
                                <button class="btn-style-1 btn-save" type="button">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Company Detail Popup ends -->


    <!-- Edit Company Address Popup starts -->
    <div class="modal fade modal-lg custom-edit-modal" id="edit-company-address" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="body">
                    <h3 class="heading">Company Address</h3>
                    <div class="row row-gap-24">
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="street_address" class="input-field"
                                    placeholder="Street Address" required autocomplete="on" value="A-125, Shahpur Jat">
                                <label for="street_address" class="input-label">Street Address<span
                                        class="required-asterisk">*</span></label>
                                <span id="street_address_err" class="err-text"></span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="city" class="input-field" placeholder="City" required
                                    autocomplete="on" value="Delhi">
                                <label for="city" class="input-label">City<span
                                        class="required-asterisk">*</span></label>
                                <span id="city_err" class="err-text"></span>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="state" class="input-field" placeholder="State" required
                                    autocomplete="on" value="Delhi">
                                <label for="state" class="input-label">State<span
                                        class="required-asterisk">*</span></label>
                                <span id="state_err" class="err-text"></span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <!-- <input type="text" name="country" readonly value="{{$data['country']}}" class="input-field" placeholder="Country" required
                                    autocomplete="on"> -->
                                <select name="country" disabled id="country" class="input-field form-dropdown" required
                                    autocomplete="on">
                                    <option value="india" selected>India</option>
                                    <option value="us">US</option>
                                </select>
                                <!-- <label for="country" class="input-label">Country</label> -->
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="pincode" class="input-field" placeholder="Pincode" required
                                    autocomplete="on" value="110049">
                                <label for="pincode" class="input-label">Pincode<span
                                        class="required-asterisk">*</span></label>
                                <span id="pincode_err" class="err-text"></span>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="footer">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                            <div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
                                <button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
                                    aria-label="Close">Cancel</button>
                                <button class="btn-style-1 btn-save" type="button">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Company Address Popup ends -->



    <!-- Edit Contact Person popup starts -->
    <div class="modal fade modal-lg custom-edit-modal" id="edit-contact-person" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="body">
                    <h3 class="heading">Contact Person</h3>
                    <div class="row row-gap-24">
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="contact_person_name" class="input-field" placeholder="Name"
                                    required autocomplete="on" value="Ashok Singh">
                                <label for="contact_person_name" class="input-label">Name<span
                                        class="required-asterisk">*</span></label>
                                <span id="contact_person_name_err" class="err-text"></span>

                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="contact_person_designation" class="input-field"
                                    placeholder="Designation" required autocomplete="on" value="Developer">
                                <label for="contact_person_designation" class="input-label">Designation<span
                                        class="required-asterisk">*</span></label>
                                <span id="contact_person_designation_err" class="err-text"></span>

                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="email" name="contact_person_email" class="input-field" placeholder="Email"
                                    required autocomplete="on" value="ashok.s@brainydx.com">
                                <label for="contact_person_email" class="input-label">Email<span
                                        class="required-asterisk">*</span></label>
                                <span id="contact_person_email_err" class="err-text"></span>

                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="contact_person_phone" class="input-field" placeholder="Phone"
                                    required autocomplete="on" value="9026552789">
                                <label for="contact_person_phone" class="input-label">Phone<span
                                        class="required-asterisk">*</span></label>
                                <span id="contact_person_phone_err" class="err-text"></span>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="footer">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                            <div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
                                <button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
                                    aria-label="Close">Cancel</button>
                                <button class="btn-style-1 btn-save" type="button">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Contact Person popup ends -->

    <!-- Edit Legal Information popup starts -->
    <div class="modal fade modal-lg custom-edit-modal" id="edit-legal-information" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="body">
                    <h3 class="heading">Legal Information</h3>
                    <div class="row row-gap-24">
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group select-field-group">
                                <select name="type_of_business_entity" id="type_of_business_entity"
                                    class="input-field form-dropdown" autocomplete="on">
                                    <option value="" hidden></option>
                                    <option value="Sole Proprietorship" selected>Sole Proprietorship</option>
                                    <option value="Partnership">Partnership</option>
                                    <option value="Private Limited">Private Limited</option>
                                    <option value="Public Limited">Public Limited</option>
                                    <option value="LLP">LLP</option>
                                    <option value="Corporation">Corporation</option>
                                </select>
                                <label for="type_of_business_entity" class="input-label">Type of Business
                                    Entity</label>
                                <span id="type_of_business_entity_err" class="err-text"></span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="business_reg_number" class="input-field"
                                    placeholder="Business Reg. Number(CIN)" autocomplete="on"
                                    value="U52341MP2022PTC052831">
                                <label for="business_reg_number" class="input-label">Business Reg.
                                    Number(CIN)</label>
                                <span id="business_reg_number_err" class="err-text"></span>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="tax_id_number" class="input-field"
                                    placeholder="Tax Id. Number (EIN)" autocomplete="on" value="22AAAAA0000A1Z5">
                                <label for="tax_id_number" class="input-label">Tax Id. Number (EIN)</label>
                                <span id="tax_id_number_err" class="err-text"></span>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="footer">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                            <div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
                                <button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
                                    aria-label="Close">Cancel</button>
                                <button class="btn-style-1 btn-save" type="button">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Legal Information popup ends -->


    <!-- Edit Financial Information popup starts -->
    <div class="modal fade modal-lg custom-edit-modal" id="edit-financial-information" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="body">
                    <h3 class="heading">Financial Information</h3>
                    <div class="row row-gap-24">
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="bank_name" class="input-field" placeholder="Bank Name"
                                    autocomplete="on" value="SBI">
                                <label for="bank_name" class="input-label">Bank Name</label>
                                <span id="bank_name_err" class="err-text"></span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="account_number" class="input-field"
                                    placeholder="Account Number" autocomplete="on" value="38845472800">
                                <label for="account_number" class="input-label">Account Number</label>
                                <span id="account_number_err" class="err-text"></span>

                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group">
                                <input type="text" name="ifsc_code" class="input-field" placeholder="IFSC Code"
                                    autocomplete="on" value="SBIN0017333">
                                <label for="ifsc_code" class="input-label">IFSC Code</label>
                                <span id="ifsc_code_err" class="err-text"></span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="field-group d-flex position-relative align-items-center">
                                <div class="input-group-prepend position-absolute"
                                    style="left: 10px; width: 32px; height: 32px;">
                                    <span class="input-group-text" id="basic-addon1"
                                        style="font-size: 12px; padding: 4px;">INR</span>
                                </div>
                                <input type="text" name="annual_turnover" style="padding-left:50px;" class="input-field"
                                    placeholder="Annual Turnover" autocomplete="on" value="13">
                                <label for="annual_turnover" style="left:50px;" class="input-label">Annual
                                    Turnover</label>
                            </div>
                            <span id="annual_turnover_err" class="err-text"></span>
                        </div>

                    </div>
                </div>
                <div class="footer">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                            <div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
                                <button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
                                    aria-label="Close">Cancel</button>
                                <button class="btn-style-1 btn-save" type="button">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Financial Information popup ends -->

    <!-- Edit Signature popup starts -->
    <div class="modal fade modal-lg custom-edit-modal" id="edit-signature" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="body">
                    <h3 class="heading">Signature</h3>
                    <div class="row row-gap-24">
                        <div class="col-12">
                            <div class="signature-card-1 custom-file-input-2">
                                <div class="signature-preview-area">
                                    <input type="file" class="file-input" id="signature-input" accept=".png,.jpg,.jpeg"
                                        name="signature" hidden>
                                    <img class="img" src="assets/images/profile/signature.png" alt="">
                                </div>
                                <div class="icon-box">
                                    <img class="icon choose-new-signature-btn" src="assets/images/profile/replace.png"
                                        alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                            <div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
                                <button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
                                    aria-label="Close">Cancel</button>
                                <button class="btn-style-1 btn-save" type="button">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Signature popup ends -->



    <!-- Profile pic popup starts-->
    <div class="modal fade custom-profile-pic-view-modal modal-sm" id="view-profile-pic" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <span class="close-btn" data-bs-dismiss="modal" aria-label="Close">&times;</span>
                <img class="modal-img" src="assets/images/profile/user.png" alt="Success Animation">
            </div>
        </div>
    </div>
    <!-- Profile pic popup ends-->


    <!-- Thank you popup starts -->
    <div class="modal fade custom-thank-you-modal modal-lg" id="thank-you-modal" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <img class="modal-img mb-16" src="assets/icons/Succeess Animation.svg" alt="Success Animation">
                <h2 class="modal-heading text-center mb-8">Thank You!</h2>
                <p class="modal-para text-center">You've successfully completed your onboarding process. Cnerzy will
                    review your profile in 1-2 days.</p>
            </div>
        </div>
    </div>
    <!-- Thank you popup ends -->

<script>
console.log("${role}")
var myHeaders = new Headers();

	var requestOptions = {
		method: "GET",
		headers: myHeaders,

		redirect: "follow",
	};
fetch("${pageContext.request.contextPath}/getUsersList?userRole=", requestOptions)
	.then((response) => {
		if (!response.ok) {
			throw new Error("Network response was not ok");
		}
		return response.json();
	})
	.then((data) => {
		console.log("Success:", data);
		if (data.status == "true") {
			$('#thank-you-modal').modal('show');
			   setTimeout(function() {
	                window.location.href = "${pageContext.request.contextPath}/dashboard";
	            }, 5000); 
		} else if (data.status == "false") {
			toastr.error(data.message)
		} 
//	    data-bs-toggle="modal"
//   data-bs-target="#thank-you-modal

	})
	.catch((error) => {
		console.error("Fetch error:", error);
	});
</script>

   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>