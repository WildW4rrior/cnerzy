<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Onboarding | BUYER(US)</title>
    <c:import url="common-header-import.jsp"></c:import>

</head>

<body>

    <!-- <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
        $(window).on('load', function() {
            $('#thank-you-modal').modal('show');
        });
   </script> -->

    <div class="container-fluid bg-gray box-style-1">
        <div class="box-style-2">
            <div class="onboarding-header bg-gray row">
                <div class="col-sm-3 col-12 logo-col">
                    <a href="#">
                        <img class="header-logo" src="assets/images/Logo.svg" alt="">
                    </a>
                </div>
                <div class="col-sm-9 col-12"></div>
            </div>
            <form action="" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="user_id" value="{{$data['userId']}}">
                <div class="content">
                    <div class="input-field-section mt-32">
                        <h6 class="input-section-heading mb-16">Company Details</h6>
                        <div class="row row-gap-16">
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="company_name" class="input-field"
                                        placeholder="Company Name" required autocomplete="on">
                                    <label for="compnay_name" class="input-label">Company Name<span
                                            class="required-asterisk">*</span></label>
                                    <span id="company_name_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="email" name="company_email" class="input-field"
                                        placeholder="Company Email" required autocomplete="on">
                                    <label for="company_email" class="input-label">Company Email<span
                                            class="required-asterisk">*</span></label>
                                    <span id="company_email_err" class="err-text"></span>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="company_phone" class="input-field" placeholder="Phone"
                                        required autocomplete="on">
                                    <label for="company_phone" class="input-label">Phone<span
                                            class="required-asterisk">*</span></label>
                                    <span id="company_phone_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="company_website" class="input-field" placeholder="Website"
                                     autocomplete="on">
                                    <label for="company_website" class="input-label">Website</label>
                                    <span id="company_website_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group select-field-group-toggle">
                                    <select name="industry" id="industry" class="input-field form-dropdown" required
                                        autocomplete="on">
                                        <option value="" selected hidden></option>
                                        <option value="Automotive">Automotive</option>
                                        <option value="Aerospace">Aerospace</option>
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
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="linkedin_url" class="input-field"
                                        placeholder="LinkedIn Profile URL" autocomplete="on">
                                    <label for="linkedin_url" class="input-label">LinkedIn Profile URL</label>
                                    <span id="linkedin_url_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="file-input-field-group">
                                    <input type="file" id="logo_buyer_us_input" name="company_logo" class="input-field"
                                        accept="application/pdf" placeholder="File" autocomplete="on" hidden>
                                    <button class="input-btn" type="button"
                                        onclick="handleClick('logo_buyer_us_input','logo_buyer_us_text')">Choose
                                        File</button>
                                    <p id="logo_buyer_us_text">No File Choosen</p>
                                </div>
                                <div class="fileType-and-maxFileSize">
                                    <p>Attach your company logo here</p>
                                    <p>File Size: Max 2 MB</p>
                                    <span id="logo_buyer_us_err" class="err-text"></span>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="input-field-section mt-32">
                        <h6 class="input-section-heading mb-16">Company Address</h6>
                        <div class="row row-gap-16">
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="street_address" class="input-field"
                                        placeholder="Street Address" required autocomplete="on">
                                    <label for="street_address" class="input-label">Street Address<span
                                            class="required-asterisk">*</span></label>
                                    <span id="street_address_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="city" class="input-field" placeholder="City" required
                                        autocomplete="on">
                                    <label for="city" class="input-label">City<span
                                            class="required-asterisk">*</span></label>
                                    <span id="city_err" class="err-text"></span>

                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="state" class="input-field" placeholder="State" required
                                        autocomplete="on">
                                    <label for="state" class="input-label">State<span
                                            class="required-asterisk">*</span></label>
                                    <span id="state_err" class="err-text"></span>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <!-- <input type="text" name="country" readonly value="{{$data['country']}}" class="input-field" placeholder="Country" required
                                    autocomplete="on"> -->
                                    <select name="country" disabled id="country" class="input-field form-dropdown"
                                        required autocomplete="on">
                                        <option value="india">India</option>
                                        <option value="us" selected>US</option>
                                    </select>
                                    <!-- <label for="country" class="input-label">Country</label> -->
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="pincode" class="input-field" placeholder="Pincode" required
                                        autocomplete="on">
                                    <label for="pincode" class="input-label">Pincode<span
                                            class="required-asterisk">*</span></label>
                                    <span id="pincode_err" class="err-text"></span>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="input-field-section mt-32">
                        <h6 class="input-section-heading mb-16">Contact Person</h6>
                        <div class="row row-gap-16">
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="contact_person_name" class="input-field" placeholder="Name"
                                        required autocomplete="on">
                                    <label for="contact_person_name" class="input-label">Name<span
                                            class="required-asterisk">*</span></label>
                                    <span id="contact_person_name_err" class="err-text"></span>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="contact_person_designation" class="input-field"
                                        placeholder="Designation" required autocomplete="on">
                                    <label for="contact_person_designation" class="input-label">Designation<span
                                            class="required-asterisk">*</span></label>
                                    <span id="contact_person_designation_err" class="err-text"></span>

                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="email" name="contact_person_email" class="input-field"
                                        placeholder="Email" required autocomplete="on">
                                    <label for="contact_person_email" class="input-label">Email<span
                                            class="required-asterisk">*</span></label>
                                    <span id="contact_person_email_err" class="err-text"></span>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="contact_person_phone" class="input-field"
                                        placeholder="Phone" required autocomplete="on">
                                    <label for="contact_person_phone" class="input-label">Phone<span
                                            class="required-asterisk">*</span></label>
                                    <span id="contact_person_phone_err" class="err-text"></span>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="input-field-section mt-32">
                        <h6 class="input-section-heading mb-16">Legal Information</h6>
                        <div class="row row-gap-16">
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group">

                                    <select name="type_of_business_entity" id="type_of_business_entity"
                                        class="input-field form-dropdown" autocomplete="on">
                                        <option value="" selected hidden></option>
                                        <option value="Sole Proprietorship">Sole Proprietorship</option>
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
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="business_reg_number" class="input-field"
                                        placeholder="Business Reg. Number(CIN)" autocomplete="on">
                                    <label for="business_reg_number" class="input-label">Business Reg.
                                        Number(CIN)</label>
                                    <span id="business_reg_number_err" class="err-text"></span>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="tax_id_number" class="input-field"
                                        placeholder="Tax Id. Number (EIN)" autocomplete="on">
                                    <label for="tax_id_number" class="input-label">Tax Id. Number (EIN)</label>
                                    <span id="tax_id_number_err" class="err-text"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="input-field-section mt-32">
                        <h6 class="input-section-heading mb-16">Financial Information</h6>
                        <div class="row row-gap-16">
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="bank_name" class="input-field" placeholder="Bank Name"
                                        autocomplete="on">
                                    <label for="bank_name" class="input-label">Bank Name</label>
                                    <span id="bank_name_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="account_number" class="input-field"
                                        placeholder="Account Number" autocomplete="on">
                                    <label for="account_number" class="input-label">Account Number</label>
                                    <span id="account_number_err" class="err-text"></span>

                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="routing_number" class="input-field"
                                        placeholder="Routing Number" autocomplete="on">
                                    <label for="routing_number" class="input-label">Routing Number</label>
                                    <span id="routing_number_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group d-flex position-relative align-items-center">
                                    <div class="input-group-prepend position-absolute"
                                        style="left: 10px; width: 32px; height: 32px;">
                                        <span class="input-group-text" id="basic-addon1"
                                            style="font-size: 12px; padding: 3px;">USD</span>
                                    </div>
                                    <input type="text" name="annual_turnover" style="padding-left:50px;"
                                        class="input-field" placeholder="Annual Turnover" autocomplete="on">
                                    <label for="annual_turnover" style="left:50px;" class="input-label">Annual
                                        Turnover</label>
                                </div>
                                <span id="annual_turnover_err" class="err-text"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-field-section mt-32">
                        <h6 class="input-section-heading mb-16">Declaration</h6>
                        <p class="declaration-text mb-16">By submitting this form, I confirm that the information
                            provided
                            is true and accurate to the best of my knowledge.</p>
                        <div class="row row-gap-16">
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" value="{{date('d-M-Y')}}" readonly name="date" class="input-field auto-fill-date" required
                                        autocomplete="on">
                                    <!-- <label for="date" class="input-label">Date</label> -->
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-32">
                                <div class="file-input-field-group">
                                    <input type="file" id="signature_buyer_us_input" name="signature"
                                        accept="application/pdf" class="input-field" placeholder="File"
                                        autocomplete="on" hidden>
                                    <button class="input-btn" type="button"
                                        onclick="handleClick('signature_buyer_us_input','signature_buyer_us_text')">Choose
                                        File</button>
                                    <p id="signature_buyer_us_text">No File Choosen</p>
                                </div>
                                <div class="fileType-and-maxFileSize">
                                    <p>Attach your signature here<span class="required-asterisk">*</span></p>
                                    <p>File Size: Max 2 MB</p>
                                    <span id="signature_buyer_us_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-12 mt-32 mb-32 d-flex justify-content-end">
                                <button class="btn-style-1" id="submit-btn" type="submit">Submit</button>
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
                <img class="modal-img mb-16" src="assets/icons/Succeess Animation.svg"
                    alt="Success Animation">
                <h2 class="modal-heading text-center mb-8">Thank You!</h2>
                <p class="modal-para text-center">You've successfully completed your onboarding process.</p>
            </div>
        </div>
    </div>

    <!-- Thank you popup ends -->


    <script>
        const inputs = document.querySelectorAll('input');

        function showError(id, errorMsg) {
            let errSpan = document.getElementById(id)
            errSpan.innerHTML = errorMsg
        }

        function validateFileSize(input) {
            let valid = true
            const file = input.files[0]
            if (file) {
                const limit = 2000;
                const size = file.size / 1024
                if (size > limit) {
                    // const err = new Error("File size must not be more than 2MB");
                    // console.log(size, limit, `File size must not be more than 2MB`)
                    valid = false
                    // console.log('large-file-size', valid)
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

        function validateForm() {
            let valid = true;
            // console.log(inputs)

            for (let input of inputs) {
                let errorMessage = '';
                if (input.name == 'company_name' && input.value != '') {
                    const regex = /^[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid company Name';
                        showError('company_name_err', errorMessage)

                        return;
                    } else {
                        errorMessage = ''
                        showError('company_name_err', '')
                    }
                } else if (input.name == 'company_email' && input.value != '') {
                    const regex = /^[a-zA-Z0-9._%+-]+@(?!gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid company Email';
                        showError('company_email_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('company_email_err', '')
                    }
                } else if (input.name == 'company_phone' && input.value != '') {
                    const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Phone Number';
                        showError('company_phone_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('company_phone_err', '')
                    }
                } else if (input.name == 'company_website' && input.value != '') {
                    const regex = /^(https?:\/\/)?(www\.)?[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})(\/\S*)?$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Website Url';
                        showError('company_website_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('company_website_err', '')
                    }
                } else if (input.name == 'industry' && input.value != '') {
                    console.log("industry-error")
                    const regex = /^[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Industry Name';
                        showError('industry_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('industry_err', '')
                    }
                } else if (input.name == 'linkedin_url' && input.value != '') {
                    const regex = /^(https?:\/\/)?(www\.)?linkedin\.com\/(?:in|pub)\/[a-zA-Z0-9_-]+\/?$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid LinkedIn Url';
                        showError('linkedin_url_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('linkedin_url_err', '')
                    }
                } else if (input.name == 'logo_buyer_us' && input.value != '') {
                    let res = validateFileSize(input)
                    console.log(input, res)
                    if (!res) {
                        errorMessage = 'File size is too large';
                        showError('logo_buyer_us_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('logo_buyer_us_err', '')
                    }
                } else if (input.name == 'street_address' && input.value != '') {
                    const regex = /^[\w\s\d#,-]+$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Street Name';
                        showError('street_address_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('street_address_err', '')
                    }
                } else if (input.name == 'city' && input.value != '') {
                    const regex = /^[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid City Name';
                        showError('city_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('city_err', '')
                    }
                } else if (input.name == 'state' && input.value != '') {
                    const regex = /^[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid State Name';
                        showError('state_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('state_err', '')
                    }
                } else if (input.name == 'pincode' && input.value != '') {
                    const regex = /^\d{5}$/
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Pincode';
                        showError('pincode_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('pincode_err', '')
                    }
                } else if (input.name == 'contact_person_name' && input.value != '') {
                    const regex = /^[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Name';
                        showError('contact_person_name_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('contact_person_name_err', '')
                    }
                } else if (input.name == 'contact_person_designation' && input.value != '') {
                    const regex = /^[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Designation';
                        showError('contact_person_designation_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('contact_person_designation_err', '')
                    }
                } else if (input.name == 'contact_person_email' && input.value != '') {
                    const regex = /^[a-zA-Z0-9._%+-]+@(?!gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Email';
                        showError('contact_person_email_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('contact_person_email_err', '')
                    }
                } else if (input.name == 'contact_person_phone' && input.value != '') {
                    const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Phone Number';
                        showError('contact_person_phone_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('contact_person_phone_err', '')
                    }
                } else if (input.name == 'type_of_business_entity' && input.value != '') {
                    const regex = /^[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Business Entity';
                        showError('type_of_business_entity_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('type_of_business_entity_err', '')
                    }
                } else if (input.name == 'business_reg_number' && input.value != '') {
                    const regex = /^[A-Za-z0-9]{21}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Business Registration Number';
                        showError('business_reg_number_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('business_reg_number_err', '')
                    }
                } else if (input.name == 'tax_id_number' && input.value != '') {
                    const regex = /^\d(?:-?\d){8}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Tax Id Number';
                        showError('tax_id_number_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('tax_id_number_err', '')
                    }
                } else if (input.name == 'bank_name' && input.value != '') {
                    const regex = /^[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Bank Name';
                        showError('bank_name_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('bank_name_err', '')
                    }
                } else if (input.name == 'account_number' && input.value != '') {
                    const regex = /^\d+$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Account Number';
                        showError('account_number_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('account_number_err', '')
                    }
                } else if (input.name == 'routing_number' && input.value != '') {
                    const regex = /^\d+$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Routing Number';
                        showError('routing_number_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('routing_number_err', '')
                    }
                } else if (input.name == 'annual_turnover' && input.value != '') {
                    const regex = /^\d+$/;
                    if (!regex.test(input.value)) {
                        errorMessage = 'Invalid Turnover';
                        showError('annual_turnover_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('annual_turnover_err', '')
                    }
                } else if (input.name == 'signature_buyer_us' && input.value != '') {
                    let res = validateFileSize(input)
                    if (!res) {
                        errorMessage = 'File size is too large';
                        showError('signature_buyer_us_err', errorMessage)
                        return;
                    } else {
                        errorMessage = ''
                        showError('signature_buyer_us_err', '')
                    }

                } else if (input.name == 'signature_buyer_us') {
                    // console.log("no signature-found")
                    // errorMessage = 'File required';
                    // showError('signature_buyer_us_err', errorMessage)
                    // checkForFiles()
                } else {
                    // console.log(input)
                }

                if (errorMessage != '') {
                    valid = false;
                } else {
                    valid = true
                }

            }
            return valid;
        }

        for (let input of inputs) {
            input.addEventListener('change', function () {
                validateForm();
            });
        }

        function checkForFiles() {
            let allReqFiles = true
            if (!document.querySelector('#signature_buyer_us_input').files[0]) {
                allReqFiles = false
                showError('signature_buyer_us_err', 'Signature is Required')
            } else if (document.querySelector('#signature_buyer_us_input').files[0]) {
                let res = validateFileSize(document.querySelector('#signature_buyer_us_input'))
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('signature_buyer_us_err', errorMessage)
                    allReqFiles = false

                } else {
                    showError('signature_buyer_us_err', '')
                    allReqFiles = true

                }
            } else {
                allReqFiles = true

            }
            return allReqFiles;
        }

        const form = document.querySelector('form');
        let submit_button = document.getElementById('submit-btn')

        form.addEventListener('submit', function (event) {
            if (validateForm() && checkForFiles()) {
                submit_button.setAttribute("data-bs-toggle", "modal");
                console.log('valid')
                document.getElementById('thank-you-modal').classList.toggle('hide')
                // event.preventDefault(); // Prevent form submission if validation fails
            } else {
                console.log('invalid', validateForm(), checkForFiles())
                document.getElementById('thank-you-modal').classList.toggle('hide')
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
    </script>
    <script src="assets/js/index.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
        </script>
</body>


</html>
