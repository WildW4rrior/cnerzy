<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Onboarding | SELLER(US)</title>
    
      <c:import url="common-header-import.jsp"></c:import>

    <!-- for bootstrap stepper -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bs-stepper/dist/css/bs-stepper.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bs-stepper/dist/js/bs-stepper.min.js"></script>
    <!-- for bootstrap stepper -->
</head>

<body>
    <div class="container-fluid bg-gray box-style-1">
        <div class="box-style-2" id="navigate-to-box">
            <div class="onboarding-header bg-gray row">
                <div class="col-lg-2 col-md-12 col-sm-12 col-12 d-flex align-items-center logo-col">
                    <a href="#">
                        <img class="header-logo" src="assets/images/Logo.svg" alt="">
                    </a>
                </div>
                <div class="col-lg-10 col-md-12 col-sm-12 col-12">
                    <div class="step-container">
                        <div class="step-info active d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
                            <div class="d-flex">
                                <span class="step-circle">1</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Company<br> Information</span>
                        </div>
                        <div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
                            <div class="d-flex">
                                <span class="step-circle">2</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Legal<br> Information</span>
                        </div>
                        <div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
                            <div class="d-flex">
                                <span class="step-circle">3</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Financial<br> Details</span>
                        </div>
                        <div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
                            <div class="d-flex">
                                <span class="step-circle">4</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Technical<br> Capabilities</span>
                        </div>
                        <div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
                            <div class="d-flex">
                                <span class="step-circle">5</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Certificates &<br> Compliance</span>
                        </div>
                        <div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
                            <div class="d-flex">
                                <span class="step-circle">6</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">References</span>
                        </div>
                        <div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
                            <div class="d-flex">
                                <span class="step-circle">7</span>
                            </div>
                            <span class="step-label">Supplier<br> Reference Program</span>
                        </div>
                    </div>
                </div>
                <!-- <div class="col-lg-10 col-md-12 col-sm-12 col-12 d-flex d-sm-flex d-md-none d-lg-none d-xl-none d-xxl-none">
                    <div class="step-container">
                        <div class="step-info active">
                            <div class="d-flex">
                                <span class="step-circle">1</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Company<br> Information</span>
                        </div>
                        <div class="step-info">
                            <div class="d-flex">
                                <span class="step-circle">2</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Legal<br> Information</span>
                        </div>
                        <div class="step-info">
                            <div class="d-flex">
                                <span class="step-circle">3</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Financial<br> Details</span>
                        </div>
                        <div class="step-info d-none">
                            <div class="d-flex">
                                <span class="step-circle">4</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Technical<br> Capabilities</span>
                        </div>
                        <div class="step-info d-none">
                            <div class="d-flex">
                                <span class="step-circle">5</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">Certificates &<br> Compliance</span>
                        </div>
                        <div class="step-info d-none">
                            <div class="d-flex">
                                <span class="step-circle">6</span>
                                <div class="step-line"></div>
                            </div>
                            <span class="step-label">References</span>
                        </div>
                        <div class="step-info d-none">
                            <div class="d-flex">
                                <span class="step-circle">7</span>
                            </div>
                            <span class="step-label">Supplier<br> Reference Program</span>
                        </div>
                    </div>
                </div> -->
            </div>


            <form action="" method="POST" enctype="multipart/form-data">
                <!-- Company Information Step-1 -->
                <div class="step">
                    <div class="step-content">
                        <div class="content">
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Company Details</h6>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group select-field-group-toggle">
                                            <select name="industry_classification" id="industry_classification"
                                                class="input-field form-dropdown" required autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="Automotive">Automotive</option>
                                                <option value="Aerospace">Aerospace</option>
                                                <option value="Consumer Goods">Consumer Goods</option>
                                                <option value="Electronics & Communications">Electronics &
                                                    Communications</option>
                                                <option value="Medical Equipment">Medical Equipment</option>
                                                <option value="Industrial Machinery">Industrial Machinery</option>
                                                <option value="Others">Others</option>
                                            </select>
                                            <label for="industry_classification" class="input-label">Industry
                                                Classification<span class="required-asterisk">*</span></label>
                                            <span id="industry_classification_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group select-field-group-toggle">
                                            <select name="industry_expertise" id="industry_expertise"
                                                class="input-field form-dropdown" required autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="Precision Machining">Precision Machining</option>
                                                <option value="Injection Moulds">Injection Moulds</option>
                                                <option value="Die Casting Components">Die Casting Components</option>
                                                <option value="Sheet Metal/Stamping">Sheet Metal/Stamping</option>
                                                <option value="Forging">Forging</option>
                                                <option value="Sub-assembly">Sub-assembly</option>
                                                <option value="Aerospace Components">Aerospace Components</option>
                                                <option value="Engineering & Design Services">Engineering & Design
                                                    Services</option>
                                                <option value="Prototyping">Prototyping</option>
                                                <option value="Others">Others</option>
                                            </select>
                                            <label for="industry_expertise" class="input-label">Industry Expertise<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="industry_expertise_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="company_name" class="input-field"
                                                placeholder="Company Name" required autocomplete="off">
                                            <label for="company_name" class="input-label">Company Name<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="company_name_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="company_website" class="input-field"
                                                placeholder="Company Website" required autocomplete="off">
                                            <label for="company_website" class="input-label">Company Website<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="company_website_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="email" name="company_email" class="input-field"
                                                placeholder="Company Email" required autocomplete="off">
                                            <label for="company_email" class="input-label">Company Email<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="company_email_err" class="err-text"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="tel" name="company_phone" class="input-field"
                                                placeholder="Phone" required autocomplete="off">
                                            <label for="company_phone" class="input-label">Phone<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="company_phone_err" class="err-text"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="linkedin_url" class="input-field"
                                                placeholder="LinkedIn Profile URL" autocomplete="off">
                                            <label for="linkedin_url" class="input-label">LinkedIn Profile URL</label>
                                            <span id="linkedin_url_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="file-input-field-group">
                                            <input type="file" id="logo_input" name="logo" accept="application/pdf"
                                                class="input-field" placeholder="File" autocomplete="off" hidden
                                                accept="application/pdf">
                                            <button class="input-btn" type="button"
                                                onclick="handleClick('logo_input','logo_text')">Choose
                                                File
                                            </button>
                                            <p id="logo_text">No File Choosen</p>
                                        </div>
                                        <div class="fileType-and-maxFileSize">
                                            <p>Attach your company logo here</p>
                                            <p>File Size: Max 2 MB</p>
                                            <span id="logo_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Company Address</h6>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="address_line_1" class="input-field"
                                                placeholder="Address Line 1" autocomplete="off">
                                            <label for="address_line_1" class="input-label">Address Line 1</label>
                                            <span id="address_line_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="city" class="input-field" placeholder="City"
                                                autocomplete="off">
                                            <label for="city" class="input-label">City</label>
                                            <span id="city_err" class="err-text"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="state" class="input-field" placeholder="State"
                                                autocomplete="off">
                                            <label for="state" class="input-label">State</label>
                                            <span id="state_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <!-- <input type="text" name="country" readonly value="{{$data['country']}}"
                                                id="country" class="input-field" placeholder="Country"
                                                autocomplete="off"> -->
                                            <select name="country" disabled id="country"
                                                class="input-field form-dropdown" required autocomplete="off">
                                                <option value="india">India</option>
                                                <option value="us" selected>US</option>
                                            </select>
                                            <span id="country_err" class="err-text"></span>
                                            <!-- <label for="country" class="input-label">Country</label> -->
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="pincode" class="input-field" placeholder="Pincode"
                                                autocomplete="off">
                                            <label for="pincode" class="input-label">Pincode</label>
                                            <span id="pincode_err" class="err-text"></span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Contact Person</h6>
                                <div id="contact-person-box">
                                    <div class="row row-gap-16">
                                        <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="field-group">
                                                <input type="text" name="contact_person_name[]"
                                                    id="contact_person_name_1" class="input-field" placeholder="Name"
                                                    required autocomplete="off">
                                                <label for="contact_person_name_1" class="input-label">Name<span
                                                        class="required-asterisk">*</span></label>
                                                <span id="contact_person_name_1_err" class="err-text"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="field-group">
                                                <input type="text" name="contact_person_designation[]"
                                                    id="contact_person_designation_1" class="input-field"
                                                    placeholder="Designation" required autocomplete="off">
                                                <label for="contact_person_designation_1"
                                                    class="input-label">Designation<span
                                                        class="required-asterisk">*</span></label>
                                                <span id="contact_person_designation_1_err" class="err-text"></span>

                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="field-group">
                                                <input type="email" name="contact_person_email[]"
                                                    id="contact_person_email_1" class="input-field" placeholder="Email"
                                                    required autocomplete="off">
                                                <label for="contact_person_email_1" class="input-label">Email<span
                                                        class="required-asterisk">*</span></label>
                                                <span id="contact_person_email_1_err" class="err-text"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="field-group">
                                                <input type="text" name="contact_person_phone[]"
                                                    id="contact_person_phone_1" class="input-field" placeholder="Phone"
                                                    required autocomplete="off">
                                                <label for="contact_person_phone_1" class="input-label">Phone<span
                                                        class="required-asterisk">*</span></label>
                                                <span id="contact_person_phone_1_err" class="err-text"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100 mt-16" type="button"
                                            onclick="addNewContactPersonRow()">+ Add Other</button>
                                    </div>
                                </div>
                            </div>

                            <div class="input-field-section mt-32">
                                <div class="col-12 mt-64  d-flex justify-content-end">
                                    <button class="btn-style-1 mb-32" type="button" onclick="nextStep()">Next</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- Legal Information Step-2 -->
                <div class="step d-none">
                    <div class="step-content">
                        <div class="content">
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Legal Information</h6>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="business_reg_number" class="input-field"
                                                placeholder="Business Reg. Number(CIN)" autocomplete="off">
                                            <label for="business_reg_number" class="input-label">Business Reg.
                                                Number(CIN)</label>
                                            <span id="business_reg_number_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="type_of_company" id="type_of_company"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="Sole Proprietorship">Sole Proprietorship</option>
                                                <option value="Partnership">Partnership</option>
                                                <option value="Private Limited">Private Limited</option>
                                                <option value="Public Limited">Public Limited</option>
                                                <option value="LLP">LLP</option>
                                                <option value="Corporation">Corporation</option>
                                            </select>
                                            <label for="type_of_company" class="input-label">Type of Company</label>
                                            <span id="type_of_company_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="date" name="date_of_registration"
                                                class="input-field date-field" placeholder="Date Of Registration"
                                                autocomplete="off">
                                            <label for="date_of_registration" class="input-label">Date Of
                                                Registration</label>
                                            <span id="date_of_registration_err" class="err-text"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="d_u_n_s_number" class="input-field"
                                                placeholder="D-U-N-S Number" required autocomplete="off">
                                            <label for="d_u_n_s_number" class="input-label">D-U-N-S Number<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="d_u_n_s_number_err" class="err-text"></span>

                                        </div>

                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="state_tax_id_number" class="input-field"
                                                placeholder="State Tax ID Number" required autocomplete="off">
                                            <label for="state_tax_id_number" class="input-label">State Tax ID
                                                Number<span class="required-asterisk">*</span></label>
                                            <span id="state_tax_id_number_err" class="err-text"></span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Click here to submit your W-9</h6>
                                <p class="content">As a part of the onboarding process it is mandatory for you to submit
                                    us with a copy of your W-9 on file . If you have a copy of the same , please mail it
                                    to info@cnerzy.com . If you don’t have the W-9 on file please click here to submit
                                    your W-9 <a href="" target="_blank">(hyper link to form shared as PDF, digital
                                        signature process can be set
                                        here)</a></p>
                                <p class="content">
                                    Ensure your W-9 form contains the following details:
                                </p>
                                <ul>
                                    <li>For Individuals or Sole Proprietors: First and last name, Leave the company name
                                        section blank</li>
                                    <li>For Companies: Provide the legal business name as listed on the SS4 form, Leave
                                        the individual name section blank unless a DBA is registered </li>
                                    <li> Federal Tax Classification: Select the appropriate box based on your IRS
                                        registration/SS4 form</li>
                                </ul>
                                <p class="content">Exceptions:</p>
                                <ul>
                                    <li>Provide your company address</li>
                                    <li>Include either your Social Security Number (SSN) or Employer
                                        Identification Number (EIN)<ol type="1">
                                            <li>Use your SSN only if you are an individual
                                            </li>
                                            <li>Sole Proprietors should have an EIN
                                            </li>
                                            <li>
                                                For Limited Liability Companies (LLCs), specify if you are an S or C
                                                Corp or
                                                an LLC to determine 1099 filing requirements</li>
                                        </ol>
                                    </li>
                                </ul>
                            </div>
                            <div class="input-field-section mt-32">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                        <div class="card-style-1" style="min-height: 0px;">
                                            <h6 class="card-title">W-9 Submission Form<span
                                                    class="required-asterisk">*</span>
                                            </h6>
                                            <div class="file-input-field-group p-0">
                                                <input type="file" id="w9_submission_form_input"
                                                    name="w9_submission_form" class="input-field" placeholder="File"
                                                    required autocomplete="off" accept="application/pdf" hidden>
                                                <button class="input-btn" type="button"
                                                    onclick="handleClick('w9_submission_form_input','w9_submission_form_text')">Choose
                                                    File</button>
                                                <p id="w9_submission_form_text">No File Choosen</p>
                                            </div>
                                        </div>
                                        <div class="fileType-and-maxFileSize">
                                            <p>File Size: Max 2 MB</p>
                                            <span id="w9_submission_form_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">List of Major Products</h6>
                                <div class="row row-gap-16" id="major-product-row">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="name_of_product[]" id="name_of_product_1"
                                                class="input-field" placeholder="Name of Major Product 1"
                                                autocomplete="off">
                                            <label for="name_of_product_1" class="input-label">Name of Major Product
                                                1</label>
                                            <span id="name_of_product_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="name_of_product[]" id="name_of_product_2"
                                                class="input-field" placeholder="Name of Major Product 2"
                                                autocomplete="off">
                                            <label for="name_of_product_2" class="input-label">Name of Major Product
                                                2</label>
                                            <span id="name_of_product_2_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="name_of_product[]" id="name_of_product_3"
                                                class="input-field" placeholder="Name of Major Product 3"
                                                autocomplete="off">
                                            <label for="name_of_product_3" class="input-label">Name of Major Product
                                                3</label>
                                            <span id="name_of_product_3_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addAnotherMajorProduct()">+ Add Other</button>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32" id="oem-details-parent">
                                <div class="row mb-16">
                                    <div class="col-12 d-flex align-items-center">
                                        <h6 class="input-section-heading mr-16">Are you supplying to OEMs? (If, yes,
                                            please
                                            provide
                                            details)</h6>
                                        <div class="d-flex align-items-center">
                                            <div class="radio-field-group mr-16 d-flex align-items-center">
                                                <input type="radio" name="supplying_to_oems" checked class="mr-8"
                                                    required autocomplete="off"><label for="">Yes</label>
                                            </div>
                                            <div class="radio-field-group d-flex align-items-center">
                                                <input type="radio" name="supplying_to_oems" class="mr-8" required
                                                    autocomplete="off"><label for="">No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <h6 class="input-section-heading mb-8">1.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="oem_supplying_to[]" id="oem_supplying_to_1"
                                                class="input-field" placeholder="OEM Supplying to" autocomplete="off">
                                            <label for="oem_supplying_to_1" class="input-label">OEM Supplying to</label>
                                            <span id="oem_supplying_to_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="supplier_since[]" id="supplier_since_1"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                                <option value="2024">2024</option>
                                            </select>
                                            <label for="supplier_since_1" class="input-label">Supplier Since
                                            </label>
                                            <span id="supplier_since_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group d-flex position-relative align-items-center">
                                            <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                <span class="input-group-text" id="basic-addon1"
                                                    style="font-size: 12px; padding: 3px;">USD</span>
                                            </div>
                                            <input type="text" name="oem_value[]" id="oem_value_1"
                                                style="padding-left:50px;" class="input-field" placeholder="Value"
                                                autocomplete="off">
                                            <label for="oem_value_1" style="left:50px;"
                                                class="input-label">Value</label>
                                        </div>
                                        <span id="oem_value_1_err" class="err-text"></span>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="vendor_rating[]" id="vendor_rating_1"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="5">5</option>
                                                <option value="4">4</option>
                                                <option value="3">3</option>
                                                <option value="2">2</option>
                                                <option value="1">1</option>
                                            </select>
                                            <label for="vendor_rating_1" class="input-label">Vendor Rating</label>
                                            <span id="vendor_rating_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <h6 class="input-section-heading mb-8">2.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="oem_supplying_to[]" id="oem_supplying_to_2"
                                                class="input-field" placeholder="OEM Supplying to" autocomplete="off">
                                            <label for="oem_supplying_to_2" class="input-label">OEM Supplying to</label>
                                            <span id="oem_supplying_to_2_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="supplier_since[]" id="supplier_since_2"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                                <option value="2024">2024</option>
                                            </select>
                                            <label for="supplier_since_2" class="input-label">Supplier Since
                                            </label>
                                            <span id="supplier_since_2_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group d-flex position-relative align-items-center">
                                            <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                <span class="input-group-text" id="basic-addon1"
                                                    style="font-size: 12px; padding: 3px;">USD</span>
                                            </div>
                                            <input type="text" name="oem_value[]" id="oem_value_2"
                                                style="padding-left:50px;" class="input-field" placeholder="Value"
                                                autocomplete="off">
                                            <label for="oem_value_2" style="left:50px;"
                                                class="input-label">Value</label>
                                        </div>
                                        <span id="oem_value_2_err" class="err-text"></span>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="vendor_rating[]" id="vendor_rating_2"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="5">5</option>
                                                <option value="4">4</option>
                                                <option value="3">3</option>
                                                <option value="2">2</option>
                                                <option value="1">1</option>
                                            </select>
                                            <label for="vendor_rating_2" class="input-label">Vendor Rating</label>
                                            <span id="vendor_rating_1_err" class="err-text"></span>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <h6 class="input-section-heading mb-8">3.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="oem_supplying_to[]" id="oem_supplying_to_3"
                                                class="input-field" placeholder="OEM Supplying to" autocomplete="off">
                                            <label for="oem_supplying_to_3" class="input-label">OEM Supplying to</label>
                                            <span id="oem_supplying_to_3_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="supplier_since[]" id="supplier_since_3"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                                <option value="2024">2024</option>
                                            </select>
                                            <label for="supplier_since_3" class="input-label">Supplier Since
                                            </label>
                                            <span id="supplier_since_3_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group d-flex position-relative align-items-center">
                                            <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                <span class="input-group-text" id="basic-addon1"
                                                    style="font-size: 12px; padding: 3px;">USD</span>
                                            </div>
                                            <input type="text" name="oem_value[]" id="oem_value_3"
                                                style="padding-left:50px;" class="input-field" placeholder="Value"
                                                autocomplete="off">
                                            <label for="oem_value_3" style="left:50px;"
                                                class="input-label">Value</label>
                                        </div>
                                        <span id="oem_value_3_err" class="err-text"></span>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="vendor_rating[]" id="vendor_rating_3"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="5">5</option>
                                                <option value="4">4</option>
                                                <option value="3">3</option>
                                                <option value="2">2</option>
                                                <option value="1">1</option>
                                            </select>
                                            <label for="vendor_rating_3" class="input-label">Vendor Rating</label>
                                            <span id="vendor_rating_1_err" class="err-text"></span>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addAnotherOEMDetails()">+ Add Other</button>
                                    </div>
                                </div>


                            </div>
                            <div class="input-field-section mt-32" id="list-of-major-customers-parent">
                                <h6 class="input-section-heading mb-16">List of Major Customers</h6>
                                <div class="row">
                                    <h6 class="input-section-heading mb-8">1.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="customer_name[]" id="customer_name_1"
                                                class="input-field" placeholder="Customer’s Name" autocomplete="off">
                                            <label for="customer_name_1" class="input-label">Customer’s Name</label>
                                            <span id="customer_name_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="customer_address[]" id="customer_address_1"
                                                class="input-field" placeholder="Address" autocomplete="off">
                                            <label for="customer_address_1" class="input-label">Address</label>
                                            <span id="customer_address_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="product_supplied[]" id="product_supplied_1"
                                                class="input-field" placeholder="Product Supplied" required
                                                autocomplete="off">
                                            <label for="product_supplied_1" class="input-label">Product Supplied</label>
                                            <span id="product_supplied_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <h6 class="input-section-heading mb-8">2.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="customer_name[]" id="customer_name_2"
                                                class="input-field" placeholder="Customer’s Name" autocomplete="off">
                                            <label for="customer_name_2" class="input-label">Customer’s Name</label>
                                            <span id="customer_name_2_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="customer_address[]" id="customer_address_2"
                                                class="input-field" placeholder="Address" autocomplete="off">
                                            <label for="customer_address_2" class="input-label">Address</label>
                                            <span id="customer_address_2_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="product_supplied[]" id="product_supplied_2"
                                                class="input-field" placeholder="Product Supplied" required
                                                autocomplete="off">
                                            <label for="product_supplied_2" class="input-label">Product Supplied</label>
                                            <span id="product_supplied_2_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addAnotherListOfMajorCustomer()">+ Add Other</button>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32" id="logistic-service-provider-parent">
                                <h6 class="input-section-heading mb-16">Logistics Service Provider</h6>
                                <div class="row">
                                    <h6 class="input-section-heading mb-8">1.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="provider_name[]" id="provider_name_1"
                                                class="input-field" placeholder="Name" autocomplete="off">
                                            <label for="provider_name_1" class="input-label">Name</label>
                                            <span id="provider_name_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="provider_address[]" id="provider_address_1"
                                                class="input-field" placeholder="Address" autocomplete="off">
                                            <label for="provider_address_1" class="input-label">Address</label>
                                            <span id="provider_address_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="add-provider-1-btn-col">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addAnotherLogisticServiceProvider()">+ Add Other</button>
                                    </div>
                                </div>


                            </div>
                            <div class="input-field-section mt-32" id="exporter-lists-parent">
                                <div class="row mb-16">
                                    <div class="col-12 d-flex align-items-center">
                                        <h6 class="input-section-heading mr-16">Are you an exporter? (If so, please give
                                            details
                                            of export for last 3 years)</h6>
                                        <div class="d-flex align-items-center">
                                            <div class="radio-field-group mr-16 d-flex align-items-center">
                                                <input type="radio" name="is_exporter" checked class="mr-8" required
                                                    autocomplete="off"><label for="">Yes</label>
                                            </div>
                                            <div class="radio-field-group d-flex align-items-center">
                                                <input type="radio" name="is_exporter" class="mr-8" required
                                                    autocomplete="off"><label for="">No</label>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <h6 class="input-section-heading mb-8">1.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="export_financial_year[]" id="export_financial_year_1"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="2023-24">2023-24</option>
                                                <option value="2022-23">2022-23</option>
                                                <option value="2021-22">2021-22</option>
                                            </select>
                                            <label for="export_financial_year_1" class="input-label">Financial
                                                year</label>
                                            <span id="export_financial_year_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="product_or_services[]" id="product_or_services_1"
                                                class="input-field" placeholder="Product/Services" autocomplete="off">
                                            <label for="product_or_services_1"
                                                class="input-label">Product/Services</label>
                                            <span id="product_or_services_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="export_country[]" id="export_country_1"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="india">India</option>
                                                <option value="us">US</option>
                                            </select>
                                            <label for="export_country_1" class="input-label">Country</label>
                                            <span id="export_country_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">

                                        <div class="field-group d-flex position-relative align-items-center">
                                            <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                <span class="input-group-text" id="basic-addon1"
                                                    style="font-size: 12px; padding: 3px;">USD</span>
                                            </div>
                                            <input type="text" name="export_value[]" id="export_value_1"
                                                style="padding-left:50px;" class="input-field" placeholder="Value"
                                                autocomplete="off">
                                            <label for="export_value_1" style="left:50px;"
                                                class="input-label">Value</label>
                                        </div>
                                        <span id="export_value_1_err" class="err-text"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <h6 class="input-section-heading mb-8">2.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="export_financial_year[]" id="export_financial_year_2"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="2023-24">2023-24</option>
                                                <option value="2022-23">2022-23</option>
                                                <option value="2021-22">2021-22</option>
                                            </select>
                                            <label for="export_financial_year_2" class="input-label">Financial
                                                year</label>
                                            <span id="export_financial_year_2_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="product_or_services[]" id="product_or_services_2"
                                                class="input-field" placeholder="Product/Services" autocomplete="off">
                                            <label for="product_or_services_2"
                                                class="input-label">Product/Services</label>
                                            <span id="product_or_services_2_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="export_country[]" id="export_country_2"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="india">India</option>
                                                <option value="us">US</option>
                                            </select>
                                            <label for="export_country_2" class="input-label">Country</label>
                                            <span id="export_country_2_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group d-flex position-relative align-items-center">
                                            <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                <span class="input-group-text" id="basic-addon1"
                                                    style="font-size: 12px; padding: 3px;">USD</span>
                                            </div>
                                            <input type="text" name="export_value[]" id="export_value_2"
                                                style="padding-left:50px;" class="input-field" placeholder="Value"
                                                autocomplete="off">
                                            <label for="export_value_2" style="left:50px;"
                                                class="input-label">Value</label>

                                        </div>
                                        <span id="export_value_2_err" class="err-text"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addAnotherYearExportRow()">+ Add Other</button>
                                    </div>
                                </div>

                            </div>
                            <div class="input-field-section mt-32">
                                <div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
                                    <button class="btn-style-3 mb-32 mr-16" type="button"
                                        onclick="prevStep()">Back</button>
                                    <button class="btn-style-1 mb-32" type="button" onclick="nextStep()">Next</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Financial Information Step-3 -->
                <div class="step d-none">
                    <div class="step-content">
                        <div class="content">
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Bank Account Details</h6>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="bank_name" class="input-field"
                                                placeholder="Bank Name" required autocomplete="off">
                                            <label for="bank_name" class="input-label">Bank Name<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="bank_name_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="account_number" class="input-field"
                                                placeholder="Account Number" required autocomplete="off">
                                            <label for="account_number" class="input-label">Account Number<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="account_number_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="routing_number" class="input-field"
                                                placeholder="Routing Number" required autocomplete="off">
                                            <label for="routing_number" class="input-label">Routing Number<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="routing_number_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="account_type" id="account_type"
                                                class="input-field form-dropdown" required autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="Checking">Checking</option>
                                                <option value="Savings">Savings</option>
                                            </select>
                                            <label for="account_type" class="input-label">Account Type<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="account_type_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Add annual turnover in the past 3 years</h6>
                                <!-- <div class="row" id="annual-turnover-parent">

                                    <div class="col-lg-3 col-md-12 col-sm-12 col-12">
                                        <h6 class="input-section-heading mb-8">1.</h6>
                                    </div>
                                    <div
                                        class="col-lg-3 col-md-12 col-sm-12 col-12 d-none d-sm-none d-md-none d-lg-flex d-xl-flex d-xxl-flex">
                                    </div>
                                    <div
                                        class="col-lg-3 col-md-12 col-sm-12 col-12 d-none d-sm-none d-md-none d-lg-flex d-xl-flex d-xxl-flex">
                                        <h6 class="input-section-heading mb-8">2.</h6>
                                    </div>
                                    <div
                                        class="col-lg-3 col-md-12 col-sm-12 col-12 d-none d-sm-none d-md-none d-lg-flex d-xl-flex d-xxl-flex">
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-16">
                                        <div class="field-group select-field-group">
                                            <select name="financialYear1" id="financialYear1"
                                                class="input-field form-dropdown" required autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="2023-24">2023-24</option>
                                                <option value="2022-23">2022-23</option>
                                                <option value="2021-22">2021-22</option>
                                            </select>
                                            <label for="financialYear1" class="input-label">Financial year</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-16">

                                        <div class="field-group d-flex position-relative align-items-center">
                                            <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                <span class="input-group-text" id="basic-addon1"
                                                    style="font-size: 12px; padding: 3px;">USD</span>
                                            </div>
                                            <input type="text" name="annualTurnover1" style="padding-left:50px;"
                                                class="input-field" placeholder="Annual Turnover" required
                                                autocomplete="off">
                                            <label for="annualTurnover1" style="left:50px;" class="input-label">Annual
                                                Turnover</label>
                                        </div>
                                    </div>
                                    <div
                                        class="col-lg-3 col-md-12 col-sm-12 col-12 d-flex d-sm-flex d-md-flex d-lg-none d-xl-none d-xxl-none">
                                        <h6 class="input-section-heading mb-8">2.</h6>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-16">
                                        <div class="field-group select-field-group">
                                            <select name="financialYear2" id="financialYear2"
                                                class="input-field form-dropdown" required autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="2023-24">2023-24</option>
                                                <option value="2022-23">2022-23</option>
                                                <option value="2021-22">2021-22</option>
                                            </select>
                                            <label for="financialYear2" class="input-label">Financial year</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-16">

                                        <div class="field-group d-flex position-relative align-items-center">
                                            <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                <span class="input-group-text" id="basic-addon1"
                                                    style="font-size: 12px; padding: 3px;">USD</span>
                                            </div>
                                            <input type="text" name="annualTurnover2" style="padding-left:50px;"
                                                class="input-field" placeholder="Annual Turnover" required
                                                autocomplete="off">
                                            <label for="annualTurnover2" style="left:50px;" class="input-label">Annual
                                                Turnover</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                                        <h6 class="input-section-heading">3.</h6>
                                    </div>
                                    <div
                                        class="col-lg-6 col-md-12 col-sm-12 col-12 d-none d-lg-flex d-xl-flex d-xxl-flex">
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-16">
                                        <div class="field-group select-field-group">
                                            <select name="financialYear3" id="financialYear3"
                                                class="input-field form-dropdown" required autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="2023-24">2023-24</option>
                                                <option value="2022-23">2022-23</option>
                                                <option value="2021-22">2021-22</option>
                                            </select>
                                            <label for="financialYear3" class="input-label">Financial year</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-16">

                                        <div class="field-group d-flex position-relative align-items-center">
                                            <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                <span class="input-group-text" id="basic-addon1"
                                                    style="font-size: 12px; padding: 3px;">USD</span>
                                            </div>
                                            <input type="text" name="annualTurnover3" style="padding-left:50px;"
                                                class="input-field" placeholder="Annual Turnover" required
                                                autocomplete="off">
                                            <label for="annualTurnover3" style="left:50px;" class="input-label">Annual
                                                Turnover</label>
                                        </div>
                                    </div>
                                </div> -->
                                <div class="row" style="width:105%" id="annual-turnover-parent">
                                    <div class="col-lg-6 col-md-12 row gx-4">
                                        <h6 class="input-section-heading mb-8">1.</h6>
                                        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
                                            <div class="field-group select-field-group">
                                                <select name="turnover_financial_year[]" id="turnover_financial_year_1"
                                                    class="input-field form-dropdown" autocomplete="off">
                                                    <option value="" selected hidden></option>
                                                    <option value="2023-24">2023-24</option>
                                                    <option value="2022-23">2022-23</option>
                                                    <option value="2021-22">2021-22</option>
                                                </select>
                                                <label for="turnover_financial_year_1" class="input-label">Financial
                                                    year</label>
                                                <span id="turnover_financial_year_1_err" class="err-text"></span>

                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
                                            <div class="field-group d-flex position-relative align-items-center">
                                                <div class="input-group-prepend position-absolute"
                                                    style="left: 10px; width: 32px; height: 32px;">
                                                    <span class="input-group-text" id="basic-addon1"
                                                        style="font-size: 12px; padding: 3px;">USD</span>
                                                </div>
                                                <input type="text" name="turnover_value[]" id="turnover_value_1"
                                                    style="padding-left:50px;" class="input-field"
                                                    placeholder="Annual Turnover" autocomplete="off">
                                                <label for="turnover_value_1" style="left:50px;"
                                                    class="input-label">Annual
                                                    Turnover</label>
                                            </div>
                                            <span id="turnover_value_1_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 row gx-4">
                                        <h6 class="input-section-heading mb-8">2.</h6>
                                        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
                                            <div class="field-group select-field-group">
                                                <select name="turnover_financial_year[]" id="turnover_financial_year_2"
                                                    class="input-field form-dropdown" autocomplete="off">
                                                    <option value="" selected hidden></option>
                                                    <option value="2023-24">2023-24</option>
                                                    <option value="2022-23">2022-23</option>
                                                    <option value="2021-22">2021-22</option>
                                                </select>
                                                <label for="turnover_financial_year_2" class="input-label">Financial
                                                    year</label>
                                                <span id="turnover_financial_year_2_err" class="err-text"></span>

                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
                                            <div class="field-group d-flex position-relative align-items-center">
                                                <div class="input-group-prepend position-absolute"
                                                    style="left: 10px; width: 32px; height: 32px;">
                                                    <span class="input-group-text" id="basic-addon1"
                                                        style="font-size: 12px; padding: 3px;">USD</span>
                                                </div>
                                                <input type="text" name="turnover_value[]" id="turnover_value_2"
                                                    style="padding-left:50px;" class="input-field"
                                                    placeholder="Annual Turnover" autocomplete="off">
                                                <label for="turnover_value_2" style="left:50px;"
                                                    class="input-label">Annual
                                                    Turnover</label>
                                            </div>
                                            <span id="turnover_value_2_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 row gx-4">
                                        <h6 class="input-section-heading mb-8">3.</h6>
                                        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
                                            <div class="field-group select-field-group">
                                                <select name="turnover_financial_year[]" id="turnover_financial_year_3"
                                                    class="input-field form-dropdown" autocomplete="off">
                                                    <option value="" selected hidden></option>
                                                    <option value="2023-24">2023-24</option>
                                                    <option value="2022-23">2022-23</option>
                                                    <option value="2021-22">2021-22</option>
                                                </select>
                                                <label for="turnover_financial_year_3" class="input-label">Financial
                                                    year</label>
                                                <span id="turnover_financial_year_3_err" class="err-text"></span>

                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
                                            <div class="field-group d-flex position-relative align-items-center">
                                                <div class="input-group-prepend position-absolute"
                                                    style="left: 10px; width: 32px; height: 32px;">
                                                    <span class="input-group-text" id="basic-addon1"
                                                        style="font-size: 12px; padding: 3px;">USD</span>
                                                </div>
                                                <input type="text" name="turnover_value[]" id="turnover_value_3"
                                                    style="padding-left:50px;" class="input-field"
                                                    placeholder="Annual Turnover" autocomplete="off">
                                                <label for="turnover_value_3" style="left:50px;"
                                                    class="input-label">Annual
                                                    Turnover</label>
                                            </div>
                                            <span id="turnover_value_3_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <!-- <div class="col-12 row">
                                        <div class="col-lg-3 col-md-6 col-sm-12"> </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <button class="btn-style-2 w-100" type="button"
                                                onclick="addAnotherAnnualYearTurnover()">+ Add Other</button>
                                        </div>
                                    </div> -->
                                </div>
                                <div class="row row-gap-16 mb-64">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addAnotherAnnualYearTurnover()">+ Add Other</button>
                                    </div>
                                </div>

                            </div>
                            <div class="input-field-section mt-32">
                                <div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
                                    <button class="btn-style-3 mb-32 mr-16" type="button"
                                        onclick="prevStep()">Back</button>
                                    <button class="btn-style-1 mb-32" type="button" onclick="nextStep()">Next</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Technical Capabilities Step-4 -->
                <div class="step d-none">
                    <div class="step-content">
                        <div class="content">
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Registered Address of Factory</h6>
                                <div id="reg-addresses-of-factory-parent">
                                    <div>
                                        <div class="row">
                                            <h6 class="input-section-heading mb-8">1.</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="factory_name[]" id="factory_name_1"
                                                        class="input-field" placeholder="Factory Name"
                                                        autocomplete="off">
                                                    <label for="factory_name_1" class="input-label">Factory Name</label>
                                                    <span id="factory_name_1_err" class="err-text"></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="area_in_square_mtr[]"
                                                        id="area_in_square_mtr_1" class="input-field"
                                                        placeholder="Area in Square Meter" autocomplete="off">
                                                    <label for="area_in_square_mtr_1" class="input-label">Area in Square
                                                        Meter</label>
                                                    <span id="area_in_square_mtr_1_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="factory_address[]" id="factory_address_1"
                                                        class="input-field" placeholder="Address" autocomplete="off">
                                                    <label for="factory_address_1" class="input-label">Address</label>
                                                    <span id="factory_address_1_err" class="err-text"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addAnotherRegAddressOfFactory()">+ Add Other</button>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Details of manpower available in the factory
                                </h6>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="total_employees" class="input-field"
                                                placeholder="Total No. of Employees" autocomplete="off">
                                            <label for="total_employees" class="input-label">Total No. of
                                                Employees</label>
                                            <span id="total_employees_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="supervisors" class="input-field"
                                                placeholder="Supervisors" autocomplete="off">
                                            <label for="supervisors" class="input-label">Supervisors</label>
                                            <span id="supervisors_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="engg_degree_or_diploma" class="input-field"
                                                placeholder="Engg. Degree/Diploma Holders" autocomplete="off">
                                            <label for="engg_degree_or_diploma" class="input-label">Engg.
                                                Degree/Diploma</label>
                                            <span id="engg_degree_or_diploma_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="skilled_workers" class="input-field"
                                                placeholder="Skilled Workers" autocomplete="off">
                                            <label for="skilled_workers" class="input-label">Skilled Workers</label>
                                            <span id="skilled_workers_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="design_department" class="input-field"
                                                placeholder="Design Department" autocomplete="off">
                                            <label for="design_department" class="input-label">Design Department</label>
                                            <span id="design_department_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="quality_control_and_inspection" class="input-field"
                                                placeholder="Quality Control & Inspection" autocomplete="off">
                                            <label for="quality_control_and_inspection" class="input-label">Quality
                                                Control &
                                                Inspection</label>
                                            <span id="quality_control_and_inspection_err" class="err-text"></span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">List of Machining / Fabrication & Material
                                    Handling
                                    Facilities Available in the Factory</h6>
                                <div id="machine-list-parent">
                                    <div>
                                        <div class="row">
                                            <h6 class="input-section-heading mb-8">1.</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="machining_facility[]"
                                                        id="machining_facility_1" class="input-field"
                                                        placeholder="Details of facility available" autocomplete="off">
                                                    <label for="machining_facility_1" class="input-label">Details of
                                                        facility
                                                        available</label>
                                                    <span id="machining_facility_1_err" class="err-text"></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="machining_facility_remark[]"
                                                        id="machining_facility_remark_1" class="input-field"
                                                        placeholder="Remarks if any" autocomplete="off">
                                                    <label for="machining_facility_remark_1" class="input-label">Remarks
                                                        if any</label>
                                                    <span id="machining_facility_remark_1_err" class="err-text"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addAnotherMachineList()">+ Add Other</button>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">List of Inspection / Testing Facilities
                                    Available in the
                                    Factory</h6>
                                <div id="inspection-list-parent">
                                    <div>
                                        <div class="row">
                                            <h6 class="input-section-heading mb-8">1.</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="inspection_facility[]"
                                                        id="inspection_facility_1" class="input-field"
                                                        placeholder="Details of facility available" autocomplete="off">
                                                    <label for="inspection_facility_1" class="input-label">Details of
                                                        facility
                                                        available</label>
                                                    <span id="inspection_facility_1_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="inspection_facility_remark[]"
                                                        id="inspection_facility_remark_1" class="input-field"
                                                        placeholder="Remarks if any" autocomplete="off">
                                                    <label for="inspection_facility_remark_1"
                                                        class="input-label">Remarks if any</label>
                                                    <span id="inspection_facility_remark_1_err" class="err-text"></span>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addAnotherInspectionList()">+ Add Other</button>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
                                    <button class="btn-style-3 mb-32 mr-16" type="button"
                                        onclick="prevStep()">Back</button>
                                    <button class="btn-style-1 mb-32" type="button" onclick="nextStep()">Next</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Upload Certifications Step-5 -->
                <div class="step d-none">
                    <div class="step-content">
                        <div class="content">
                            <div class="input-field-section mt-32">
                                <!-- <h6 class="input-section-heading mb-16">Upload Certifications</h6> -->
                                <div class="row row-gap-16">
                                    <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                        <div class="card-style-1">
                                            <h6 class="card-title">ISO Certification<span
                                                    class="required-asterisk">*</span>
                                            </h6>
                                            <div class="file-input-field-group p-0">
                                                <input type="file" id="iso_certificate_input" name="iso_certificate"
                                                    class="input-field" accept="application/pdf" placeholder="File"
                                                    required autocomplete="off" hidden>
                                                <button class="input-btn" type="button"
                                                    onclick="handleClick('iso_certificate_input','iso_certificate_text')">Choose
                                                    File</button>
                                                <p id="iso_certificate_text">No File Choosen</p>
                                            </div>
                                            <span id="iso_certificate_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                        <div class="card-style-1">
                                            <h6 class="card-title">AS Certification<span
                                                    class="required-asterisk">*</span>
                                            </h6>
                                            <div class="file-input-field-group p-0">
                                                <input type="file" id="as_certificate_input" name="as_certificate"
                                                    class="input-field" accept="application/pdf" placeholder="File"
                                                    required autocomplete="off" hidden>
                                                <button class="input-btn" type="button"
                                                    onclick="handleClick('as_certificate_input','as_certificate_text')">Choose
                                                    File</button>
                                                <p id="as_certificate_text">No File Choosen</p>
                                            </div>
                                            <span id="as_certificate_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                        <div class="card-style-1">
                                            <h6 class="card-title">OSHA Compliance<span
                                                    class="required-asterisk">*</span>
                                            </h6>
                                            <div class="file-input-field-group p-0">
                                                <input type="file" id="osha_compliance_input" name="osha_compliance"
                                                    class="input-field" accept="application/pdf" placeholder="File"
                                                    required autocomplete="off" hidden>
                                                <button class="input-btn" type="button"
                                                    onclick="handleClick('osha_compliance_input','osha_compliance_text')">Choose
                                                    File</button>
                                                <p id="osha_compliance_text">No File Choosen</p>
                                            </div>
                                            <span id="osha_compliance_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                        <div class="card-style-1">
                                            <h6 class="card-title">FDA Registration<span
                                                    class="required-asterisk">*</span>
                                            </h6>
                                            <div class="file-input-field-group p-0">
                                                <input type="file" id="fda_registration_input" name="fda_registration"
                                                    class="input-field" accept="application/pdf" placeholder="File"
                                                    required autocomplete="off" hidden>
                                                <button class="input-btn" type="button"
                                                    onclick="handleClick('fda_registration_input','fda_registration_text')">Choose
                                                    File</button>
                                                <p id="fda_registration_text">No File Choosen</p>
                                            </div>
                                            <span id="fda_registration_err" class="err-text"></span>

                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                        <div class="card-style-1">
                                            <!-- <h6 class="card-title">Other(Please Specify)<span
                                                    class="required-asterisk">*</span>
                                            </h6> -->
                                            <div class="custom-field-group">
                                                <input type="text" name="other_certificate_name" class="mb-8"
                                                    placeholder="Others(please specify)" required autocomplete="off">
                                            </div>

                                            <div class="file-input-field-group p-0">
                                                <input type="file" id="other_certificate_input" name="other_certificate"
                                                    accept="application/pdf" class="input-field" placeholder="File"
                                                    required autocomplete="off" hidden>
                                                <button class="input-btn" type="button"
                                                    onclick="handleClick('other_certificate_input','other_certificate_text')">Choose
                                                    File</button>
                                                <p id="other_certificate_text">No File Choosen</p>
                                            </div>
                                            <span id="other_certificate_err" class="err-text"></span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
                                    <button class="btn-style-3 mb-32 mr-16" type="button"
                                        onclick="prevStep()">Back</button>
                                    <button class="btn-style-1 mb-32" type="button" onclick="nextStep()">Next</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- References Step-6 -->
                <div class="step d-none">
                    <div class="step-content">
                        <div class="content">
                            <div class="input-field-section mt-32">
                                <!-- <h6 class="input-section-heading mb-16">Upload Certifications</h6> -->
                                <div class="row row-gap-16">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="card-style-1 project-case-stu-card-style-1">
                                            <h6 class="card-title">Project Case Studies</h6>
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="file-input-field-group p-0">
                                                    <input type="file" id="project_case_studies_input"
                                                        accept="application/pdf" name="project_case_studies"
                                                        class="input-field" placeholder="File" autocomplete="off"
                                                        hidden>
                                                    <button class="input-btn" type="button"
                                                        onclick="handleClick('project_case_studies_input','project_case_studies_text')">Choose
                                                        File</button>
                                                    <p id="project_case_studies_text">No File Choosen</p>
                                                </div>
                                                <span id="project_case_studies_err" class="err-text"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Customer Testimonials / Awards</h6>
                                <div id="testimonials-list-parent">
                                    <div class="row">
                                        <div class="col-12">
                                            <h6 class="input-section-heading mb-8">1.</h6>
                                        </div>
                                        <div class="col-lg-9 col-md-6 col-sm-12 col-12 mb-16">
                                            <div class="field-group">
                                                <input type="text" name="testimonials_or_awards[]"
                                                    id="testimonials_or_awards_1" class="input-field"
                                                    placeholder="Customer Testimonials / Awards" autocomplete="off">
                                                <label for="testimonials_or_awards_1" class="input-label">Customer
                                                    Testimonials
                                                    /
                                                    Awards</label>
                                                <span id="testimonials_or_awards_1_err" class="err-text"></span>

                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="testimonials-btn-1">
                                            <button class="btn-style-2 w-100" type="button"
                                                onclick="addAnotherTestimonialList()">+ Add Other</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <p class="declaration-text mb-16">By signing below, the supplier agrees to provide
                                    accurate and
                                    up-to-date information and to comply with all regulations and requirements.</p>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="date" readonly name="date" class="input-field auto-fill-date"
                                                required autocomplete="off">
                                            <!-- <label for="date" class="input-label">Date</label> -->
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-32">
                                        <div class="file-input-field-group">
                                            <input type="file" id="signature_input" name="signature"
                                                accept="application/pdf" class="input-field" placeholder="File" required
                                                autocomplete="off" hidden>
                                            <button class="input-btn" type="button"
                                                onclick="handleClick('signature_input','signature_text')">Choose
                                                File</button>
                                            <p id="signature_text">No File Choosen</p>
                                        </div>
                                        <div class="fileType-and-maxFileSize">
                                            <p>Attach your signature here<span class="required-asterisk">*</span></p>
                                            <p>File Size: Max 2 MB</p>
                                            <span id="signature_err" class="err-text"></span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
                                    <button class="btn-style-3 mb-32 mr-16" type="button"
                                        onclick="prevStep()">Back</button>
                                    <button class="btn-style-1 mb-32" type="button" onclick="nextStep()">Next</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Supplier Reference Program Step-7 -->
                <div class="step d-none">
                    <div class="step-content">
                        <div class="content">
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Supplier Reference Program</h6>
                                <div class="row row-gap-16">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">As a leading supplier in the manufacturing industry in India,
                                            we
                                            believe that your success story can inspire and benefit other businesses
                                            seeking
                                            similar services. By featuring your story on our platform, we aim to
                                            highlight your
                                            achievements and attract more customers who can benefit from your expertise
                                            and
                                            services. </p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">We are writing to inform you of our new Supplier Reference
                                            Program,
                                            which we are launching to showcase the success of our valued suppliers to
                                            potential
                                            customers. </p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">
                                            As one of our esteemed suppliers, we would like to invite you to participate
                                            in this
                                            program. We believe that your experience with our platform will provide
                                            valuable
                                            insights to potential customers, and we are excited to showcase your success
                                            story
                                            as a testament to the effectiveness of our platform. </p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">
                                            By participating in this program, you will have the opportunity to feature
                                            in our
                                            marketing campaigns, on our website, and in other promotional materials.
                                            This will
                                            give you an opportunity to showcase your business to a wider audience and
                                            attract
                                            new customers. </p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">
                                            Key Benefits: </p>
                                        <ul>
                                            <li>Visibility for your organization and your spokesperson</li>
                                            <li>Increase reach of your brand</li>
                                            <li>Business opportunities from publicity and networking platforms </li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">
                                            To participate in the program, we request that you provide us with your
                                            permission
                                            to use your company name, logo, and testimonials on our promotional
                                            materials. We
                                            also kindly ask that you provide us with a brief summary of your experience
                                            with our
                                            platform, highlighting your achievements and successes</p>

                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">
                                            If you agree to participate in this program, please fill out the attached
                                            form and
                                            return it to us. We will then follow up with you to discuss the next steps.
                                        </p>

                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">
                                            Thank you for your continued support of our platform. We look forward to
                                            featuring
                                            your success story in our promotional materials and attracting new customers
                                            to your
                                            business. </p>

                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">
                                            Your participation in our customer reference program is perpetual and free
                                            of cost.
                                            Think of it as a comprehensive marketing program for your organization that
                                            extends
                                            beyond a limited period</p>

                                    </div>

                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Identification / Designation</h6>
                                <p class="content mb-16">Please provide your organization contact point for all Customer
                                    Reference Program communication activities:</p>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="ref_name" class="input-field" placeholder="ref_"
                                                required autocomplete="off">
                                            <label for="ref_name" class="input-label">Name<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="ref_name_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="ref_job_title" class="input-field"
                                                placeholder="Job Title" required autocomplete="off">
                                            <label for="ref_job_title" class="input-label">Job Title<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="ref_job_title_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="ref_company_name" class="input-field"
                                                placeholder="Company Name" required autocomplete="off">
                                            <label for="ref_company_name" class="input-label">Company Name<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="ref_company_name_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="ref_company_website" class="input-field"
                                                placeholder="Company Website" required autocomplete="off">
                                            <label for="ref_company_website" class="input-label">Company Website<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="ref_company_website_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="ref_phone_number" class="input-field"
                                                placeholder="Phone Number" required autocomplete="off">
                                            <label for="ref_phone_number" class="input-label">Phone Number<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="ref_phone_number_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="email" name="ref_email" class="input-field" placeholder="Email"
                                                required autocomplete="off">
                                            <label for="ref_email" class="input-label">Email<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="ref_email_err" class="err-text"></span>

                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="input-field-section mt-32">
                                <div class="row row-gap-16 ">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">Participation:</p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">By participating in this program, we would like to showcase
                                            your
                                            company's name, logo, and solution specifics for internal presentations,
                                            corporate
                                            intranet, case studies, and customer testimonial videos. We would also like
                                            to seek
                                            your permission to reference your company and its activities externally.
                                        </p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <p class="content">Please indicate which areas/activities your company is
                                            willing to
                                            participate in for external references by selecting all relevant options
                                            below</p>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <div class="row row-gap-16">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox1" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Presentations: Use your company name,
                                                logo, and
                                                solution details in speeches and presentations.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox2" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Newsletters: Use your company name,
                                                logo, and
                                                solution details in printed and electronic newsletters.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox3" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Customer Profile on Web: Display your
                                                company
                                                name, logo, and solution details on our website.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox4" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">RFP: Use your company name and solution
                                                details
                                                to respond to customer requests for proposals.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox5" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Online/Direct Marketing Campaigns: Use
                                                your
                                                company name, logo, and solution details in online and/or direct
                                                marketing
                                                campaigns.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox6" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Sponsored Events: Participate in
                                                sponsored
                                                events and display your company name, logo, and solution
                                                details.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox7" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Case Study: Use your company name and
                                                solution
                                                details in a case study brochure and presentation.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox8" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">White Paper: Use your company name and
                                                solution
                                                details in a white paper.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox9" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Broadcast Media: Be contacted by print
                                                or
                                                broadcast media representatives and consulted each time your
                                                organization's name
                                                is used as a client reference.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox10" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Press/Analysts: Meet with analysts and
                                                members
                                                of the media and be consulted each time your organization's name is used
                                                as a
                                                client reference.</label>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox11" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Customer Testimonial Letter: Provide a
                                                written
                                                testimonial for internet use.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox12" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Customer Testimonial Video: Participate
                                                in a
                                                video testimonial which displays your company name, logo, and solution
                                                details.</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="checkbox-field-group d-flex">
                                            <input type="checkbox" name="checkbox13" class="mr-8 child-checkboxes"
                                                autocomplete="off"><label for="">Speaking Engagement: Participate in
                                                speaking
                                                engagements to gain high-profile access to industry and media audiences
                                                and
                                                enhance your marketplace positioning.</label>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="checkbox-field-group d-flex">
                                        <input type="checkbox" name="checkbox14" class="mr-8 parent-checkbox"
                                            onclick="tickAllCheckboxes('parent-checkbox','child-checkboxes')"
                                            autocomplete="off"><label for=""><span style="font-weight: bold;">Select
                                                above all activities</span> to participate in all the
                                            activities in the Supplier Reference Program</label>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-16">
                                <p class="content mb-16">I, the undersigned, agree to participate in the Supplier
                                    Reference
                                    Program , I give my permission to use my company name, logo, and testimonials in its
                                    marketing campaigns, on its website, and in other promotional materials.</p>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="date" readonly name="ref_date"
                                                class="input-field auto-fill-date" required autocomplete="off">
                                            <!-- <label for="ref_date" class="input-label">Date</label> -->
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-32">
                                        <div class="file-input-field-group">
                                            <input type="file" id="ref_signature_input" name="ref_signature"
                                                accept="application/pdf" class="input-field" placeholder="File" required
                                                autocomplete="off" hidden>
                                            <button class="input-btn" type="button"
                                                onclick="handleClick('ref_signature_input','ref_signature_text')">Choose
                                                File</button>
                                            <p id="ref_signature_text">No File Choosen</p>
                                        </div>
                                        <div class="fileType-and-maxFileSize">
                                            <p>Attach your signature here<span class="required-asterisk">*</span></p>
                                            <p>File Size: Max 2 MB</p>
                                            <span id="ref_signature_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
                                    <button class="btn-style-3 mb-32 mr-16" type="button"
                                        onclick="prevStep()">Back</button>
                                    <button class="btn-style-1 mb-32" type="submit" id="submit-btn">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
        <div class="footer-row">
            <div class="col-12">
                <p class="text-center m-0">2024 CNERZY. All rights reserved.</p>
            </div>
        </div>
    </div>



    <!-- Thank you popup starts -->
    <div class="modal fade custom-thank-you-modal modal-lg" id="thank-you-modal" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <img class="modal-img mb-16" src="assets/icons/Succeess Animation.svg" alt="Success Animation">
                <h2 class="modal-heading text-center mb-8">Thank You!</h2>
                <p class="modal-para text-center">You've successfully completed your onboarding process.</p>
            </div>
        </div>
    </div>

    <!-- Thank you popup ends -->


    <!-- <script>
        document.addEventListener('DOMContentLoaded', function () {
            var stepper = new Stepper(document.querySelector('.bs-stepper'))
        })
    </script> -->


    <script src="assets/js/index.js"></script>
    <script src="assets/js/stepper.js"></script>
    <script>
        // getAllInput()
    </script>

    <!-- script for adding new Contact person details row -->
    <script>
        let contactPersonInputBox = document.getElementById('contact-person-box');
        let row = 2;

        function addNewContactPersonRow() {
            let newInputRow = `
        <div class="row row-gap-16" style="margin-top:16px;">
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="field-group">
                    <input type="text" name="contact_person_name[]" id="contact_person_name_${row}" class="input-field contact_person_name" placeholder="Name" autocomplete="off">
                    <label for="contact_person_name_${row}" class="input-label">Name</label>
                    <span id="contact_person_name_${row}_err" class="err-text"></span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="field-group">
                    <input type="text" name="contact_person_designation[]" id="contact_person_designation_${row}" class="input-field contact_person_designation" placeholder="Designation"  autocomplete="off">
                    <label for="contact_person_designation_${row}" class="input-label">Designation</label>
                    <span id="contact_person_designation_${row}_err" class="err-text"></span>

                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="field-group">
                    <input type="email" name="contact_person_email[]" id="contact_person_email_${row}" class="input-field contact_person_email" placeholder="Email" autocomplete="off">
                    <label for="contact_person_email_${row}" class="input-label">Email</label>
                    <span id="contact_person_email_${row}_err" class="err-text"></span>

                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="field-group">
                    <input type="text" name="contact_person_phone[]" id="contact_person_phone_${row}" class="input-field contact_person_phone" placeholder="Phone" autocomplete="off">
                    <label for="contact_person_phone_${row}" class="input-label">Phone</label>
                    <span id="contact_person_phone_${row}_err" class="err-text"></span>

                </div>
            </div>
        </div>
    `;

            // Create a temporary container element
            let tempContainer = document.createElement('div');

            // Set its innerHTML to the newInputRow HTML string
            tempContainer.innerHTML = newInputRow;

            // Append the child nodes of the temporary container to the contactPersonInputBox
            while (tempContainer.firstChild) {
                contactPersonInputBox.appendChild(tempContainer.firstChild);
            }
            row = row + 1;

            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep1();
                });
            }
        }
    </script>


    <!-- script for adding new Major product column -->
    <script>
        let parentElement = document.querySelector(
            '#major-product-row'); // Select the parent element where new columns will be appended
        let productCount = 3; // Initialize the product count

        function addAnotherMajorProduct() {
            // Increment the product count
            productCount++;

            // Create a new column div
            let newColumn = document.createElement('div');
            newColumn.className = 'col-lg-3 col-md-6 col-sm-12 col-12';
            newColumn.innerHTML = `<div class="field-group">
                                    <input type="text" name="name_of_product[]" id="name_of_product_${productCount}" class="input-field"
                                        placeholder="Name of Major Product ${productCount}" required autocomplete="off">
                                    <label for="name_of_product_${productCount}" class="input-label">Name of Major Product
                                        ${productCount}</label>
                                        <span id="name_of_product_${productCount}_err" class="err-text"></span>

                                </div>`;

            // Append the new column to the parent element
            parentElement.insertBefore(newColumn, parentElement.lastElementChild);
            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep2();
                });
            }
        }
    </script>



    <!-- script for adding new OEM Row -->
    <script>
        let parentRow = document.querySelector(
            '#oem-details-parent'); // Select the parent row where new rows will be appended
        let rowCount = 3; // Initialize the row count

        function addAnotherOEMDetails() {
            // Increment the row count
            rowCount = rowCount + 1

            // Create a new row div
            let newRow = document.createElement('div');

            // Set inner HTML for the new row
            newRow.innerHTML = `
            <div class="row">
                                    <h6 class="input-section-heading mb-8">${rowCount}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">           
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="oem_supplying_to[]" id="oem_supplying_to_${rowCount}" class="input-field"
                                        placeholder="OEM Supplying to"  autocomplete="off">
                                    <label for="oem_supplying_to_${rowCount}" class="input-label">OEM Supplying to</label>
                                    <span id="oem_supplying_to_${rowCount}_err" class="err-text"></span>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group">
                                    <select name="supplier_since[]" id="supplier_since_${rowCount}"
                                        class="input-field form-dropdown"  autocomplete="off">
                                        <option value="" selected hidden></option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                                <option value="2024">2024</option>
                                    </select>
                                    <label for="supplier_since_${rowCount}" class="input-label">Supplier Since
                                    </label>
                                    <span id="supplier_since_${rowCount}_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group d-flex position-relative align-items-center">
                                    <div class="input-group-prepend position-absolute"
                                        style="left: 10px; width: 32px; height: 32px;">
                                        <span class="input-group-text" id="basic-addon1"
                                            style="font-size: 12px; padding: 3px;">USD</span>
                                    </div>
                                    <input type="text" name="oem_value[]" id="oem_value_${rowCount}" style="padding-left:50px;"
                                        class="input-field" placeholder="Value"  autocomplete="off">
                                    <label for="oem_value_${rowCount}" style="left:50px;" class="input-label">Value</label>
                                    
                                    </div>
                                    <span id="oem_value_${rowCount}_err" class="err-text"></span>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group">
                                    <select name="vendor_rating[]" id="vendor_rating_${rowCount}"
                                        class="input-field form-dropdown"  autocomplete="off">
                                        <option value="" selected hidden></option>
                                        <option value="5">5</option>
                                        <option value="4">4</option>
                                        <option value="3">3</option>
                                        <option value="2">2</option>
                                        <option value="1">1</option>
                                    </select>
                                    <label for="vendor_rating_${rowCount}" class="input-label">Vendor Rating</label>
                                    <span id="vendor_rating_${rowCount}_err" class="err-text"></span>

                                </div>
                            </div></div>`;

            // Append the new row to the parent row
            parentRow.insertBefore(newRow, parentRow.lastElementChild);

            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep2();
                });
            }
        }
    </script>


    <!-- script for adding list of major customers -->
    <script>
        let majorCustomerParent = document.querySelector(
            '#list-of-major-customers-parent'); // Select the parent row where new rows will be appended
        let listCount = 2; // Initialize the row count

        function addAnotherListOfMajorCustomer() {
            // Increment the row count
            listCount = listCount + 1

            // Create a new row div
            let newList = document.createElement('div');

            // Set inner HTML for the new row
            newList.innerHTML = `<div class="row">
                                    <h6 class="input-section-heading mb-8">${listCount}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="customer_name[]" id="customer_name_${listCount}" class="input-field"
                                                placeholder="Customer’s Name" autocomplete="off">
                                            <label for="customer_name_${listCount}" class="input-label">Customer’s Name</label>
                                            <span id="customer_name_${listCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="customer_address[]" id="customer_address_${listCount}" class="input-field" placeholder="Address"
                                                 autocomplete="off">
                                            <label for="customer_address_${listCount}" class="input-label">Address</label>
                                            <span id="customer_address_${listCount}_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="product_supplied[]" id="product_supplied_${listCount}" class="input-field"
                                                placeholder="Product Supplied" required autocomplete="off">
                                            <label for="product_supplied_${listCount}" class="input-label">Product Supplied</label>
                                            <span id="product_supplied_${listCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>`;

            // Append the new row to the parent row
            majorCustomerParent.insertBefore(newList, majorCustomerParent.lastElementChild);

            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep2();
                });
            }
        }
    </script>


    <!-- script for adding Logistic Service Provide -->
    <script>
        let logisticServiceProviderParent = document.querySelector(
            '#logistic-service-provider-parent'); // Select the parent row where new rows will be appended
        let providerCount = 1; // Initialize the row count

        function addAnotherLogisticServiceProvider() {

            // Increment the row count
            providerCount = providerCount + 1

            // Create a new row div
            let providerRow = document.createElement('div');

            // Set inner HTML for the new row
            providerRow.innerHTML = `<div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="provider_name[]" id="provider_name_${providerCount}" class="input-field"
                                                placeholder="Name"  autocomplete="off">
                                            <label for="provider_name_${providerCount}" class="input-label">Name</label>
                                            <span id="provider_name_${providerCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="provider_address[]" id="provider_address_${providerCount}" class="input-field"
                                                placeholder="Address"  autocomplete="off">
                                            <label for="provider_address_${providerCount}" class="input-label">Address</label>
                                            <span id="provider_address_${providerCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="add-provider-${providerCount}-btn-col">
                                        <button class="btn-style-2 w-100" type="button" onclick="addAnotherLogisticServiceProvider()">+ Add Other</button>
                                    </div>
                                </div>

            `;


            setTimeout(() => {
                document.querySelector(`#add-provider-${providerCount}-btn-col`).style.display = "none"
            }, 0)
            // Append the new row to the parent row
            logisticServiceProviderParent.insertBefore(providerRow, logisticServiceProviderParent.lastElementChild);
            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep2();
                });
            }
        }
    </script>




    <!-- script for adding exporter list -->
    <script>
        let exporterListsParent = document.querySelector(
            '#exporter-lists-parent'); // Select the parent row where new rows will be appended
        let exporterListCount = 2; // Initialize the row count

        function addAnotherYearExportRow() {
            // Increment the row count
            exporterListCount = exporterListCount + 1

            // Create a new row div
            let newExporterList = document.createElement('div');

            // Set inner HTML for the new row
            newExporterList.innerHTML = `<div class="row">
                                    <h6 class="input-section-heading mb-8">${exporterListCount}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="export_financial_year[]" id="export_financial_year_${exporterListCount}"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="2023-24">2023-24</option>
                                                <option value="2022-23">2022-23</option>
                                                <option value="2021-22">2021-22</option>
                                            </select>
                                            <label for="export_financial_year_${exporterListCount}" class="input-label">Financial year</label>
                                            <span id="export_financial_year_${exporterListCount}_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="product_or_services[]" id="product_or_services_${exporterListCount}" class="input-field"
                                                placeholder="Product/Services"  autocomplete="off">
                                            <label for="product_or_services_${exporterListCount}" class="input-label">Product/Services</label>
                                            <span id="product_or_services_${exporterListCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="export_country[]" id="export_country_${exporterListCount}" class="input-field form-dropdown"
                                                 autocomplete="off">
                                                <option value="" selected hidden></option>
                                                <option value="india">India</option>
                                                <option value="us">US</option>
                                            </select>
                                            <label for="export_country_${exporterListCount}" class="input-label">Country</label>
                                            <span id="export_country_${exporterListCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group d-flex position-relative align-items-center">
                                            <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                <span class="input-group-text" id="basic-addon1"
                                                    style="font-size: 12px; padding: 3px;">USD</span>
                                            </div>
                                            <input type="text" name="export_value[]"  id="export_value_${exporterListCount}" style="padding-left:50px;"
                                                class="input-field" placeholder="Value"  autocomplete="off">
                                            <label for="export_value_${exporterListCount}" style="left:50px;" class="input-label">Value</label>
                                            </div>
                                            <span id="export_value_${exporterListCount}_err" class="err-text"></span>
                                    </div>
                                </div>`;

            // Append the new row to the parent row
            exporterListsParent.insertBefore(newExporterList, exporterListsParent.lastElementChild);

            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep2();
                });
            }
        }
    </script>



    <!-- script for adding annual year turnover -->
    <script>
        let annualTurnoverParent = document.querySelector(
            '#annual-turnover-parent'); // Select the parent row where new rows will be appended
        let annualTurnoverListCount = 3; // Initialize the row count

        function addAnotherAnnualYearTurnover() {
            // Increment the row count
            annualTurnoverListCount = annualTurnoverListCount + 1

            // Create a new div element to hold the new fields
            var newDiv = document.createElement("div");
            newDiv.className = "col-lg-6 col-md-12 row";

            // Set the content for the new section
            newDiv.innerHTML = `
        <h6 class="input-section-heading mb-8">${annualTurnoverListCount}.</h6>
        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
            <div class="field-group select-field-group">
                <select name="turnover_financial_year[]" id="turnover_financial_year_${annualTurnoverListCount}" class="input-field form-dropdown"  autocomplete="off">
                    <option value="" selected hidden></option>
                    <option value="2023-24">2023-24</option>
                    <option value="2022-23">2022-23</option>
                    <option value="2021-22">2021-22</option>
                </select>
                <label for="turnover_financial_year_${annualTurnoverListCount}" class="input-label">Financial year</label>
                <span id="turnover_financial_year_${annualTurnoverListCount}_err" class="err-text"></span>

            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
            <div class="field-group d-flex position-relative align-items-center">
                <div class="input-group-prepend position-absolute" style="left: 10px; width: 32px; height: 32px;">
                    <span class="input-group-text" id="basic-addon-1" style="font-size: 12px; padding: 3px;">USD</span>
                </div>
                <input type="text" name="turnover_value[]" id="turnover_value_${annualTurnoverListCount}" style="padding-left:50px;" class="input-field" placeholder="Annual Turnover"  autocomplete="off">
                <label for="turnover_value_${annualTurnoverListCount}" style="left:50px;" class="input-label">Annual Turnover</label>

                </div>
                <span id="turnover_value_${annualTurnoverListCount}_err" class="err-text"></span>

        </div>
    `;

            // Append the new section to the parent element
            annualTurnoverParent.appendChild(newDiv);

            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep3();
                });
            }

        }
    </script>




    <!-- script for adding Registered Addresses of factory -->
    <script>
        let regAddressesOfFactoryParent = document.querySelector(
            '#reg-addresses-of-factory-parent'); // Select the parent row where new rows will be appended
        let addressCount = 1; // Initialize the row count

        function addAnotherRegAddressOfFactory() {
            // Increment the row count
            addressCount = addressCount + 1

            // Create a new div element to hold the new fields
            var newAddressList = document.createElement("div");

            // Set the content for the new section
            newAddressList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${addressCount}.</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="factory_name[]" id="factory_name_${addressCount}" class="input-field"
                                                        placeholder="Factory Name"  autocomplete="off">
                                                    <label for="factory_name_${addressCount}" class="input-label">Factory Name</label>
                                                    <span id="factory_name_${addressCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="area_in_square_mtr[]" id="area_in_square_mtr_${addressCount}" class="input-field"
                                                        placeholder="Area in Square Meter"  autocomplete="off">
                                                    <label for="area_in_square_mtr_${addressCount}" class="input-label">Area in Square
                                                        Meter</label>
                                                    <span id="area_in_square_mtr_${addressCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="factory_address[]" id="factory_address_${addressCount}" class="input-field"
                                                        placeholder="Address"  autocomplete="off">
                                                    <label for="factory_address_${addressCount}" class="input-label">Address</label>
                                                    <span id="factory_address_${addressCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                        </div>`;

            // Append the new section to the parent element
            regAddressesOfFactoryParent.appendChild(newAddressList);

            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep4();
                });
            }
        }
    </script>


    <!-- script for adding List of Machining -->
    <script>
        let machiningListParent = document.querySelector(
            '#machine-list-parent'); // Select the parent row where new rows will be appended
        let machineListCount = 1; // Initialize the row count

        function addAnotherMachineList() {
            // Increment the row count
            machineListCount = machineListCount + 1

            // Create a new div element to hold the new fields
            var newMachineList = document.createElement("div");

            // Set the content for the new section
            newMachineList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${machineListCount}.</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="machining_facility[]" id="machining_facility_${machineListCount}" class="input-field"
                                                        placeholder="Details of facility available" 
                                                        autocomplete="off">
                                                    <label for="machining_facility_${machineListCount}" class="input-label">Details of
                                                        facility
                                                        available</label>
                                                        <span id="machining_facility_${machineListCount}_err"
                                                        class="err-text"></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="machining_facility_remark[]" id="machining_facility_remark_${machineListCount}" class="input-field"
                                                        placeholder="Remarks if any"  autocomplete="off">
                                                    <label for="machining_facility_remark_${machineListCount}" class="input-label">Remarks if any</label>
                                                    <span id="machining_facility_remark_${machineListCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                        </div>`;

            // Append the new section to the parent element
            machiningListParent.appendChild(newMachineList);
            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep4();
                });
            }
        }
    </script>


    <!-- script for adding Inspection List -->
    <script>
        let inspectionListParent = document.querySelector(
            '#inspection-list-parent'); // Select the parent row where new rows will be appended
        let InspectionListCount = 1; // Initialize the row count

        function addAnotherInspectionList() {
            // Increment the row count
            InspectionListCount = InspectionListCount + 1

            // Create a new div element to hold the new fields
            var newInspectionList = document.createElement("div");

            // Set the content for the new section
            newInspectionList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${InspectionListCount}.</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="inspection_facility[]" id="inspection_facility_${InspectionListCount}" class="input-field"
                                                        placeholder="Details of facility available"  autocomplete="off">
                                                    <label for="inspection_facility_${InspectionListCount}" class="input-label">Details of facility
                                                        available</label>
                                                    <span id="inspection_facility_${InspectionListCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="inspection_facility_remark[]" id="inspection_facility_remark_${InspectionListCount}" class="input-field"
                                                        placeholder="Remarks if any"  autocomplete="off">
                                                    <label for="inspection_facility_remark_${InspectionListCount}" class="input-label">Remarks if any</label>
                                                    <span id="inspection_facility_remark_${InspectionListCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                        </div>`;

            // Append the new section to the parent element
            inspectionListParent.appendChild(newInspectionList);
            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep4();
                });
            }
        }
    </script>

    <!-- script for adding Testimonials List -->
    <script>
        let testmonialsListParent = document.querySelector(
            '#testimonials-list-parent'); // Select the parent row where new rows will be appended
        let testimonialsListCount = 1; // Initialize the row count

        function addAnotherTestimonialList() {
            // Increment the row count
            testimonialsListCount = testimonialsListCount + 1

            // Create a new div element to hold the new fields
            var newTestimonialList = document.createElement("div");
            newTestimonialList.className = "row";

            // Set the content for the new section
            newTestimonialList.innerHTML = `
                                        <div class="col-12">
                                            <h6 class="input-section-heading mb-8">${testimonialsListCount}.</h6>
                                        </div>
                                        <div class="col-lg-9 col-md-6 col-sm-12 col-12 mb-16">
                                            <div class="field-group">
                                                <input type="text" name="testimonials_or_awards[]" id="testimonials_or_awards_${testimonialsListCount}" class="input-field"
                                                    placeholder="Customer Testimonials / Awards" 
                                                    autocomplete="off">
                                                <label for="testimonials_or_awards_${testimonialsListCount}" class="input-label">Customer
                                                    Testimonials
                                                    /
                                                    Awards</label>
                                                <span id="testimonials_or_awards_${testimonialsListCount}_err" class="err-text"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="testimonials-btn-${testimonialsListCount}">
                                            <button class="btn-style-2 w-100" type="button"
                                                onclick="addAnotherTestimonialList()">+ Add Other</button>
                                        </div>
                                    `;

            setTimeout(() => {
                document.querySelector(`#testimonials-btn-${testimonialsListCount - 1}`).style.display = 'none'
            }, 0)

            // Append the new section to the parent element
            testmonialsListParent.appendChild(newTestimonialList);
            getAllInput()
            for (let input of AllInputs) {
                input.addEventListener('change', function () {
                    validateStep6();
                });
            }

        }
    </script>


    <!-- <script src="assets/js/index.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
        </script>
</body>

</html>