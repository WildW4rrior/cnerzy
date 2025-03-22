<%@ include file="./taglibs.jsp" %>

    <%-- <% // Example of setting the country variable in the servlet or JSP page String country="US" ; // This should
        be set dynamically based on your application's logic request.setAttribute("country", country); %> --%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <c:choose>
                <c:when test="${country == 'IN'}">
                    <title>Onboarding | PM(INDIA)</title>
                </c:when>
                <c:otherwise>
                    <title>Onboarding | PM(US)</title>
                </c:otherwise>
            </c:choose>
            <c:import url="common-header-import.jsp"></c:import>

        </head>
        <style>
            @media (min-width : 576px) {
                .modal-dialog {
                    max-width: var(--bs-modal-width);
                }
            }

            .pr-0 {
                padding-right: 0 !important
            }

            @media (min-width : 576px) {
                .modal-dialog {
                    max-width: var(--bs-modal-width);
                }
            }

            .show-placeholder::placeholder {
                color: var(--gray-4);
            }

            @media (min-width : 992px) {

                .modal-lg,
                .modal-xl {
                    max-width: none !important;
                }
            }

            .show-placeholder::placeholder {
                color: var(--gray-4);
            }
        </style>

        <body>


            <div class="container-fluid bg-gray box-style-1">
                <div class="box-style-2">
                    <div class="onboarding-header bg-gray row">
                        <div class="col-sm-3 col-12 logo-col">
                            <a href="#"> <img class="header-logo" src="assets/images/Logo.svg" alt="">
                            </a>
                        </div>
                        <div class="col-sm-9 col-12"></div>
                    </div>
                    <form id="pmOnboarding">

                        <div class="content">
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Personal Information</h6>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="name" id="name" class="input-field"
                                                placeholder="Full Name" required autocomplete="off"> <label for="name"
                                                class="input-label">Full
                                                Name<span class="required-asterisk">*</span></label>
                                            <!-- <div class="error-message err-text"></div> -->
                                            <span id="name_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="email" name="email" id="email" class="input-field"
                                                placeholder="Email Address" required autocomplete="off">
                                            <label for="email" class="input-label">Email Address<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="email_err" class="err-text"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="tel" name="phone" id="phone" class="input-field"
                                                placeholder="Phone Number" maxlength="10" required autocomplete="off">
                                            <label for="phone" class="input-label">Phone Number<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="phone_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group select-field-group-toggle">
                                            <select name="industry" id="industry" class="input-field form-dropdown"
                                                required autocomplete="off">
                                                <option value="" selected>Industry Classification</option>
                                                <option value="Aerospace">Aerospace</option>
                                                <option value="Automotive">Automotive</option>
                                                <option value="Consumer Goods">Consumer Goods</option>
                                                <option value="Energy">Energy</option>
                                                <option value="Industrial Machinery">Industrial Machinery</option>
                                                <option value="Others">Others</option>
                                            </select> <label for="industry" class="input-label">Select<span
                                                    class="required-asterisk">*</span>
                                            </label>
                                            <span id="industry_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group select-field-group-toggle">
                                            <select name="expertise" id="expertise" class="input-field form-dropdown"
                                                required autocomplete="off">
                                                <option value="" selected>Industry Expertise</option>
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
                                            </select> <label for="expertise" class="input-label">Select<span
                                                    class="required-asterisk">*</span>
                                            </label>
                                            <span id="expertise_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Address</h6>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="streetAddress" id="streetAddress"
                                                class="input-field" placeholder="Street Address" required
                                                autocomplete="off">
                                            <label for="streetAddress" class="input-label">Street
                                                Address<span class="required-asterisk">*</span>
                                            </label>
                                            <span id="streetAddress_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="city" id="city" class="input-field"
                                                placeholder="City" required autocomplete="off"> <label for="city"
                                                class="input-label">City<span class="required-asterisk">*</span></label>
                                            <span id="city_err" class="err-text"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="state" id="state" class="input-field"
                                                placeholder="State" required autocomplete="off"> <label for="state"
                                                class="input-label">State<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="state_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="country" id="country" class="input-field form-dropdown"
                                                disabled required autocomplete="off">
                                                <c:choose>
                                                    <c:when test="${country == 'IN'}">
                                                        <option value="india" selected>India</option>
                                                        <option value="us">US</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="india">India</option>
                                                        <option value="us" selected>US</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                            <!-- 									<label for="country" class="input-label">Country</label> -->
                                            <span id="country_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="pincode" id="pincode"
                                                class="input-field uc-text text-uppercase" placeholder="Pincode"
                                                required autocomplete="off"> <label for="pincode"
                                                class="input-label">Pincode<span
                                                    class="required-asterisk">*</span></label>
                                            <span id="pincode_err" class="err-text"></span>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Professional
                                    Information</h6>
                                <div class="row row-gap-16 mb-16" id="company-parent-row">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="companyName[0]" id="professionalInfoCompanyName_0"
                                                class="input-field" placeholder="Company Name 1" required
                                                autocomplete="off">
                                            <label for="professionalInfoCompanyName_0" class="input-label">Company
                                                Name 1<span class="required-asterisk">*</span>
                                            </label>
                                            <span id="professionalInfoCompanyName_0_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <button class="btn-style-2 w-100" type="button"
                                            onclick="addNewCompanyColumn()">+ Add Other</button>
                                    </div>
                                </div>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="companyExperience" id="companyExperience"
                                                class="input-field" placeholder="Years of Experience" required
                                                oninput="validateNumber(this)" autocomplete="off"> <label
                                                for="companyExperience" class="input-label">Years of
                                                Experience<span class="required-asterisk">*</span>
                                            </label>
                                            <span id="companyExperience_err" class="err-text"></span>
                                        </div>

                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="companyLinkedInUrl" id="companyLinkedInUrl"
                                                class="input-field" placeholder="LinkedIn Profile URL"
                                                autocomplete="off"> <label for="companyLinkedInUrl"
                                                class="input-label">LinkedIn
                                                Profile URL</label>
                                            <span id="companyLinkedInUrl_err" class="err-text"></span>
                                        </div>

                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="file-input-field-group">
                                            <input type="file" id="relevantDocuments" name="relevantDocuments"
                                                class="input-field" placeholder="File" required autocomplete="off"
                                                hidden>
                                            <button class="input-btn" type="button"
                                                onclick="handleClick('relevantDocuments','uploadCertificate-pm-text')">Choose
                                                File</button>
                                            <p id="uploadCertificate-pm-text">No File Choosen</p>
                                        </div>
                                        <div class="fileType-and-maxFileSize">
                                            <p>Attach Relevant Certifications</p>
                                            <span id="relevantDocuments_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Legal Information</h6>
                                <div class="row row-gap-16">
                                    <c:choose>
                                        <c:when test="${country == 'IN'}">

                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="panNo" id="panNo"
                                                        class="input-field uc-text text-uppercase"
                                                        placeholder="PAN Number" maxlength="10" required
                                                        autocomplete="off">
                                                    <label for="panNo" class="input-label">PAN Number<span
                                                            class="required-asterisk">*</span></label>
                                                    <span id="panNo_err" class="err-text"></span>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="EINNumber" id="EINNumber"
                                                        class="input-field show-placeholder " placeholder="XX-XXXXXXX"
                                                        required autocomplete="off">
                                                    <label for="EINNumber" class="input-label">EIN Number<span
                                                            class="required-asterisk">*</span></label>
                                                    <span id="EINNumber_err" class="err-text"></span>
                                                </div>

                                            </div>
                                            <!-- <div class="col-lg-3 col-md-6 col-sm-12 col-12">
										<div class="field-group">
											<input type="text" name="EINNumber" class="input-field" 
												placeholder="XX-XXXXXXX" required autocomplete="off">
											<label for="EINNumber" class="input-label">EIN Number<span
												class="required-asterisk">*</span></label>
											<div class="error-message err-text"></div>
										</div>

									</div>
					 -->
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Project Management
                                    Experience</h6>

                                <div class="row row-gap-16" id="Experience">
                                    <!-- <h6 class="input-section-heading mb-8">1.</h6> -->
                                    <!-- <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="pmExperienceModels[0].companyName"
                                                id="exp_companyName_0" class="input-field" placeholder="Company Name"
                                                autocomplete="off">
                                            <label for="exp_companyName_0" class="input-label">Company Name</label>
                                            <span id="exp_companyName_0_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="pmExperienceModels[0].yearOfExperience"
                                                id="exp_yearOfExperience_0" class="input-field"
                                                placeholder="Year of Experience" oninput="validateNumber(this)"
                                                autocomplete="off"> <label for="exp_yearOfExperience_0"
                                                class="input-label">Year of
                                                Experience</label>
                                            <span id="exp_yearOfExperience_0_err" class="err-text"></span>
                                        </div>
                                    </div> -->
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="exp_projectsHandled" id="exp_projectsHandled"
                                                class="input-field" placeholder="Number of projects handled"
                                                oninput="validateNumber(this)" autocomplete="off">
                                            <label for="exp_projectsHandled" class="input-label">Number of projects
                                                handled
                                                <span id="exp_projectsHandled_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="exp_projectsComplexity" id="exp_projectsComplexity"
                                                class="input-field form-dropdown" autocomplete="off">
                                                <option value="" selected>Complexity of Project</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                            <label for="exp_projectsComplexity" class="input-label">Select</label>
                                            <span id="exp_projectsComplexity_err" class="err-text"></span>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="field-group">
                                            <textarea name="exp_description" id="exp_description" class="input-field"
                                                placeholder="Briefly describe your experience in project management"
                                                autocomplete="off"></textarea> <label for="exp_description"
                                                class="input-label">Briefly describe your experience in project
                                                management</label>
                                            <span id="exp_description_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <!-- <div class="col-12">
                                        <div class="field-group">
                                            <input type="text" name="pmExperienceModels[0].projectsComplexity"
                                                id="exp_projectsComplexity_0" class="input-field"
                                                placeholder="Size and complexity of projects you have managed"
                                                autocomplete="off"> <label for="exp_projectsComplexity_0"
                                                class="input-label">Size and complexity of projects
                                                you have managed</label>
                                            <span id="exp_projectsComplexity_0_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-12 d-flex " style="justify-content: flex-end;">
                                        <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                            <button class="btn-style-2 w-100" type="button"
                                                onclick="addNewDescriptionRow()">+ Add Other</button>
                                        </div>
                                    </div> -->
                                </div>







                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Reference</h6>
                                <h6 class="input-section-heading mb-8">1.</h6>
                                <div class="row row-gap-16" id="Reference">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="pmRefrenceModels[0].name" id="refName_0"
                                                class="input-field" placeholder="Name" autocomplete="off"> <label
                                                for="refName_0" class="input-label">Name</label>
                                            <span id="refName_0_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="pmRefrenceModels[0].companyName"
                                                class="input-field" id="refCompany_0" placeholder="Company/Orgnization"
                                                autocomplete="off">
                                            <label for="refCompany_0" class="input-label">Company/Orgnization</label>
                                            <span id="refCompany_0_err" class="err-text"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="pmRefrenceModels[0].email" class="input-field"
                                                placeholder="Email" id="refEmail_0" autocomplete="off"> <label
                                                for="refEmail_0" class="input-label">Email</label>
                                            <span id="refEmail_0_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="pmRefrenceModels[0].phone" class="input-field"
                                                id="refPhone_0" placeholder="Phone Number" maxlength="10"
                                                oninput="validateNumber(this)" autocomplete="off"> <label
                                                for="refPhone_0" class="input-label">Phone
                                                Number</label>
                                            <span id="refPhone_0_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <!-- <div class="col-12">
                                        <div class="field-group">
                                            <input type="text" name="pmRefrenceModels[0].description"
                                                class="input-field" id="refDescription_0" placeholder="Description"
                                                autocomplete="off">
                                            <label for="refDescription_0" class="input-label">Description</label>
                                            <span id="refDescription_0_err" class="err-text"></span>
                                        </div>
                                    </div> -->
                                    <div class="col-12 d-flex " style="justify-content: flex-end;">
                                        <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                            <button class="btn-style-2 w-100" type="button"
                                                onclick="addNewReferenceRow()">+ Add Other</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">
                                    Attach Resume<span class="required-asterisk">*</span>
                                </h6>
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">

                                        <div class="file-input-field-group">
                                            <input type="file" id="resume" name="resume" class="input-field"
                                                placeholder="File" required autocomplete="off" hidden>
                                            <button class="input-btn" type="button"
                                                onclick="handleClick('resume','uploadResume-pm-text')">Choose
                                                File</button>
                                            <p id="uploadResume-pm-text">No File Choosen</p>
                                        </div>
                                        <div class="fileType-and-maxFileSize" id="resumeError">
                                            <!-- <p>Attach your resume here</p> -->
                                            <span id="resume_err" class="err-text"></span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="input-field-section mt-32">
                                <h6 class="input-section-heading mb-16">Declaration</h6>
                                <div class="d-flex mb-16">
                                    <input type="checkbox" name="declaration" id="declaration" class="declaration mr-8">
                                    <label class="declaration_label" for="declaration">By
                                        submitting this form, I confirm that the information provided is
                                        true and accurate to the best of my knowledge.</label> <span
                                        id="declaration_err" class="err-text"></span>
                                </div>
                                <div class="row row-gap-16">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" value="" placeholder="yyyy-MM-dd" readonly
                                                name="declerationDate" id="declerationDate"
                                                class="input-field auto-fill-declerationDate " required
                                                autocomplete="on">
                                            <!-- <label for="declerationDate" class="input-label">Date</label> -->
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="file-input-field-group">
                                            <input type="file" id="SingatureDocument" name="SingatureDocument"
                                                accept=".jpg, .png, .jpeg" class="input-field" placeholder="File"
                                                autocomplete="on" hidden>
                                            <button class="input-btn" type="button"
                                                onclick="handleClick('SingatureDocument','signature_text')">Choose
                                                File</button>
                                            <p id="signature_text">No File Choosen</p>
                                        </div>
                                        <div class="fileType-and-maxFileSize">
                                            <p>
                                                Attach your signature here<span class="required-asterisk">*</span>
                                            </p>

                                            <span id="signature_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <input type="checkbox" name="terms_and_conditions" id="terms_and_conditions"
                                            class="terms_and_conditions">
                                        <label class="terms_and_conditions_label" for="terms_and_conditions">I have read the <a
                                                href="https://cnerzy.com/assets/privacy-policy/terms-and-conditions.pdf"
                                                target="_blank" style="text-decoration: none;">Terms &
                                                Conditions</a> and I agree</label> <span id="terms_and_conditions_err"
                                            class="err-text"></span>
                                    </div>
                                    <div class="col-12  mb-32">
                                        <input type="checkbox" name="send_updates" id="send_updates"
                                            class="send_updates"> <label class="send_updates_label"
                                            for="send_updates">By
                                            sharing your contact information, you agree to receive
                                            important news and updates from Cnerzy. You can update your
                                            preference and unsubscribe from these communications anytime
                                            using the link in our marketing email. For more information,
                                            read our <a
                                                href="https://cnerzy.com/assets/privacy-policy/privacy-policy.pdf"
                                                target="_blank" style="text-decoration: none;">Privacy
                                                Policy.</a></label>
                                    </div>
                                    <div class="col-12 mt-32 mb-32 d-flex justify-content-end">
                                        <button class="btn-style-1" id="submitBtn" type="submit"
                                            onclick="handleSubmit()">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="footer-row">
                    <div class="col-12">
                        <p class="text-center m-0">&copy; 2024 CNERZY. All Rights Reserved</p>
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
                        <p class="modal-para text-center">Congratulations on registering with CNERZY! Your account is
                            currently under review. We'll notify you once it's approved.</p>
                    </div>
                </div>
            </div>

            <!-- Thank you popup ends -->


            <script>
                function setDateForToday(inputId) {
                    var today = new Date();

                    // Get day, month, and year
                    var dd = String(today.getDate()).padStart(2, '0');
                    var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
                    var yyyy = today.getFullYear();

                    // Format the date as dd/mm/yyyy
                    var formattedDate = dd + '/' + mm + '/' + yyyy;

                    // Set the value of the input field with the provided ID
                    document.getElementById(inputId).value = formattedDate;
                }

                // Call the function with the ID of the input field you want to set the date for
                setDateForToday('declerationDate');

                // Call the function with the ID of the input field you want to set the date for


            </script>

            <script>
                //get all input fields 
                var rigion = "${country}"
                let inputs = document.querySelectorAll('input, select');
                // console.log('Total Fields', inputs.length)
                const getAllInputs = function () {
                    inputs = document.querySelectorAll('input, select');
                    // console.log('Total Fields', inputs.length)
                    for (let input of inputs) {
                        input.addEventListener('blur', function () {
                            validateForm(input);
                        });
                    }

                    for (let input of inputs) {
                        input.addEventListener('change', function () {
                            validateForm(input);
                        });
                    }
                }
                //Email Verified Toastr

                // $(document).ready(function () {
                //     if ("${emailVerificationstatus}" === "true") {
                //         toastr.success("${emailVerificationmessage}");
                //     } else if ("${emailVerificationstatus}" === "false") {
                //         toastr.error("${emailVerificationmessage}");
                //     }
                //     optionsValidator("expertise")
                //     optionsValidator("industry")
                // });
                function capitalizeInput(input) {
                    if (input && input.data) {
                        input.data = input.data.toUpperCase();
                    }
                }


                let companyParentRow = document.querySelector('#company-parent-row');
                let companyColCount = 1;

                function addNewCompanyColumn() {
                    let newCompanycol = document.createElement('div');
                    newCompanycol.className = 'col-lg-3 col-md-6 col-sm-12 col-12'
                    let inputFieldStr = '<div class="field-group"><input type="text" name="companyName[' + companyColCount + ']" id="professionalInfoCompanyName_' + companyColCount + '" class="input-field" placeholder="Company Name ' + (companyColCount + 1) + '" required autocomplete="off"><label for="professionalInfoCompanyName_' + companyColCount + '" class="input-label">Company Name ' + (companyColCount + 1) + '</label><span id="professionalInfoCompanyName_' + companyColCount + '_err" class="err-text"></span></div>';

                    newCompanycol.innerHTML = inputFieldStr;
                    companyParentRow.insertBefore(newCompanycol, companyParentRow.lastElementChild);
                    companyColCount = companyColCount + 1;
                    getAllInputs()
                }


                let ReferenceListsParent = document.querySelector('#Reference'); // Select the parent row where new rows will be appended
                let ReferenceListCount = 0; // Initialize the row count

                function addNewReferenceRow() {
                    // Increment the row count
                    ReferenceListCount++;
                    let i = ReferenceListCount;

                    // Create a new row div
                    let newExporterList = document.createElement('div');
                    newExporterList.className = 'row row-gap-16 pr-0';

                    // Create h6 element for serial number
                    let serialNumber = document.createElement('h6');
                    serialNumber.className = 'input-section-heading mb-8';
                    serialNumber.textContent = i + 1 + '.';

                    // Create input fieldspmRefrenceModels[0].id
                    let name = createInputField('refName_' + i, 'pmRefrenceModels[' + i + '].name', 'Name', 'Name', 'off');
                    let companyNameInput = createInputField('refCompany_' + i, 'pmRefrenceModels[' + i + '].companyName', 'Company Name', 'Company Name', 'off');
                    let email = createInputField('refEmail_' + i, 'pmRefrenceModels[' + i + '].email', 'Email', 'Email', 'off');
                    let phone = createInputField('refPhone_' + i, 'pmRefrenceModels[' + i + '].phone', 'Phone', 'Phone', 'off', 'validateNumber(this)');
                    // let descriptionInput = createInputField2('refDescription_' + i, 'pmRefrenceModels[' + i + '].description', 'Description', 'Description', 'off');

                    // Append elements to the new row
                    newExporterList.appendChild(serialNumber);
                    newExporterList.appendChild(name);
                    newExporterList.appendChild(companyNameInput);
                    newExporterList.appendChild(email);
                    newExporterList.appendChild(phone);
                    // newExporterList.appendChild(descriptionInput);

                    // Append the new row to the parent row
                    ReferenceListsParent.insertBefore(newExporterList, ReferenceListsParent.lastElementChild);

                    getAllInputs()
                }


                let exporterListsParent = document.querySelector('#Experience'); // Select the parent row where new rows will be appended
                let exporterListCount = 0; // Initialize the row count

                function addNewDescriptionRow() {
                    // Increment the row count
                    exporterListCount++;
                    let i = exporterListCount;

                    // Create a new row div
                    let newExporterList = document.createElement('div');
                    newExporterList.className = 'row row-gap-16 pr-0';

                    // Create h6 element for serial number
                    let serialNumber = document.createElement('h6');
                    serialNumber.className = 'input-section-heading mb-8';
                    serialNumber.textContent = i + 1 + '.';

                    // Create input fields
                    let companyNameInput = createInputField('exp_companyName_' + i, 'pmExperienceModels[' + i + '].companyName', 'Company Name', 'Company Name', 'off');
                    let yearOfExperienceInput = createInputField('exp_yearOfExperience' + i, 'pmExperienceModels[' + i + '].yearOfExperience', 'Year of Experience', 'Year of Experience', 'off', 'validateNumber(this)');
                    let descriptionInput = createInputField2('exp_description' + i, 'pmExperienceModels[' + i + '].description', 'Description', 'Description', 'off');
                    let projectsComplexityInput = createInputField2('exp_projectsComplexity' + i, 'pmExperienceModels[' + i + '].projectsComplexity', 'Size and complexity of projects you have managed', 'Size and complexity of projects you have managed', 'off');

                    // Append elements to the new row
                    newExporterList.appendChild(serialNumber);
                    newExporterList.appendChild(companyNameInput);
                    newExporterList.appendChild(yearOfExperienceInput);
                    newExporterList.appendChild(descriptionInput);
                    newExporterList.appendChild(projectsComplexityInput);

                    // Append the new row to the parent row
                    exporterListsParent.insertBefore(newExporterList, exporterListsParent.lastElementChild);
                    getAllInputs()
                }

                // Function to create input field element
                function createInputField(id, name, label, placeholder, autocomplete, oninput = '') {
                    let inputField = document.createElement('input');
                    inputField.type = 'text';
                    inputField.id = id;
                    inputField.name = name;
                    inputField.className = 'input-field';
                    inputField.placeholder = placeholder;
                    inputField.autocomplete = autocomplete;
                    if (label == 'Phone') {
                        inputField.maxLength = 10;
                    }
                    if (oninput !== '') {
                        inputField.setAttribute('oninput', oninput);
                    }

                    let inputLabel = document.createElement('label');
                    inputLabel.htmlFor = id;
                    inputLabel.className = 'input-label';
                    inputLabel.textContent = label;

                    let fieldGroup = document.createElement('div');
                    fieldGroup.className = 'field-group';
                    fieldGroup.appendChild(inputField);
                    fieldGroup.appendChild(inputLabel);

                    let error = document.createElement('span');
                    error.className = 'err-text';
                    error.id = id + '_err'
                    fieldGroup.appendChild(error);

                    let columnDiv = document.createElement('div');
                    columnDiv.className = 'col-lg-3 col-md-6 col-sm-12 col-12 pr-0';
                    columnDiv.appendChild(fieldGroup);

                    return columnDiv;
                }
                function createInputField2(id, name, label, placeholder, autocomplete, oninput = '') {
                    let inputField = document.createElement('input');
                    inputField.type = 'text';
                    inputField.id = id;
                    inputField.name = name;
                    inputField.className = 'input-field';
                    inputField.placeholder = placeholder;
                    inputField.autocomplete = autocomplete;
                    if (oninput !== '') {
                        inputField.setAttribute('oninput', oninput);
                    }

                    let inputLabel = document.createElement('label');
                    inputLabel.htmlFor = id;
                    inputLabel.className = 'input-label';
                    inputLabel.textContent = label;

                    let fieldGroup = document.createElement('div');
                    fieldGroup.className = 'field-group';
                    fieldGroup.appendChild(inputField);
                    fieldGroup.appendChild(inputLabel);

                    let error = document.createElement('span');
                    error.className = 'err-text';
                    error.id = id + '_err'
                    fieldGroup.appendChild(error);

                    let columnDiv = document.createElement('div');
                    columnDiv.className = 'col-12 pr-0';
                    columnDiv.appendChild(fieldGroup);

                    return columnDiv;
                }


                // function validateEmail(email) {
                //     // Regular expression for validating email addresses
                //     const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                //     // Test the email against the regular expression
                //     return emailRegex.test(email);
                // }

                // function validateEmailInput(input) {
                //     let email = input.value;
                //     if (!validateEmail(email)) {
                //         // Email is invalid, display error message or take appropriate action
                //         console.log("Invalid email address");
                //         // You can also display an error message or apply a CSS class to indicate the error
                //         showError('email_err', 'Invalid Company Email');
                //     } else {
                //         // Email is valid
                //         console.log("Valid email address");
                //         // You can clear any error message or CSS class if previously applied
                //         showError('email_err', '');
                //     }
                // }


                function validateNumber(input) {
                    // Get the current value of the input
                    let value = input.value;

                    // Use a regular expression to remove any non-numeric characters except decimal points
                    value = value.replace(/[^0-9.]/g, '');

                    // Ensure only one decimal point is present
                    if ((value.match(/\./g) || []).length > 1) {
                        value = value.slice(0, -1);
                    }

                    // Update the input value with the validated value
                    input.value = value;
                }

                // function validateForm(args) {
                //     let arrayValid = []
                //     let error = false;
                //     var name = document.getElementsByName('name')[0].value;
                //     var email = document.getElementsByName('email')[0].value;
                //     var phone = document.getElementsByName('phone')[0].value;
                //     var industry = document.getElementsByName('industry')[0].value;
                //     var expertise = document.getElementsByName('expertise')[0].value;
                //     var streetAddress = document.getElementsByName('streetAddress')[0].value;
                //     var state = document.getElementsByName('state')[0].value;
                //     var city = document.getElementsByName('city')[0].value;
                //     var country = document.getElementsByName('country')[0].value;
                //     var pincode = document.getElementsByName('pincode')[0].value;
                //     var companyLinkedInUrl = document.getElementsByName('companyLinkedInUrl')[0].value;
                //     if ("${country}" === "IN") {
                //         var panNo = document.getElementsByName('panNo')[0].value;

                //     }

                //     var companyName = document.getElementsByName('companyName')[0].value;
                //     var companyExperience = document.getElementsByName('companyExperience')[0].value;
                //     if ("${country}" === "US") {
                //         var einNumber = document.getElementsByName('EINNumber')[0].value;

                //     }


                //     // Regular expressions for validation
                //     const nameRegex = /^[A-Za-z\s]+$/;
                //     const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                //     const phoneRegex = /^\d{10}$/;
                //     const addressRegex = /^[\w\s\d#,-]+$/;
                //     const cityRegex = /^[A-Za-z ]{3,}$/;
                //     const stateRegex = /^[A-Za-z ]{3,}$/;
                //     let pincodeRegex
                //     if (country == 'india') {
                //         pincodeRegex = /^\d{6}$/
                //     } else {
                //         pincodeRegex = /^\d{5}$/
                //     }
                //     const linkeinRegex = /^(https?:\/\/)?(www\.)?linkedin\.com\/(?:in|pub)\/[a-zA-Z0-9_-]+\/?$/;
                //     const gstRegex = /^([0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1})$/;
                //     const panRegex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
                //     const einRegex = /^\d{2}-\d{7}$/;//for EIN(US) in XX-XXXXXXX
                //     const industryRegex = /^[A-Za-z ]{2,}$/;




                //     // Check if fields are empty
                //     if (!name || !email || !phone || !industry || !expertise || !streetAddress || !state || !city || !country || !pincode || !companyLinkedInUrl || !panNo || !companyName || !companyExperience || !resume) {
                //         error = true;
                //         if (args) {
                //             // Show error message for each required field
                //             /* if (!name) showError('name', 'Name is required');
                //             if (!email) showError('email', 'Email is required');
                //             if (!phone) showError('phone', 'Phone number is required');
                //             if (!industry) showError('industry', 'Industry is required');
                //             if (!expertise) showError('expertise', 'Expertise is required');
                //             if (!streetAddress) showError('streetAddress', 'Street Address is required');
                //             if (!state) showError('state', 'State is required');
                //             if (!city) showError('city', 'City is required');
                //             if (!country) showError('country', 'Country is required');
                //             if (!pincode) showError('pincode', 'Pin Code is required');
                //             if (!companyLinkedInUrl) showError('companyLinkedInUrl', 'Linked In Url is required');
                //             if (!gstNo) showError('gstNo', 'GST No is required');
                //             if (!panNo) showError('panNo', 'Pan No is required'); 
                //             if (!companyName) showError('companyName', 'Company Name is required'); 
                //             if (!companyExperience) showError('companyExperience', 'Experience is required'); 
                //             if (!resume) showError('resume', 'Resume is required'); 
                //              */
                //         }
                //     } else {
                //         // Clear error messages if all fields are filled
                //         clearError('name');
                //         clearError('email');
                //         clearError('phone');
                //         clearError('industry');
                //         clearError('expertise');
                //         clearError('streetAddress');
                //         clearError('state');
                //         clearError('city');
                //         clearError('country');
                //         clearError('picode');
                //         clearError('companyLinkedInUrl');

                //         clearError('panNo');
                //         clearError('companyName');
                //         clearError('companyExperience');
                //         claearError('einNumber')
                //     }

                //     // Validate name
                //     if (name != "" && !nameRegex.test(name)) {
                //         error = true;
                //         showError('name', 'Invalid name format');
                //     } else {
                //         clearError('name');
                //     }

                //     if ("${country}" === "US") {
                //         if (einNumber != "" && !einRegex.test(einNumber)) {
                //             error = true;
                //             showError('EINNumber', 'Invalid EIN Number format');
                //         } else {
                //             clearError('EINNumber');

                //         }
                //     }

                //     // Validate email
                //     if (email != "" && !emailRegex.test(email)) {
                //         error = true;
                //         showError('email', 'Invalid email format');
                //     } else {
                //         clearError('email');
                //     }

                //     // Validate phone
                //     if (phone != "" && !phoneRegex.test(phone)) {
                //         error = true;
                //         showError('phone', 'Invalid phone number format');
                //     } else {
                //         clearError('phone');
                //     }


                //     // Validate street address
                //     if (streetAddress != "" && !addressRegex.test(streetAddress)) {
                //         error = true;
                //         showError('streetAddress', 'Invalid street address format');
                //     } else {
                //         clearError('streetAddress');
                //     }

                //     // Validate state
                //     if (state != "" && !stateRegex.test(state)) {
                //         error = true;
                //         showError('state', 'Invalid state format');
                //     } else {
                //         clearError('state');
                //     }

                //     // Validate city
                //     if (city != "" && !cityRegex.test(city)) {
                //         error = true;
                //         showError('city', 'Invalid city format');
                //     } else {
                //         clearError('city');
                //     }

                //     // Validate country
                //     if (country != "" && country === 'Select') {
                //         error = true;
                //         showError('country', 'Please select a country');
                //     } else {
                //         clearError('country');
                //     }

                //     // Validate pincode
                //     if (pincode != "" && !pincodeRegex.test(pincode)) {
                //         error = true;
                //         showError('pincode', 'Invalid pin code format');
                //     } else {
                //         clearError('pincode');
                //     }

                //     // Validate LinkedIn URL
                //     if (companyLinkedInUrl != "" && !linkeinRegex.test(companyLinkedInUrl)) {
                //         error = true;
                //         showError('companyLinkedInUrl', 'Invalid LinkedIn URL format');
                //     } else {
                //         clearError('companyLinkedInUrl');
                //     }

                //     if ("${country}" === "IN") {
                //         // Validate PAN number
                //         if (panNo != "" && !panRegex.test(panNo.toUpperCase())) {
                //             error = true;
                //             showError('panNo', 'Invalid PAN number format');
                //         } else {
                //             clearError('panNo');
                //         }

                //     }


                //     if (companyName = "") {
                //         error = true;
                //         showError('companyName', 'Company Name is required');
                //     } else {
                //         clearError('companyName');
                //     }
                //     if (companyExperience = "") {
                //         error = true;
                //         showError('companyExperience', 'Experience is required');
                //     } else {
                //         clearError('companyExperience');
                //     }



                //     return error;
                // }

                // function optionsValidator(id) {
                //     const selectElement = document.getElementById(id);

                //     // Add change event listener to the select element
                //     selectElement.addEventListener('change', function () {
                //         // Get the selected value
                //         const selectedValue = this.value;

                //         // Check if the selected value is empty
                //         if (selectedValue === '') {
                //             // Show error message if the value is empty
                //             showError(id, 'Please select an Industry');
                //         } else {
                //             // Clear error message if a valid value is selected
                //             clearError(id);
                //         }
                //     });
                // }



                // function showError(id, message) {
                //     const elements = document.getElementsByName(id);
                //     if (elements.length > 0) {
                //         elements.forEach(element => {
                //             if (id === "resume") {
                //                 errorElement = document.querySelector("#resumeError").querySelector('.error-message');

                //             } else {
                //                 errorElement = element.closest('.field-group').querySelector('.error-message ');

                //             }
                //             if (errorElement) {
                //                 errorElement.innerText = message;
                //             }
                //         });
                //     } else {
                //         console.error("Element with ID " + id + " not found.");
                //     }
                // }
                function showError(id, errorMsg) {
                    let errSpan = document.getElementById(id)
                    errSpan.innerHTML = errorMsg
                }


                function validateFileSize(input) {
                    let valid = true
                    const file = input.files[0]
                    if (file) {
                        const limit = 10000;
                        const size = file.size / 1024
                        if (size > limit) {
                            // console.log(size, limit, `File size must not be more than 10MB`)
                            valid = false
                        } else {
                            valid = true
                            // console.log('good-file-size', valid)
                        }
                    } else {
                        valid = false
                        // console.log('no-file-found', valid)
                    }
                    return valid
                }

                function clearError(id) {
                    const elements = document.getElementsByName(id);
                    if (elements.length > 0) {
                        elements.forEach(element => {
                            if (id === "resume") {
                                errorElement = document.querySelector("#resumeError").querySelector('.error-message');

                            } else {
                                errorElement = element.closest('.field-group').querySelector('.error-message ');

                            } if (errorElement) {
                                errorElement.innerText = '';
                            }
                        });
                    } else {
                        console.error("Element with ID " + id + " not found.");
                    }
                }


                const personalInputs = document.querySelectorAll('#pmOnboarding input');
                personalInputs.forEach(input => {
                    input.addEventListener('focusout', validateForm);
                });
                //Assuming 'resume' is the ID of your file input element
                var fileInput = document.getElementById('resume');

                fileInput.addEventListener('change', function () {
                    if (this.files.length > 0) {
                        clearError('resume'); // Assuming clearError function exists to remove error messages
                    }
                });


                // function handleSubmit() {

                //     $("#pmOnboarding").submit(function (e) {
                //         e.preventDefault();
                //     })
                //     var name = document.getElementsByName('name')[0].value;
                //     var email = document.getElementsByName('email')[0].value;
                //     var phone = document.getElementsByName('phone')[0].value;
                //     var industry = document.getElementsByName('industry')[0].value;
                //     var expertise = document.getElementsByName('expertise')[0].value;
                //     var streetAddress = document.getElementsByName('streetAddress')[0].value;
                //     var state = document.getElementsByName('state')[0].value;
                //     var city = document.getElementsByName('city')[0].value;
                //     var country = document.getElementsByName('country')[0].value;
                //     var pincode = document.getElementsByName('pincode')[0].value;
                //     var companyLinkedInUrl = document.getElementsByName('companyLinkedInUrl')[0].value;
                //     if ("${country}" === "IN") {
                //         var panNo = document.getElementsByName('panNo')[0].value;

                //     } var companyName = document.getElementsByName('companyName')[0].value;
                //     var companyExperience = document.getElementsByName('companyExperience')[0].value;
                //     const signatureInput = document.querySelector('#uploadResume-pm-input');
                //     if ("${country}" === "US") {
                //         var einNumber = document.getElementsByName('EINNumber')[0].value;

                //     }
                //     // Regular expressions for validation
                //     const nameRegex = /^[A-Za-z\s]+$/;
                //     const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                //     const phoneRegex = /^\d{10}$/;
                //     const addressRegex = /^[\w\s\d#,-]+$/;
                //     const cityRegex = /^[A-Za-z ]{3,}$/;
                //     const stateRegex = /^[A-Za-z ]{3,}$/;
                //     let pincodeRegex
                //     if (country == 'india') {
                //         pincodeRegex = /^\d{6}$/
                //     } else {
                //         pincodeRegex = /^\d{5}$/
                //     }
                //     const linkeinRegex = /^(https?:\/\/)?(www\.)?linkedin\.com\/(?:in|pub)\/[a-zA-Z0-9_-]+\/?$/;
                //     const gstRegex = /^([0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1})$/;
                //     const panRegex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
                //     const einRegex = /^\d{2}-\d{7}$/;//for EIN(US) in XX-XXXXXXX
                //     const industryRegex = /^[A-Za-z ]{2,}$/;

                //     if ("${country}" === "US") {

                //         if (!einNumber) {
                //             showError('EINNumber', 'EIN Number is required');
                //         } else if (!einRegex.test(einNumber)) {
                //             error = true;
                //             showError('EINNumber', 'Invalid EIN Number format');
                //         } else {
                //             clearError('EINNumber');
                //         }

                //     }
                //     if (!name) {
                //         showError('name', 'Name is required');
                //     } else if (!nameRegex.test(name)) {
                //         error = true;
                //         showError('name', 'Invalid name format');

                //     } else {
                //         clearError('name');
                //     }

                //     if (!email) {
                //         showError('email', 'Email is required');
                //     } else if (!emailRegex.test(email)) {
                //         error = true;
                //         showError('email', 'Invalid email format');
                //     } else {
                //         clearError('email');
                //     }

                //     if (!phone) {
                //         showError('phone', 'Phone number is required');
                //     } else if (!phoneRegex.test(phone)) {
                //         error = true;
                //         showError('phone', 'Invalid phone number format');
                //     } else {
                //         clearError('phone');
                //     }

                //     if (!industry) {

                //         showError('industry', 'Industry is required');
                //     } else {
                //         clearError('industry');
                //     }

                //     if (!expertise) {
                //         showError('expertise', 'Expertise is required');
                //     } else {
                //         clearError('expertise');
                //     }

                //     if (!streetAddress) {
                //         showError('streetAddress', 'Street Address is required');
                //     } else if (!addressRegex.test(streetAddress)) {
                //         error = true;
                //         showError('streetAddress', 'Invalid street address format');
                //     } else {
                //         clearError('streetAddress');
                //     }

                //     if (!state) {
                //         showError('state', 'State is required');
                //     } else if (!stateRegex.test(state)) {
                //         error = true;
                //         showError('state', 'Invalid state format');
                //     } else {
                //         clearError('state');
                //     }

                //     if (!city) {
                //         showError('city', 'City is required');
                //     } else if (!cityRegex.test(city)) {
                //         error = true;
                //         showError('city', 'Invalid city format');
                //     } else {
                //         clearError('city');
                //     }

                //     if (!country) {
                //         showError('country', 'Country is required');
                //     } else if (country === 'Select') {
                //         error = true;
                //         showError('country', 'Please select a country');
                //     } else {
                //         clearError('country');
                //     }

                //     if (!pincode) {
                //         showError('pincode', 'Pin Code is required');
                //     } else if (!pincodeRegex.test(pincode)) {
                //         error = true;
                //         showError('pincode', 'Invalid pin code format');
                //     } else {
                //         clearError('pincode');
                //     }

                //     if (companyLinkedInUrl != "" && !linkeinRegex.test(companyLinkedInUrl)) {
                //         showError('companyLinkedInUrl', 'Invalid LinkedIn URL format');
                //     } else {
                //         clearError('companyLinkedInUrl');
                //     }

                //     if ("${country}" === "IN") {

                //         if (!panNo) {
                //             showError('panNo', 'Pan No is required');
                //         } else if (!panRegex.test(panNo)) {
                //             error = true;
                //             showError('panNo', 'Invalid PAN number format');
                //         } else {
                //             clearError('panNo');
                //         }
                //     }

                //     if (!companyName) {
                //         showError('companyName', 'Company Name is required');
                //     } else {
                //         clearError('companyName');
                //     }
                //     if (!companyExperience) {
                //         showError('companyExperience', 'Experience is required');
                //     } else {
                //         clearError('companyExperience');
                //     }
                //     if (!signatureInput.files[0]) {

                //         showError('resume', 'Signature is Required');

                //     } else {
                //         clearError('resume', '');
                //     }
                //     if (panNo) {
                //         idProof = panNo
                //     } if (einNumber) {
                //         idProof = einNumber
                //     }

                //     // If any field is empty, stop further execution
                //     if (!name || !email || !phone || !industry || !expertise || !streetAddress || !state || !city || !country || !pincode || !companyName || !companyExperience || !signatureInput.files[0] || !idProof) {
                //         return;
                //     }

                //     var filled = validateForm()
                //     event.preventDefault(); // Prevent default form submission behavior
                //     if (filled) {


                //         // Get form data
                //         const form = document.getElementById('pmOnboarding'); // Assuming 'pmOnboarding' is the ID of your form
                //         const formData = new FormData(form);
                //         // Make API call with form data
                //         var myHeaders = new Headers();

                //         var requestOptions = {
                //             method: "POST",
                //             headers: myHeaders,
                //             body: formData,
                //             redirect: "follow",
                //         };
                //         fetch("${pageContext.request.contextPath}/savePMDetails", requestOptions)
                //             .then((response) => {
                //                 if (!response.ok) {
                //                     throw new Error("Network response was not ok");
                //                 }
                //                 return response.json();
                //             })
                //             .then((data) => {
                //                 console.log("Success:", data);
                //                 if (data.status == "true") {
                //                     $('#thank-you-modal').modal('show');
                //                     setTimeout(function () {
                //                         window.location.href = "${pageContext.request.contextPath}/dashboard";
                //                     }, 5000);
                //                 } else if (data.status == "false") {
                //                     toastr.error(data.message)
                //                 }
                //                 //		    data-bs-toggle="modal"
                //                 //          data-bs-target="#thank-you-modal

                //             })
                //             .catch((error) => {
                //                 console.error("Fetch error:", error);
                //             });
                //     }
                // }

                document.addEventListener("DOMContentLoaded", function () {
                    let arrowIconUrl = '${pageContext.request.contextPath}/assets/icons/close.png'
                    //     	let arrowIconUrl  = '${pageContext.request.contextPath}/assets/icons/arrow.png'
                    //     	let closeIconUrl = '../assets/icons/close.png'

                    //----------------------------------------- js script for converting dropdown into textfield starts here --------------------------------------
                    function convertDropdownToText(selectDropdownBox) {
                        //get select dropdown
                        let selectDropdown = selectDropdownBox.querySelector('select');
                        // console.log(selectDropdown)

                        // Get the label for the select dropdown
                        let selectLabel = selectDropdownBox.querySelector('label');
                        let selectErrorSpan = selectDropdownBox.querySelector('.err-text');
                        // console.log(selectLabel)


                        let inputCreated = false;

                        // Listen for changes in the select dropdown
                        selectDropdown.addEventListener('change', function () {
                            if (this.value == 'Others') {
                                if (inputCreated == false) {
                                    // Create a new div for the input field
                                    const inputDiv = document.createElement('div');
                                    inputDiv.classList.add('new-field-group', 'input-created-box');
                                    inputDiv.style.position = 'relative';

                                    // Create a new input element
                                    const inputField = document.createElement('input');
                                    inputField.type = 'text';
                                    inputField.name = selectDropdown.name;
                                    inputField.id = selectDropdown.id;
                                    inputField.classList.add('new-input-field');
                                    inputField.placeholder = 'Please Specify';
                                    inputField.required = true;
                                    inputField.autocomplete = 'off';

                                    // Create a new label for the input field
                                    let label = selectLabel;
                                    label.style.backgroundColor = 'white';
                                    label.style.zIndex = '1';


                                    // Create a new icon element
                                    const iconSpan = document.createElement('span');
                                    iconSpan.innerHTML = "<img class='created-input-icon'src=" + arrowIconUrl + " alt='x'>";
                                    // iconSpan.style.position = 'absolute';
                                    // iconSpan.style.right = '10px';
                                    // iconSpan.style.transform = 'translateY(18px)';
                                    iconSpan.classList = 'icon-span'
                                    iconSpan.style.cursor = 'pointer !important';
                                    iconSpan.addEventListener('click', function (event) {
                                        if (inputField.name == 'industry') {
                                            showError('industry_err', '')
                                        } else if (inputField.name == 'expertise') {
                                            showError('expertise_err', '')
                                        }
                                        event.preventDefault();
                                        selectDropdown.required = true;
                                        inputField.required = false;
                                        selectDropdown.disabled = false;
                                        inputField.disabled = true;
                                        selectDropdownBox.style.display = 'block';
                                        inputField.value = '';

                                        selectDropdown.value = '';
                                        inputDiv.style.display = 'none';
                                        selectLabel.style.top = '-10px';
                                        // selectLabel.style.top = '20px';
                                        selectLabel.style.left = '18px';
                                        selectLabel.style.transform = 'translate(0px,0px)';

                                        // selectLabel.style.color = '#7a7a7a';
                                        // selectLabel.style.fontSize = '16px';
                                        selectDropdownBox.appendChild(selectLabel);
                                        customSelectInitialization()
                                        getAllInputs()
                                    })

                                    label = document.createElement('label')
                                    label.classList = 'input-label'
                                    label.setAttribute('for', selectDropdown.id)
                                    if (selectDropdown.options[0].innerHTML == 'Choose an Option' && selectDropdown.name == 'reference') {
                                        label.innerHTML = ""
                                    } else {
                                        label.innerHTML = selectDropdown.options[0].innerHTML + "<span class='required-asterisk'>*</span>"
                                    }
                                    let errSpan = selectErrorSpan

                                    // Append the input field and label to the new div
                                    inputDiv.appendChild(inputField);
                                    inputDiv.appendChild(label);
                                    inputDiv.appendChild(iconSpan);
                                    let parentElement = selectDropdownBox.parentElement
                                    parentElement.appendChild(inputDiv);
                                    parentElement.appendChild(errSpan);
                                    // Show the input field div
                                    selectDropdown.required = false;
                                    inputField.required = true;
                                    selectDropdown.disabled = true;
                                    inputField.disabled = false;

                                    inputDiv.style.display = 'block';
                                    selectDropdownBox.style.display = 'none'; // Hide the select field group
                                    inputCreated = true;
                                    getAllInputs()
                                    // if (inputDiv.style.display === 'block') {
                                    //     inputField.focus();
                                    //     console.log('input-focused')
                                    // }

                                    setTimeout(() => {
                                        inputField.focus();
                                        setTimeout(() => {
                                            if (document.activeElement !== inputField) {
                                                inputField.focus();
                                            }
                                        }, 100);
                                    }, 100);

                                    inputField.addEventListener('blur', function () {
                                        // if (inputField.name == 'industry' || inputField.name == 'expertise') {
                                        //     validateStep1()
                                        // }
                                    })

                                }
                                else {
                                    let inputDiv = selectDropdownBox.parentElement.querySelector('.input-created-box')
                                    let inputField = inputDiv.querySelector('.new-input-field');
                                    // inputDiv.appendChild(selectLabel);
                                    inputDiv.style.display = 'block';
                                    selectDropdown.required = false;
                                    inputField.required = true;
                                    selectDropdown.disabled = true;
                                    inputField.disabled = false;
                                    selectDropdownBox.style.display = 'none'; // Hide the select field group
                                    if (inputDiv.style.display === 'block') {
                                        inputField.focus();
                                    }
                                    getAllInputs()
                                }
                            }

                        });

                    }

                    // Get all select dropdowns
                    const selectDropdownsBoxes = document.querySelectorAll('.select-field-group-toggle');

                    // Convert each select dropdown to text input when "Other" is selected
                    selectDropdownsBoxes.forEach(function (selectDropdownBox) {
                        convertDropdownToText(selectDropdownBox);
                    });

                    //----------------------------------------- js script for converting dropdown into textfield ends here --------------------------------------
                });


                //===================== handling validations(NEW) for pm starts here  =====================

                function checkRequiredFields() {
                    // console.log("checkRequiredFields called")
                    let allFilled = true;
                    let firstRequiredField = null;
                    for (let input of inputs) {
                        if (input.name == 'name' && input.value.trim() == '') {
                            allFilled = false;
                            showError('name_err', 'Company Name is Required')
                        } else if (input.name == 'email' && input.value.trim() == '') {
                            allFilled = false;
                            showError('email_err', 'Company Email is Required')
                        }
                        else if (input.name == 'phone' && input.value.trim() == '') {
                            allFilled = false;
                            showError('phone_err', 'Phone Number is Required')
                        }
                        else if (input.name == 'industry' && input.value.trim() == '' && input.required) {
                            // console.log(input)
                            allFilled = false;
                            showError('industry_err', 'Industry Classification is Required')
                        }
                        else if (input.name == 'expertise' && input.value.trim() == '' && input.required) {
                            allFilled = false;
                            showError('expertise_err', 'Industry Expertise is Required')
                        }
                        else if (input.name == 'streetAddress' && input.value.trim() == '') {
                            allFilled = false;
                            showError('streetAddress_err', 'Street Name is Required')
                        } else if (input.name == 'city' && input.value.trim() == '') {
                            allFilled = false;
                            showError('city_err', 'City Name is Required')
                        } else if (input.name == 'state' && input.value.trim() == '') {
                            allFilled = false;
                            showError('state_err', 'State Name is Required')
                        } else if (input.name == 'pincode' && input.value.trim() == '') {
                            allFilled = false;
                            showError('pincode_err', 'Pincode is Required')
                        } else if (input.name == 'companyName[0].name' && input.value.trim() == '') {
                            allFilled = false;
                            showError('professionalInfoCompanyName_0_err', 'Company Name is Required')
                        } else if (input.name == 'companyExperience' && input.value.trim() == '') {
                            allFilled = false;
                            showError('companyExperience_err', 'Experience is Required')
                        } else if ((input.name == 'panNo' || input.name == 'EINNumber') && input.value.trim() == '') {
                            allFilled = false;
                            if (rigion === "US") {
                                showError('EINNumber_err', 'EIN Number is Required')
                            } else {
                                showError('panNo_err', 'PAN Number is Required')
                            }
                        }
                        else if (input.name == 'resume' && !input.files[0]) {
                            allFilled = false;
                            showError('resume_err', 'Resume is Required')
                        }
                        else if (input.name == 'SingatureDocument' && !input.files[0]) {
                            allFilled = false;
                            showError('signature_err', 'Signature is Required')
                        } else if (input.name == 'declaration' && input.checked == false) {
                            allFilled = false;
                            showError('declaration_err', 'Please check declaration')
                        } else if (input.name == 'terms_and_conditions' && input.checked == false) {
                            allFilled = false;
                            showError('terms_and_conditions_err', 'Please check terms and conditions')
                        }

                        if (allFilled == false && firstRequiredField == null) {
                            firstRequiredField = input;
                        }
                    }

                    // console.log(firstRequiredField)
                    // firstRequiredField.focus()
                    if (firstRequiredField != null) {
                        firstRequiredField.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    }
                    return allFilled;
                }

                let errorsArray = [];
                function validateForm(input) {
                    // for (let input of inputs) {
                    let errorMessage = '';
                    if (input.name == 'name') {
                        if (input.value != '') {
                            const regex = /^[A-Za-z0-9 ]{3,}$/;
                            if (input.value.trim() == '' || !regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Full Name';
                                showError('name_err', errorMessage)
                            } else {
                                showError('name_err', '')
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            }
                        } else {
                            showError('name_err', '')
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        }
                    } else if (input.name == 'email') {
                        if (input.value != '') {
                            // const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
                            const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|yahoo\.com|outlook\.com|icloud\.com|hotmail\.com)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
                            if (input.value.trim() == '' || !regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Enter Company Email';
                                showError('email_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('email_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('email_err', '')
                        }
                    } else if (input.name == 'phone') {
                        if (input.value != '') {
                            const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Phone Number';
                                showError('phone_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('phone_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('phone_err', '')
                        }
                    } else if (input.name == 'industry') {
                        if (input.value != '') {
                            const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
                            // const regex = /^(?=.*[A-Za-z])[A-Za-z ]{2,}$/;
                            if (!regex.test(input.value.trim().trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Industry Classification';
                                showError('industry_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('industry_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('industry_err', '')
                        }
                    }
                    else if (input.name == 'expertise') {
                        if (input.value != '') {
                            const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
                            // const regex = /^(?=.*[A-Za-z])[A-Za-z ]{2,}$/;
                            if (!regex.test(input.value.trim().trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Industry Expertise';
                                showError('expertise_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('expertise_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('expertise_err', '')
                        }
                    }

                    else if (input.name == 'streetAddress') {
                        if (input.value != '') {
                            const regex = /^[\w\s\d#,\-.]+$/;
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Street Name';
                                showError('streetAddress_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('streetAddress_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('streetAddress_err', '')
                        }
                    } else if (input.name == 'city') {
                        if (input.value != '') {
                            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid City Name';
                                showError('city_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('city_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('city_err', '')
                        }
                    } else if (input.name == 'state') {
                        if (input.value != '') {
                            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid State Name';
                                showError('state_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('state_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('state_err', '')
                        }
                    } else if (input.name == 'pincode') {
                        if (input.value != '') {
                            if (rigion === "US") {
                                var regex = /^\d{5}$/
                            } else {
                                var regex = /^\d{6}$/
                            }
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Pincode';
                                showError('pincode_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('pincode_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('pincode_err', '')
                        }
                    }
                    else if (input?.id?.includes("professionalInfoCompanyName")) {
                        let nameArray = input.id.split("_")
                        let num = nameArray[nameArray.length - 1];
                        if (input.value != '') {
                            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Company Name';
                                showError('professionalInfoCompanyName_' + num + '_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('professionalInfoCompanyName_' + num + '_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('professionalInfoCompanyName_' + num + '_err', '')
                        }
                    }
                    //  else if (input.name == 'companyName') {
                    //     if (input.value != '') {
                    //         const regex = /^[A-Za-z0-9 ]{3,}$/;
                    //         if (!regex.test(input.value.trim())) {
                    //             if (!errorsArray.includes(input.name)) {
                    //                 errorsArray.push(input.name);
                    //             }
                    //             errorMessage = 'Invalid Company Name';
                    //             showError('companyName_err', errorMessage)
                    //         } else {
                    //             errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //             showError('companyName_err', '')
                    //         }
                    //     } else {
                    //         errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //         showError('companyName_err', '')
                    //     }
                    // } 
                    else if (input.name == 'companyExperience') {
                        if (input.value != '') {
                            const regex = /^(?:0|[1-9][0-9]?|100)$/;
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Experience';
                                showError('companyExperience_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })

                                showError('companyExperience_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('companyExperience_err', '')
                        }
                    }
                    else if (input.name == 'companyLinkedInUrl') {
                        if (input.value != '') {
                            const regex = /^https:\/\/(www\.)?linkedin\.com\/(in|company)\/[a-zA-Z0-9-]+\/?$/
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid LinkedIn Url';
                                showError('companyLinkedInUrl_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('companyLinkedInUrl_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('companyLinkedInUrl_err', '')
                        }
                    }
                    else if (input.name == 'relevantDocuments') {
                        if (input.files[0]) {
                            let res = validateFileSize(input)
                            if (!res) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'File size is too large';
                                showError('relevantDocuments_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('relevantDocuments_err', '')
                            }
                        }
                    }
                    else if (input.name == 'panNo') {
                        if (input.value != '') {
                            const regex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
                            if (!regex.test(input.value.toUpperCase().trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid PAN Number';
                                showError('panNo_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('panNo_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('panNo_err', '')
                        }
                    }
                    else if (input.name == 'EINNumber') {
                        if (input.value != '') {
                            var regex = /^\d{2}-\d{7}$/;
                            if (!regex.test(input.value.toUpperCase().trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid EIN Number';
                                showError('EINNumber_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('EINNumber_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('EINNumber_err', '')
                        }
                    }
                    // else if (input.name == "exp_projectsHandled") {
                    //     if (input.value != '') {
                    //         const regex = /^(?:0|[1-9][0-9]?|100)$/;
                    //         if (!regex.test(input.value.trim())) {
                    //             if (!errorsArray.includes(input.name)) {
                    //                 errorsArray.push(input.name);
                    //             }
                    //             errorMessage = 'Invalid';
                    //             showError('exp_projectsHandled_err', errorMessage)
                    //         } else {
                    //             errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //             showError('exp_projectsHandled_err', '')
                    //         }
                    //     } else {
                    //         errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //         showError('exp_projectsHandled_err', '')
                    //     }
                    // }
                    // else if (input?.id?.includes("exp_companyName")) {
                    //     let nameArray = input.id.split("_")
                    //     let num = nameArray[nameArray.length - 1];
                    //     if (input.value != '') {
                    //         const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
                    //         if (!regex.test(input.value.trim())) {
                    //             if (!errorsArray.includes(input.name)) {
                    //                 errorsArray.push(input.name);
                    //             }
                    //             errorMessage = 'Invalid Company Name';
                    //             showError('exp_companyName_' + num + '_err', errorMessage)
                    //         } else {
                    //             errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //             showError('exp_companyName_' + num + '_err', '')
                    //         }
                    //     } else {
                    //         errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //         showError('exp_companyName_' + num + '_err', '')
                    //     }
                    // } else if (input?.id?.includes("exp_yearOfExperience")) {
                    //     let nameArray = input.id.split("_")
                    //     let num = nameArray[nameArray.length - 1];
                    //     if (input.value != '') {
                    //         const regex = /^(?:0|[1-9][0-9]?|100)$/;
                    //         if (!regex.test(input.value.trim())) {
                    //             if (!errorsArray.includes(input.name)) {
                    //                 errorsArray.push(input.name);
                    //             }
                    //             errorMessage = 'Invalid Experience';
                    //             showError('exp_yearOfExperience_' + num + '_err', errorMessage)
                    //         } else {
                    //             errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //             showError('exp_yearOfExperience_' + num + '_err', '')
                    //         }
                    //     } else {
                    //         errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //         showError('exp_yearOfExperience_' + num + '_err', '')
                    //     }
                    // }
                    // else if (input?.id?.includes("exp_description")) {
                    //     let nameArray = input.id.split("_")
                    //     let num = nameArray[nameArray.length - 1];
                    //     if (input.value != '') {
                    //         const regex = /^(?=.*[^\d\s])[A-Za-z0-9\s!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]+$/;
                    //         if (!regex.test(input.value.trim())) {
                    //             if (!errorsArray.includes(input.name)) {
                    //                 errorsArray.push(input.name);
                    //             }
                    //             errorMessage = 'Invalid Description';
                    //             showError('exp_description_'+num+'_err', errorMessage)
                    //         } else {
                    //             errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //             showError('exp_description_'+num+'_err', '')
                    //         }
                    //     } else {
                    //         errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //         showError('exp_description_'+num+'_err', '')
                    //     }
                    // }
                    // else if (input?.id?.includes("exp_projectsComplexity")) {
                    //     let nameArray = input.id.split("_")
                    //     let num = nameArray[nameArray.length - 1];
                    //     if (input.value != '') {
                    //         const regex = /^(?=.*[^\d\s])[A-Za-z0-9\s!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]+$/;
                    //         if (!regex.test(input.value.trim())) {
                    //             if (!errorsArray.includes(input.name)) {
                    //                 errorsArray.push(input.name);
                    //             }
                    //             errorMessage = 'Invalid Size and complexity';
                    //             showError('exp_projectsComplexity_'+num+'_err', errorMessage)
                    //         } else {
                    //             errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //             showError('exp_projectsComplexity_'+num+'_err', '')
                    //         }
                    //     } else {
                    //         errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //         showError('exp_projectsComplexity_'+num+'_err', '')
                    //     }
                    // }
                    else if (input?.id?.includes("refName")) {
                        let nameArray = input.id.split("_")
                        let num = nameArray[nameArray.length - 1];
                        if (input.value != '') {
                            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Name';
                                showError('refName_' + num + '_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('refName_' + num + '_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('refName_' + num + '_err', '')
                        }
                    }
                    else if (input?.id?.includes("refCompany")) {
                        let nameArray = input.id.split("_")
                        let num = nameArray[nameArray.length - 1];
                        if (input.value != '') {
                            const regex = /^[A-Za-z0-9 ]{3,}$/;
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Company Name';
                                showError('refCompany_' + num + '_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('refCompany_' + num + '_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('refCompany_' + num + '_err', '')
                        }
                    }
                    else if (input?.id?.includes("refEmail")) {
                        let nameArray = input.id.split("_")
                        let num = nameArray[nameArray.length - 1];
                        if (input.value != '') {
                            // const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
                            const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|yahoo\.com|outlook\.com|icloud\.com|hotmail\.com)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;

                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Enter Company Email';
                                showError('refEmail_' + num + '_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('refEmail_' + num + '_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('refEmail_' + num + '_err', '')
                        }
                    }
                    else if (input?.id?.includes("refPhone")) {
                        let nameArray = input.id.split("_")
                        let num = nameArray[nameArray.length - 1];
                        if (input.value != '') {
                            const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
                            if (!regex.test(input.value.trim())) {
                                if (!errorsArray.includes(input.name)) {
                                    errorsArray.push(input.name);
                                }
                                errorMessage = 'Invalid Phone Number';
                                showError('refPhone_' + num + '_err', errorMessage)
                            } else {
                                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                                showError('refPhone_' + num + '_err', '')
                            }
                        } else {
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                            showError('refPhone_' + num + '_err', '')
                        }
                    }
                    // else if (input?.id?.includes("refDescription")) {
                    //     let nameArray = input.id.split("_")
                    //     let num = nameArray[nameArray.length - 1];
                    //     if (input.value != '') {
                    //         const regex = /^[A-Za-z0-9 ]{3,}$/;
                    //         if (!regex.test(input.value.trim())) {
                    //             if (!errorsArray.includes(input.name)) {
                    //                 errorsArray.push(input.name);
                    //             }
                    //             errorMessage = 'Invalid Description';
                    //             showError('refDescription_'+num+'_err', errorMessage)
                    //         } else {
                    //             errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //             showError('refDescription_'+num+'_err', '')
                    //         }
                    //     } else {
                    //         errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    //         showError('refDescription_'+num+'_err', '')
                    //     }
                    // }



                    else if (input.name == 'signature') {
                        // if (input.files[0]) {
                        //     // let res = validateFileSize(input)
                        //     // if (!res) {
                        //     //     errorMessage = 'File size is too large';
                        //     //     showError('signature_err', errorMessage)

                        //     // } else {
                        //     //     errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        //     //     showError('signature_err', '')
                        //     // }
                        //     showError('signature_err', '')
                        //     errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        // } else {
                        //     if (!errorsArray.includes(input.name)) {
                        //         errorsArray.push(input.name);
                        //     }
                        //     showError('signature_err', 'Signature is Required')
                        // }
                    }

                    // else if (input.name == 'declaration') {
                    //     // console.log('declaration',input,input.checked)
                    //     if (input.checked == false) {
                    //         showError('declaration_err', 'Please check declaration')
                    //     } else {
                    //         showError('declaration_err', '')
                    //     }
                    // }
                    // else if (input.name == 'terms_and_conditions') {
                    //     // console.log('terms_and_conditions',input,input.checked)
                    //     if (input.checked == false) {
                    //         showError('terms_and_conditions_err', 'Please check terms and conditions')
                    //     } else {
                    //         showError('terms_and_conditions_err', '')
                    //     }
                    // }
                    // console.log(errorsArray)

                }

                for (let input of inputs) {
                    input.addEventListener('blur', function () {
                        validateForm(input);
                    });
                }
                for (let input of inputs) {
                    input.addEventListener('change', function () {
                        validateForm(input);
                    });
                }



                function handleSubmit() {
                    $("#pmOnboarding").submit(function (e) {
                        e.preventDefault();
                    })
                    // var filled = validateForm()
                    event.preventDefault(); // Prevent default form submission behavior
                    if (checkRequiredFields() && errorsArray.length == 0) {


                        // Get form data
                        const form = document.getElementById('pmOnboarding'); // Assuming 'pmOnboarding' is the ID of your form
                        const formData = new FormData(form);
                        // Make API call with form data
                        var myHeaders = new Headers();

                        var requestOptions = {
                            method: "POST",
                            headers: myHeaders,
                            body: formData,
                            redirect: "follow",
                        };
                        fetch("${pageContext.request.contextPath}/savePMDetails", requestOptions)
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
                                    setTimeout(function () {
                                        window.location.href = "${pageContext.request.contextPath}/profile";
                                    }, 5000);
                                } else if (data.status == "false") {
                                    toastr.error(data.message)
                                }
                                //		    data-bs-toggle="modal"
                                //          data-bs-target="#thank-you-modal

                            })
                            .catch((error) => {
                                console.error("Fetch error:", error);
                            });
                    }
                }


                document.querySelector('#resume').addEventListener('change', function () {
                    // if (!this.files[0]) {
                    //     showError('resume_err', 'Resume is Required')
                    // } else {
                    //     showError('resume_err', '')
                    // }

                    if (this.files[0]) {
                        let res = validateFileSize(this)
                        if (!res) {
                            if (!errorsArray.includes(this.name)) {
                                errorsArray.push(this.name);
                            }
                            errorMessage = 'File size is too large';
                            showError('resume_err', errorMessage)
                        } else {
                            errorsArray = errorsArray.filter(function (e) {
                                return e !== 'resume'
                            })
                            showError('resume_err', '')
                        }
                    } else {
                        showError('resume_err', 'Resume is Required')
                    }

                })
                document.querySelector('#SingatureDocument').addEventListener('change', function () {
                    // if (!this.files[0]) {
                    //     showError('signature_err', 'Signature is Required')
                    // } else {
                    //     showError('signature_err', '')
                    // }

                    if (this.files[0]) {
                        let res = validateFileSize(this)
                        if (!res) {
                            if (!errorsArray.includes(this.name)) {
                                errorsArray.push(this.name);
                            }
                            errorMessage = 'File size is too large';
                            showError('signature_err', errorMessage)
                        } else {
                            errorsArray = errorsArray.filter(function (e) {
                                return e !== 'SingatureDocument'
                            })
                            showError('signature_err', '')
                        }
                    } else {
                        showError('signature_err', 'Signature is Required')
                    }
                })


                document.querySelector('#declaration').addEventListener('click', function () {
                    if (this.checked) {
                        showError('declaration_err', '')
                    } else {
                        showError('declaration_err', 'Plese check declaration')
                    }
                })

                document.querySelector('#terms_and_conditions').addEventListener('click', function () {
                    if (this.checked) {
                        showError('terms_and_conditions_err', '')
                    } else {
                        showError('terms_and_conditions_err', 'Plese check terms and conditions')
                    }
                })


                //===================== handling validations(NEW) for pm ends here  =====================

            </script>
            <script src="assets/js/index.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
        </body>

        </html>