<%@ include file="./taglibs.jsp" %>
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


		<link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
	</head>
	<style>
		.wrapper {
			gap: 24px
		}

		.verification-status {
			height: fit-content
		}

		#companyLogoUrl img,
		#companySignatureUrl img,
		#edit-signature img {
			height: 100%;
			width: 100%;
		}

		#notice {
			display: flex;
			flex-wrap: wrap;
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

		.verification-status {
			height: fit-content
		}

		.green {
			color: rgba(59, 186, 48, 1) !important;
			background: rgba(232, 255, 230, 1) !important;
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
									<h6 class="section-heading">Personal Details</h6>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">First Name</h6>
									<p class="text" name="firstName">Ashok Singh</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Last Name</h6>
									<p class="text" name="lastName">Developer</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<div class="d-flex">
										<h6 class="heading">Email Address</h6>
										<span class="ml-8 verification-status">Unverified</span>
									</div>
									<p class="text" name="personalEmail">ashok.s@brainydx.com</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Country</h6>
									<p class="text" name="userCountry">+91 90265 52789</p>
								</div>
							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit" data-bs-toggle="modal"
								data-bs-target="#edit-personal-detail">

						</div>
					</div>
					<div class="col-12">
						<div class="section-style-2">

							<div class="row row-gap-24">

								<div class="col-12">
									<h6 class="section-heading">Company Details</h6>
								</div>
								<div class="col-12 mt-8 mb-8">
									<div class="profile-pic-box" data-bs-toggle="modal"
										data-bs-target="#view-profile-pic" id="companyLogoUrl">
										<img class="" src="assets/images/profile/user.png" alt="">
									</div>

								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Company Name</h6>
									<p class="text" name="companyName">xyz company LLP</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<div class="d-flex">
										<h6 class="heading">Email Address</h6>
									</div>
									<p class="text" name="companyEmail">user@company.com</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Phone Number</h6>
									<p class="text" name="companyPhone">+91 12121 2122</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Website</h6>
									<p class="text" name="companyWebsite">www.company.com</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Industry</h6>
									<p class="text" name="companyIndustry">www.company.com</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">LinkedIn</h6>
									<p class="text" name="companyLinkedInUrl">linkedIn.com/in/username</p>
								</div>

							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit" data-bs-toggle="modal"
								data-bs-target="#edit-company-details">

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
							<img class="icon" src="assets/icons/edit.svg" alt="edit" data-bs-toggle="modal"
								data-bs-target="#edit-company-address">

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
									<p class="text" name="contactPersonName">Ashok Singh</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Designation</h6>
									<p class="text" name="contactPersonDesignation">Developer</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Email Address</h6>
									<p class="text" name="contactPersonEmail">ashok.s@brainydx.com</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Phone Number</h6>
									<p class="text" name="contactPersonPhone">+91 90265 52789</p>
								</div>
							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit" data-bs-toggle="modal"
								data-bs-target="#edit-contact-person">

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
									<p class="text" name="companyType">Partnership</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Business Registration Number(CIN)</h6>
									<p class="text" name="buisnessRegNumber">U 52341 MP 2022 PTC
										052831</p>
								</div>
								<c:choose>
									<c:when test="${country == 'IN'}">
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">Tax Identification Number (GSTIN)</h6>
											<p class="text" name="gstNo">22 AAAAA0000A 1 Z 5</p>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">Tax Id. Number (EIN)</h6>
											<p class="text" name="taxIdNumber">22 AAAAA0000A 1 Z 5</p>
										</div>
									</c:otherwise>
								</c:choose>

							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit" data-bs-toggle="modal"
								data-bs-target="#edit-legal-information">

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
									<p class="text" name="companyBankName">SBI</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Account Number</h6>
									<p class="text" name="companyAccountNumber">38845472800</p>
								</div>
								<c:choose>
									<c:when test="${country == 'IN'}">
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">IFSC Code</h6>
											<p class="text" name="companyIfscCode">SBIN0017333</p>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">Routing Number</h6>
											<p class="text" name="companyRoutingNumber">SBIN0017333</p>
										</div>
									</c:otherwise>
								</c:choose>

								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Annual Turnover</h6>
									<div style="display: flex; gap: 10px;">
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
										<p class="text" name="annualTurnoverValue">13 Crore</p>
									</div>
								</div>
							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit" data-bs-toggle="modal"
								data-bs-target="#edit-financial-information">

						</div>
					</div>
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Signature</h6>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-4" name="companySignatureUrl"
									id="companySignatureUrl">
									<img src="assets/images/profile/signature.png" alt="">
								</div>

							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit" data-bs-toggle="modal"
								data-bs-target="#edit-signature">


						</div>
					</div>


				</div>
			</div>


		</div>
		<!------------- page content starts here -------------->

		<!-- edit-personal-detail popup starts -->
		<div class="modal fade modal-lg custom-edit-modal" id="edit-personal-detail" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="body">
						<h3 class="heading">Personal Details</h3>

						<div class="row row-gap-24">


							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="firstName" id="firstName" class="input-field"
										placeholder="First Name" required autocomplete="on"> <label for="firstName"
										class="input-label">First Name<span class="required-asterisk">*</span></label>
									<span id="firstName_err" class="err-text"></span>
								</div>
							</div>


							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="lastName" id="lastName" class="input-field"
										placeholder="Last Name" required autocomplete="on"> <label for="lastName"
										class="input-label">Last Name</label> <span id="lastName_err"
										class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="personalEmail" id="personalEmail" class="input-field"
										placeholder="Email" required autocomplete="on"> <label for="personalEmail"
										class="input-label">Email Address<span
											class="required-asterisk">*</span></label> <span id="personalEmail_err"
										class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<!-- <input type="text" name="country" readonly value="{{$data['country']}}" class="input-field" placeholder="Country" required
                                    autocomplete="on"> -->
									<select name="userCountry" disabled id="userCountry"
										class="input-field form-dropdown" required autocomplete="on">
										<option value="india" selected>India</option>
										<option value="us">US</option>
									</select>
									<!-- <label for="country" class="input-label">Country</label> -->
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
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-personal-detail','/updateBuyerPersonalDetails')">Save</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- edit-personal-detail popup ends -->

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
									<div class="profile-pic-preview-area" id="ModalcompanyLogoUrl">
										<input name="companyLogoId" hidden> <input type="file" class="file-input"
											id="profile-pic-input" accept=".png,.jpg,.jpeg" name="companyLogo" hidden>
										<img class="profile-pic" src="assets/images/profile/user.png" alt="">
									</div>
									<div class="edit-icon-box">
										<img class="icon choose-new-profile-pic" name="companyLogoUrl"
											src="assets/icons/edit.svg" alt="edit">
									</div>
								</div>
							</div>
							<div>
								<span id="companyLogo_err" class="err-text"></span>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyName" id="companyName" class="input-field"
										placeholder="Company Name" required autocomplete="on" value="Cnerzy"> <label
										for="companyName" class="input-label">Company Name<span
											class="required-asterisk">*</span></label> <span id="companyName_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="companyEmail" id="companyEmail" class="input-field"
										placeholder="Company Email" required autocomplete="on" value="user@company.com">
									<label for="companyEmail" class="input-label">Company Email<span
											class="required-asterisk">*</span></label> <span id="companyEmail_err"
										class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyPhone" id="companyPhone" class="input-field"
										placeholder="Phone" required autocomplete="on" maxlength="10"
										value="9026552789"> <label for="companyPhone" class="input-label">Phone<span
											class="required-asterisk">*</span></label> <span id="companyPhone_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyWebsite" id="companyWebsite" class="input-field"
										placeholder="Website" autocomplete="on" value="www.company.com"> <label
										for="companyWebsite" class="input-label">Website</label> <span
										id="companyWebsite_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group select-field-group select-field-group-toggle">
									<select name="companyIndustry" id="companyIndustry"
										class="input-field form-dropdown" required autocomplete="on">
										<option value="" selected>Industry</option>
										<option value="Aerospace">Aerospace</option>
										<option value="Automotive">Automotive</option>
										<option value="Consumer Goods">Consumer Goods</option>
										<option value="Energy">Energy</option>
										<option value="Industrial Machinery">Industrial
											Machinery</option>
										<option value="Others">Others</option>
									</select> <label for="companyIndustry" class="input-label">Select<span
											class="required-asterisk">*</span></label> <span id="companyIndustry_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyLinkedInUrl" id="companyLinkedInUrl"
										class="input-field" placeholder="LinkedIn Profile URL" autocomplete="on"
										value="linkedin.com/in/username"> <label for="companyLinkedInUrl"
										class="input-label">LinkedIn
										Profile URL</label> <span id="companyLinkedInUrl_err" class="err-text"></span>
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
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-company-details','/updateBuyerCompanyDetails')">Save</button>
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
						<input name="addressId" hidden>

						<div class="row row-gap-24">
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="streetAddress" class="input-field"
										placeholder="Street Address" required autocomplete="on"
										value="A-125, Shahpur Jat"> <label for="street_address"
										class="input-label">Street Address<span
											class="required-asterisk">*</span></label> <span id="street_address_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="city" class="input-field" placeholder="City" required
										autocomplete="on" value="Delhi">
									<label for="city" class="input-label">City<span
											class="required-asterisk">*</span></label> <span id="city_err"
										class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="state" class="input-field" placeholder="State" required
										autocomplete="on" value="Delhi">
									<label for="state" class="input-label">State<span
											class="required-asterisk">*</span></label> <span id="state_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<!-- <input type="text" name="country" readonly value="{{$data['country']}}" class="input-field" placeholder="Country" required
                                    autocomplete="on"> -->
									<select name="country" disabled id="country" class="input-field form-dropdown"
										required autocomplete="on">
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
									<button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
										aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-company-address','/updateBuyerCompanyAddressDetails')">Save</button>
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
						<input name="contactPersonId" hidden>
						<h3 class="heading">Contact Person</h3>
						<div class="row row-gap-24">
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonName" id="contactPersonName"
										class="input-field" placeholder="Name" required autocomplete="on"> <label
										for="contactPersonName" class="input-label">Name<span
											class="required-asterisk">*</span></label> <span id="contactPersonName_err"
										class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonDesignation" id="contactPersonDesignation"
										class="input-field" placeholder="Designation" required autocomplete="on"> <label
										for="contactPersonDesignation" class="input-label">Designation<span
											class="required-asterisk">*</span></label> <span
										id="contactPersonDesignation_err" class="err-text"></span>

								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="contactPersonEmail" id="contactPersonEmail"
										class="input-field" placeholder="Email" required autocomplete="on"> <label
										for="contactPersonEmail" class="input-label">Email<span
											class="required-asterisk">*</span></label> <span id="contactPersonEmail_err"
										class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonPhone" id="contactPersonPhone"
										class="input-field" placeholder="Phone" required autocomplete="on"
										maxlength="10"> <label for="contactPersonPhone" class="input-label">Phone<span
											class="required-asterisk">*</span></label> <span id="contactPersonPhone_err"
										class="err-text"></span>

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
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-contact-person','/updateBuyerContactPersonDetails')">Save</button>
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
									<select name="typeOfBusinessEntity" id="typeOfBusinessEntity"
										class="input-field form-dropdown" autocomplete="on">
										<option value="" hidden></option>
										<option value="Sole Proprietorship" selected>Sole
											Proprietorship</option>
										<option value="Partnership">Partnership</option>
										<option value="Private Limited">Private Limited</option>
										<option value="Public Limited">Public Limited</option>
										<option value="LLP">LLP</option>
										<option value="Corporation">Corporation</option>
									</select> <label for="typeOfBusinessEntity" class="input-label">Type
										of Business Entity</label> <span id="typeOfBusinessEntity_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="buisnessRegNumber" id="buisnessRegNumber"
										class="input-field" placeholder="Business Reg. Number(CIN)" autocomplete="on"
										value="U52341MP2022PTC052831"> <label for="buisnessRegNumber"
										class="input-label">Business
										Reg. Number(CIN)</label> <span id="buisnessRegNumber_err"
										class="err-text"></span>
								</div>
							</div>
							<c:choose>
								<c:when test="${country == 'US'}">
									<div class="col-lg-6 col-md-12 col-sm-12 col-12">
										<div class="field-group">
											<input type="text" name="taxIdNumber" id="taxIdNumber" class="input-field"
												placeholder="Tax Id. Number (EIN)" autocomplete="on"
												value="22AAAAA0000A1Z5"> <label for="taxIdNumber"
												class="input-label">Tax Id. Number
												(EIN)</label> <span id="taxIdNumber_err" class="err-text"></span>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-lg-6 col-md-12 col-sm-12 col-12">
										<div class="field-group">
											<input type="text" name="gstNo" id="gstNo" class="input-field"
												placeholder="T" autocomplete="on" value=""> <label for="gstNo"
												class="input-label">Tax Id. Number (GST)</label>
											<span id="taxIdNumber_err" class="err-text"></span>
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
									<button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
										aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-legal-information','/updateBuyerLegalInformation')">Save</button>
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
						<input id="companyBankId" name="companyBankId" hidden> <input id="annualTurnoverId"
							name="annualTurnoverId" hidden>
						<div class="row row-gap-24">
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyBankName" id="companyBankName" class="input-field"
										placeholder="Bank Name" autocomplete="on" value="SBI"> <label
										for="companyBankName" class="input-label">Bank Name</label> <span
										id="companyBankName_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyAccountNumber" id="companyAccountNumber"
										class="input-field" placeholder="Account Number" autocomplete="on"
										value="38845472800"> <label for="companyAccountNumber"
										class="input-label">Account Number</label> <span id="companyAccountNumber_err"
										class="err-text"></span>

								</div>
							</div>


							<c:choose>
								<c:when test="${country == 'IN'}">
									<div class="col-lg-6 col-md-12 col-sm-12 col-12">
										<div class="field-group">
											<input type="text" name="companyIfscCode" id="companyIfscCode"
												class="input-field" placeholder="IFSC Code" autocomplete="on"
												value="SBIN0017333"> <label for="companyIfscCode"
												class="input-label">IFSC Code</label> <span id="companyIfscCode_err"
												class="err-text"></span>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-lg-6 col-md-12 col-sm-12 col-12">
										<div class="field-group">
											<input type="text" name="companyRoutingNumber" id="companyRoutingNumber"
												class="input-field" placeholder="IFSC Code" autocomplete="on"
												value="SBIN0017333">
											<label for="companyRoutingNumber" class="input-label">Routing
												Number</label> <span id="companyRoutingNumber_err"
												class="err-text"></span>
										</div>
									</div>

								</c:otherwise>
							</c:choose>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
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
													style="font-size: 12px; padding: 4px;">USD</span>
											</c:otherwise>
										</c:choose>
									</div>
									<input type="text" name="annualTurnoverValue" id="annualTurnoverValue"
										style="padding-left: 50px;" class="input-field" placeholder="Annual Turnover"
										autocomplete="on" value="13"> <label for="annualTurnoverValue"
										style="left: 50px;" class="input-label">Annual Turnover</label>
								</div>
								<span id="annualTurnoverValue_err" class="err-text"></span>
							</div>

						</div>
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
										aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-financial-information','/updateBuyerBankDetails')">Save</button>
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
									<div class="signature-preview-area" id="companySignature">
										<input id="companySignatureId" hidden> <input type="file" class="file-input"
											id="signature-input" accept=".png,.jpg,.jpeg" name="signature" hidden> <img
											class="img" src="assets/images/profile/signature.png" alt="">
									</div>
									<div class="icon-box">
										<img class="icon choose-new-signature-btn"
											src="assets/images/profile/replace.png" alt="">
									</div>
								</div>
								<span id="signature_err" class="err-text"></span>
							</div>
						</div>
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
										aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-signature','/updateBuyerCompanyDocuments')">Save</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Edit Signature popup ends -->

		<!-- edit-personal-detail popup starts -->
		<div class="modal fade modal-lg custom-edit-modal" id="edit-personal-detail" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="body">
						<h3 class="heading">Personal Details</h3>

						<div class="row row-gap-24">


							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="firstName" class="input-field" placeholder="Company Name"
										required autocomplete="on" value="Cnerzy"> <label for="compnay_name"
										class="input-label">First Name<span class="required-asterisk">*</span></label>
									<span id="company_name_err" class="err-text"></span>
								</div>
							</div>


							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="lastName" class="input-field" placeholder="Company Email"
										required autocomplete="on" value="user@company.com"> <label for="company_email"
										class="input-label">Last Name<span class="required-asterisk">*</span></label>
									<span id="company_email_err" class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="personalEmail" class="input-field"
										placeholder="Company Email" required autocomplete="on" value="user@company.com">
									<label for="company_email" class="input-label">Email Address<span
											class="required-asterisk">*</span></label> <span id="company_email_err"
										class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<!-- <input type="text" name="country" readonly value="{{$data['country']}}" class="input-field" placeholder="Country" required
                                    autocomplete="on"> -->
									<select name="userCountry" disabled id="" class="input-field form-dropdown" required
										autocomplete="on">
										<option value="india" selected>India</option>
										<option value="us">US</option>
									</select>
									<!-- <label for="country" class="input-label">Country</label> -->
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
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-personal-detail','/updateBuyerPersonalDetails')">Save</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- edit-personal-detail popup ends -->


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
									<div class="profile-pic-preview-area" id="ModalcompanyLogoUrl">
										<input name="companyLogoId" hidden> <input type="file" class="file-input"
											id="profile-pic-input" accept=".png,.jpg,.jpeg" name="companyLogo" hidden>
										<img class="profile-pic" src="assets/images/profile/user.png" alt="">
									</div>
									<div class="edit-icon-box">
										<img class="icon choose-new-profile-pic" name="companyLogoUrl"
											src="assets/icons/edit.svg" alt="edit">
									</div>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyName" class="input-field" placeholder="Company Name"
										required autocomplete="on" value="Cnerzy"> <label for="compnay_name"
										class="input-label">Company Name<span class="required-asterisk">*</span></label>
									<span id="company_name_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="companyEmail" class="input-field"
										placeholder="Company Email" required autocomplete="on" value="user@company.com">
									<label for="company_email" class="input-label">Company Email<span
											class="required-asterisk">*</span></label> <span id="company_email_err"
										class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyPhone" class="input-field" placeholder="Phone"
										required autocomplete="on" maxlength="10">
									<label for="company_phone" class="input-label">Phone<span
											class="required-asterisk">*</span></label> <span id="company_phone_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyWebsite" class="input-field" placeholder="Website"
										autocomplete="on" value="www.company.com">
									<label for="company_website" class="input-label">Website</label>
									<span id="company_website_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group select-field-group select-field-group-toggle">
									<select name="companyIndustry" id="industry" class="input-field form-dropdown"
										required autocomplete="on">
										<option value="" hidden></option>
										<option value="Automotive">Automotive</option>
										<option value="Aerospace" selected>Aerospace</option>
										<option value="Consumer Goods">Consumer Goods</option>
										<option value="Electronics & Communications">Electronics
											& Communications</option>
										<option value="Medical Equipment">Medical Equipment</option>
										<option value="Industrial Machinery">Industrial
											Machinery</option>
										<option value="Others">Others</option>
									</select> <label for="industry" class="input-label">Industry<span
											class="required-asterisk">*</span></label> <span id="industry_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyLinkedInUrl" class="input-field"
										placeholder="LinkedIn Profile URL" autocomplete="on"
										value="linkedin.com/in/username"> <label for="linkedin_url"
										class="input-label">LinkedIn Profile
										URL</label> <span id="linkedin_url_err" class="err-text"></span>
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
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-company-details','/updateBuyerCompanyDetails')">Save</button>
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
						<input id="addressId" name="addressId" hidden>

						<div class="row row-gap-24">
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="streetAddress" class="input-field"
										placeholder="Street Address" required autocomplete="on"
										value="A-125, Shahpur Jat"> <label for="street_address"
										class="input-label">Street Address<span
											class="required-asterisk">*</span></label> <span id="street_address_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="city" class="input-field" placeholder="City" required
										autocomplete="on" value="Delhi">
									<label for="city" class="input-label">City<span
											class="required-asterisk">*</span></label> <span id="city_err"
										class="err-text"></span>
								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="state" class="input-field" placeholder="State" required
										autocomplete="on" value="Delhi">
									<label for="state" class="input-label">State<span
											class="required-asterisk">*</span></label> <span id="state_err"
										class="err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<!-- <input type="text" name="country" readonly value="{{$data['country']}}" class="input-field" placeholder="Country" required
                                    autocomplete="on"> -->
									<select name="country" disabled id="country" class="input-field form-dropdown"
										required autocomplete="on">
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
									<button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
										aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-company-address','/updateBuyerCompanyAddressDetails')">Save</button>
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
						<input name="contactPersonId" id="contactPersonId" hidden>
						<h3 class="heading">Contact Person</h3>
						<div class="row row-gap-24">
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonName" class="input-field" placeholder="Name"
										required autocomplete="on" value="Ashok Singh"> <label for="contact_person_name"
										class="input-label">Name<span class="required-asterisk">*</span></label>
									<span id="contact_person_name_err" class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonDesignation" class="input-field"
										placeholder="Designation" required autocomplete="on" value="Developer"> <label
										for="contact_person_designation" class="input-label">Designation<span
											class="required-asterisk">*</span></label> <span
										id="contact_person_designation_err" class="err-text"></span>

								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="contactPersonEmail" class="input-field"
										placeholder="Email" required autocomplete="on" value="ashok.s@brainydx.com">
									<label for="contact_person_email" class="input-label">Email<span
											class="required-asterisk">*</span></label> <span
										id="contact_person_email_err" class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonPhone" class="input-field" placeholder="Phone"
										required autocomplete="on" value="9026552789"> <label for="contact_person_phone"
										class="input-label">Phone<span class="required-asterisk">*</span></label> <span
										id="contact_person_phone_err" class="err-text"></span>

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
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-contact-person','/updateBuyerContactPersonDetails')">Save</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Edit Contact Person popup ends -->

		<!-- 	<!-- Edit Legal Information popup starts -->
		<!-- 	<div class="modal fade modal-lg custom-edit-modal" -->
		<!-- 		id="edit-legal-information" aria-hidden="true" -->
		<!-- 		aria-labelledby="exampleModalToggleLabel2" tabindex="-1" -->
		<!-- 		data-keyboard="false" data-backdrop="static"> -->
		<!-- 		<div class="modal-dialog modal-dialog-centered"> -->
		<!-- 			<div class="modal-content"> -->
		<!-- 				<div class="body"> -->


		<!-- 					<h3 class="heading">Legal Information</h3> -->
		<!-- 					<div class="row row-gap-24"> -->
		<!-- 						<div class="col-lg-6 col-md-12 col-sm-12 col-12"> -->
		<!-- 							<div class="field-group select-field-group"> -->
		<!-- 								<select name="typeOfBusinessEntity" id="type_of_business_entity" -->
		<!-- 									class="input-field form-dropdown" autocomplete="on"> -->
		<!-- 									<option value="" hidden></option> -->
		<!-- 									<option value="Sole Proprietorship" selected>Sole -->
		<!-- 										Proprietorship</option> -->
		<!-- 									<option value="Partnership">Partnership</option> -->
		<!-- 									<option value="Private Limited">Private Limited</option> -->
		<!-- 									<option value="Public Limited">Public Limited</option> -->
		<!-- 									<option value="LLP">LLP</option> -->
		<!-- 									<option value="Corporation">Corporation</option> -->
		<!-- 								</select> <label for="type_of_business_entity" class="input-label">Type -->
		<!-- 									of Business Entity</label> <span id="type_of_business_entity_err" -->
		<!-- 									class="err-text"></span> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 						<div class="col-lg-6 col-md-12 col-sm-12 col-12"> -->
		<!-- 							<div class="field-group"> -->
		<!-- 								<input type="text" name="buisnessRegNumber" class="input-field" -->
		<!-- 									placeholder="Business Reg. Number(CIN)" autocomplete="on" -->
		<!-- 									value="U52341MP2022PTC052831"> <label -->
		<!-- 									for="business_reg_number" class="input-label">Business -->
		<!-- 									Reg. Number(CIN)</label> <span id="business_reg_number_err" -->
		<!-- 									class="err-text"></span> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<%-- <c:choose> --%>
			<%-- <c:when test="${country == 'US'}"> --%>
				<!-- 								<div class="col-lg-6 col-md-12 col-sm-12 col-12"> -->
				<!-- 									<div class="field-group"> -->
				<!-- 										<input type="text" name="taxIdNumber" id="taxIdNumber" -->
				<!-- 											class="input-field" placeholder="Tax Id. Number (EIN)" -->
				<!-- 											autocomplete="on" value="22AAAAA0000A1Z5"> <label -->
				<!-- 											for="tax_id_number" class="input-label">Tax Id. -->
				<!-- 											Number (EIN)</label> <span id="tax_id_number_err" class="err-text"></span> -->
				<!-- 									</div> -->
				<!-- 								</div> -->
				<%-- </c:when> --%>
					<%-- <c:otherwise> --%>
						<!-- 								<div class="col-lg-6 col-md-12 col-sm-12 col-12"> -->
						<!-- 									<div class="field-group"> -->
						<!-- 										<input type="text" name="gstNo" id="taxIdNumber" -->
						<!-- 											class="input-field" placeholder="Tax Id. Number (EIN)" -->
						<!-- 											autocomplete="on" value="22AAAAA0000A1Z5"> <label -->
						<!-- 											for="tax_id_number" class="input-label">Tax Id. -->
						<!-- 											Number (GST)</label> <span id="tax_id_number_err" class="err-text"></span> -->
						<!-- 									</div> -->
						<!-- 								</div> -->
						<%-- </c:otherwise> --%>
							<%-- </c:choose> --%>
								<!-- 					</div> -->
								<!-- 				</div> -->
								<!-- 			</div> -->
								<!-- 			<div class="footer"> -->
								<!-- 				<div class="row"> -->
								<!-- 					<div class="col-12 d-flex justify-content-end"> -->
								<!-- 						<div class="div d-block d-sm-flex space-x-2 space-sm-x-0"> -->
								<!-- 							<button class="btn-style-4 btn-cancel" type="button" -->
								<!-- 								data-bs-dismiss="modal" aria-label="Close">Cancel</button> -->
								<!-- 							<button class="btn-style-1 btn-save" type="button" -->
								<!-- 								onclick="save('#edit-signature','/updateBuyerCompanyDocuments')">Save</button> -->
								<!-- 						</div> -->
								<!-- 					</div> -->
								<!-- 				</div> -->
								<!-- 			</div> -->
								<!-- 		</div> -->
								<!-- 	</div> -->
								<!-- 	</div> -->
								<!-- 	<!-- Edit Signature popup ends -->

								<!-- Profile pic popup starts-->
								<div class="modal fade custom-profile-pic-view-modal modal-sm" id="view-profile-pic"
									aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
									data-keyboard="false" data-backdrop="static">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<span class="close-btn" data-bs-dismiss="modal"
												aria-label="Close">&times;</span>
											<div id="singleCompanyLogo">

												<img class="modal-img" src="assets/images/profile/user.png"
													alt="Success Animation">
											</div>

										</div>
									</div>
								</div>
								<!-- Profile pic popup ends-->


								<!-- Thank you popup starts -->
								<div class="modal fade custom-thank-you-modal modal-lg" id="thank-you-modal"
									aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
									data-keyboard="false" data-backdrop="static">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<img class="modal-img mb-16" src="assets/icons/Succeess Animation.svg"
												alt="Success Animation">
											<h2 class="modal-heading text-center mb-8">Thank You!</h2>
											<p class="modal-para text-center">You've successfully completed
												your onboarding process. Cnerzy will review your profile in 1-2
												days.</p>
										</div>
									</div>
								</div>
								<!-- Thank you popup ends -->

								<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
								<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
								<script
									src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

								<script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/toastr.min.js"></script>
								<script>
									console.log("${role}", "${country}")
									var userListJson;
									var role = "${role}"
									var isApproved = "${isApproved}"
									console.log(isApproved)
									var contextPath = "${pageContext.request.contextPath}"

									var rigion = "${country}"
									$(document).ready(function () {
										console.log("ready!");
										firstCall()
										if (isApproved === "true") {
											$(".icon[alt='edit']").hide();
											$("#notice").show();
										}

									});

									//===================== validation functions starts here=====================
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

									// for checking required fields modal's ID-wise
									function checkRequiredFields(inputs, modalId) {
										let allFilled = true;
										let firstRequiredField = null;
										for (let input of inputs) {
											if (modalId == '#edit-personal-detail') {
												if (input.name == 'firstName' && input.value.trim() == '') {
													allFilled = false;
													showError('firstName_err', 'First Name is Required')
												} else if (input.name == 'personalEmail' && input.value.trim() == '') {
													allFilled = false;
													showError('personalEmail_err', 'Company Email is Required')
												}
											}
											else if (modalId == '#edit-company-details') {
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
													console.log('checkRequiredFields for company Ind')
													console.log('select or input', input)
													allFilled = false;
													showError('companyIndustry_err', 'Industry is Required')
												}
											}
											else if (modalId == '#edit-company-address') {
												if (input.name == 'streetAddress' && input.value.trim() == '') {
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
												}
											}
											else if (modalId == '#edit-contact-person') {
												if (input.name == 'contactPersonName' && input.value.trim() == '') {
													allFilled = false;
													showError('contactPersonName_err', 'Name is Required')
												}
												else if (input.name == 'contactPersonDesignation' && input.value.trim() == '') {
													allFilled = false;
													showError('contactPersonDesignation_err', 'Designation is Required')
												} else if (input.name == 'contactPersonEmail' && input.value.trim() == '') {
													allFilled = false;
													showError('contactPersonEmail_err', 'Email is Required')
												} else if (input.name == 'contactPersonPhone' && input.value.trim() == '') {
													allFilled = false;
													showError('contactPersonPhone_err', 'Phone Number is Required')
												}
											}
											else if (false) {
												if (input.name == 'companySignature' && !input.files[0]) {
													allFilled = false;
													showError('companySignature_err', 'Signature is Required')
												} else if (input.name == 'declaration' && input.checked == false) {
													allFilled = false;
													showError('declaration_err', 'Please check declaration')
												} else if (input.name == 'terms_and_conditions' && input.checked == false) {
													allFilled = false;
													showError('terms_and_conditions_err', 'Please check terms and conditions')
												}
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

									//---------for personal Details----------
									var personalDetailsModal = document.querySelector('#edit-personal-detail');
									var personalDetailsInputs = personalDetailsModal.querySelectorAll('input,select');
									var personalDetailsErrorsArray = []
									for (let input of personalDetailsInputs) {
										input.addEventListener('change', function () {
											validatePersonalDetails(input)
										})
									}
									function validatePersonalDetails(input) {
										let errorMessage = '';
										if (input.name == 'firstName') {
											if (input.value != '') {
												const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
												if (!regex.test(input.value.trim())) {
													if (!personalDetailsErrorsArray.includes(input.name)) {
														personalDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid First Name';
													showError('firstName_err', errorMessage)
												} else {
													personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })

													showError('firstName_err', '')
												}
											} else {
												personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
												showError('firstName_err', '')
											}
										} else if (input.name == 'lastName') {
											if (input.value != '') {
												const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
												if (!regex.test(input.value.trim())) {
													if (!personalDetailsErrorsArray.includes(input.name)) {
														personalDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Last Name';
													showError('lastName_err', errorMessage)
												} else {
													personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })

													showError('lastName_err', '')
												}
											} else {
												personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
												showError('lastName_err', '')
											}
										}
										else if (input.name == 'personalEmail') {
											if (input.value != '') {
												const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
												if (input.value.trim() == '' || !regex.test(input.value.trim())) {
													if (!personalDetailsErrorsArray.includes(input.name)) {
														personalDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'Enter Company Email';
													showError('personalEmail_err', errorMessage)
												} else {
													personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
													showError('personalEmail_err', '')
												}
											} else {
												personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
												showError('personalEmail_err', '')
											}
										}

										console.log('errors-', personalDetailsErrorsArray)
									}

									//---------for company Details----------
									var companyDetailsModal = document.querySelector('#edit-company-details');
									var companyDetailsInputs = companyDetailsModal.querySelectorAll('input,select');
									var companyDetailsErrorsArray = []
									for (let input of companyDetailsInputs) {
										input.addEventListener('change', function () {
											validateCompanyDetails(input)
										})
									}
									function validateCompanyDetails(input) {
										let errorMessage = '';
										if (input.name == 'companyLogo') {
											if (input.files[0]) {
												let res = validateFileSize(input)
												if (!res) {
													if (!companyDetailsErrorsArray.includes(input.name)) {
														companyDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'File size is too large';
													showError('companyLogo_err', errorMessage)
												} else {
													companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
													showError('companyLogo_err', '')
												}
											} else {
												companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyLogo_err', '')
											}
										}
										else if (input.name == 'companyName') {
											if (input.value != '') {
												const regex = /^[A-Za-z0-9 ]{3,}$/;
												if (input.value.trim() == '' || !regex.test(input.value.trim())) {
													if (!companyDetailsErrorsArray.includes(input.name)) {
														companyDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid company Name';
													showError('companyName_err', errorMessage)
												} else {
													showError('companyName_err', '')
													companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
												}
											} else {
												showError('companyName_err', '')
												companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
											}
										} else if (input.name == 'companyEmail') {
											if (input.value != '') {
												const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
												if (input.value.trim() == '' || !regex.test(input.value.trim())) {
													if (!companyDetailsErrorsArray.includes(input.name)) {
														companyDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'Enter Company Email';
													showError('companyEmail_err', errorMessage)
												} else {
													companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
													showError('companyEmail_err', '')
												}
											} else {
												companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyEmail_err', '')
											}
										} else if (input.name == 'companyPhone') {
											if (input.value != '') {
												const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
												if (!regex.test(input.value.trim())) {
													if (!companyDetailsErrorsArray.includes(input.name)) {
														companyDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Phone Number';
													showError('companyPhone_err', errorMessage)
												} else {
													companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
													showError('companyPhone_err', '')
												}
											} else {
												companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyPhone_err', '')
											}
										} else if (input.name == 'companyWebsite') {
											if (input.value != '') {
												const regex = /^(https?:\/\/)?([a-zA-Z0-9-]+\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\/\S*)?$/;
												if (!regex.test(input.value.trim())) {
													if (!companyDetailsErrorsArray.includes(input.name)) {
														companyDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Website Url';
													showError('companyWebsite_err', errorMessage)
												} else {
													companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
													showError('companyWebsite_err', '')
												}
											} else {
												companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyWebsite_err', '')
											}
										} else if (input.name == 'companyIndustry') {
											if (input.value != '') {
												const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
												// const regex = /^(?=.*[A-Za-z])[A-Za-z ]{2,}$/;
												if (!regex.test(input.value.trim().trim())) {
													if (!companyDetailsErrorsArray.includes(input.name)) {
														companyDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Industry Name';
													showError('companyIndustry_err', errorMessage)
												} else {
													companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
													showError('companyIndustry_err', '')
												}
											} else {
												companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyIndustry_err', '')
											}
										}
										else if (input.name == 'companyLinkedInUrl') {
											if (input.value != '') {
												// const regex = /^(https?:\/\/)?(www\.)?linkedin\.com\/(?:in|pub)\/[a-zA-Z0-9_-]+\/?$/;
												const regex = /^https:\/\/(www\.)?linkedin\.com\/(in|company)\/[a-zA-Z0-9-]+\/?$/
												if (!regex.test(input.value.trim())) {
													if (!companyDetailsErrorsArray.includes(input.name)) {
														companyDetailsErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid LinkedIn Url';
													showError('companyLinkedInUrl_err', errorMessage)
												} else {
													companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
													showError('companyLinkedInUrl_err', '')
												}
											} else {
												companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyLinkedInUrl_err', '')
											}
										}
										else if (input.name == 'companyLogo') {
											if (input.value != '') {
												// let res = validateFileSize(input)
												// console.log(input, res)
												// if (!res) {
												//     errorMessage = 'File size is too large';
												//     showError('companyLogo_err', errorMessage)
												// } else {
												companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
												//     errorMessage = ''
												//     showError('companyLogo_err', '')
												// }
											}
										}

										console.log('errors-', companyDetailsErrorsArray)
									}

									//---------for company Address----------
									var companyAddressModal = document.querySelector('#edit-company-address');
									var companyAddressInputs = companyAddressModal.querySelectorAll('input,select');
									var companyAddressErrorsArray = []
									for (let input of companyAddressInputs) {
										input.addEventListener('change', function () {
											validateCompanyAddress(input)
										})
									}
									function validateCompanyAddress(input) {
										let errorMessage = '';

										if (input.name == 'streetAddress') {
											if (input.value != '') {
												const regex = /^[\w\s\d#,\-.]+$/;
												if (!regex.test(input.value.trim())) {
													if (!companyAddressErrorsArray.includes(input.name)) {
														companyAddressErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Street Name';
													showError('streetAddress_err', errorMessage)
												} else {
													companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
													showError('streetAddress_err', '')
												}
											} else {
												companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
												showError('streetAddress_err', '')
											}
										} else if (input.name == 'city') {
											if (input.value != '') {
												const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
												if (!regex.test(input.value.trim())) {
													if (!companyAddressErrorsArray.includes(input.name)) {
														companyAddressErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid City Name';
													showError('city_err', errorMessage)
												} else {
													companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
													showError('city_err', '')
												}
											} else {
												companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
												showError('city_err', '')
											}
										} else if (input.name == 'state') {
											if (input.value != '') {
												const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
												if (!regex.test(input.value.trim())) {
													if (!companyAddressErrorsArray.includes(input.name)) {
														companyAddressErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid State Name';
													showError('state_err', errorMessage)
												} else {
													companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
													showError('state_err', '')
												}
											} else {
												companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
												showError('state_err', '')
											}
										} else if (input.name == 'pincode') {
											if (input.value != '') {
												if (document.querySelector('select[name="country"]').value === "US") {
													var regex = /^\d{5}$/
												} else {
													var regex = /^\d{6}$/
												}
												if (!regex.test(input.value.trim())) {
													if (!companyAddressErrorsArray.includes(input.name)) {
														companyAddressErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Pincode';
													showError('pincode_err', errorMessage)
												} else {
													companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
													showError('pincode_err', '')
												}
											} else {
												companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
												showError('pincode_err', '')
											}
										}

										console.log('errors-', companyAddressErrorsArray)
									}

									//---------for contact Person----------
									var contactPersonModal = document.querySelector('#edit-contact-person');
									var contactPersonInputs = contactPersonModal.querySelectorAll('input,select');
									var contactPersonErrorsArray = []
									for (let input of contactPersonInputs) {
										input.addEventListener('change', function () {
											validateContactPersonDetails(input)
										})
									}
									function validateContactPersonDetails(input) {
										let errorMessage = '';

										if (input.name == 'contactPersonName') {
											if (input.value != '') {
												const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
												if (!regex.test(input.value.trim())) {
													if (!contactPersonErrorsArray.includes(input.name)) {
														contactPersonErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Name';
													showError('contactPersonName_err', errorMessage)
												} else {
													contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
													showError('contactPersonName_err', '')
												}
											} else {
												contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
												showError('contactPersonName_err', '')
											}
										} else if (input.name == 'contactPersonDesignation') {
											if (input.value != '') {
												const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
												if (!regex.test(input.value.trim())) {
													if (!contactPersonErrorsArray.includes(input.name)) {
														contactPersonErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Designation';
													showError('contactPersonDesignation_err', errorMessage)
												} else {
													contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })

													showError('contactPersonDesignation_err', '')
												}
											} else {
												contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
												showError('contactPersonDesignation_err', '')
											}
										} else if (input.name == 'contactPersonEmail') {
											if (input.value != '') {
												const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
												if (!regex.test(input.value.trim().trim())) {
													if (!contactPersonErrorsArray.includes(input.name)) {
														contactPersonErrorsArray.push(input.name);
													}
													errorMessage = 'Enter Company Email';
													showError('contactPersonEmail_err', errorMessage)
												} else {
													contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })

													showError('contactPersonEmail_err', '')
												}
											} else {
												contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
												showError('contactPersonEmail_err', '')
											}
										} else if (input.name == 'contactPersonPhone') {
											if (input.value != '') {
												const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
												if (!regex.test(input.value.trim())) {
													if (!contactPersonErrorsArray.includes(input.name)) {
														contactPersonErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Phone Number';
													showError('contactPersonPhone_err', errorMessage)
												} else {
													contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })

													showError('contactPersonPhone_err', '')
												}
											} else {
												contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
												showError('contactPersonPhone_err', '')
											}

										}

										console.log('errors-', contactPersonErrorsArray)
									}

									//---------for legal Information----------
									var legalInformationModal = document.querySelector('#edit-legal-information');
									var legalInformationInputs = legalInformationModal.querySelectorAll('input,select');
									var legalInformationErrorsArray = []
									for (let input of legalInformationInputs) {
										input.addEventListener('change', function () {
											validateLegalInfoDetails(input)
										})
									}
									function validateLegalInfoDetails(input) {
										let errorMessage = '';

										if (input.name == 'companyType') {
											if (input.value != '') {
												const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
												if (!regex.test(input.value.trim())) {
													if (!legalInformationErrorsArray.includes(input.name)) {
														legalInformationErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Business Entity';
													showError('companyType_err', errorMessage)
												} else {
													legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })

													showError('companyType_err', '')
												}
											} else {
												legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyType_err', '')
											}
										} else if (input.name == 'buisnessRegNumber') {
											if (input.value != '') {
												const regex = /^(?=.*[A-Z])(?=.*\d)[A-Z0-9]{21}$/;
												if (!regex.test(input.value.toUpperCase().trim())) {
													if (!legalInformationErrorsArray.includes(input.name)) {
														legalInformationErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Business Registration Number';
													showError('buisnessRegNumber_err', errorMessage)
												} else {
													legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
													showError('buisnessRegNumber_err', '')
												}
											} else {
												legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
												showError('buisnessRegNumber_err', '')
											}
											// const regex = /^(?=.*[A-Z])[A-Z0-9]{21}$/;
										} else if (document.querySelector('select[name="country"]').value === "US") {
											if (input.name == 'taxIdNumber') {

												if (input.value != '') {

													var regex = /^\d{2}-\d{7}$/;

													if (!regex.test(input.value.toUpperCase().trim())) {
														if (!legalInformationErrorsArray.includes(input.name)) {
															legalInformationErrorsArray.push(input.name);
														}

														errorMessage = 'Invalid Tax Id Number';

														showError('taxIdNumber_err', errorMessage)
													} else {
														legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
														showError('taxIdNumber_err', '')
													}
												} else {
													legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
													showError('taxIdNumber_err', '')
												}

											}
										} else if (rigion === "IN") {
											if (input.name == 'gstNo') {


												if (input.value != '') {
													var regex = /^([0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1})$/;  //for GSTIN(India)
													if (!regex.test(input.value.toUpperCase().trim())) {
														if (!legalInformationErrorsArray.includes(input.name)) {
															legalInformationErrorsArray.push(input.name);
														}

														errorMessage = 'Invalid GST Number';

														showError('taxIdNumber_err', errorMessage)
													} else {
														legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
														showError('taxIdNumber_err', '')
													}
												} else {
													legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
													showError('taxIdNumber_err', '')
												}

											}
										}

										console.log('errors-', legalInformationErrorsArray)
									}


									//---------for financial Information----------
									var financialInformationModal = document.querySelector('#edit-financial-information');
									var financialInformationInputs = financialInformationModal.querySelectorAll('input,select');
									var financialInformationErrorsArray = []
									for (let input of financialInformationInputs) {
										input.addEventListener('change', function () {
											validateFinancialInfoDetails(input)
										})
									}
									function validateFinancialInfoDetails(input) {
										let errorMessage = '';

										if (input.name == 'companyBankName') {
											if (input.value != '') {
												const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
												if (!regex.test(input.value.trim())) {
													if (!financialInformationErrorsArray.includes(input.name)) {
														financialInformationErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Bank Name';
													showError('companyBankName_err', errorMessage)
												} else {
													financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })

													showError('companyBankName_err', '')
												}
											} else {
												financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyBankName_err', '')
											}
										}
										else if (input.name == 'companyAccountNumber') {
											if (input.value != '') {
												const regex = /^\d{1,20}$/;
												if (!regex.test(input.value.trim())) {
													if (!financialInformationErrorsArray.includes(input.name)) {
														financialInformationErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Account Number';
													showError('companyAccountNumber_err', errorMessage)
												} else {
													financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })
													showError('companyAccountNumber_err', '')
												}
											}
											else {
												financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyAccountNumber_err', '')
											}
										}
										else if (input.name == 'companyIfscCode') {
											if (input.value != '') {
												const regex = /^[A-Z]{4}0[A-Z0-9]{6}$/;
												if (!regex.test(input.value.toUpperCase().trim())) {
													if (!financialInformationErrorsArray.includes(input.name)) {
														financialInformationErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid IFSC Code';
													showError('companyIfscCode_err', errorMessage)
												} else {
													financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })
													showError('companyIfscCode_err', '')
												}
											} else {
												financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyIfscCode_err', '')
											}

										} else if (input.name == 'companyRoutingNumber') {
											if (input.value != '') {
												const regex = /^\d{9}$/;
												if (!regex.test(input.value)) {
													if (!financialInformationErrorsArray.includes(input.name)) {
														financialInformationErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Routing Number';
													showError('companyRoutingNumber_err', errorMessage)
												} else {
													financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })
													showError('companyRoutingNumber_err', '')
												}
											} else {
												financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })
												showError('companyRoutingNumber_err', '')
											}
										} else if (input.name == 'annualTurnoverValue') {
											if (input.value != '') {
												const regex = /^\d+$/;
												if (!regex.test(input.value.trim())) {
													if (!financialInformationErrorsArray.includes(input.name)) {
														financialInformationErrorsArray.push(input.name);
													}
													errorMessage = 'Invalid Turnover';
													showError('annualTurnoverValue_err', errorMessage)
												} else {
													financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })
													showError('annualTurnoverValue_err', '')
												}
											} else {
												financialInformationErrorsArray = financialInformationErrorsArray.filter(function (e) { return e !== input.name })
												showError('annualTurnoverValue_err', '')
											}

										}

										console.log('errors-', financialInformationErrorsArray)
									}


									//---------for Signature----------

									var signatureModal = document.querySelector('#edit-signature');
									var signatureInputs = signatureModal.querySelectorAll('input');
									var signatureUploadErrorsArray = []
									for (let input of signatureInputs) {
										input.addEventListener('change', function () {
											validateUploadSignature(input)
										})
									}
									function validateUploadSignature(input) {
										let errorMessage = '';

										if (input.name == 'signature') {
											if (input.files[0]) {
												let res = validateFileSize(input)
												if (!res) {
													if (!signatureUploadErrorsArray.includes(input.name)) {
														signatureUploadErrorsArray.push(input.name);
													}
													errorMessage = 'File size is too large';
													showError('signature_err', errorMessage)
												} else {
													signatureUploadErrorsArray = signatureUploadErrorsArray.filter(function (e) { return e !== input.name })
													showError('signature_err', '')
												}
											} else {
												signatureUploadErrorsArray = signatureUploadErrorsArray.filter(function (e) { return e !== input.name })
												showError('signature_err', '')
											}
										}

										console.log('errors-', signatureUploadErrorsArray)
									}


									//===================== validation functions ends here=====================


									function firstCall() {


										var myHeaders = new Headers();
										myHeaders.append("Content-Type", "application/json");


										var requestOptions = {
											method: "GET",
											headers: myHeaders,
											redirect: "follow"
										};

										fetch(contextPath + "/getBuyerDetails?companyId=", requestOptions)
											.then(response => response.json())  // Parse the response as JSON
											.then(result => {
												console.log(result);

												RequirementList = result.data
												addToId(result.data)
												if (result.data.companySignatureUrl) {
													// Assuming relevantDocumentUrl is the id of the element
													const companySignatureUrl = document.getElementById("companySignatureUrl");
													const companySignature = document.getElementById("companySignature")
													forSignature(companySignature, result.data.companySignatureUrl)

													forSignature(companySignatureUrl, result.data.companySignatureUrl)
													// Function to check if the URL points to a PDF

												}
												if (result.data.companyLogoUrl) {
													// Assuming relevantDocumentUrl is the id of the element
													const companyLogoUrl = document.getElementById("companyLogoUrl");
													const ModalcompanyLogoUrl = document.getElementById("ModalcompanyLogoUrl");
													const singleCompanyLogo = document.getElementById("singleCompanyLogo")


													forSignature(companyLogoUrl, result.data.companyLogoUrl)
													forSignature(ModalcompanyLogoUrl, result.data.companyLogoUrl)
													forSignature(singleCompanyLogo, result.data.companyLogoUrl)


													// Function to check if the URL points to a PDF

												}

											})
											.catch(error => console.error("Error:", error));
									}

									function addToId(rowData) {
										Object.keys(rowData).forEach(function (key) {
											var div = $("#profile [name='" + key + "']");



											// Get the value from rowData, default to "" if not present
											var value = rowData[key] ? rowData[key] : "";
											if (key === "personalEmailVerified") {
												if (value === true) {
													$(".verification-status").addClass("green");
													$(".verification-status").html("verified");
												}

											}
											if (key === "companyLogoUrl" || key === "companySignatureUrl" || key === "companyLogoId" || key === "companySignatureId") {
												value = rowData[key] ? rowData[key] : "";
												if (key === "companyLogoId") {
													$("#companyLogoId").val(value);
												}
												if (key === "companySignatureId") {
													$("#companySignatureId").val(value);
												}
											} else if (!div.length) {
												if (key === "addressId" || key === "companyBankId" || key === "contactPersonId" || key === "annualTurnoverId") {
													div = $(".modal [name='" + key + "']");
													if (div.length) {
														div.html(value);
													}
												}
												return;
											} else {
												div.html(value);

											}
											var inputs = document.querySelectorAll('.custom-edit-modal input[name="' + key + '"]');
											var selects = document.querySelectorAll('.custom-edit-modal select[name="' + key + '"]');
											// console.log(selects)

											// Update the value of the matching input elements

											inputs.forEach(input => {
												input.value = value;
											});

											selects.forEach(select => {
												// Remove disabled attribute temporarily
												const wasDisabled = select.disabled;
												if (wasDisabled) {
													select.disabled = false;
												}

												let optionFound = false;
												Array.from(select.options).forEach(option => {
													if (option.value === value) {
														option.selected = true;
														optionFound = true;
													}
												});


												// If the option is not found, add a new one with the value and select it
												if (!optionFound) {
													const newOption = new Option(value, value, true, true);
													select.add(newOption);
												}

												// Restore disabled attribute if it was previously set
												if (wasDisabled) {
													select.disabled = true;
												}
											});
										})
									}

									function save(parentDivId, url) {
										var finalData = {};
										// Get all input, select, and textarea elements from the parent div
										var inputs = $(parentDivId).find('input, select, textarea');

										// Iterate through the inputs to find the one with ID "profile-pic-input"

										// Check if any inputs were found
										if (inputs.length === 0) {
											console.error("No input or select elements found within the parent div.");
											return;
										}
										// Check if the specific div with id 'edit{key}' exists

										// validate here first
										let error;
										if (parentDivId == '#edit-personal-detail') {
											let isRequiredErr = checkRequiredFields(personalDetailsInputs, parentDivId)
											if (!isRequiredErr || personalDetailsErrorsArray.length != 0) {
												error = true
											}
										} else if (parentDivId == '#edit-company-details') {
											let isRequiredErr = checkRequiredFields(companyDetailsInputs, parentDivId)
											if (!isRequiredErr || companyDetailsErrorsArray.length != 0) {
												error = true
											}
										}
										else if (parentDivId == '#edit-company-address') {
											let isRequiredErr = checkRequiredFields(companyAddressInputs, parentDivId)
											if (!isRequiredErr || companyAddressErrorsArray.length != 0) {
												error = true
											}
										} else if (parentDivId == '#edit-contact-person') {
											let isRequiredErr = checkRequiredFields(contactPersonInputs, parentDivId)
											if (!isRequiredErr || contactPersonErrorsArray.length != 0) {
												error = true
											}
										} else if (parentDivId == '#edit-legal-information') {
											if (legalInformationErrorsArray.length != 0) {
												error = true
											}
										} else if (parentDivId == '#edit-financial-information') {
											if (financialInformationErrorsArray.length != 0) {
												error = true
											}
										} else if (parentDivId == '#edit-signature') {
											if (signatureUploadErrorsArray.length != 0) {
												error = true
											}
										}

										if (error) {
											return; //no API call if found true(i.e Some Required fields are empty)
										}

										// Iterate over each input element
										inputs.each(function () {
											// Get the input element
											var input = $(this);
											var key = input.attr('name'); // Get the name of the input element
											var value = input.val(); // Get the value of the input element


											if (key === "companyBankId") {

												value = input.text() == "" ? "" : input.text();
											}
											if (key === "annualTurnoverId") {

												value = input.text() == "" ? "" : input.text();
											} if (key === "addressId") {

												value = input.text() == "" ? "" : input.text();
											}
											if (key === "contactPersonId") {

												value = input.text() == "" ? "" : input.text();
											} if (key === "companyLogo" || key === "companyLogoId") {
												return
											}

											finalData[key] = value;



										});
										console.log(finalData)

										var formData = new FormData();
										for (var key in finalData) {
											if (finalData.hasOwnProperty(key)) {
												formData.append(key, finalData[key]);
											}
										}
										if (parentDivId === "#edit-company-details") {
											// Select the image element within the modal
											var companyLogoInput = $("#ModalcompanyLogoUrl input[type='file']");
											var companyLogoIdInput = $("#ModalcompanyLogoUrl input[name='companyLogoId']");
											const image = companyLogoInput[0].files[0];
											const companyLogoId = companyLogoIdInput.val(); // Get the value of the input with id 'ModalcompanyLogoId'
											if (image) {
												// Create a new FormData object
												var formData = new FormData();
												formData.append('companyLogo', image); // Append the selected file
												formData.append('companyLogoId', companyLogoId); // Append the value of the input


											}

											// Optional: You can now use 'formData' to send via fetch or XMLHttpRequest
											console.log('Form data:', formData);

											// Save the FormData object (this can be sent via an AJAX request or other means)
											for (var pair of formData.entries()) {
												console.log(pair[0] + ': ' + pair[1]);
											}
											var myHeaders = new Headers();



											var requestOptions = {
												method: 'POST',
												body: formData
											};

											fetch(contextPath + "/updateBuyerCompanyDocuments", requestOptions)
												.then(response => response.json())  // Parse the response as JSON
												.then(result => {
													console.log(result);

													if (result.status === 'true') {


														sendData(parentDivId, url, finalData)

													} else {
														toastr.error('Something went wrong');
													}
												})
										} else if (parentDivId === "#edit-signature") {
											// Select the image element within the modal
											var companySignatureInput = $("#companySignature input[type='file']");
											var companySignatureIdInput = $("#companySignature input[id='companySignatureId']");
											const image = companySignatureInput[0].files[0];
											const companySignatureId = companySignatureIdInput.val(); // Get the value of the input with id 'ModalcompanyLogoId'

											// Create a new FormData object
											var formData = new FormData();
											formData.append('companySignature', image); // Append the selected file
											formData.append('companySignatureId', companySignatureId); // Append the value of the input


											// Save the FormData object (this can be sent via an AJAX request or other means)
											for (var pair of formData.entries()) {
												console.log(pair[0] + ': ' + pair[1]);
											}
											var myHeaders = new Headers();



											var requestOptions = {
												method: 'POST',
												body: formData
											};

											fetch(contextPath + "/updateBuyerCompanyDocuments", requestOptions)
												.then(response => response.json())  // Parse the response as JSON
												.then(result => {
													console.log(result);

													if (result.status === 'true') {
														firstCall()
														toastr.success('Sucessfully Updated The Details');
														$(parentDivId).modal('hide');
													} else {
														toastr.error('Something went wrong');
													}
												})
										} else {
											sendData(parentDivId, url, finalData)
										}
									}

									function sendData(parentDivId, url, finalData) {
										var myHeaders = new Headers();
										myHeaders.append("Content-Type", "application/json");


										var requestOptions = {
											method: "POST",
											headers: myHeaders,
											body: JSON.stringify(finalData),
											redirect: "follow",
										};

										fetch(contextPath + url, requestOptions)
											.then(response => response.json())  // Parse the response as JSON
											.then(result => {
												console.log(result);

												if (result.status === 'true') {

													firstCall()
													
														toastr.success('Sucessfully Updated The Details');
													
													
													
													
													$(parentDivId).modal('hide'); // Redirect to BuyersRequirementList
												} else {
													toastr.error('Something went wrong');
												}

											})
									}
									function forSignature(div, url) {
										const isImage = (url) => {
											return url.match(/\.(jpeg|jpg|gif|png)$/) != null;
										};

										// Check if the provided URL is an image URL
										if (isImage(url)) {
											// Select the img element inside the specified div using jQuery
											var img = $("#" + div.id + " img");
											console.log(img)

											// Update the src attribute of the img element with the new URL
											img.attr('src', url);
										} else {
											console.error('Invalid image URL:', url);
										}
									}


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
															if (inputField.name == "companyIndustry") {
																showError('companyIndustry_err', '')
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
															companyDetailsInputs = companyDetailsModal.querySelectorAll('input,select');
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
														companyDetailsInputs = companyDetailsModal.querySelectorAll('input,select');
														setTimeout(() => {
															inputField.focus();
															setTimeout(() => {
																if (document.activeElement !== inputField) {
																	inputField.focus();
																}
															}, 100);
														}, 100);

														inputField.addEventListener('blur', function () {
															if (inputField.name == 'companyIndustry') {
																validateCompanyDetails(input);
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
														companyDetailsInputs = companyDetailsModal.querySelectorAll('input,select');
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
								<script src="assets/js/requirement_module_buyer.js"></script>
								<script src="assets/js/custom-file-input-with-preview-for-profile.js"></script>

								<script
									src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
									integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
									crossorigin="anonymous"></script>
	</body>

	</html>