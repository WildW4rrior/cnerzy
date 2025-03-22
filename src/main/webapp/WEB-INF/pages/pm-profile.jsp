<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CNERZY | Profile</title>
<link rel="stylesheet" href="assets/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<!-- for google icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<link
	href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css"
	rel="stylesheet">
</head>
<style>
.wrapper {
	gap: 24px
}

#singatureDocumentUrl img, #companySignature img {
	height: 100%;
	width: 100%;
}

#notice {
	display: flex;
	flex-wrap:wrap;
	justify-content: flex-end;
}

#notice h1 {
	
	height: 54px;
	padding: 15px 10px 15px 10px;
	gap: 10px;
	border-radius: 6px;
	background: rgba(26, 28, 67, 0.1);
	border: 1px solid rgba(26, 28, 67, 1);
	font-family: Chivo;
	font-size: 17px;
	font-weight: 400;
	line-height: 23.8px;
}

#notice a {
	font-family: Chivo;
	font-size: 20px;
	font-weight: 400;
	line-height: 23.8px;
	text-align: left;
}
</style>

<body>

	<!------------- navbar starts here -------------->

	<!------------- navbar ends here -------------->

	<!------------- page content starts here -------------->
	<c:import url="navbar.jsp"></c:import>
	<div class="wrapper">


		<c:import url="sidebar.jsp"></c:import>
		<div class="right-content right-content-profile" id="profile">
			<div class="row row-gap-16">
				<div id="notice" style="display: none">
					<h1>
						<img src="assets/icons/infoIcon.svg"> Important: To edit
						your profile, please contact the Cnerzy Admin Team at <a
							href="mailto:admin@cnerzy.com">admin@cnerzy.com</a>
					</h1>
				</div>
				<h1
					style="font-family: Lora; font-size: 24px; font-weight: 500; line-height: 30.72px; text-align: left; color: rgba(26, 28, 67, 1);">
					My Profile</h1>

				<div class="col-12">
					<div class="section-style-2">
						<div class="row row-gap-24">
							<div class="col-12">
								<h6 class="section-heading">Personal Information</h6>
							</div>

							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">Full Name</h6>
								<p class="text" name="name">xyz company LLP</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<div class="d-flex">
									<h6 class="heading">Email</h6>
								</div>
								<p class="text" name="email">user@company.com</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">Phone</h6>
								<p class="text" name="phone">+91 12121 2122</p>
							</div>
							<!-- <div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<h6 class="heading">Website</h6>
						<p class="text">www.company.com</p>
					</div> -->
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">Industry Classification</h6>
								<p class="text" name="industry">www.company.com</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">Industry Expertise</h6>
								<p class="text" name="expertise">linkedIn.com/in/username</p>
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
								<p class="text" name="streetAddress">A-125, Shahpur Jat</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">City</h6>
								<p class="text" name="city">Delhi</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">State</h6>
								<p class="text" name="state">Delhi</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">Country</h6>
								<p class="text" name="country">India</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">Pincode</h6>
								<p class="text" name="pincode">110049</p>
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
								<h6 class="section-heading">Professional Information</h6>
							</div>

							<div id="Professional" class="row row-gap-24"></div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">Years of Experience in Project
									Management</h6>
								<p class="text" name="companyExperience">Developer</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">LinkedIn Profile URL</h6>
								<a href="" class="text" name="companyLinkedInUrl">+91 90265
									52789</a>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-3">
								<h6 class="heading">Certifications</h6>
								<button class="btn-style-4 " name="relevantDocumentUrlProfile"
									type="button"></button>
							</div>

						</div>

						<img class="icon" src="assets/icons/edit.svg" alt="edit"
							data-bs-toggle="modal"
							data-bs-target="#edit-professional-information">


					</div>

				</div>

				<div class="col-12">
					<div class="section-style-2">
						<div class="row row-gap-24">
							<div class="col-12">
								<h6 class="section-heading">Legal Information</h6>
							</div>

							<c:choose>
								<c:when test="${country == 'IN'}">
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">PAN Number</h6>
										<p class="text" name="panNo"></p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">EIN Number</h6>
										<p class="text" name="einnumber"></p>
									</div>

								</c:otherwise>
							</c:choose>

						</div>
						<img class="icon" src="assets/icons/edit.svg" alt="edit"
							data-bs-toggle="modal" data-bs-target="#edit-legal-information">
					</div>
				</div>
				<div class="col-12">
					<div class="section-style-2">
						<div class="row row-gap-24">
							<div class="col-12">
								<h6 class="section-heading">Project Management Experience</h6>
							</div>
							<div class="col-12 row row-gap-24">
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Number of projects handled</h6>
									<p class="text" name="exp_projectsHandled">SBI</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Complexity of projects managed</h6>
									<p class="text" name="exp_projectsComplexity">38845472800</p>
								</div>
							</div>

							<div class="col-12">
								<h6 class="heading">Briefly describe your experience in
									project management</h6>
								<p class="text" name="exp_description">Lorem Ipsum�is
									simply dummy text of the printing and typesetting industry.
									Lorem Ipsum has been the industry's standard dummy text ever
									since the 1500s, when an unknown printer took a galley of type
									and scrambled it to make a type specimen book. It has survived
									not only five centuries, but also the leap into electronic
									typesetting, remaining essentially unchanged.</p>

							</div>

						</div>
						<img class="icon" src="assets/icons/edit.svg" alt="edit"
							data-bs-toggle="modal" data-bs-target="#edit-PM-Experience">

					</div>
				</div>
				<div class="col-12">
					<div class="section-style-2">
						<div class="row row-gap-24" id="References">
							<div class="col-12">
								<h6 class="section-heading">References</h6>
							</div>
							<div class="col-12 row row-gap-24" id="mainRow">
								<h1 class="section-heading">1.</h1>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Name</h6>
									<p class="text">SBI</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-6">
									<h6 class="heading">Company/Organization</h6>
									<p class="text">38845472800</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Email</h6>
									<p class="text">38845472800</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-3">
									<h6 class="heading">Phone</h6>
									<p class="text">38845472800</p>
								</div>
							</div>
							<div class="col-12 row row-gap-24">
								<h1 class="section-heading">2.</h1>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Name</h6>
									<p class="text">SBI</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-6">
									<h6 class="heading">Company/Organization</h6>
									<p class="text">38845472800</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Email</h6>
									<p class="text">38845472800</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Phone</h6>
									<p class="text">38845472800</p>
								</div>
							</div>

							<div class="col-12 d-flex " style="justify-content: flex-end;">
								<div class="col-lg-3 col-md-6 col-sm-12 col-12">
									<button class="btn-style-2 w-100" type="button"
										onclick="addNewReferenceRow()">+ Add Other</button>
								</div>
							</div>
						</div>
						<img class="icon" src="assets/icons/edit.svg" alt="edit"
							data-bs-toggle="modal" data-bs-target="#edit-PM-Refrence">

					</div>
				</div>
				<div class="col-12">
					<div class="section-style-2">
						<div class="row row-gap-24">
							<div class="col-12">
								<h6 class="section-heading">Resume</h6>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<button class="btn-style-4 " type="button"
									name="resumeLinkProfile"></button>
							</div>

						</div>
						<img class="icon" src="assets/icons/edit.svg" alt="edit"
							data-bs-toggle="modal" data-bs-target="#edit-Resume">

					</div>
				</div>

				<div class="col-12">
					<div class="section-style-2">
						<div class="row row-gap-24">
							<div class="col-12">
								<h6 class="section-heading">Signature</h6>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4"
								name="singatureDocumentUrl" id="singatureDocumentUrl">
								<img src="assets/images/profile/signature.png" alt="">
							</div>


						</div>
						<img class="icon" src="assets/icons/edit.svg" alt="edit"
							data-bs-toggle="modal" data-bs-target="#edit-signature">

					</div>
				</div>


			</div>
		</div>

	</div>



	<!------------- page content ends here -------------->


	<!-- Edit Company Detail Popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-company-details" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form id="edit-company-details-form">
					<div class="body">
						<h3 class="heading">Personal Information</h3>
						<div class="row row-gap-24">


							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="name" id="name" class="input-field"
										placeholder="Company Name" required autocomplete="on">
									<label for="name" class="input-label">Company Name<span
										class="required-asterisk">*</span></label> <span id="name_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="email" id="email" class="input-field"
										placeholder="Company Email" required autocomplete="on">
									<label for="email" class="input-label">Company Email<span
										class="required-asterisk">*</span></label> <span id="email_err"
										class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="phone" id="phone" pattern="/d*" class="input-field"
										placeholder="Phone" required autocomplete="on" maxlength="10">
									<label for="phone" class="input-label">Phone<span
										class="required-asterisk">*</span></label> <span id="phone_err"
										class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div
									class="field-group select-field-group select-field-group-toggle">
									<select name="industry" id="industry"
										class="input-field form-dropdown" required autocomplete="off">
										<option value="" selected>Industry Classification</option>
										<option value="Aerospace">Aerospace</option>
										<option value="Automotive">Automotive</option>
										<option value="Consumer Goods">Consumer Goods</option>
										<option value="Energy">Energy</option>
										<option value="Industrial Machinery">Industrial
											Machinery</option>
										<option value="Others">Others</option>
									</select> <label for="industry" class="input-label">Select<span
										class="required-asterisk">*</span>
									</label> <span id="industry_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div
									class="field-group select-field-group select-field-group-toggle">
									<select name="expertise" id="expertise"
										class="input-field form-dropdown" required autocomplete="on">
										<option value="">Industry Expertise</option>
										<option value="Precision Machining">Precision
											Machining</option>
										<option value="Injections Moulds">Injections Moulds</option>
										<option value="Die Casting Components">Die Casting
											Components</option>
										<option value="Sheet Metal / Stamping">Sheet Metal /
											Stamping</option>
										<option value="Forging">Forging</option>
										<option value="Sub-assembly">Sub-assembly</option>
										<option value="Aerospace Components">Aerospace
											Components</option>
										<option value="Engineering & Design Services">Engineering
											& Design Services</option>
										<option value="Prototyping">Prototyping</option>
										<option value="Others">Others</option>
									</select> <label for="expertise" class="input-label">Select<span
										class="required-asterisk">*</span>
									</label> <span id="expertise_err" class="err-text"></span>
								</div>
							</div>


						</div>
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button"
										data-bs-dismiss="modal" aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('/updatePMPersonalDetails','#edit-company-details')">Save</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Company Detail Popup ends -->


	<!-- Edit Company Address Popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-company-address" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<div class="body">

					<input name="addressId" hidden>

					<h3 class="heading">Company Address</h3>
					<div class="row row-gap-24">
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="streetAddress" id="streetAddress"
									class="input-field" placeholder="Street Address" required
									autocomplete="on"> <label for="streetAddress"
									class="input-label">Street Address<span
									class="required-asterisk">*</span></label> <span id="streetAddress_err"
									class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="city" id="city" class="input-field"
									placeholder="City" required autocomplete="on"> <label
									for="city" class="input-label">City<span
									class="required-asterisk">*</span></label> <span id="city_err"
									class="err-text"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="state" id="state" class="input-field"
									placeholder="State" required autocomplete="on"> <label
									for="state" class="input-label">State<span
									class="required-asterisk">*</span></label> <span id="state_err"
									class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<!-- <input type="text" name="country" readonly value="{{$data['country']}}" class="input-field" placeholder="Country" required
                                    autocomplete="on"> -->
								<select name="country" disabled id="country"
									class="input-field form-dropdown" required autocomplete="on">
									<option value="india" selected>India</option>
									<option value="us">US</option>
								</select>
								<!-- <label for="country" class="input-label">Country</label> -->
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="pincode" pattern="/d*" class="input-field"
									placeholder="Pincode" required autocomplete="on"> <label
									for="pincode" class="input-label">Pincode<span
									class="required-asterisk">*</span></label> <span id="pincode_err"
									class="err-text"></span>
							</div>
						</div>

					</div>
				</div>
				<div class="footer">
					<div class="row">
						<div class="col-12 d-flex justify-content-end">
							<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
								<button class="btn-style-4 btn-cancel" type="button"
									data-bs-dismiss="modal" aria-label="Close">Cancel</button>
								<button class="btn-style-1 btn-save" type="button"
									onclick="save('/updatePMAddress','#edit-company-address')">Save</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Edit Company Address Popup ends -->



	<!-- Edit Professional Information popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-professional-information" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<form id="edit-professional-information-form">
						<div class="input-field-section mt-32">
							<h6 class="input-section-heading mb-16">Professional
								Information</h6>
							<div class="row row-gap-16 mb-16" id="company-parent-row">

								<div class="col-md-6 col-sm-12 col-12">
									<button class="btn-style-2 w-100" type="button"
										onclick="addNewCompanyColumn()">+ Add Other</button>
								</div>
							</div>
							<div class="row row-gap-16">
								<div class="col-md-6 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="companyExperience" pattern="/d*"
											id="companyExperience" class="input-field"
											placeholder="Years of Experience" required
											oninput="validateNumber(this)" autocomplete="off"> <label
											for="companyExperience" class="input-label">Years of
											Experience<span class="required-asterisk">*</span>
										</label> <span id="companyExperience_err" class="err-text"></span>
									</div>

								</div>
								<div class="col-md-6 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="companyLinkedInUrl"
											id="companyLinkedInUrl" class="input-field"
											placeholder="LinkedIn Profile URL" autocomplete="off">
										<label for="companyLinkedInUrl" class="input-label">LinkedIn
											Profile URL</label> <span id="companyLinkedInUrl_err"
											class="err-text"></span>
									</div>

								</div>
								<div class="col-md-6 col-sm-12 col-12">
									<div class="file-input-field-group">
										<input name="relevantDocumentId" hidden> <input
											type="file" id="relevantDocuments" name="relevantDocuments"
											class="input-field" placeholder="File" required
											autocomplete="off" hidden>
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
							<div class="footer">
								<div class="row">
									<div class="col-12 d-flex justify-content-end">
										<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
											<button class="btn-style-4 btn-cancel" type="button"
												data-bs-dismiss="modal" aria-label="Close">Cancel</button>
											<button class="btn-style-1 btn-save" type="button"
												onclick="save('/updatePMProfessionalDetails','#edit-professional-information-form')">Save</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Professional Information popup ends -->

	<!-- Edit Legal Information popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-legal-information" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<h3 class="heading">Legal Information</h3>
					<div class="row row-gap-24">


						<c:choose>
							<c:when test="${country == 'IN'}">
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="panNo" id="panNo" class="input-field"
											placeholder="PAN Number" autocomplete="on"> <label
											for="panNo" class="input-label">PAN Number<span
											class="required-asterisk">*</span></label> <span id="panNo_err"
											class="err-text"></span>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="einnumber" id="EINNumber"
											class="input-field" placeholder="Tax Id. Number (EIN)"
											autocomplete="on" value=""> <label for="EINNumber"
											class="input-label">EIN Number<span
											class="required-asterisk">*</span></label> <span id="EINNumber_err"
											class="err-text"></span>
									</div>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
				<div class="footer">
					<div class="row">
						<div class="col-12 d-flex justify-content-end">
							<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
								<button class="btn-style-4 btn-cancel" type="button"
									data-bs-dismiss="modal" aria-label="Close">Cancel</button>
								<button class="btn-style-1 btn-save" type="button"
									onclick="save('/updatePMLegalDetails','#edit-legal-information')">Save</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Legal Information popup ends -->


	<!-- Edit Financial Information popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-financial-information" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<h3 class="heading">Financial Information</h3>
					<div class="row row-gap-24">
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="companyBankName" class="input-field"
									placeholder="Bank Name" autocomplete="on" value="SBI">
								<label for="bank_name" class="input-label">Bank Name</label> <span
									id="bank_name_err" class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="companyAccountNumber" pattern="/d*"
									class="input-field" placeholder="Account Number"
									autocomplete="on" value="38845472800"> <label
									for="account_number" class="input-label">Account Number</label>
								<span id="account_number_err" class="err-text"></span>

							</div>
						</div>


						<c:choose>
							<c:when test="${country == 'IN'}">
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="companyIfscCode" class="input-field"
											placeholder="IFSC Code" autocomplete="on" value="SBIN0017333">
										<label for="ifsc_code" class="input-label">IFSC Code</label> <span
											id="ifsc_code_err" class="err-text"></span>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="companyRoutingNumber" pattern="/d*"
											class="input-field" placeholder="IFSC Code" autocomplete="on"
											value="SBIN0017333"> <label for="ifsc_code"
											class="input-label">Routing Number</label> <span
											id="ifsc_code_err" class="err-text"></span>
									</div>
								</div>

							</c:otherwise>
						</c:choose>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
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
												style="font-size: 12px; padding: 4px;">USD</span>
										</c:otherwise>
									</c:choose>
								</div>
								<input type="number" name="annualTurnoverValue"
									style="padding-left: 50px;" class="input-field"
									placeholder="Annual Turnover" autocomplete="on" value="13">
								<label for="annual_turnover" style="left: 50px;"
									class="input-label">Annual Turnover</label>
							</div>
							<span id="annual_turnover_err" class="err-text"></span>
						</div>

					</div>
				</div>
				<div class="footer">
					<div class="row">
						<div class="col-12 d-flex justify-content-end">
							<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
								<button class="btn-style-4 btn-cancel" type="button"
									data-bs-dismiss="modal" aria-label="Close">Cancel</button>
								<button class="btn-style-1 btn-save" type="button">Save</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Financial Information popup ends -->


	<!-- Edit Experience popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-PM-Experience" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<div class="input-field-section mt-32">
						<h6 class="input-section-heading mb-16">Project Management
							Experience</h6>
						<input name="exp_id" hidden>
						<div class="row row-gap-16" id="Experience">

							<div class="col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" pattern="/d*" name="exp_projectsHandled"
										id="exp_projectsHandled" class="input-field"
										placeholder="Number of projects handled" autocomplete="off">
									<label for="exp_projectsHandled" class="input-label">Number
										of projects handled <span id="exp_projectsHandled_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="field-group select-field-group">
									<select name="exp_projectsComplexity"
										id="exp_projectsComplexity" class="input-field form-dropdown"
										autocomplete="off">
										<option value="" selected>Complexity of Project</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select> <label for="exp_projectsComplexity" class="input-label">Select</label>
									<span id="exp_projectsComplexity_err" class="err-text"></span>
								</div>
							</div>

							<div class="col-12">
								<div class="field-group">
									<textarea name="exp_description" id="exp_description"
										class="input-field"
										placeholder="Briefly describe your experience in project management"
										autocomplete="off"></textarea>
									<label for="exp_description" class="input-label">Briefly
										describe your experience in project management</label> <span
										id="exp_description_err" class="err-text"></span>
								</div>
							</div>

						</div>
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button"
										data-bs-dismiss="modal" aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('/saveOrUpdatePMExperience','#edit-PM-Experience')">Save</button>
								</div>
							</div>
						</div>
					</div>

				</div>


			</div>
		</div>
	</div>
	<!-- Edit Experience popup ends -->

	<!-- Edit Reference popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-PM-Refrence" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form id="edit-PM-Refrence-form">


					<div class="body">
						<div class="input-field-section mt-32">


							<div class="row row-gap-24" id="References-modal"></div>

						</div>
						<div class="footer">
							<div class="row">
								<div class="col-12 d-flex justify-content-end">
									<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
										<button class="btn-style-4 btn-cancel" type="button"
											data-bs-dismiss="modal" aria-label="Close">Cancel</button>
										<button class="btn-style-1 btn-save" type="button"
											onclick="save('/saveOrUpdatePMReference','edit-PM-Refrence-form')">Save</button>
									</div>
								</div>
							</div>
						</div>

					</div>

				</form>
			</div>
		</div>
	</div>
	<!-- Edit Reference popup ends -->

	<!-- Edit Resume popup starts -->
	<div class="modal fade modal-lg custom-edit-modal" id="edit-Resume"
		aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
		tabindex="-1" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<form id="edit-Resume-form">

						<div class="input-field-section mt-32">
							<h6 class="input-section-heading mb-16">Attach Resume</h6>

							<div class="col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="file-input-field-group">
									<input name="resumeId" hidden> <input type="file"
										name="Resume" id="Resume" accept=".pdf,.png,.jpg,.jpeg"
										class="input-field" placeholder="File" required
										autocomplete="off" hidden>
									<button class="input-btn" type="button"
										onclick="handleClick('Resume','resume-pm-text')">Choose
										File</button>
									<p id="resume-pm-text">No File Choosen</p>
								</div>
								<div class="fileType-and-maxFileSize">
									<p>Attach Relevant Certifications</p>
									<span id="Resume_err" class="err-text"></span>
								</div>
							</div>
						</div>
						<div class="footer">
							<div class="row">
								<div class="col-12 d-flex justify-content-end">
									<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
										<button class="btn-style-4 btn-cancel" type="button"
											data-bs-dismiss="modal" aria-label="Close">Cancel</button>
										<button class="btn-style-1 btn-save" type="button"
											onclick="save('/updatePMResume','#edit-Resume-form')">Save</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>


			</div>
		</div>
	</div>
	<!-- Edit Resume popup ends -->

	<!-- Edit Signature popup starts -->
	<div class="modal fade modal-lg custom-edit-modal" id="edit-signature"
		aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
		tabindex="-1" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form id="edit-signature-form">
					<div class="body">
						<h3 class="heading">Signature</h3>
						<div class="row row-gap-24">
							<div class="col-12">
								<div class="signature-card-1 custom-file-input-2">
									<div class="signature-preview-area" id="companySignature">
										<input name="signatureDocumentId" hidden> <input
											type="file" class="file-input" id="signature-input"
											accept=".png,.jpg,.jpeg" name="singatureDocument" hidden>
										<img class="img" src="assets/images/profile/signature.png"
											alt="">
										
									</div>
									<div class="icon-box">
										<img class="icon choose-new-signature-btn"
											src="assets/images/profile/replace.png" alt="">
									</div>
								</div>
								<span id="signatureDocument_err" class="err-text"></span>
							</div>
						</div>
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button"
										data-bs-dismiss="modal" aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('/updatePMResume','#edit-signature-form')">Save</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Signature popup ends -->



	<!-- Profile pic popup starts-->
	<div class="modal fade custom-profile-pic-view-modal modal-sm"
		id="view-profile-pic" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<span class="close-btn" data-bs-dismiss="modal" aria-label="Close">&times;</span>
				<img class="modal-img" src="assets/images/profile/user.png"
					alt="Success Animation">
			</div>
		</div>
	</div>
	<!-- Profile pic popup ends-->


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
				<p class="modal-para text-center">You've successfully completed
					your onboarding process. Cnerzy will review your profile in 1-2
					days.</p>
			</div>
		</div>
	</div>
	<!-- Thank you popup ends -->

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/toastr.min.js"></script>
	<script>
		console.log("${role}", "${country}")
		var userListJson;
		var role = "${role}"
		var contextPath = "${pageContext.request.contextPath}"
		var isApproved = "${isApproved}"
		if (isApproved === "true") {
			$(".icon[alt='edit']").hide();
			$("#notice").show();
		}
	</script>
	<script src="assets/js/pm-profile.js"></script>
	<script src="assets/js/index.js"></script>
	<script src="assets/js/requirement_module_buyer.js"></script>
	<script src="assets/js/custom-file-input-with-preview-for-profile.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>