<%@ include file="./taglibs.jsp"%>
<%--  <%
// Example of setting the country variable in the servlet or JSP page
String country = "US"; // This should be set dynamically based on your application's logic
request.setAttribute("country", country);
%>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:choose>
	<c:when test="${country == 'IN'}">
		<title>Onboarding | BUYER (INDIA)</title>
	</c:when>
	<c:otherwise>
		<title>Onboarding | BUYER(US)</title>
	</c:otherwise>
</c:choose>

<c:import url="common-header-import.jsp"></c:import>
</head>
<style>
select:disabled {
	background: transparent;
}

@media ( min-width : 576px) {
	.modal-dialog {
		max-width: var(--bs-modal-width);
	}
}

.show-placeholder::placeholder {
	color: var(--gray-4);
}
@media ( min-width : 992px) {
	.modal-lg, .modal-xl {
		max-width: none !important;
	}
}
</style>
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
					<a href="#"> <img class="header-logo"
						src="assets/images/Logo.svg" alt="">
					</a>
				</div>
				<div class="col-sm-9 col-12"></div>
			</div>
			<form id="BuyerDetails">

				<div class="content">
					<div class="input-field-section mt-32">
						<h6 class="input-section-heading mb-16">Company Details</h6>
						<div class="row row-gap-16">
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyName" class="input-field"
										required placeholder="Company Name" autocomplete="on">
									<label for="companyName" class="input-label">Company
										Name<span class="required-asterisk">*</span>
									</label> <span id="companyName_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="companyEmail" class="input-field"
										placeholder="Company Email" required autocomplete="on">
									<label for="companyEmail" class="input-label">Company
										Email<span class="required-asterisk">*</span>
									</label> <span id="companyEmail_err" class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyPhone" class="input-field"
										placeholder="Phone" required maxlength="10" autocomplete="on"> <label
										for="companyPhone" class="input-label">Phone<span
										class="required-asterisk">*</span></label> <span id="companyPhone_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyWebsite" class="input-field"
										placeholder="Website" autocomplete="on"> <label
										for="companyWebsite" class="input-label">Website</label> <span
										id="companyWebsite_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class=" select-field-group select-field-group-toggle">
									<select name="companyIndustry" id="companyIndustry"
										class="input-field form-dropdown" required autocomplete="on">
										<option value="" selected>Industry</option>
										<option value="Aerospace">Aerospace</option>
                                        <option value="Automotive">Automotive</option>
                                        <option value="Consumer Goods">Consumer Goods</option>
                                        <option value="Energy">Energy</option>
                                        <option value="Industrial Machinery">Industrial Machinery</option>
                                        <option value="Others">Others</option>
									</select> <label for="companyIndustry" class="input-label">Select<span
										class="required-asterisk">*</span></label> <span
										id="companyIndustry_err" class="err-text"></span>
								</div>

							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyLinkedInUrl"
										class="input-field" placeholder="LinkedIn Profile URL"
										autocomplete="on"> <label for="companyLinkedInUrl"
										class="input-label">LinkedIn Profile URL</label> <span
										id="companyLinkedInUrl_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="file-input-field-group">
									<input type="file" id="companyLogo_input" name="companyLogo"
										class="input-field" accept=".jpg, .png, .jpeg"
										placeholder="File" autocomplete="on" hidden>
									<button class="input-btn" type="button"
										onclick="handleClick('companyLogo_input','companyLogo_text')">Choose
										File</button>
									<p id="companyLogo_text">No File Choosen</p>
								</div>
								<div class="fileType-and-maxFileSize">
									<p>Attach your company logo here</p>

									<span id="companyLogo_err" class="err-text"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="input-field-section mt-32">
						<h6 class="input-section-heading mb-16">Company Address</h6>
						<div class="row row-gap-16">
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="streetAddress" class="input-field"
										placeholder="Street Address" required autocomplete="on">
									<label for="streetAddress" class="input-label">Street
										Address<span class="required-asterisk">*</span>
									</label> <span id="streetAddress_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="city" class="input-field"
										placeholder="City" required autocomplete="on"> <label
										for="city" class="input-label">City<span
										class="required-asterisk">*</span></label> <span id="city_err"
										class="err-text"></span>

								</div>
							</div>

							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="state" class="input-field"
										placeholder="State" required autocomplete="on"> <label
										for="state" class="input-label">State<span
										class="required-asterisk">*</span></label> <span id="state_err"
										class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<!-- <input type="text" name="country" readonly value="{{$data['country']}}" class="input-field" placeholder="Country" required
                                        autocomplete="on"> -->
									<c:choose>
										<c:when test="${country == 'IN'}">
											<select name="country" disabled id="country"
												class="input-field form-dropdown" required autocomplete="on">
												<option value="india" selected>India</option>
												<option value="us">US</option>
											</select>
										</c:when>
										<c:otherwise>

											<select name="country" disabled id="country"
												class="input-field form-dropdown" required autocomplete="on">
												<option value="india">India</option>
												<option value="us" selected>US</option>
											</select>
										</c:otherwise>
									</c:choose>


									<!-- <label for="country" class="input-label">Country</label> -->
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="pincode" class="input-field"
										placeholder="Pincode" required autocomplete="on"> <label
										for="pincode" class="input-label">Pincode<span
										class="required-asterisk">*</span></label> <span id="pincode_err"
										class="err-text"></span>
								</div>
							</div>

						</div>
					</div>
					<div class="input-field-section mt-32">
						<h6 class="input-section-heading mb-16">Contact Person</h6>
						<div class="row row-gap-16">
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonName" class="input-field"
										placeholder="Name" required autocomplete="on"> <label
										for="contactPersonName" class="input-label">Name<span
										class="required-asterisk">*</span></label> <span
										id="contactPersonName_err" class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonDesignation"
										class="input-field" placeholder="Designation" required
										autocomplete="on"> <label
										for="contactPersonDesignation" class="input-label">Designation<span
										class="required-asterisk">*</span></label> <span
										id="contactPersonDesignation_err" class="err-text"></span>

								</div>
							</div>

							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="contactPersonEmail"
										class="input-field" placeholder="Email" required
										autocomplete="on"> <label for="contactPersonEmail"
										class="input-label">Email<span
										class="required-asterisk">*</span></label> <span
										id="contactPersonEmail_err" class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonPhone"
										class="input-field" maxlength="10" placeholder="Phone" required
										autocomplete="on"> <label for="contactPersonPhone"
										class="input-label">Phone<span
										class="required-asterisk">*</span></label> <span
										id="contactPersonPhone_err" class="err-text"></span>

								</div>
							</div>

						</div>
					</div>
					<div class="input-field-section mt-32">
						<h6 class="input-section-heading mb-16">Legal Information</h6>
						<div class="row row-gap-16">
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group select-field-group">
									<select name="companyType" id="companyType"
										class="input-field form-dropdown" autocomplete="on">
										<option value="" selected>Type of Business Entity</option>
										<option value="Sole Proprietorship">Sole
											Proprietorship</option>
										<option value="Partnership">Partnership</option>
										<option value="Private Limited">Private Limited</option>
										<option value="Public Limited">Public Limited</option>
									    <c:choose>
                                            <c:when test="${country == 'IN'}">
                                                <option value="LLP">LLP</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="LLC">LLC</option>
                                            </c:otherwise>
                                        </c:choose>
										<option value="Corporation">Corporation</option>
									</select> <label for="companyType" class="input-label">Select</label> <span
										id="companyType_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="buisnessRegNumber"
										class="input-field uc-text text-uppercase"
										placeholder="Business Reg. Number(CIN)" autocomplete="on">
									<label for="buisnessRegNumber" class="input-label">Business
										Reg. Number(CIN)</label> <span id="buisnessRegNumber_err"
										class="err-text"></span>
								</div>
							</div>


							<c:choose>
								<c:when test="${country == 'IN'}">
									<div class="col-lg-3 col-md-6 col-sm-12 col-12">
										<div class="field-group">
											<input type="text" name="gstNo"
												class="input-field uc-text text-uppercase" placeholder="" autocomplete="on">
											<label for="taxIdNumber" class="input-label">Tax Id.
												Number (GSTIN)</label> <span id="taxIdNumber_err" class="err-text"></span>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-lg-3 col-md-6 col-sm-12 col-12">
										<div class="field-group">
											<input type="text" name="taxIdNumber"
												class="input-field show-placeholder uc-text text-uppercase"
												placeholder="XX-XXXXXXX" autocomplete="on"> <label
												for="taxIdNumber" class="input-label">Tax Id. Number
												(EIN)</label> <span id="taxIdNumber_err" class="err-text"></span>

										</div>
									</div>
								</c:otherwise>
							</c:choose>


						</div>
					</div>
					<div class="input-field-section mt-32 ">
						<h6 class="input-section-heading mb-16">Financial Information</h6>
						<div class="row row-gap-16 mb-16">
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyBankName" class="input-field"
										placeholder="Bank Name" autocomplete="on"> <label
										for="companyBankName" class="input-label">Bank Name</label> <span
										id="companyBankName_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="number" name="companyAccountNumber"
										class="input-field" placeholder="Account Number"
										autocomplete="on"> <label for="companyAccountNumber"
										class="input-label">Account Number</label> <span
										id="companyAccountNumber_err" class="err-text"></span>

								</div>
							</div>
							<c:choose>
								<c:when test="${country == 'IN'}">

									<div class="col-lg-3 col-md-6 col-sm-12 col-12">
										<div class="field-group">
											<input type="text" name="companyIfscCode"
												class="input-field uc-text text-uppercase" placeholder="IFSC Code"
												autocomplete="on"> <label for="companyIfscCode"
												class="input-label">IFSC Code</label> <span
												id="companyIfscCode_err" class="err-text"></span>
										</div>
									</div>
								</c:when>
								<c:otherwise>

									<div class="col-lg-3 col-md-6 col-sm-12 col-12">
										<div class="field-group">
											<input type="number" name="companyRoutingNumber"
												class="input-field" placeholder="Routing Number"
												autocomplete="on"> <label for="companyRoutingNumber"
												class="input-label">Routing Number</label> <span
												id="companyRoutingNumber_err" class="err-text"></span>
										</div>
									</div>
								</c:otherwise>
							</c:choose>


						</div>
						<div class="row row-gap-16">
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div
									class="field-group d-flex position-relative align-items-center">
									<div class="input-group-prepend position-absolute"
										style="left: 10px; width: 32px; height: 32px;">
										<c:choose>
											<c:when test="${country == 'IN'}">

												<span class="input-group-text" id="basic-addon1"
													style="font-size: 12px; padding: 4px;">INR</span>
											</c:when>
											<c:otherwise>


												<span class="input-group-text" id="basic-addon1"
													style="font-size: 12px; padding: 3px;">USD</span>
											</c:otherwise>
										</c:choose>
									</div>
									<input type="number" name="annualTurnoverValue"
										style="padding-left: 50px;" class="input-field"
										placeholder="Annual Turnover" autocomplete="on"> <label
										for="annualTurnoverValue" style="left: 50px;"
										class="input-label">Annual Turnover</label>
								</div>
								<span id="annualTurnoverValue_err" class="err-text"></span>
							</div>
						</div>
					</div>
					<div class="input-field-section mt-32">
						<h6 class="input-section-heading mb-16">Declaration</h6>
						<div class="d-flex mb-16">
							<input type="checkbox" name="declaration" id="declaration"
								class="declaration mr-8"> <label
								class="declaration_label" for="declaration">By
								submitting this form, I confirm that the information provided is
								true and accurate to the best of my knowledge.</label> <span
								id="declaration_err" class="err-text"></span>
						</div>
						<div class="row row-gap-16">
							<div class="col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" value="" placeholder="yyyy-MM-dd"
										readonly name="declerationDate" id="declerationDate"
										class="input-field auto-fill-declerationDate " required
										autocomplete="on">
									<!-- <label for="declerationDate" class="input-label">Date</label> -->
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-32">
								<div class="file-input-field-group">
									<input type="file" id="companySignature" name="companySignature"
										accept=".jpg, .png, .jpeg" class="input-field"
										placeholder="File" autocomplete="on" hidden>
									<button class="input-btn" type="button"
										onclick="handleClick('companySignature','signature_buyer_in_text')">Choose
										File</button>
									<p id="signature_buyer_in_text">No File Choosen</p>
								</div>
								<div class="fileType-and-maxFileSize">
									<p>
										Attach your signature here<span class="required-asterisk">*</span>
									</p>

									<span id="companySignature_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-12">
								<input type="checkbox" name="terms_and_conditions"
									id="terms_and_conditions" class="terms_and_conditions mr-8">
								<label class="terms_and_conditions_label"
									for="terms_and_conditions">I have read the  <a
									href="https://cnerzy.com/assets/privacy-policy/terms-and-conditions.pdf"
									target="_blank" style="text-decoration: none;">Terms and conditions</a> 
									and I agree</label> <span id="terms_and_conditions_err"
									class="err-text"></span>
							</div>
							<div class="col-12">
							<div class="d-flex align-items-baseline">
								<input type="checkbox" name="getIsNotificationsAllowed" id="send_updates"
									class="send_updates mr-8"> <label class="send_updates_label"
									for="send_updates">By sharing your contact information, you agree to receive important news and updates from Cnerzy. You can update your preference and unsubscribe from these communications anytime using the link in our marketing email. For more information, read our <a
									href="https://cnerzy.com/assets/privacy-policy/privacy-policy.pdf"
									target="_blank" style="text-decoration: none;">Privacy Policy.</a></label>
							</div>
							</div>
                            <div class="col-12">
                              <div class="d-flex align-items-baseline">
                                    <input type="checkbox" name="createEscrowAccount"
									id="createEscrowAccount" class="createEscrowAccount mr-8" checked onclick="return false;" onkeydown="return false;">
								<label
									for="createEscrowAccount">Create my escrow account (this will enable us to create your account in the escrow sandbox, which will speed up the transaction process for the project.)</label>
                                    <span id="createEscrowAccount_err"
                                       class="err-text"></span>
                                </div>
                                
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
	<div class="modal fade custom-thank-you-modal modal-lg"
		id="thank-you-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="modal-img mb-16"
					src="assets/icons/Succeess Animation.svg" alt="Success Animation">
				<h2 class="modal-heading text-center mb-8">Thank You!</h2>
				<p class="modal-para text-center">Congratulations on registering with CNERZY! Your account is currently under review. We'll notify you once it's approved.</p>
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
    console.log("${country}")
    var rigion = "${country}"
        var inputs = document.querySelectorAll('input,select');

        function showError(id, errorMsg) {
            let errSpan = document.getElementById(id)
            errSpan.innerHTML = errorMsg
        }
        $(document).ready(function () {
        	  console.log("Hello World!");
        	  
                /*   $('#thank-you-modal').modal('show');
              
        	 	 */
        	});
   
        /* 
        action="${pageContext.request.contextPath}/saveBuyerDetails"
			method="POST" id="BuyerDetails" enctype="multipart/form-data" */
        function handleSubmit(){
        	$("#BuyerDetails").submit(function(e) {
        		e.preventDefault();})
        	 const form = document.querySelector('#BuyerDetails');
             let submit_button = document.getElementById('submitBtn')
                 // Check if all required fields are filled and valid
                 if (checkRequiredFields() && errorsArray.length == 0) {
                     console.log('valid');
                    //  submit_button.disabled = true;
                     const form = document.getElementById('BuyerDetails'); // Assuming 'pmOnboarding' is the ID of your form
             		const formData = new FormData(form);
             	  // Make API call with form data
             	var myHeaders = new Headers();

             	var requestOptions = {
             		method: "POST",
             		headers: myHeaders,
             		body: formData,
             		redirect: "follow",
             	};
                     fetch("${pageContext.request.contextPath}/saveBuyerDetails", requestOptions)
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
             		                window.location.href = "${pageContext.request.contextPath}/profile";
             		            }, 5000); 
             			} else if (data.status == "false") {
             				toastr.error(data.message)
             			} 
//             		    data-bs-toggle="modal"
//                       data-bs-target="#thank-you-modal

             		})
             		.catch((error) => {
             			console.error("Fetch error:", error);
             		});
             		
                 } else {
                     event.preventDefault(); // Prevent form submission if validation fails
                 }
           
             }
         	
                /* if (validateForm()&& checkForFiles()) {
                    console.log('valid');
                    
                    // event.preventDefault(); // Prevent form submission if validation fails
                } else {
                    event.preventDefault(); // Prevent form submission if validation fails
                } */
                
     
        function checkRequiredFields() {
                	console.log("hello")
            let allFilled = true;
            let firstRequiredField = null;
            for (let input of inputs) {
                if (input.name == 'companyName' && input.value.trim() == '') {
                    allFilled = false;
                    showError('companyName_err', 'Company Name is Required')
                } else if (input.name == 'companyEmail' && input.value.trim() == '') {
                    allFilled = false;
                    showError('companyEmail_err', 'Company Email is Required')
                }
                else if (input.name == 'companyPhone' && input.value.trim() == '') {
                    allFilled = false;
                    showError('companyPhone_err', 'Phone Number is Required')
                }
                else if (input.name == 'companyIndustry' && input.value.trim() == '' && input.required) {
                    // console.log(input)
                    allFilled = false;
                    showError('companyIndustry_err', 'Industry is Required')
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
                } else if (input.name == 'contactPersonName' && input.value.trim() == '') {
                    allFilled = false;
                    showError('contactPersonName_err', 'Name is Required')
                } else if (input.name == 'contactPersonDesignation' && input.value.trim() == '') {
                    allFilled = false;
                    showError('contactPersonDesignation_err', 'Designation is Required')
                } else if (input.name == 'contactPersonEmail' && input.value.trim() == '') {
                    allFilled = false;
                    showError('contactPersonEmail_err', 'Email is Required')
                } else if (input.name == 'contactPersonPhone' && input.value.trim() == '') {
                    allFilled = false;
                    showError('contactPersonPhone_err', 'Phone Number is Required')
                }
                else if (input.name == 'companySignature' && !input.files[0]) {
                    allFilled = false;
                    showError('companySignature_err', 'Signature is Required')
                } else if (input.name == 'declaration' && input.checked == false) {
                    allFilled = false;
                    showError('declaration_err', 'Please check declaration')
                } else if (input.name == 'terms_and_conditions' && input.checked == false) {
                    allFilled = false;
                    showError('terms_and_conditions_err', 'Please check terms and conditions')
                }
                // else if (input.name == 'createEscrowAccount' && input.checked == false) {
                //     allFilled = false;
                //     showError('createEscrowAccount_err', 'Permission is Required')
                // }
                

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
        // let result = checkRequiredFields()


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

        let errorsArray = [];
        function validateForm(input) {
            // for (let input of inputs) {
            let errorMessage = '';
            if (input.name == 'companyName') {
                if (input.value != '') {
                    const regex = /^[A-Za-z0-9 ]{3,}$/;
                    if (input.value.trim() == '' || !regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid company Name';
                        showError('companyName_err', errorMessage)
                    } else {
                        showError('companyName_err', '')
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    }
                } else {
                    showError('companyName_err', '')
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                }
            } else if (input.name == 'companyEmail') {
                if (input.value != '') {
                    // const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
                    const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|yahoo\.com|outlook\.com|icloud\.com|hotmail\.com)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;

                    if (input.value.trim() == '' || !regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Enter Company Email';
                        showError('companyEmail_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('companyEmail_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('companyEmail_err', '')
                }
            } else if (input.name == 'companyPhone') {
                if (input.value != '') {
                    const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
                    if (!regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Phone Number';
                        showError('companyPhone_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('companyPhone_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('companyPhone_err', '')
                }
            } else if (input.name == 'companyWebsite') {
                if (input.value != '') {
                    // const regex = /^(https?:\/\/)?(www\.)?[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})(\/\S*)?$/;
                    const regex = /^(https?:\/\/)?([a-zA-Z0-9-]+\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\/\S*)?$/;
                    if (!regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Website Url';
                        showError('companyWebsite_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('companyWebsite_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('companyWebsite_err', '')
                }
            } else if (input.name == 'companyIndustry') {
                if (input.value != '') {
                    const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
                    // const regex = /^(?=.*[A-Za-z])[A-Za-z ]{2,}$/;
                    if (!regex.test(input.value.trim().trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Industry Name';
                        showError('companyIndustry_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('companyIndustry_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('companyIndustry_err', '')
                }
            }
            else if (input.name == 'companyLinkedInUrl') {
                if (input.value != '') {
                    // const regex = /^(https?:\/\/)?(www\.)?linkedin\.com\/(?:in|pub)\/[a-zA-Z0-9_-]+\/?$/;
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
            else if (input.name == 'companyLogo') {
                if (input.files[0]) {
                    let res = validateFileSize(input)
                    if (!res) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'File size is too large';
                        showError('companyLogo_err', errorMessage)
                    } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('companyLogo_err', '')
                    }
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
                	if(rigion==="US"){
                		var regex = /^\d{5}$/
                	}else{
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
            } else if (input.name == 'contactPersonName') {
                if (input.value != '') {
                    const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Name';
                        showError('contactPersonName_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('contactPersonName_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('contactPersonName_err', '')
                }
            } else if (input.name == 'contactPersonDesignation') {
                if (input.value != '') {
                    const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Designation';
                        showError('contactPersonDesignation_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })

                        showError('contactPersonDesignation_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('contactPersonDesignation_err', '')
                }
            } else if (input.name == 'contactPersonEmail') {
                if (input.value != '') {
                    // const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
                    const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|yahoo\.com|outlook\.com|icloud\.com|hotmail\.com)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
                    if (!regex.test(input.value.trim().trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Enter Company Email';
                        showError('contactPersonEmail_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })

                        showError('contactPersonEmail_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('contactPersonEmail_err', '')
                }
            } else if (input.name == 'contactPersonPhone') {
                if (input.value != '') {
                    const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
                    if (!regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Phone Number';
                        showError('contactPersonPhone_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })

                        showError('contactPersonPhone_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('contactPersonPhone_err', '')
                }

            } else if (input.name == 'companyType') {
                if (input.value != '') {
                    const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Business Entity';
                        showError('companyType_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })

                        showError('companyType_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('companyType_err', '')
                }
            } else if (input.name == 'buisnessRegNumber') {
                if (input.value != '') {
                    const regex = /^(?=.*[A-Z])(?=.*\d)[A-Z0-9]{21}$/;
                    if (!regex.test(input.value.toUpperCase().trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Business Registration Number';
                        showError('buisnessRegNumber_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('buisnessRegNumber_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('buisnessRegNumber_err', '')
                }
                // const regex = /^(?=.*[A-Z])[A-Z0-9]{21}$/;
            } else if(rigion==="US"){
            	      if (input.name == 'taxIdNumber') {
            
                      if (input.value != '') {
                	
                		   var regex = /^\d{2}-\d{7}$/;
                	
                    if (!regex.test(input.value.toUpperCase().trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                    	
                    		 errorMessage = 'Invalid Tax Id Number';
                    	
                        showError('taxIdNumber_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('taxIdNumber_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('taxIdNumber_err', '')
                }

            } }else if(rigion==="IN"){
                if (input.name == 'gstNo'){

              
                if (input.value != '') {
                    var regex = /^([0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1})$/;  //for GSTIN(India)
                    if (!regex.test(input.value.toUpperCase().trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                    	
                    		  errorMessage = 'Invalid GST Number';    
                    	
                        showError('taxIdNumber_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('taxIdNumber_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('taxIdNumber_err', '')
                }

                }  
            }

            
            	else if (input.name == 'companyBankName') {
            
                if (input.value != '') {
                    const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
                    if (!regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Bank Name';
                        showError('companyBankName_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('companyBankName_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('companyBankName_err', '')
                }
            }
            else if (input.name == 'companyAccountNumber') {
                if (input.value != '') {
                    const regex = /^\d{1,20}$/;
                    if (!regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Account Number';
                        showError('companyAccountNumber_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('companyAccountNumber_err', '')
                    }
                }
                else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('companyAccountNumber_err', '')
                }
            }
            else if (input.name == 'companyIfscCode') {
                if (input.value != '') {
                    const regex = /^[A-Z]{4}0[A-Z0-9]{6}$/;
                    if (!regex.test(input.value.toUpperCase().trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid IFSC Code';
                        showError('companyIfscCode_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('companyIfscCode_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('companyIfscCode_err', '')
                }

            } else if (input.name == 'companyRoutingNumber' ){
            	if( input.value != '') {
                const regex = /^\d{9}$/;
                if (!regex.test(input.value)) {
                    if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                    errorMessage = 'Invalid Routing Number';
                    showError('companyRoutingNumber_err', errorMessage)
                    
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('companyRoutingNumber_err', '')
                }
            } else {
                errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                showError('companyRoutingNumber_err', '')
            }
            } else if (input.name == 'annualTurnoverValue') {
                if (input.value != '') {
                    const regex = /^\d+$/;
                    if (!regex.test(input.value.trim())) {
                        if (!errorsArray.includes(input.name)) {
                            errorsArray.push(input.name);
                        }
                        errorMessage = 'Invalid Turnover';
                        showError('annualTurnoverValue_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        showError('annualTurnoverValue_err', '')
                    }
                } else {
                    errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    showError('annualTurnoverValue_err', '')
                }

            }
            else if (input.name == 'companySignature') {
                // if (input.files[0]) {
                //     let res = validateFileSize(input)
                //     if (!res) {
                //         if (!errorsArray.includes(input.name)) {
                //             errorsArray.push(input.name);
                //         }
                //         errorMessage = 'File size is too large';
                //         showError('companySignature_err', errorMessage)
                //     } else {
                //     errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                //         showError('companySignature_err', '')
                //     }
                // }
                
            }

            else if (input.name == 'declaration') {
                // console.log('declaration',input,input.checked)
                if (input.checked == false) {
                    showError('declaration_err', 'Please check declaration')
                } else {
                    showError('declaration_err', '')
                }
            }
            else if (input.name == 'terms_and_conditions') {
                // console.log('terms_and_conditions',input,input.checked)
                if (input.checked == false) {
                    showError('terms_and_conditions_err', 'Please check terms and conditions')
                } else {
                    showError('terms_and_conditions_err', '')
                }
            }
            // else if (input.name == 'createEscrowAccount') {
            //     if (input.checked == false) {
            //         showError('createEscrowAccount_err', 'Permission is Required')
            //     } else {
            //         showError('createEscrowAccount_err', '')
            //     }
            // }
            console.log(errorsArray)

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

        document.querySelector('#companySignature').addEventListener('change', function () {
            // if (!this.files[0]) {
            //     showError('companySignature_err', 'Signature is Required')
            // } else {
            //     showError('companySignature_err', '')
            // }


                if (this.files[0]) {
                    let res = validateFileSize(this)
                    if (!res) {
                        if (!errorsArray.includes(this.name)) {
                            errorsArray.push(this.name);
                        }
                        errorMessage = 'File size is too large';
                        showError('companySignature_err', errorMessage)
                    } else {
                        errorsArray = errorsArray.filter(function (e) { 
                            return e !== 'companySignature' 
                        })
                        showError('companySignature_err', '')
                    }
                }else{
                    showError('companySignature_err', 'Signature is Required')
                }
        })

        document.querySelector('#declaration').addEventListener('click',function(){
            if(this.checked){
                showError('declaration_err', '')
            }else{
                showError('declaration_err', 'Plese check declaration')
            }
        })

        document.querySelector('#terms_and_conditions').addEventListener('click',function(){
            if(this.checked){
                showError('terms_and_conditions_err', '')
            }else{
                showError('terms_and_conditions_err', 'Plese check terms and conditions')
            }
        })

        // document.querySelector('#createEscrowAccount').addEventListener('click',function(){
        //     if(this.checked){
        //         showError('createEscrowAccount_err', '')
        //     }else{
        //         showError('createEscrowAccount_err', 'Permission is Required')
        //     }
        // })


       

        // form.addEventListener('submit', function (event) {
        //     for (let input of inputs) {
        //         let allValid = false
        //         input.addEventListener('blur', function () {
        //             let isValid = validateForm(input);
        //             return isValid;
        //         })
        //     }

        //     if (checkRequiredFields()) {
        //         console.log('valid')
        //         submit_button.disabled = true;
        //         event.preventDefault(); // Prevent form submission if validation fails
        //     } else {
        //         event.preventDefault(); // Prevent form submission if validation fails
        //     }
        // });


    </script>
	<script>
         document.addEventListener("DOMContentLoaded", function () {
            let arrowIconUrl = '${pageContext.request.contextPath}/assets/icons/close.png'
//             	let arrowIconUrl  = '${pageContext.request.contextPath}/assets/icons/arrow.png'
//             		//
//             		let closeIconUrl = '../assets/icons/close.png'
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
                            // inputField.required = true;
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
                                if(inputField.name == "companyIndustry"){
                                    showError('companyIndustry_err','')
                                }
                                event.preventDefault();
                                selectDropdown.disabled = false;
                                inputField.disabled = true;
                                selectDropdown.required = true;
                                inputField.required = false;
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
                                inputs = document.querySelectorAll('input, select');
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
                           /*  if (inputDiv.style.display === 'block') {
                                inputField.focus();
                                console.log('input-focused')
                            } */
                            inputs = document.querySelectorAll('input, select');
                            setTimeout(() => {
                                inputField.focus();
                                setTimeout(() => {
                                    if (document.activeElement !== inputField) {
                                        inputField.focus();
                                    }
                                }, 100);
                            }, 100);

                            inputField.addEventListener('blur', function () {
                                for (let input of inputs) {
                                    if (input.name == 'companyIndustry') {
                                        validateForm(input);
                                    }
                                }
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
                            inputs = document.querySelectorAll('input, select');
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


    </script>
	<script src="assets/js/index.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>
