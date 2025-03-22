<%@ include file="./taglibs.jsp" %>

	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<c:choose>
			<c:when test="${country == 'IN'}">
				<title>Onboarding | SELLER(INDIA)</title>
			</c:when>
			<c:otherwise>
				<title>Onboarding | SELLER(US)</title>
			</c:otherwise>
		</c:choose>


		<c:import url="common-header-import.jsp"></c:import>

		<!-- for bootstrap stepper -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bs-stepper/dist/css/bs-stepper.min.css">
		<script src="https://cdn.jsdelivr.net/npm/bs-stepper/dist/js/bs-stepper.min.js"></script>
		<!-- for bootstrap stepper -->

	</head>
	<style>
		select:disabled {
			background: transparent;
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

		#PermissionDetails .required-asterisk {
			display: none
		}

		#dashboardredirect:hover {
			color: white !important
		}
	</style>

	<body>


		<div class="container-fluid bg-gray box-style-1">
			<div class="box-style-2" id="navigate-to-box">
				<div class="onboarding-header bg-gray row">
					<div class="col-lg-2 col-md-12 col-sm-12 col-12 d-flex align-items-center logo-col">
						<a href="#"> <img class="header-logo" src="assets/images/Logo.svg" alt="">
						</a>
					</div>
					<div class="col-lg-10 col-md-12 col-sm-12 col-12">
						<div class="step-container">
							<div class="step-info active d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
								<div class="d-flex">
									<span class="step-circle">1</span>
									<div class="step-line"></div>
								</div>
								<span class="step-label">Company<br> Information
								</span>
							</div>
							<div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
								<div class="d-flex">
									<span class="step-circle">2</span>
									<div class="step-line"></div>
								</div>
								<span class="step-label">Legal<br> Information
								</span>
							</div>
							<div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
								<div class="d-flex">
									<span class="step-circle">3</span>
									<div class="step-line"></div>
								</div>
								<span class="step-label">Financial<br> Details
								</span>
							</div>
							<div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
								<div class="d-flex">
									<span class="step-circle">4</span>
									<div class="step-line"></div>
								</div>
								<span class="step-label">Technical<br> Capabilities
								</span>
							</div>
							<div class="step-info d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
								<div class="d-flex">
									<span class="step-circle">5</span>
									<div class="step-line"></div>
								</div>
								<span class="step-label">Certificates &<br>
									Compliance
								</span>
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
								<span class="step-label">Supplier<br> Reference
									Program
								</span>
							</div>
						</div>
					</div>
				</div>


				<form action="" method="POST" id="CompanyDetails" enctype="multipart/form-data">

					<!-- Company Information Step-1 -->

					<div class="step">
						<div class="step-content">
							<div class="content">
								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">Company Details</h6>
									<div class="row row-gap-16">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group select-field-group select-field-group-toggle">
												<select name="industryClassificaiton" id="industryClassificaiton"
													class="input-field form-dropdown" required autocomplete="off">
													<option value="" selected>Industry Classification</option>
													<option value="Aerospace">Aerospace</option>
													<option value="Automotive">Automotive</option>
													<option value="Consumer Goods">Consumer Goods</option>
													<option value="Energy">Energy</option>
													<option value="Industrial Machinery">Industrial
														Machinery</option>

													<option value="Others">Others</option>
												</select> <label for="industryClassificaiton"
													class="input-label">Select<span class="required-asterisk">*</span>
												</label> <span id="industryClassificaiton_err" class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group select-field-group select-field-group-toggle">
												<select name="industryExpertise" id="industryExpertise"
													class="input-field form-dropdown" required autocomplete="off">
													<option value="" selected>Industry Expertise</option>
													<option value="Precision Machining">Precision
														Machining</option>
													<option value="Injection Moulds">Injection Moulds</option>
													<option value="Die Casting Components">Die Casting
														Components</option>
													<option value="Sheet Metal/Stamping">Sheet
														Metal/Stamping</option>
													<option value="Forging">Forging</option>
													<option value="Sub-assembly">Sub-assembly</option>
													<option value="Aerospace Components">Aerospace
														Components</option>
													<option value="Engineering & Design Services">Engineering
														& Design Services</option>
													<option value="Prototyping">Prototyping</option>
													<option value="Others">Others</option>
												</select> <label for="industryExpertise" class="input-label">Select<span
														class="required-asterisk">*</span>
												</label> <span id="industryExpertise_err" class="err-text"></span>

											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="companyName" class="input-field"
													placeholder="Company Name" required autocomplete="off">
												<label for="companyName" class="input-label">Company
													Name<span class="required-asterisk">*</span>
												</label> <span id="companyName_err" class="err-text"></span>

											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="companyWebsite" class="input-field"
													placeholder="Company Website" required autocomplete="off">
												<label for="companyWebsite" class="input-label">Company
													Website<span class="required-asterisk">*</span>
												</label> <span id="companyWebsite_err" class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="email" name="companyEmail" class="input-field"
													placeholder="Company Email" required autocomplete="off">
												<label for="companyEmail" class="input-label">Company
													Email<span class="required-asterisk">*</span>
												</label> <span id="companyEmail_err" class="err-text"></span>
											</div>
										</div>

										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type=tel name="companyPhone" maxlength="10" class="input-field"
													placeholder="Phone" required autocomplete="off"> <label
													for="companyPhone" class="input-label">Phone<span
														class="required-asterisk">*</span></label> <span
													id="companyPhone_err" class="err-text"></span>
											</div>
										</div>

										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="companyLinkedInUrl" class="input-field"
													placeholder="LinkedIn Profile URL" autocomplete="off"> <label
													for="companyLinkedInUrl" class="input-label">LinkedIn Profile
													URL</label> <span id="companyLinkedInUrl_err"
													class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="file-input-field-group">
												<input type="file" id="companyLogo" name="companyLogo"
													accept=".jpg, .png, .jpeg" class="input-field" placeholder="File"
													autocomplete="off" hidden>
												<button class="input-btn" type="button"
													onclick="handleClick('companyLogo','logo_text')">Choose
													File</button>
												<p id="logo_text">No File Choosen</p>
											</div>
											<div class="fileType-and-maxFileSize">
												<p>Attach your company logo here</p>

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
												<input type="text" name="streetAddress" class="input-field" required
													placeholder="Address Line 1" autocomplete="off"> <label
													for="streetAddress" class="input-label">Address Line
													1<span class="required-asterisk">*</span></label> <span
													id="streetAddress_err" class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="city" class="input-field" placeholder="City"
													required autocomplete="off"> <label for="city"
													class="input-label">City<span
														class="required-asterisk">*</span></label> <span id="city_err"
													class="err-text"></span>
											</div>
										</div>

										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="state" class="input-field" placeholder="State"
													required autocomplete="off"> <label for="state"
													class="input-label">State<span
														class="required-asterisk">*</span></label> <span id="state_err"
													class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<!-- <input type="text" name="country" readonly value="{{$data['country']}}" id="country" class="input-field" placeholder="Country"
                                                autocomplete="off"> -->
												<select name="country" disabled id="country"
													class="input-field form-dropdown" required autocomplete="off">

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
												</select> <span id="country_err" class="err-text"></span>
												<!-- <label for="country" class="input-label">Country</label> -->
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="pincode" class="input-field" required
													placeholder="Pincode" autocomplete="off"> <label for="pincode"
													class="input-label">Pincode<span
														class="required-asterisk">*</span></label> <span
													id="pincode_err" class="err-text"></span>
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
													<input type="text" name="contactPersonModels[0].name"
														id="contact_person_name_0"
														class="input-field contact_person_name" placeholder="Name"
														required autocomplete="off"> <label
														for="contactPersonModels[0].name" class="input-label">Name<span
															class="required-asterisk">*</span></label> <span
														id="contact_person_name_0_err" class="err-text"></span>
												</div>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group">
													<input type="text" name="contactPersonModels[0].designation"
														id="contact_person_designation_0"
														class="input-field contact_person_designation"
														placeholder="Designation" required autocomplete="off">
													<label for="contact_person_designation_1"
														class="input-label">Designation<span
															class="required-asterisk">*</span></label> <span
														id="contact_person_designation_0_err" class="err-text"></span>

												</div>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group">
													<input type="email" name="contactPersonModels[0].email"
														id="contact_person_email_0"
														class="input-field contact_person_email" placeholder="Email"
														required autocomplete="off"> <label for="contact_person_email_0"
														class="input-label">Email<span
															class="required-asterisk">*</span></label> <span
														id="contact_person_email_0_err" class="err-text"></span>
												</div>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group">
													<input type="text" name="contactPersonModels[0].phone"
														id="contact_person_phone_0"
														class="input-field contact_person_phone" placeholder="Phone"
														required maxlength="10" autocomplete="off"> <label
														for="contact_person_phone_1" class="input-label">Phone<span
															class="required-asterisk">*</span></label> <span
														id="contact_person_phone_0_err" class="err-text"></span>
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
										<button class="btn-style-1 mb-32" type="button"
											onclick="submitFirstForm('CompanyDetails','saveSellerCompanyDetails',checkStep1RequiredInputs(),validateStep1())">Next</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</form>
				<form id="LegalDetails">

					<!-- Legal Information Step-2 -->
					<div class="step d-none">
						<div class="step-content">
							<div class="content">
								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">Legal Information</h6>
									<div class="row row-gap-16">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="buisnessRegNumber"
													class="input-field uc-text  text-uppercase"
													placeholder="Business Reg. Number(CIN)" autocomplete="off"> <label
													for="buisnessRegNumber" class="input-label">Business Reg.
													Number(CIN)</label> <span id="buisnessRegNumber_err"
													class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group select-field-group">
												<select name="typeOfCompany" id="typeOfCompany"
													class="input-field form-dropdown" autocomplete="off">
													<option value="" selected>Type of Company</option>
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
												</select> <label for="typeOfCompany" class="input-label">Select</label>
												<span id="typeOfCompany_err" class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="date" name="registrationDate"
													class="input-field date-field" placeholder="Date Of Registration"
													autocomplete="off">
												<label for="registrationDate" class="input-label">Date
													Of Registration</label> <span id="registrationDate_err"
													class="err-text"></span>
											</div>
										</div>

										<c:choose>
											<c:when test="${country == 'IN'}">
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="text" name="panNo"
															class="input-field uc-text text-uppercase"
															placeholder="PAN Number" required autocomplete="off">
														<label for="panNo" class="input-label">PAN Number<span
																class="required-asterisk">*</span>
														</label> <span id="panNo_err" class="err-text"></span>

													</div>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="text" name="gstNo"
															class="input-field uc-text text-uppercase"
															placeholder="GST Number" required autocomplete="off">
														<label for="gstNo" class="input-label">GST Number<span
																class="required-asterisk">*</span>
														</label> <span id="gstNo_err" class="err-text"></span>

													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="text" name="dunsNumber"
															class="input-field uc-text text-uppercase"
															placeholder="D-U-N-S Number" required autocomplete="off">
														<label for="dunsNumber" class="input-label">D-U-N-S
															Number<span class="required-asterisk">*</span>
														</label> <span id="dunsNumber_err" class="err-text"></span>

													</div>

												</div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="text" name="taxIdNumber"
															class="input-field uc-text text-uppercase show-placeholder"
															placeholder="XX-XXXXXXX"
															onfocus="this.placeholder='XX-XXXXXXX'" required
															autocomplete="off"> <label for="taxIdNumber"
															class="input-label">Tax ID Number (EIN)<span
																class="required-asterisk">*</span>
														</label> <span id="taxIdNumber_err" class="err-text"></span>

													</div>
												</div>
											</c:otherwise>
										</c:choose>


									</div>
								</div>
								<c:if test="${country == 'US'}">
									<div class="input-field-section mt-32">
										<h6 class="input-section-heading mb-16">Click here to
											submit your W-9</h6>
										<p class="content">
											As a part of the onboarding process it is mandatory for you to
											submit us with a copy of your W-9 on file . If you have a copy
											of the same , please mail it to admin@cnerzy.com . If you
											don't have the W-9 on file please click here to submit your
											W-9 <a
												href="https://cnerzy.com/assets/onboarding_module/seller/W-9-Form.pdf"
												target="_blank">(hyper link to form shared
												as PDF, digital signature process can be set here)</a>
										</p>
										<p class="content">Ensure your W-9 form contains the
											following details:</p>
										<ul>
											<li>For Individuals or Sole Proprietors: First and last
												name, Leave the company name section blank</li>
											<li>For Companies: Provide the legal business name as
												listed on the SS4 form, Leave the individual name section
												blank unless a DBA is registered</li>
											<li>Federal Tax Classification: Select the appropriate
												box based on your IRS registration/SS4 form</li>
										</ul>
										<p class="content">Exceptions:</p>
										<ul>
											<li>Provide your company address</li>
											<li>Include either your Social Security Number (SSN) or
												Employer Identification Number (EIN)
												<ol type="1">
													<li>Use your SSN only if you are an individual</li>
													<li>Sole Proprietors should have an EIN</li>
													<li>For Limited Liability Companies (LLCs), specify if
														you are an S or C Corp or an LLC to determine 1099 filing
														requirements</li>
												</ol>
											</li>
										</ul>
									</div>
									<div class="input-field-section mt-32">
										<div class="row">
											<div class="col-lg-4 col-md-6 col-sm-12 col-12">
												<div class="card-style-1" style="min-height: 0px;">
													<h6 class="card-title">
														W-9 Submission Form<span class="required-asterisk">*</span>
													</h6>
													<div class="file-input-field-group p-0">
														<input type="file" id="w9SubmissionForm" name="w9SubmissionForm"
															class="input-field" placeholder="File" required
															autocomplete="off" accept=".pdf, .jpg, .png, .jpeg" hidden>
														<button class="input-btn" type="button"
															onclick="handleClick('w9SubmissionForm','w9SubmissionForm_text')">Choose
															File</button>
														<p id="w9SubmissionForm_text">No File Choosen</p>
													</div>
												</div>
												<div class="fileType-and-maxFileSize">

													<span id="w9SubmissionForm_err" class="err-text"></span>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">List of Major
										Products</h6>
									<div class="row row-gap-16" id="major-product-row">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="productsList[0].productName"
													id="name_of_product_1" class="input-field"
													placeholder="Name of Major Product 1" autocomplete="off">
												<label for="name_of_product_1" class="input-label">Name
													of Major Product 1</label> <span id="name_of_product_1_err"
													class="err-text"></span>
											</div>
										</div>

										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<button class="btn-style-2 w-100" type="button"
												onclick="addAnotherMajorProduct()">+ Add Other</button>
										</div>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<div class="row mb-16">
										<div class="col-12 d-flex align-items-center">
											<h6 class="input-section-heading mr-16">Are you supplying
												to OEMs?</h6>
											<div class="d-flex align-items-center">
												<div class="radio-field-group mr-16 d-flex align-items-center">
													<input type="radio" name="isSupplyingToOEM" value="yes" class="mr-8"
														required autocomplete="off"><label for="">Yes</label>
												</div>
												<div class="radio-field-group d-flex align-items-center">
													<input type="radio" name="isSupplyingToOEM" class="mr-8" required
														checked value="no" autocomplete="off"><label for="">No</label>
												</div>
											</div>
										</div>
									</div>
									<div id="oem-details-parent">
										<div class="row">
											<h6 class="input-section-heading mb-8">1.</h6>
										</div>
										<div class="row row-gap-16 mb-32">
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group">
													<input type="text" name="oemModels[0].supplyingTo"
														id="oem_supplying_to_1" class="input-field"
														placeholder="OEM Supplying to" autocomplete="off"> <label
														for="oem_supplying_to_1" class="input-label">OEM
														Supplying to</label> <span id="oem_supplying_to_1_err"
														class="err-text"></span>
												</div>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group select-field-group">
													<select name="oemModels[0].supplierSince" id="supplier_since_1"
														class="input-field form-dropdown" autocomplete="off">
														<option value="" selected>Supplier Since</option>
														<option value="2021">2021</option>
														<option value="2022">2022</option>
														<option value="2023">2023</option>
														<option value="2024">2024</option>
													</select> <label for="supplier_since_1" class="input-label">Select
													</label> <span id="supplier_since_1_err" class="err-text"></span>
												</div>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group d-flex position-relative align-items-center">
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
													<input type="number" name="oemModels[0].value" id="oem_value_1"
														style="padding-left: 50px;" class="input-field"
														placeholder="Value" autocomplete="off"> <label for="oem_value_1"
														style="left: 50px;" class="input-label">Value</label>
												</div>
												<span id="oem_value_1_err" class="err-text"></span>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group select-field-group">
													<select name="oemModels[0].vendorRating" id="vendor_rating_1"
														class="input-field form-dropdown" autocomplete="off">
														<option value="" selected>Vendor Rating</option>
														<option value="5">5</option>
														<option value="4">4</option>
														<option value="3">3</option>
														<option value="2">2</option>
														<option value="1">1</option>
													</select> <label for="vendor_rating_1"
														class="input-label">Select</label>
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
								</div>


								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">List of Major
										Customers</h6>
									<div class="row">
										<h6 class="input-section-heading mb-8">1.</h6>
									</div>
									<div class="row row-gap-16 mb-32" id="list-of-major-customers-parent">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="majorCustomers[0].name" id="customer_name_1"
													class="input-field" placeholder="Customer's Name"
													autocomplete="off"> <label for="customer_name_1"
													class="input-label">Customer's
													Name</label> <span id="customer_name_1_err" class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="majorCustomers[0].address"
													id="customer_address_1" class="input-field" placeholder="Address"
													autocomplete="off"> <label for="customer_address_1"
													class="input-label">Address</label>
												<span id="customer_address_1_err" class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="majorCustomers[0].productSupplied"
													id="product_supplied_1" class="input-field"
													placeholder="Product Supplied" autocomplete="off"> <label
													for="product_supplied_1" class="input-label">Product
													Supplied</label> <span id="product_supplied_1_err"
													class="err-text"></span>
											</div>
										</div>
									</div>


									<div class="row">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<button class="btn-style-2 w-100" type="button"
												onclick="addAnotherListOfMajorCustomer()">+ Add
												Other</button>
										</div>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<div class="row mb-16">
										<div class="col-12 d-flex align-items-center">
											<h6 class="input-section-heading mr-16">Are you a
												Logistics Service Provider?</h6>
											<div class="d-flex align-items-center">
												<div class="radio-field-group mr-16 d-flex align-items-center">
													<input type="radio" name="isLogisticServiceProvider" value="yes"
														class="mr-8" required autocomplete="off"><label
														for="">Yes</label>
												</div>
												<div class="radio-field-group d-flex align-items-center">
													<input type="radio" name="isLogisticServiceProvider" class="mr-8"
														required checked value="no" autocomplete="off"><label
														for="">No</label>
												</div>
											</div>
										</div>
									</div>
									<div id="logistic-service-provider-parent">
										<h6 class="input-section-heading mb-16"></h6>
										<div class="row">
											<h6 class="input-section-heading mb-8">1.</h6>
										</div>
										<div class="row row-gap-16 mb-32">
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group">
													<input type="text" name="logisticServiceProvider[0].name"
														id="provider_name_1" class="input-field" placeholder="Name"
														autocomplete="off"> <label for="provider_name_1"
														class="input-label">Name</label> <span id="provider_name_1_err"
														class="err-text"></span>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 col-12">
												<div class="field-group">
													<input type="text" name="logisticServiceProvider[0].address"
														id="provider_address_1" class="input-field"
														placeholder="Address" autocomplete="off"> <label
														for="provider_address_1" class="input-label">Address</label>
													<span id="provider_address_1_err" class="err-text"></span>
												</div>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12" id="add-provider-1-btn-col">
												<button class="btn-style-2 w-100" type="button"
													onclick="addAnotherLogisticServiceProvider()">+ Add
													Other</button>
											</div>
										</div>

									</div>
								</div>
								<div class="input-field-section mt-32" id="">
									<div class="row mb-16">
										<div class="col-12 d-flex align-items-center">
											<h6 class="input-section-heading mr-16">Are you an
												exporter?</h6>
											<div class="d-flex align-items-center">
												<div class="radio-field-group mr-16 d-flex align-items-center">
													<input type="radio" name="isExporter" value="yes" class="mr-8"
														required autocomplete="off"><label for="">Yes</label>
												</div>
												<div class="radio-field-group d-flex align-items-center">
													<input type="radio" name="isExporter" checked value="no"
														class="mr-8" required autocomplete="off"><label
														for="">No</label>
												</div>
											</div>
										</div>

									</div>
									<div id="exporter-lists-parent">
										<div class="row">
											<h6 class="input-section-heading mb-8">1.</h6>
										</div>
										<div class="row row-gap-16 mb-32">
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group select-field-group">
													<select name="exporterList[0].financialYear"
														id="export_financial_year_1" class="input-field form-dropdown"
														autocomplete="off">
														<option value="" selected>Financial year</option>
														<option value="2023-24">2023-24</option>
														<option value="2022-23">2022-23</option>
														<option value="2021-22">2021-22</option>
													</select> <label for="export_financial_year_1"
														class="input-label">Select</label>
													<span id="export_financial_year_1_err" class="err-text"></span>
												</div>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group">
													<input type="text" name="exporterList[0].product"
														id="product_or_services_1" class="input-field"
														placeholder="Product/Services" autocomplete="off"> <label
														for="product_or_services_1"
														class="input-label">Product/Services</label>
													<span id="product_or_services_1_err" class="err-text"></span>
												</div>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">
												<div class="field-group select-field-group">
													<select name="exporterList[0].country" id="export_country_1"
														class="input-field form-dropdown" autocomplete="off">
														<option value="" selected>Country</option>
														<option value="india">India</option>
														<option value="us">US</option>
													</select> <label for="export_country_1"
														class="input-label">Select</label>
													<span id="export_country_1_err" class="err-text"></span>
												</div>
											</div>
											<div class="col-lg-3 col-md-6 col-sm-12 col-12">

												<div class="field-group d-flex position-relative align-items-center">
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
													<input type="number" name="exporterList[0].value"
														id="export_value_1" style="padding-left: 50px;"
														class="input-field" placeholder="Value" autocomplete="off">
													<label for="export_value_1" style="left: 50px;"
														class="input-label">Value</label>
												</div>
												<span id="export_value_1_err" class="err-text"></span>
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

								</div>
								<div class="input-field-section mt-32">
									<div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
										<button class="btn-style-3 mb-32 mr-16" type="button"
											onclick="prevStep()">Back</button>
										<button class="btn-style-1 mb-32" type="button"
											onclick="submitFirstForm('LegalDetails','saveSellerLegalDetails',checkStep2RequiredInputs(),validateStep2())">Next</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</form>
				<form id="SellerFinancialDetails">
					<!-- Financial Information Step-3 -->
					<div class="step d-none">
						<div class="step-content">

							<div class="content">
								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">Bank Account
										Details</h6>
									<div class="row row-gap-16">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="bankName" class="input-field"
													placeholder="Bank Name" required autocomplete="off">
												<label for="bankName" class="input-label">Bank Name<span
														class="required-asterisk">*</span></label> <span
													id="bankName_err" class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="number" name="accountNo" class="input-field"
													placeholder="Account Number" required autocomplete="off">
												<label for="accountNo" class="input-label">Account
													Number<span class="required-asterisk">*</span>
												</label> <span id="accountNo_err" class="err-text"></span>
											</div>
										</div>

										<c:choose>
											<c:when test="${country == 'IN'}">
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="text" name="ifscCode"
															class="input-field uc-text text-uppercase"
															placeholder="IFSC Code" required autocomplete="off"> <label
															for="ifscCode" class="input-label">IFSC Code<span
																class="required-asterisk">*</span>
														</label> <span id="ifscCode_err" class="err-text"></span>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="number" name="routingNo" class="input-field"
															placeholder="Routing Number" required autocomplete="off">
														<label for="routingNo" class="input-label">Routing
															Number<span class="required-asterisk">*</span>
														</label> <span id="routingNo_err" class="err-text"></span>
													</div>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group select-field-group">
														<select name="accountType" id="accountType"
															class="input-field form-dropdown" required
															autocomplete="off">
															<option value="" selected>Account Type</option>
															<option value="Checking">Checking</option>
															<option value="Savings">Savings</option>
														</select> <label for="accountType"
															class="input-label">Select<span
																class="required-asterisk">*</span>
														</label> <span id="accountType_err" class="err-text"></span>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">Add annual turnover
										in the past 3 years</h6>
									<div class="row" style="width: 105%" id="annual-turnover-parent">
										<div class="col-lg-6 col-md-12 row gx-4">
											<h6 class="input-section-heading mb-8">1.</h6>
											<div class="col-lg-6 col-md-6 col-sm-12 mb-16">
												<div class="field-group select-field-group">
													<select name="annualTurnoverList[0].financialYear"
														id="turnover_financial_year_1" class="input-field form-dropdown"
														autocomplete="off">
														<option value="" selected>Financial year</option>
														<option value="2023-24">2023-24</option>
														<option value="2022-23">2022-23</option>
														<option value="2021-22">2021-22</option>
													</select> <label for="turnover_financial_year_1"
														class="input-label">Select</label>
													<span id="turnover_financial_year_1_err" class="err-text"></span>

												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 mb-16">
												<div class="field-group d-flex position-relative align-items-center">
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
													<input type="number" name="annualTurnoverList[0].turnover"
														id="turnover_value_1" style="padding-left: 50px;"
														class="input-field" placeholder="Annual Turnover"
														autocomplete="off"> <label for="turnover_value_1"
														style="left: 50px;" class="input-label">Annual
														Turnover</label>
												</div>
												<span id="turnover_value_1_err" class="err-text"></span>
											</div>
										</div>

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
										<button class="btn-style-1 mb-32" type="button"
											onclick="submitFirstForm('SellerFinancialDetails','saveSellerFinancialDetails',checkStep3RequiredInputs(),validateStep3())">Next</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</form>
				<form id="SellerTechnicalDetails">

					<!-- Technical Capabilities Step-4 -->
					<div class="step d-none">
						<div class="step-content">

							<div class="content">
								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">Registered Address
										of Factory</h6>
									<div id="reg-addresses-of-factory-parent">
										<div>
											<div class="row">
												<h6 class="input-section-heading mb-8">1.</h6>
											</div>
											<div class="row row-gap-16 mb-16">
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="text" name="factoryList[0].factoryName"
															id="factory_name_0" class="input-field"
															placeholder="Factory Name" autocomplete="off"> <label
															for="factory_name_0" class="input-label">Factory
															Name</label> <span id="factory_name_0_err"
															class="err-text"></span>
													</div>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="text" name="factoryList[0].area"
															id="area_in_square_mtr_0" class="input-field"
															placeholder="Area in Square Meter" autocomplete="off">
														<label for="area_in_square_mtr_0" class="input-label">Area
															in Square Meter</label> <span id="area_in_square_mtr_0_err"
															class="err-text"></span>

													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="text" name="factoryList[0].address"
															id="factory_address_0" class="input-field"
															placeholder="Address" autocomplete="off"> <label
															for="factory_address_0" class="input-label">Address</label>
														<span id="factory_address_0_err" class="err-text"></span>
													</div>
												</div>
											</div>
										</div>

										<div class="input-field-section mt-32 mb-32">
											<h6 class="input-section-heading mb-16">Details of
												manpower available in the factory</h6>
											<div class="row row-gap-16">
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="number" name="factoryList[0].totalEmployees"
															id="total_employees_0" class="input-field"
															placeholder="Total No. of Employees" autocomplete="off">
														<label for="total_employees_0" class="input-label">Total
															No. of Employees</label> <span id="total_employees_0_err"
															class="err-text"></span>

													</div>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="number" name="factoryList[0].supervisiors"
															id="supervisors_0" class="input-field"
															placeholder="Supervisors" autocomplete="off"> <label
															for="supervisors_0" class="input-label">Supervisors</label>
														<span id="supervisors_0_err" class="err-text"></span>

													</div>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="number" name="factoryList[0].enggDegreeOrDiploma"
															id="engg_degree_or_diploma_0" class="input-field"
															placeholder="Engg. Degree/Diploma Holders"
															autocomplete="off"> <label for="engg_degree_or_diploma_0"
															class="input-label">Engg.
															Degree/Diploma</label> <span
															id="engg_degree_or_diploma_0_err" class="err-text"></span>

													</div>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="number" name="factoryList[0].skilledWorkers"
															id="skilled_workers_0" class="input-field"
															placeholder="Skilled Workers" autocomplete="off">
														<label for="skilled_workers_0" class="input-label">Skilled
															Workers</label> <span id="skilled_workers_0_err"
															class="err-text"></span>

													</div>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="number" name="factoryList[0].designDepartment"
															id="design_department_0" class="input-field"
															placeholder="Design Department" autocomplete="off">
														<label for="design_department_0" class="input-label">Design
															Department</label> <span id="design_department_0_err"
															class="err-text"></span>

													</div>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<div class="field-group">
														<input type="number" name="factoryList[0].qualityAndInspection"
															id="quality_control_and_inspection_0" class="input-field"
															placeholder="Quality Control & Inspection"
															autocomplete="off"> <label
															for="quality_control_and_inspection_0"
															class="input-label">Quality
															Control & Inspection</label> <span
															id="quality_control_and_inspection_0_err"
															class="err-text"></span>
													</div>
												</div>

											</div>
										</div>

										<div class="input-field-section mt-32">
											<h6 class="input-section-heading mb-16">List of Machining /
												Fabrication & Material Handling Facilities Available in the
												Factory</h6>
											<div id="machine-list-parent-0">
												<div>
													<div class="row">
														<h6 class="input-section-heading mb-8">1.1</h6>
													</div>
													<div class="row row-gap-16 mb-16">
														<div class="col-lg-6 col-md-6 col-sm-12 col-12">
															<input hidden name="factoryList[0].facilityList[0].type"
																value="Machining">
															<div class="field-group">
																<input type="text"
																	name="factoryList[0].facilityList[0].details"
																	id="machining_facility_0_0" class="input-field"
																	placeholder="Details of facility available"
																	autocomplete="off"> <label
																	for="machining_facility_0_0"
																	class="input-label">Details
																	of facility available</label> <span
																	id="machining_facility_0_0_err"
																	class="err-text"></span>
															</div>
														</div>
														<div class="col-lg-6 col-md-6 col-sm-12 col-12">
															<div class="field-group">
																<input type="text"
																	name="factoryList[0].facilityList[0].remarks"
																	id="machining_facility_remark_0_0"
																	class="input-field" placeholder="Remarks if any"
																	autocomplete="off"> <label
																	for="machining_facility_remark_0_0"
																	class="input-label">Remarks
																	if any</label> <span
																	id="machining_facility_remark_0_0_err"
																	class="err-text"></span>
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
														onclick="addAnotherMachineList(0,1)">+ Add Other</button>
												</div>
											</div>
										</div>

										<div class="input-field-section mt-32">
											<h6 class="input-section-heading mb-16">List of Inspection
												/ Testing Facilities Available in the Factory</h6>
											<div id="inspection-list-parent-0">
												<div>
													<div class="row">
														<h6 class="input-section-heading mb-8">1.1</h6>
														<input hidden name="factoryList[0].facilityList[1].type"
															value="Inspection">
													</div>
													<div class="row row-gap-16 mb-16">
														<div class="col-lg-6 col-md-6 col-sm-12 col-12">
															<div class="field-group">
																<input type="text"
																	name="factoryList[0].facilityList[1].details"
																	id="inspection_facility_0_0" class="input-field"
																	placeholder="Details of facility available"
																	autocomplete="off"> <label
																	for="inspection_facility_0_0"
																	class="input-label">Details
																	of facility available</label> <span
																	id="inspection_facility_0_0_err"
																	class="err-text"></span>

															</div>
														</div>
														<div class="col-lg-6 col-md-6 col-sm-12 col-12">
															<div class="field-group">
																<input type="text"
																	name="factoryList[0].facilityList[1].remarks"
																	id="inspection_facility_remark_0_0"
																	class="input-field" placeholder="Remarks if any"
																	autocomplete="off"> <label
																	for="inspection_facility_remark_0_0"
																	class="input-label">Remarks
																	if any</label> <span
																	id="inspection_facility_remark_0_0_err"
																	class="err-text"></span>
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
														onclick="addAnotherInspectionList(0,1)">+ Add Other</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<div class="row row-gap-16">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<button class="btn-style-2 w-100" type="button"
												onclick="addAnotherRegAddressOfFactory()">+ Add
												New Factory</button>
										</div>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
										<button class="btn-style-3 mb-32 mr-16" type="button"
											onclick="prevStep()">Back</button>
										<button class="btn-style-1 mb-32" type="button"
											onclick="submitFirstForm('SellerTechnicalDetails','saveSellerTechnicalDetails',checkStep4RequiredInputs(),validateStep4())">Next</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</form>
				<form id="SellerCertificatesDetails">
					<!-- Upload Certifications Step-5 -->
					<div class="step d-none">
						<div class="step-content">

							<div class="content">
								<div class="input-field-section mt-32">
									<!-- <h6 class="input-section-heading mb-16">Upload Certifications</h6> -->
									<span id="one_certificate_req_err" class="err-text"></span>
									<div class="row row-gap-16">
										<div class="col-lg-4 col-md-6 col-sm-12 col-12">
											<div class="card-style-1">
												<h6 class="card-title">ISO/TS Certification</h6>
												<div class="file-input-field-group p-0">
													<input type="file" id="isoCertificationFile_input"
														name="isoCertificationFile" accept=".pdf, .jpg, .png, .jpeg"
														class="input-field" placeholder="File" required
														autocomplete="off" hidden>
													<button class="input-btn" type="button"
														onclick="handleClick('isoCertificationFile_input','isoCertificationFile_text')">Choose
														File</button>
													<p id="isoCertificationFile_text">No File Choosen</p>
												</div>
												<span id="isoCertificationFile_err" class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-4 col-md-6 col-sm-12 col-12">
											<div class="card-style-1">
												<h6 class="card-title">AS Certification</h6>
												<div class="file-input-field-group p-0">
													<input type="file" id="asCertificationFile_input"
														name="asCertificationFile" class="input-field"
														accept=".pdf, .jpg, .png, .jpeg" placeholder="File" required
														autocomplete="off" hidden>
													<button class="input-btn" type="button"
														onclick="handleClick('asCertificationFile_input','asCertificationFile_text')">Choose
														File</button>
													<p id="asCertificationFile_text">No File Choosen</p>
												</div>
												<span id="asCertificationFile_err" class="err-text"></span>

											</div>
										</div>
										<c:choose>
											<c:when test="${country == 'IN'}">
												<div class="col-lg-4 col-md-6 col-sm-12 col-12">
													<div class="card-style-1">
														<h6 class="card-title">Compliance with Labor Laws</h6>
														<div class="file-input-field-group p-0">
															<input type="file" id="laborLawComplianceFile_input"
																accept=".pdf, .jpg, .png, .jpeg"
																name="laborLawComplianceFile" class="input-field"
																placeholder="File" required autocomplete="off" hidden>
															<button class="input-btn" type="button"
																onclick="handleClick('laborLawComplianceFile_input','laborLawComplianceFile_text')">Choose
																File</button>
															<p id="laborLawComplianceFile_text">No File Choosen</p>
														</div>
														<span id="laborLawComplianceFile_err" class="err-text"></span>
													</div>
												</div>
												<div class="col-lg-4 col-md-6 col-sm-12 col-12">
													<div class="card-style-1">
														<h6 class="card-title">Compliance with Indian
															Standards</h6>
														<div class="file-input-field-group p-0">
															<input type="file" id="indianStandardsComplianceFile_input"
																name="indianStandardsComplianceFile" class="input-field"
																placeholder="File" required autocomplete="off" hidden>
															<button class="input-btn" type="button"
																onclick="handleClick('indianStandardsComplianceFile_input','indianStandardsComplianceFile_text')">Choose
																File</button>
															<p id="indianStandardsComplianceFile_text">No File
																Choosen</p>
														</div>
														<span id="indianStandardsComplianceFile_err"
															class="err-text"></span>
													</div>
												</div>
												<div class="col-lg-4 col-md-6 col-sm-12 col-12">
													<div class="card-style-1">
														<h6 class="card-title">Compliance with Environmental
															Regulations</h6>
														<div class="file-input-field-group p-0">
															<input type="file"
																id="environmentalRegulationsComplianceFile_input"
																accept=".pdf, .jpg, .png, .jpeg"
																name="environmentalRegulationsComplianceFile"
																class="input-field" placeholder="File" required
																autocomplete="off" hidden>
															<button class="input-btn" type="button"
																onclick="handleClick('environmentalRegulationsComplianceFile_input','environmentalRegulationsComplianceFile_text')">Choose
																File</button>
															<p id="environmentalRegulationsComplianceFile_text">No
																File Choosen</p>
														</div>
														<span id="environmentalRegulationsComplianceFile_err"
															class="err-text"></span>

													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-lg-4 col-md-6 col-sm-12 col-12">
													<div class="card-style-1">
														<h6 class="card-title">OSHA Compliance</h6>
														<div class="file-input-field-group p-0">
															<input type="file" id="osha_compliance_input"
																name="oshaCertificationFile" class="input-field"
																accept=".pdf, .jpg, .png, .jpeg" placeholder="File"
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
														<h6 class="card-title">FDA Registration</h6>
														<div class="file-input-field-group p-0">
															<input type="file" id="fda_registration_input"
																name="fdaRegisterationFile" class="input-field"
																accept=".pdf, .jpg, .png, .jpeg" placeholder="File"
																required autocomplete="off" hidden>
															<button class="input-btn" type="button"
																onclick="handleClick('fda_registration_input','fda_registration_text')">Choose
																File</button>
															<p id="fda_registration_text">No File Choosen</p>
														</div>
														<span id="fda_registration_err" class="err-text"></span>

													</div>
												</div>
											</c:otherwise>
										</c:choose>
										<div class="col-lg-4 col-md-6 col-sm-12 col-12">
											<div class="card-style-1">
												<h6 class="card-title">Other Certifications(CE, ROHS,
													UL)</h6>
												<div class="file-input-field-group p-0">
													<input type="file" id="otherCertificationsIndiaFile_input"
														accept=".pdf, .jpg, .png, .jpeg"
														name="otherCertificationsIndiaFile" class="input-field"
														placeholder="File" required autocomplete="off" hidden>
													<button class="input-btn" type="button"
														onclick="handleClick('otherCertificationsIndiaFile_input','otherCertificationsIndiaFile_text')">Choose
														File</button>
													<p id="otherCertificationsIndiaFile_text">No File
														Choosen</p>
												</div>
												<span id="otherCertificationsIndiaFile_err" class="err-text"></span>

											</div>
										</div>
									</div>

								</div>
								<div class="input-field-section mt-32">
									<div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
										<button class="btn-style-3 mb-32 mr-16" type="button"
											onclick="prevStep()">Back</button>
										<button class="btn-style-1 mb-32" type="button"
											onclick="submitFirstForm('SellerCertificatesDetails','saveSellerCertificatesDetails',checkStep5RequiredInputs(),validateStep5())">Next</button>

									</div>
								</div>
							</div>

						</div>
					</div>
				</form>
				<form id="SellerReferencesDetails">
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
														<input type="file" id="projectCaseStudiesFile_input"
															accept=".pdf, .jpg, .png, .jpeg"
															name="projectCaseStudiesFile" class="input-field"
															placeholder="File" autocomplete="off" hidden>
														<button class="input-btn" type="button"
															onclick="handleClick('projectCaseStudiesFile_input','projectCaseStudiesFile_text')">Choose
															File</button>
														<p id="projectCaseStudiesFile_text">No File Choosen</p>
													</div>
													<span id="projectCaseStudiesFile_err" class="err-text"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">Customer
										Testimonials / Awards</h6>
									<div id="testimonials-list-parent">
										<div class="row">
											<div class="col-12">
												<h6 class="input-section-heading mb-8">1.</h6>
											</div>
											<div class="col-lg-9 col-md-6 col-sm-12 col-12 mb-16">
												<div class="field-group">
													<input type="text" name="testimonialsList[0].description"
														id="testimonials_or_awards_0" class="input-field"
														placeholder="Customer Testimonials / Awards" autocomplete="off">
													<label for="testimonials_or_awards_0" class="input-label">Customer
														Testimonials / Awards</label> <span
														id="testimonials_or_awards_0_err" class="err-text"></span>

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
									<p class="declaration-text mb-16">By signing below, the
										supplier agrees to provide accurate and up-to-date information
										and to comply with all regulations and requirements.</p>
									<div class="row row-gap-16">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="date" readonly name="declarationDate"
													class="input-field date-field auto-fill-date" required
													autocomplete="off">
												<!-- <label for="date" class="input-label">Date</label> -->
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-32">
											<div class="file-input-field-group">
												<input type="file" id="signatureFile_input" name="signatureFile"
													accept=".jpg, .png, .jpeg" class="input-field" placeholder="File"
													required autocomplete="off" hidden>
												<button class="input-btn" type="button"
													onclick="handleClick('signatureFile_input','signatureFile_text')">Choose
													File</button>
												<p id="signatureFile_text">No File Choosen</p>
											</div>
											<div class="fileType-and-maxFileSize">
												<p>
													Attach your signatureFile here<span
														class="required-asterisk">*</span>
												</p>

												<span id="signatureFile_err" class="err-text"></span>
											</div>
										</div>
									</div>
									<div class="row row-gap-16">
										<div class="col-12">
											<input type="checkbox" name="terms_and_conditions" id="terms_and_conditions"
												class="terms_and_conditions mr-8">
											<label class="terms_and_conditions_label" for="terms_and_conditions">I have read the 
												<a class="text-decoration-none"
													href="https://cnerzy.com/assets/privacy-policy/terms-and-conditions.pdf"
													target="_blank">Terms & Conditions</a>		and I agree</label>
											<span id="terms_and_conditions_err" class="err-text"></span>
										</div>
										<div class="col-12">
											<div class="d-flex align-items-baseline">
												<input type="checkbox" name="send_updates" id="send_updates"
													class="send_updates mr-8"> <label class="send_updates_label"
													for="send_updates">By
													sharing your contact information, you agree to receive
													important news and updates from Cnerzy. You can update your
													preference and unsubscribe from these communications anytime
													using the link in our marketing email. For more information,
													read our <a
														href="https://cnerzy.com/assets/privacy-policy/privacy-policy.pdf"
														target="_blank" style="text-decoration: none;">Privacy
														Policy.</a>
												</label>
											</div>
										</div>
										<div class="col-12">
											<div class="d-flex align-items-baseline">
												<input type="checkbox" name="create_escrow_account"
													id="create_escrow_account" class="create_escrow_account mr-8"
													checked onclick="return false;" onkeydown="return false;"> <label
													for="create_escrow_account">Create my escrow account
													(this will enable us to create your account in the escrow
													sandbox, which will speed up the transaction process for the
													project.)</label> <span id="create_escrow_account_err"
													class="err-text"></span>
											</div>

										</div>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
										<button class="btn-style-3 mb-32 mr-16" type="button"
											onclick="prevStep()">Back</button>
										<button class="btn-style-1 mb-32" type="button"
											onclick="submitFirstForm('SellerReferencesDetails','saveSellerReferencesDetails',checkStep6RequiredInputs(),validateStep6())">Next</button>


									</div>
								</div>
							</div>

						</div>
					</div>
				</form>
				<form id="PermissionDetails">
					<!-- Supplier Reference Program Step-7 -->
					<div class="step d-none">
						<div class="step-content">

							<div class="content">
								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">Supplier Reference
										Program</h6>
									<div class="row row-gap-16">
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">As a leading supplier in the
												manufacturing industry in India, we believe that your success
												story can inspire and benefit other businesses seeking
												similar services. By featuring your story on our platform, we
												aim to highlight your achievements and attract more customers
												who can benefit from your expertise and services.</p>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">We are writing to inform you of our new
												Supplier Reference Program, which we are launching to
												showcase the success of our valued suppliers to potential
												customers.</p>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">As one of our esteemed suppliers, we
												would like to invite you to participate in this program. We
												believe that your experience with our platform will provide
												valuable insights to potential customers, and we are excited
												to showcase your success story as a testament to the
												effectiveness of our platform.</p>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">By participating in this program, you
												will have the opportunity to feature in our marketing
												campaigns, on our website, and in other promotional
												materials. This will give you an opportunity to showcase your
												business to a wider audience and attract new customers.</p>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">Key Benefits:</p>
											<ul>
												<li>Visibility for your organization and your
													spokesperson</li>
												<li>Increase reach of your brand</li>
												<li>Business opportunities from publicity and networking
													platforms</li>
											</ul>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">To participate in the program, we
												request that you provide us with your permission to use your
												company name, logo, and testimonials on our promotional
												materials. We also kindly ask that you provide us with a
												brief summary of your experience with our platform,
												highlighting your achievements and successes</p>

										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">If you agree to participate in this
												program, please fill out the attached form and return it to
												us. We will then follow up with you to discuss the next
												steps.</p>

										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">Thank you for your continued support of
												our platform. We look forward to featuring your success story
												in our promotional materials and attracting new customers to
												your business.</p>

										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">Your participation in our customer
												reference program is perpetual and free of cost. Think of it
												as a comprehensive marketing program for your organization
												that extends beyond a limited period</p>

										</div>

									</div>
								</div>
								<div class="input-field-section mt-32">
									<h6 class="input-section-heading mb-16">Identification /
										Designation</h6>
									<p class="content mb-16">Please provide your organization
										contact point for all Customer Reference Program communication
										activities:</p>
									<div class="row row-gap-16">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="customerReferencePersonName"
													class="input-field" placeholder="ref_" required autocomplete="off">
												<label for="customerReferencePersonName" class="input-label">Name<span
														class="required-asterisk">*</span></label> <span
													id="customerReferencePersonName_err" class="err-text"></span>
											</div>

										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="customerReferencePersonJobTitle"
													class="input-field" placeholder="Job Title" required
													autocomplete="off"> <label for="customerReferencePersonJobTitle"
													class="input-label">Job
													Title<span class="required-asterisk">*</span>
												</label> <span id="customerReferencePersonJobTitle_err"
													class="err-text"></span>

											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="customerReferencePersonCompanyName"
													class="input-field" placeholder="Company Name" required
													autocomplete="off"> <label for="customerReferencePersonCompanyName"
													class="input-label">Company
													Name<span class="required-asterisk">*</span>
												</label> <span id="customerReferencePersonCompanyName_err"
													class="err-text"></span>

											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="customerReferencePersonCompanyWebsite"
													class="input-field" placeholder="Company Website" required
													autocomplete="off"> <label
													for="customerReferencePersonCompanyWebsite"
													class="input-label">Company Website<span
														class="required-asterisk">*</span></label> <span
													id="customerReferencePersonCompanyWebsite_err"
													class="err-text"></span>

											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="text" name="customerReferencePersonPhoneNo"
													class="input-field" placeholder="Phone Number" required
													maxlength="10" autocomplete="off"> <label
													for="customerReferencePersonPhoneNo" class="input-label">Phone
													Number<span class="required-asterisk">*</span>
												</label> <span id="customerReferencePersonPhoneNo_err"
													class="err-text"></span>
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="email" name="customerReferencePersonEmail"
													class="input-field" placeholder="Email" required autocomplete="off">
												<label for="customerReferencePersonEmail" class="input-label">Email<span
														class="required-asterisk">*</span></label> <span
													id="customerReferencePersonEmail_err" class="err-text"></span>

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
											<p class="content">By participating in this program, we
												would like to showcase your company's name, logo, and
												solution specifics for internal presentations, corporate
												intranet, case studies, and customer testimonial videos. We
												would also like to seek your permission to reference your
												company and its activities externally.</p>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<p class="content">Please indicate which areas/activities
												your company is willing to participate in for external
												references by selecting all relevant options below</p>
										</div>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<div class="row row-gap-16">
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.presentations"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Presentations: Use your company name, logo,
													and solution details in speeches and presentations.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.newsletters"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Newsletters: Use your company name, logo, and
													solution details in printed and electronic newsletters.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.customerProfileOnWeb"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Customer Profile on Web: Display your company
													name, logo, and solution details on our website.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.rfp"
													class="mr-8 child-checkboxes" autocomplete="off"><label for="">RFP:
													Use your company name and solution
													details to respond to customer requests for proposals.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox"
													name="permissionModel.onlineDirectMarketingCampaigns"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Online/Direct Marketing Campaigns: Use your
													company name, logo, and solution details in online and/or
													direct marketing campaigns.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.sponsoredEvents"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Sponsored Events: Participate in sponsored
													events and display your company name, logo, and solution
													details.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.caseStudy"
													class="mr-8 child-checkboxes" autocomplete="off"><label for="">Case
													Study: Use your company name and
													solution details in a case study brochure and presentation.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.whitePaper"
													class="mr-8 child-checkboxes" autocomplete="off"><label for="">White
													Paper: Use your company name and
													solution details in a white paper.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.broadcastMedia"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Broadcast Media: Be contacted by print or
													broadcast media representatives and consulted each time your
													organization's name is used as a client reference.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.pressAnalysts"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Press/Analysts: Meet with analysts and
													members of the media and be consulted each time your
													organization's name is used as a client reference.</label>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.customerTestimonialLetter"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Customer Testimonial Letter: Provide a
													written testimonial for internet use.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.customerTestimonialVideo"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Customer Testimonial Video: Participate in a
													video testimonial which displays your company name, logo,
													and solution details.</label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="checkbox-field-group d-flex">
												<input type="checkbox" name="permissionModel.speakingEngagement"
													class="mr-8 child-checkboxes" autocomplete="off"><label
													for="">Speaking Engagement: Participate in speaking
													engagements to gain high-profile access to industry and
													media audiences and enhance your marketplace positioning.</label>
											</div>
										</div>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<div class="col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="checkbox-field-group d-flex">
											<input type="checkbox" name="parentCheckbox" class="mr-8 parent-checkbox"
												onclick="tickAllCheckboxes('parent-checkbox','child-checkboxes')"
												autocomplete="off"><label for=""><span style="font-weight: bold;">Select
													above all activities</span>
												to participate in all the activities in the Supplier
												Reference Program</label>

										</div>
									</div>
								</div>
								<span id="check_one_checkbox_err" class="err-text"></span>
								<div class="input-field-section mt-16">
									<div style="display: flex; align-items: baseline;">
										<input type="checkbox" id="declaration" name="declaration" class="mr-8 "
											autocomplete="off">
										<p class="content mb-16">I, the undersigned, agree to
											participate in the Supplier Reference Program , I give my
											permission to use my company name, logo, and testimonials in
											its marketing campaigns, on its website, and in other
											promotional materials.</p>

									</div>
									<span id="declaration_err" class="err-text"></span>
									<div class="row row-gap-16">
										<div class="col-lg-3 col-md-6 col-sm-12 col-12">
											<div class="field-group">
												<input type="date" readonly name="permissionModel.declerationDate"
													class="input-field auto-fill-date" required autocomplete="off">
												<!-- <label for="permissionModel.declerationDate" class="input-label">Date</label> -->
											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-32">
											<div class="file-input-field-group">
												<input type="file" id="ref_signature_input"
													name="permissionModel.signatureFile" accept=".jpg, .png, .jpeg"
													class="input-field" placeholder="File" required autocomplete="off"
													hidden>
												<button class="input-btn" type="button"
													onclick="handleClick('ref_signature_input','ref_signature_text')">Choose
													File</button>
												<p id="ref_signature_text">No File Choosen</p>
											</div>
											<div class="fileType-and-maxFileSize">
												<p>
													Attach your signature here<span class="required-asterisk">*</span>
												</p>

												<span id="ref_signature_err" class="err-text"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="input-field-section mt-32">
									<div class="col-12 mt-64 d-block d-sm-block d-md-flex justify-content-end">
										<!-- <button class="btn-style-3 mb-32 mr-16" type="button"
											onclick="prevStep()">Back</button> -->
										<button class="btn-style-1 mb-32" type="button"
											onclick="submitLastForm('PermissionDetails','saveSellerPermissionDetails',validateLastStep())">Submit</button>


									</div>
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
					<!-- <div class="d-flex flex-column justify-content-center align-items-center">
						<a href="dashboard" id="dashboardredirect" class="btn-style-1 mt-32"
							style="    text-decoration: none;">Back to Profile</a>
					</div> -->
				</div>
			</div>
		</div>

		<!-- Thank you popup ends -->


		<!-- <script>
        document.addEventListener('DOMContentLoaded', function () {
            var stepper = new Stepper(document.querySelector('.bs-stepper'))
            //----------------------------------------- js script for stepper responsivess starts here --------------------------------------

            let currentStep = 0;
            const steps = document.querySelectorAll('.step');
            const stepCircles = document.querySelectorAll('.res-step');
            const stepLines = document.querySelectorAll('.step-line');


            console.log(stepCircles)

            function showStep(stepIndex) {
                steps.forEach((step, index) => {
                    if (index === stepIndex || index === 0 || index === steps.length - 1 || Math.abs(index -
                        stepIndex) <= 1) {
                        step.classList.remove('d-none');
                        stepCircles[index].classList.add('active');
                        stepLines[index].classList.add('active');
                    } else {
                        step.classList.add('d-none');
                        stepCircles[index].classList.remove('active');
                        stepLines[index].classList.remove('active');
                    }
                });
            }

            function prevStep() {
                currentStep--;
                if (currentStep < 0) {
                    currentStep = 0;
                }
                showStep(currentStep);
            }

            function nextStep() {
                const currentStepInput = steps[currentStep].querySelector('input');



                stepLines[currentStep].classList.add('completed');
                stepCircles[currentStep].classList.add('completed');
                currentStep++;
                if (currentStep >= steps.length) {
                    currentStep = steps.length - 1;
                }
                showStep(currentStep);
            }

            showStep(currentStep);


            //----------------------------------------- js script for stepper responsivess ends here --------------------------------------
        })
    </script> -->



		<script src="assets/js/index.js"></script>
		<script src="assets/js/stepper.js"></script>

		<script>

			var ctx = "${pageContext.request.contextPath}"
			var countrySelected = "${country}"
			document.addEventListener('DOMContentLoaded', function () {
				// Function to handle hide/show based on selected radio button
				function handleRadioChange(checkedValue, parentElementId) {
					let parentElement = document.getElementById(parentElementId);
					parentElement.style.display = checkedValue === 'yes' ? 'block' : 'none';

				}

				// Select the radio buttons
				let isSupplyingToOEMRadioButtons = document.querySelectorAll('input[name="isSupplyingToOEM"]');
				let isExporterRadioButtons = document.querySelectorAll('input[name="isExporter"]');
				let sLogisticServiceProviderRadioButtons = document.querySelectorAll('input[name="isLogisticServiceProvider"]');


				// Determine initial states and call handleRadioChange function
				isSupplyingToOEMRadioButtons.forEach(function (radioButton) {
					if (radioButton.checked) {
						handleRadioChange(radioButton.value, 'oem-details-parent');
					}
					radioButton.addEventListener('change', function () {
						handleRadioChange(this.value, 'oem-details-parent');
					});
				});

				isExporterRadioButtons.forEach(function (radioButton) {
					if (radioButton.checked) {
						handleRadioChange(radioButton.value, 'exporter-lists-parent');
					}
					radioButton.addEventListener('change', function () {
						handleRadioChange(this.value, 'exporter-lists-parent');
					});
				});
				sLogisticServiceProviderRadioButtons.forEach(function (radioButton) {
					if (radioButton.checked) {
						handleRadioChange(radioButton.value, 'logistic-service-provider-parent');
					}
					radioButton.addEventListener('change', function () {
						handleRadioChange(this.value, 'logistic-service-provider-parent');
					});
				});
			});

			// 	let allCheckboxes = document.querySelectorAll('input[type="checkbox"]');
			const allCheckboxes = document.querySelectorAll('#PermissionDetails input[type="checkbox"]');
			// allCheckboxes.forEach(checkbox => {
			// 	checkbox.addEventListener('click', updateErrorMessage);
			// });
			function submitFirstForm(id, api, checkStepRequiredInputs, validateStep) {
				let isFieldError = false
				let isEmptyRequiredField = false

				isFieldError = validateStep
				isEmptyRequiredField = checkStepRequiredInputs
				console.log("step-1", "invalid-", isFieldError, "any empty filled-", isEmptyRequiredField)

				if (!isEmptyRequiredField && !isFieldError) {

					const form = document.getElementById(id);
					const formData = new FormData(form);


					var myHeaders = new Headers();

					var requestOptions = {
						method: "POST",
						headers: myHeaders,
						body: formData,
						redirect: "follow",
					};
					fetch("${pageContext.request.contextPath}/" + api, requestOptions)
						.then((response) => {
							if (!response.ok) {
								throw new Error("Network response was not ok");
							}
							return response.json();
						})
						.then((data) => {
							console.log("Success:", data);
							if (data.status == "true") {
								nextStep()

							} else if (data.status == "false") {
								toastr.error(data.message)
							}
						})
						.catch((error) => {
							console.error("Fetch error:", error);
						});
				}
			}

			function submitLastForm(id, api, validateStep) {
				let isFieldError = false


				isFieldError = validateStep
				console.log("step-1", "invalid-", isFieldError, "any empty filled-")

				if (!isFieldError) {

					const form = document.getElementById(id);
					const formData = new FormData(form);


					var myHeaders = new Headers();

					var requestOptions = {
						method: "POST",
						headers: myHeaders,
						body: formData,
						redirect: "follow",
					};
					fetch("${pageContext.request.contextPath}/" + api, requestOptions)
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
						})
						.catch((error) => {
							console.error("Fetch error:", error);
						});
				}
			}

			var fileInput = document.getElementById('signatureFile_input');
			var fileW9Input = document.getElementById('w9SubmissionForm');

			fileInput.addEventListener('change', function () {
				if (this.files.length > 0) {
					document.getElementById('signatureFile_err').innerHTML = "";
					// Assuming clearError function exists to remove error messages

					let res = validateFileSize(this)
					if (!res) {
						errorMessage = 'File size is too large';
						showError('signatureFile_err', errorMessage)
					} else {
						showError('signatureFile_err', '')
					}
				} else {
					showError('signatureFile_err', 'Signature is Required')
				}

			});
			fileW9Input.addEventListener('change', function () {
				if (this.files.length > 0) {
					document.getElementById('w9SubmissionForm_err').innerHTML = "";
					// Assuming clearError function exists to remove error messages

					let res = validateFileSize(this)
					if (!res) {
						errorMessage = 'File size is too large';
						showError('w9SubmissionForm_err', errorMessage)
					} else {
						showError('w9SubmissionForm_err', '')
					}
				} else {
					showError('w9SubmissionForm_err', 'W-9 Submission Form Required')
				}
			});

			//for hiding-error text when terms_and_conditions clicked
			document.querySelector('#terms_and_conditions').addEventListener('click', function () {
				if (this.checked) {
					showError('terms_and_conditions_err', '')
				} else {
					showError('terms_and_conditions_err', 'Please check terms and conditions')
				}
			})

			//for hiding-error text when create_escrow_account clicked
			document.querySelector('#create_escrow_account').addEventListener('click', function () {
				if (this.checked) {
					showError('create_escrow_account_err', '')
				} else {
					showError('create_escrow_account_err', 'Permission is Required')
				}
			})

			//for hiding-error text when declaration clicked
			document.querySelector('#declaration').addEventListener('click', function () {
				if (this.checked) {
					showError('declaration_err', '')
				} else {
					showError('declaration_err', 'Please check declaration')
				}
			})

			//for hiding-error text when any checkbox clicked

			const allPermissionCheckboxes = document.querySelectorAll('.child-checkboxes,.parent-checkbox');
			// console.log('allPermissionCheckboxes', allPermissionCheckboxes)
			for (let checkbox of allPermissionCheckboxes) {
				checkbox.addEventListener('click', function () {
					showError('check_one_checkbox_err', '')
				})
			}
		</script>
		<script>
			//Email Verified Toastr
			$(document).ready(function () {
				if ("${emailVerificationstatus}" === "true") {
					toastr.success("${emailVerificationmessage}");
				} else if ("${emailVerificationstatus}" === "false") {
					toastr.error("${emailVerificationmessage}");
				}
			});




		</script>
		<script src="assets/js/seller.js"></script>
		<script src="assets/js/dropdown-toggle-seller.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
			</script>
	</body>

	</html>