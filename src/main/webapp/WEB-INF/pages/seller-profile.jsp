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
	href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css" />

<link rel="stylesheet" href="assets/css/registration.css">

<link
	href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css"
	rel="stylesheet">
</head>
<style>
.wrapper {
	gap: 24px
}

.verification-status {
	height: fit-content
}

.green {
	color: rgba(59, 186, 48, 1) !important;
	background: rgba(232, 255, 230, 1) !important;
}

#companyLogoUrl img, #companySignatureUrl img, #edit-signature img {
	height: 100%;
	width: 100%;
}
</style>
<body>

	<!------------- navbar starts here -------------->

	<!------------- navbar ends here -------------->

	<!------------- page content starts here -------------->
	<c:import url="navbar.jsp"></c:import>
	<div class="wrapper">


		<c:import url="sidebar.jsp"></c:import>
		<div class="right-content right-content-profile sellerProfiles">
			<div class="row row-gap-16">
				<div id="notice" style="display: none">
					<h1>
						<img src="assets/icons/infoIcon.svg"> Important: To edit
						your profile, please contact the Cnerzy Admin Team at <a
							href="mailto:admin@cnerzy.com">admin@cnerzy.com</a>
					</h1>
				</div>

				<div class="heading">
					<div class="headingStatus">
						<h1 id="CompanyInformation" class="active">Company
							Information</h1>
						<h1 id="LegalInformation">Legal Information</h1>
						<h1 id="FinancialDetails">Financial Details</h1>
						<h1 id="TechnicalCapabilities">Technical Capabilities</h1>
						<h1 id="CertificatesComzpliance">Certificates & Compliance</h1>
						<h1 id="References">References</h1>
						<h1 id="SupplierReferenceProgram">Supplier Reference Program</h1>
					</div>
				</div>
				<div id="CompanyInformationContent" class="content-section "
					style="display: none;">
					<div>
						<div>

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
									<img class="icon" src="assets/icons/edit.svg" alt="edit"
										data-bs-toggle="modal" data-bs-target="#edit-personal-detail">

								</div>
							</div>
						</div>
					</div>
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Company Details</h6>
								</div>
								<div class="col-12 mt-8 mb-8">
									<div class="profile-pic-box" id="companyLogoUrl"
										data-bs-toggle="modal" data-bs-target="#view-profile-pic">
										<img class="" src="assets/images/profile/user.png" alt="">
									</div>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Industry Classification</h6>
									<p class="text" name="industryClassificaiton">xyz company
										LLP</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<div class="d-flex">
										<h6 class="heading">Industry Expertise</h6>
									</div>
									<p class="text" name="industryExpertise">user@company.com</p>
								</div>

								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Company Name</h6>
									<p class="text" name="companyName">xyz company LLP</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Company Website</h6>
									<p class="text" name="companyWebsite">www.company.com</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<div class="d-flex">
										<h6 class="heading">Company Email</h6>
									</div>
									<p class="text" name="companyEmail">user@company.com</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Phone</h6>
									<p class="text" name="companyPhone">+91 12121 2122</p>
								</div>

								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">LinkedIn Profile URL</h6>
									<p class="text" name="companyLinkedInUrl">linkedIn.com/in/username</p>
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
									<h6 class="heading">Address Line 1</h6>
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
						<div class="section-style-2" id="ContactPersonParent">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Contact Person</h6>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Name</h6>
									<p class="text">Ashok Singh</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Designation</h6>
									<p class="text">Developer</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Email</h6>
									<p class="text">ashok.s@brainydx.com</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Phone</h6>
									<p class="text">+91 90265 52789</p>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div id="LegalInformationContent" class="content-section"
					style="display: none;">
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Legal Information</h6>
								</div>

								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Business Registration Number(CIN)</h6>
									<p class="text" name="buisnessRegNumber">U 52341 MP 2022
										PTC 052831</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Type of Company</h6>
									<p class="text" name="typeOfCompany">Partnership</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Date of Registration</h6>
									<p class="text" name="registrationDate">22 AAAAA0000A 1 Z 5</p>
								</div>
								<c:choose>
									<c:when test="${country == 'IN'}">
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">PAN Number</h6>
											<p class="text" name="panNo">Partnership</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">GSTIN Number</h6>
											<p class="text" name="gstNo">Partnership</p>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">D-U-N-S Number</h6>
											<p class="text" name="dunsNumber">Partnership</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">Tax Id. Number (EIN)</h6>
											<p class="text" name="taxIdNumber">Partnership</p>
										</div>
									</c:otherwise>
								</c:choose>



							</div>

							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal" data-bs-target="#edit-legal-information">


						</div>
					</div>
					<c:if test="${country == 'US'}">
						<div class="col-12">
							<div class="section-style-2">
								<div class="row row-gap-24">
									<div class="col-12">
										<h6 class="section-heading">W-9 Submission Form</h6>
									</div>
									<div id="w9form"></div>



								</div>
								<img class="icon" src="assets/icons/edit.svg" alt="edit"
									data-bs-toggle="modal" data-bs-target="#edit-W9Form">


							</div>
						</div>
					</c:if>
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">List of Major Products</h6>
								</div>
								<table id="MajorProducts" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>
								<div class="col-12">
									<h6 class="section-heading">Are you supplying to OEMs?</h6>
								</div>
								<table id="OEMs" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>

							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal"
								data-bs-target="#edit-major-products-and-oems">
						</div>
					</div>
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">List of Major Customers</h6>
								</div>
								<table id="MajorCustomers" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>


							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal" data-bs-target="#edit-major-customers">
						</div>
					</div>
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Are you a Logistics Service
										Provider?</h6>
								</div>
								<table id="Logistics" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>
								<div class="col-12">
									<h6 class="section-heading">Are you an exporter?</h6>
								</div>
								<table id="exporter" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>

							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal"
								data-bs-target="#edit-logistics-provider-and-exporter-lists">
						</div>
					</div>
				</div>

				<div id="FinancialDetailsContent" class="content-section"
					style="display: none;">
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Bank Account Details</h6>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Bank Name</h6>
									<p class="text" name="bankName">SBI</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Account Number</h6>
									<p class="text" name="accountNo">38845472800</p>
								</div>

								<c:choose>
									<c:when test="${country == 'IN'}">
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">IFSC Code</h6>
											<p class="text" name="ifscCode">SBIN0017333</p>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">Routing Number</h6>
											<p class="text" name="routingNo">Partnership</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6 col-lg-3">
											<h6 class="heading">Account Type</h6>
											<p class="text" name="accountType">Partnership</p>
										</div>
									</c:otherwise>
								</c:choose>


							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal"
								data-bs-target="#edit-financial-information">
						</div>
					</div>
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Add annual turnover in the
										past 3 years</h6>
								</div>
								<table id="turnover" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>

							</div>

							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal" data-bs-target="#edit-Account-turnover">
						</div>

					</div>

				</div>

				<div id="TechnicalCapabilitiesContent" class="content-section"
					style="display: none;">

					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Registered Address of Factory</h6>
								</div>
								<table id="Factory" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>

								<div class="col-12">
									<h6 class="section-heading">Details of manpower available
										in the factory</h6>
								</div>
								<table id="manpower" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>
								<div class="col-12">
									<h6 class="section-heading">List of Machining /
										Fabrication & Material Handling Facilities Available in the
										Factory</h6>
								</div>
								<table id="Machining" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>
								<div class="col-12">
									<h6 class="section-heading">List of Inspection / Testing
										Facilities Available in the Factory</h6>
								</div>
								<table id="Inspection" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>



							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal"
								data-bs-target="#edit-technical-capabilities">
						</div>
					</div>
				</div>

				<div id="FinancialDetailsContent" class="content-section"
					style="display: none;">
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Bank Account Details</h6>
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

							</div>

						</div>
					</div>
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Add annual turnover in the
										past 3 years</h6>
								</div>
								<table id="turnover" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>

							</div>

						</div>
					</div>

				</div>

				<div id="CertificatesComplianceContent" class="content-section"
					style="display: none;">
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24" id="CertificatesParent">
								<div class="col-12">
									<h6 class="section-heading">Certificates & Compliance</h6>
								</div>

							</div>

							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal" data-bs-target="#edit-Certificates">


						</div>
					</div>
				</div>

				<div id="ReferencesContent" class="content-section"
					style="display: none;">
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Project Case Studies</h6>
									<div id="ProjectCaseStudies"></div>
								</div>
								<div class="col-12">
									<h6 class="section-heading">Customer Testimonials / Awards</h6>
								</div>
								<table id="Testimonials" class="" style="width: 100%">

									<tbody>
										<!-- DataTables will dynamically populate rows here -->
									</tbody>
								</table>

								<div class="col-12">
									<h6 class="section-heading">Signature</h6>
									<div></div>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-4">
									<div id="declarationDate"></div>
								</div>


							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4" id="signatureUrl"
								style="width: 300px; height: 50px;">
								<img style="height: 100%; width: 100%">

							</div>

							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal" data-bs-target="#edit-CaseStudies">


						</div>

					</div>
				</div>

				<div id="SupplierReferenceProgramContent" class="content-section"
					style="display: none;">
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="section-heading">Supplier Reference Program</h6>
								</div>

								<div class="col-12 ">
									<div class="seventhstepText">
										Thank you for your trust in Cnerzy, as a leading supplier in
										the manufacturing industry in India, we believe that your
										success story can inspire and benefit other businesses seeking
										similar services. By featuring your story on our platform, we
										aim to highlight your achievements and attract more customers
										who can benefit from your expertise and services.<br> <br>As
										one of our esteemed suppliers, we would like to invite you to
										participate in supplier reference program. By participating in
										this program, you will have the opportunity to feature in our
										marketing campaign, showcasing your business to a wider
										audience increasing your brand reach and attract new
										customers.<br> <br>There is no expiry date to your
										participation in our supplier reference program and you do not
										need to pay to join. Consider this as an extended marketing
										program for your organization.
									</div>
								</div>



							</div>

						</div>
					</div>
					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24" id="ConsentForm">
								<div class="col-12">
									<h6 class="section-heading">Consent Form:</h6>
								</div>

								<div class="col-12 ">
									<div class="seventhstepText">Please provide your
										organization contact point for all Supplier Reference Program
										communication activities:</div>
								</div>
								<div class="col-12"></div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Name</h6>
									<p class="text" name="customerReferencePersonName">SBI</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Job Title</h6>
									<p class="text" name="customerReferencePersonJobTitle">38845472800</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Company Name</h6>
									<p class="text" name="customerReferencePersonCompanyName">SBIN0017333</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Company Website</h6>
									<p class="text" name="customerReferencePersonCompanyWebsite">SBIN0017333</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Phone Number</h6>
									<p class="text" name="customerReferencePersonPhoneNo">SBIN0017333</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Email</h6>
									<p class="text" name="customerReferencePersonEmail">SBIN0017333</p>
								</div>
							</div>

							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal" data-bs-target="#edit-ConsentForm">

						</div>



					</div>

					<div class="col-12">
						<div class="section-style-2">
							<div class="row row-gap-24" id="lastStepDiv">
								<div class="col-12">
									<h6 class="section-heading">Participation</h6>
								</div>

								<div class="col-12 ">
									<div class="seventhstepText">By participating in this
										program, we would like to showcase your company name, logo,
										and solution specifics for internal presentations, corporate
										intranet, case studies, and customer testimonial videos. In
										addition, please indicate which areas/activities your company
										is willing to participate in for external references. (Please
										select all options that apply)</div>
								</div>
								<div class="col-12">
									<h6 class="section-heading">External:</h6>
								</div>
								<div class="col-12" id="permission">
									<h6 class="seventhstepText">
										<input type="checkbox" name="presentations" id="presentations">
										<b>Presentations:</b>Use your company name, logo, and solution
										details in speeches and presentations.
									</h6>
									<h6 class="seventhstepText">
										<input type="checkbox" name="customerProfileOnWeb"
											id="customerProfileOnWeb"> <b>Customer Profile on
											Web:</b>Display your company name, logo, and solution details on
										our website.
									</h6>
									<h6 class="seventhstepText">
										<input type="checkbox" name="rfp" id="rfp"> <b>RFP:</b>Use
										your company name and solution details to respond to customer
										requests for proposals.
									</h6>
									<h6 class="seventhstepText">
										<input type="checkbox" name="onlineDirectMarketingCampaigns"
											id="onlineDirectMarketingCampaigns"> <b>Online/Direct
											Marketing Campaigns:</b>Use your company name, logo, and solution
										details in online and/or direct marketing campaigns.
									</h6>
									<h6 class="seventhstepText">
										<input type="checkbox" name="sponsoredEvents"
											id="sponsoredEvents"> <b>Sponsored Events:</b>Participate
										in sponsored events and display your company name, logo, and
										solution details.
									</h6>
									<h6 class="seventhstepText">
										<input type="checkbox" name="caseStudy" id="caseStudy">
										<b>Case Study:</b>Use your company name and solution details
										in a case study brochure and presentation.
									</h6>
									<h6 class="seventhstepText">
										<input type="checkbox" name="pressAnalysts" id="pressAnalysts">
										<b>Press:</b>Meet with members of the media and be consulted
										each time your organization's name is used as a client
										reference.
									</h6>
									<h6 class="seventhstepText">

										<input type="checkbox" name="speakingEngagement"
											id="speakingEngagement"> <b>Speaking Engagement:</b>Participate
										in speaking engagements to gain high-profile access to
										industry and media audiences and enhance your marketplace
										positioning.
									</h6>
									<h6 class="seventhstepText">
										<input type="checkbox" name="parentCheckbox" id=""> <b>All
											activities:</b>Participate in all the activities in the Supplier
										Reference Program.
									</h6>
									<h6 class="seventhstepText">I, the undersigned, agree to
										participate in the Supplier Reference Program , I give my
										permission to use my company name, logo, and testimonials in
										its marketing campaigns, on its website, and in other
										promotional materials.</h6>

								</div>
								<div class="col-12">
									<h6 class="section-heading">Signature</h6>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-4">
									<div id="customerReferenceDeclerationDate"></div>
								</div>
								<div class="col-12">
									<div class="col-12 col-sm-6 col-md-6 col-lg-4"
										id="customerReferenceSignatureUrl">
										<img style="height: 100%; width: 100%">
									</div>

								</div>

							</div>
							<img class="icon" src="assets/icons/edit.svg" alt="edit"
								data-bs-toggle="modal" data-bs-target="#edit-permission">

						</div>


					</div>


				</div>
			</div>





		</div>
	</div>
	<!------------- page content starts here -------------->

	<!-- edit-personal-detail popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-personal-detail" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<h3 class="heading">Personal Details</h3>

					<div class="row row-gap-24">


						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="firstName" id="firstName"
									class="input-field" placeholder="First Name" required
									autocomplete="on"> <label for="firstName"
									class="input-label">First Name<span
									class="required-asterisk">*</span></label> <span id="firstName_err"
									class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="lastName" id="lastName"
									class="input-field" placeholder="Last Name" autocomplete="on">
								<label for="lastName" class="input-label">Last Name</label> <span
									id="lastName_err" class="err-text"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="email" name="personalEmail" id="personalEmail"
									class="input-field" placeholder="Email Address" required
									autocomplete="on"> <label for="personalEmail"
									class="input-label">Email Address<span
									class="required-asterisk">*</span></label> <span id="personalEmail_err"
									class="err-text"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<!-- <input type="text" name="country" readonly value="{{$data['country']}}" class="input-field" placeholder="Country" required
                                    autocomplete="on"> -->
								<select name="userCountry" disabled id=""
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
								<button class="btn-style-4 btn-cancel" type="button"
									data-bs-dismiss="modal" aria-label="Close">Cancel</button>
								<button class="btn-style-1 btn-save" type="button"
									onclick="save('#edit-personal-detail','/updateSellerPersonalDetails',showCompanyInformation)">Save</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- edit-personal-detail popup ends -->


	<!-- Edit Company Detail Popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-company-details" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<h3 class="heading">Company Details</h3>
					<div class="row row-gap-24">
						<div class="col-12 mt-8 mb-8">
							<div class="edit-profile-pic-box">
								<div class="profile-pic-preview-area" id="ModalcompanyLogoUrl">
									<input name="companyLogoId" hidden> <input type="file"
										class="file-input" id="profile-pic-input"
										accept=".png,.jpg,.jpeg" name="companyLogo" hidden> <img
										class="profile-pic" src="assets/images/profile/user.png"
										alt="">
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
								<input type="text" name="companyName" id="companyName"
									class="input-field" placeholder="Company Name" required
									autocomplete="on"> <label for="companyName"
									class="input-label">Company Name<span
									class="required-asterisk">*</span></label> <span id="companyName_err"
									class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="email" name="companyEmail" id="companyEmail"
									class="input-field" placeholder="Company Email" required
									autocomplete="on"> <label for="companyEmail"
									class="input-label">Company Email<span
									class="required-asterisk">*</span></label> <span id="companyEmail_err"
									class="err-text"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="companyPhone" id="companyPhone"
									class="input-field" placeholder="Phone" required
									autocomplete="on" maxlength="10"> <label
									for="companyPhone" class="input-label">Phone<span
									class="required-asterisk">*</span></label> <span id="companyPhone_err"
									class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="companyWebsite" id="companyWebsite"
									class="input-field" placeholder="Website" autocomplete="on">
								<label for="companyWebsite" class="input-label">Website</label>
								<span id="companyWebsite_err" class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div
								class="field-group select-field-group select-field-group-toggle">
								<select name="industryClassificaiton"
									id="industryClassificaiton" class="input-field form-dropdown"
									required autocomplete="off">
									<option value="" selected>Industry Classification</option>
									<option value="Aerospace">Aerospace</option>
									<option value="Automotive">Automotive</option>
									<option value="Consumer Goods">Consumer Goods</option>
									<option value="Energy">Energy</option>
									<option value="Industrial Machinery">Industrial
										Machinery</option>

									<option value="Others">Others</option>
								</select> <label for="industryClassificaiton" class="input-label">Select<span
									class="required-asterisk">*</span>
								</label> <span id="industryClassificaiton_err" class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div
								class="field-group select-field-group select-field-group-toggle">
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
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="companyLinkedInUrl"
									id="companyLinkedInUrl" class="input-field"
									placeholder="LinkedIn Profile URL" autocomplete="on"> <label
									for="companyLinkedInUrl" class="input-label">LinkedIn
									Profile URL</label> <span id="companyLinkedInUrl_err" class="err-text"></span>
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
									onclick="save('#edit-company-details','/updateSellerCompanyDetails',showCompanyInformation)">Save</button>
							</div>
						</div>
					</div>
				</div>
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
					<h3 class="heading">Company Address</h3>
					<input name="addressId" hidden>

					<div class="row row-gap-24">
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="streetAddress" id="streetAddress"
									class="input-field" placeholder="Street Address" required
									autocomplete="on"> <label for="streetAddress"
									class="input-label">Street Address<span
									class="required-asterisk">*</span>
								</label> <span id="streetAddress_err" class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="city" id="city" class="input-field"
									placeholder="City" required autocomplete="on" value="Delhi">
								<label for="city" class="input-label">City<span
									class="required-asterisk">*</span></label> <span id="city_err"
									class="err-text"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="state" id="state" class="input-field"
									placeholder="State" required autocomplete="on" value="Delhi">
								<label for="state" class="input-label">State<span
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
								</select> <label for="country" class="input-label">Country</label>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="pincode" id="pincode"
									class="input-field" placeholder="Pincode" required
									autocomplete="on" value="110049"> <label for="pincode"
									class="input-label">Pincode<span
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
									onclick="save('#edit-company-address','/updateSellerCompanyAddress',showCompanyInformation)">Save</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Company Address Popup ends -->



	<!-- Edit Contact Person popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-contact-person" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<form id="edit-contact-person-form">
				<div class="modal-content">

					<div class="body" id="modalContactPerson">
						<h3 class="heading">Contact Person</h3>

						<!-- <div class="row row-gap-24">
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonName" id="contactPersonName_0" class="input-field"
										placeholder="Name" required autocomplete="on"> <label
										for="contactPersonName_0" class="input-label">Name<span
										class="required-asterisk">*</span></label> <span
										id="contactPersonName_0_err" class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonDesignation" id="contactPersonDesignation_0"
										class="input-field" placeholder="Designation" required
										autocomplete="on"> <label
										for="contactPersonDesignation_0" class="input-label">Designation<span
										class="required-asterisk">*</span></label> <span
										id="contactPersonDesignation_0_err" class="err-text"></span>

								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="contactPersonEmail" id="contactPersonEmail_0"
										class="input-field" placeholder="Email" required
										autocomplete="on"> <label
										for="contactPersonEmail_0" class="input-label">Email<span
										class="required-asterisk">*</span></label> <span
										id="contactPersonEmail_0_err" class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonPhone" id="contactPersonPhone_0"
										class="input-field" placeholder="Phone" required
										autocomplete="on" maxlength="10"> <label
										for="contactPersonPhone_0" class="input-label">Phone<span
										class="required-asterisk">*</span></label> <span
										id="contactPersonPhone_0_err" class="err-text"></span>

								</div>
							</div>

						</div> -->
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button"
										data-bs-dismiss="modal" aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-contact-person','/updateSellerContactPersons', showCompanyInformation)">Save</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Edit Contact Person popup ends -->

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
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group select-field-group">
								<select name="typeOfCompany" id="typeOfBusinessEntity"
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
								<input type="text" name="buisnessRegNumber"
									id="buisnessRegNumber" class="input-field"
									placeholder="Business Reg. Number(CIN)" autocomplete="on"
									oninput="this.value = this.value.toUpperCase()"> <label
									for="buisnessRegNumber" class="input-label">Business
									Reg. Number(CIN)</label> <span id="buisnessRegNumber_err"
									class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="date" name="registrationDate" id="registrationDate"
									class="input-field date-field"
									placeholder="Date Of Registration" autocomplete="off">
								<label for="registrationDate" class="input-label">Date
									Of Registration</label> <span id="registrationDate_err"
									class="err-text"></span>
							</div>
						</div>
						<c:choose>
							<c:when test="${country == 'US'}">

								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="dunsNumber" id="dunsNumber"
											class="input-field" placeholder="Tax Id. Number (EIN)"
											autocomplete="on"> <label for="dunsNumber"
											class="input-label">D-U-N-S Number<span
											class="required-asterisk">*</span></label> <span id="dunsNumber_err"
											class="err-text"></span>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="taxIdNumber" id="taxIdNumber"
											class="input-field" placeholder="Tax Id. Number (EIN)"
											autocomplete="on"> <label for="taxIdNumber"
											class="input-label">Tax Id. Number (EIN)<span
											class="required-asterisk">*</span>
										</label> <span id="taxIdNumber_err" class="err-text"></span>
									</div>
								</div>

							</c:when>
							<c:otherwise>
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="panNo" id="panNo" class="input-field"
											placeholder="" autocomplete="on"
											oninput="this.value = this.value.toUpperCase()"> <label
											for="panNo" class="input-label">PAN Number<span
											class="required-asterisk">*</span></label> <span id="panNo_err"
											class="err-text"></span>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="gstNo" id="gstNo" class="input-field"
											placeholder="T" autocomplete="on"
											oninput="this.value = this.value.toUpperCase()"> <label
											for="gstNo" class="input-label">GSTIN Number<span
											class="required-asterisk">*</span></label> <span id="gstNo_err"
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
									onclick="save('#edit-legal-information','/updateSellerLegalDetails',showLegalInformation)">Save</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Legal Information popup ends -->


	<!-- Edit Major Products and OEMs Lists popup starts -->
	<div class="modal fade modal-xl custom-edit-modal"
		id="edit-major-products-and-oems" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form id="edit-major-products-and-oems-form">
					<div class="body">

						<div class="input-field-section mt-32">
							<h6 class="input-section-heading mb-16">List of Major
								Products</h6>
							<div class="row row-gap-16" id="major-product-row"></div>
						</div>
						<div class="input-field-section mt-32">
							<div class="row mb-16">
								<div class="col-12 d-flex align-items-center">
									<h6 class="input-section-heading mr-16">Are you supplying
										to OEMs?</h6>
									<div class="d-flex align-items-center">
										<div class="radio-field-group mr-16 d-flex align-items-center">
											<input type="radio" id="yes" name="isSupplyingToOEM"
												value="yes" checked class="mr-8" required autocomplete="off"><label
												for="yes">Yes</label>
										</div>
										<div class="radio-field-group d-flex align-items-center">
											<input type="radio" id="no" name="isSupplyingToOEM"
												class="mr-8" required value="no" autocomplete="off"><label
												for="no">No</label>
										</div>
									</div>
								</div>
							</div>
							<div id="oem-details-parent">

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
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button"
										data-bs-dismiss="modal" aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-major-products-and-oems','/updateSellerOEMAndProductDetails',showLegalInformation)">Save</button>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Major Products and OEMs Lists popup ends -->


	<!-- Edit Major Customers popup starts -->
	<div class="modal fade modal-xl custom-edit-modal"
		id="edit-major-customers" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form id="edit-major-customers-form">
					<div class="body">
						<div class="input-field-section mt-32">
							<h6 class="input-section-heading mb-16">List of Major
								Customers</h6>

							<div class="row row-gap-16 mb-32"
								id="list-of-major-customers-parent">
								<!-- 							<div class="col-lg-3 col-md-6 col-sm-12 col-12"> -->
								<!-- 								<div class="field-group"> -->
								<!-- 									<input type="text" name="majorCustomers[0].name" -->
								<!-- 										id="customer_name_1" class="input-field" -->
								<!-- 										placeholder="Customer's Name" autocomplete="off"> <label -->
								<!-- 										for="customer_name_1" class="input-label">Customer's -->
								<!-- 										Name</label> <span id="customer_name_1_err" class="err-text"></span> -->
								<!-- 								</div> -->
								<!-- 							</div> -->
								<!-- 							<div class="col-lg-6 col-md-6 col-sm-12 col-12"> -->
								<!-- 								<div class="field-group"> -->
								<!-- 									<input type="text" name="majorCustomers[0].address" -->
								<!-- 										id="customer_address_1" class="input-field" -->
								<!-- 										placeholder="Address" autocomplete="off"> <label -->
								<!-- 										for="customer_address_1" class="input-label">Address</label> <span -->
								<!-- 										id="customer_address_1_err" class="err-text"></span> -->
								<!-- 								</div> -->
								<!-- 							</div> -->
								<!-- 							<div class="col-lg-3 col-md-6 col-sm-12 col-12"> -->
								<!-- 								<div class="field-group"> -->
								<!-- 									<input type="text" name="majorCustomers[0].productSupplied" -->
								<!-- 										id="product_supplied_1" class="input-field" -->
								<!-- 										placeholder="Product Supplied" autocomplete="off"> <label -->
								<!-- 										for="product_supplied_1" class="input-label">Product -->
								<!-- 										Supplied</label> <span id="product_supplied_1_err" class="err-text"></span> -->
								<!-- 								</div> -->
								<!-- 							</div> -->
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
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button"
										data-bs-dismiss="modal" aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-major-customers','/updateSellerCustomerDetails',showLegalInformation)">Save</button>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Major Customers popup ends -->

	<!-- Edit Logistic Service Provider and Exporter List popup starts -->
	<div class="modal fade modal-xl custom-edit-modal"
		id="edit-logistics-provider-and-exporter-lists" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form id="edit-logistics-provider-and-exporter-lists-form">



					<div class="body">
						<div class="input-field-section mt-32">
							<div class="row mb-16">
								<div class="col-12 d-flex align-items-center">
									<h6 class="input-section-heading mr-16">Are you a
										Logistics Service Provider?</h6>
									<div class="d-flex align-items-center">
										<div class="radio-field-group mr-16 d-flex align-items-center">
											<input type="radio" name="isLogisticServiceProvider"
												value="yes" checked class="mr-8" required autocomplete="off"><label
												for="">Yes</label>
										</div>
										<div class="radio-field-group d-flex align-items-center">
											<input type="radio" name="isLogisticServiceProvider"
												class="mr-8" required value="no" autocomplete="off"><label
												for="">No</label>
										</div>
									</div>
								</div>
							</div>
							<div id="logistic-service-provider-parent"></div>
						</div>
						<div class="input-field-section mt-32" id="">
							<div class="row mb-16">
								<div class="col-12 d-flex align-items-center">
									<h6 class="input-section-heading mr-16">Are you an
										exporter?</h6>
									<div class="d-flex align-items-center">
										<div class="radio-field-group mr-16 d-flex align-items-center">
											<input type="radio" name="isExporter" value="yes" checked
												class="mr-8" required autocomplete="off"><label
												for="">Yes</label>
										</div>
										<div class="radio-field-group d-flex align-items-center">
											<input type="radio" name="isExporter" value="no" class="mr-8"
												required autocomplete="off"><label for="">No</label>
										</div>
									</div>
								</div>

							</div>
							<div id="exporter-lists-parent">

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
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button"
										data-bs-dismiss="modal" aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-logistics-provider-and-exporter-lists','/updateSellerExporterAndLogisticsDetails',showLegalInformation)">Save</button>

								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<!-- Edit Logistic Service Provider and Exporter List popup ends -->

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
								<input name="bankId" hidden> <input type="text"
									name="bankName" id="bankName" class="input-field"
									placeholder="Bank Name" autocomplete="on"> <label
									for="bankName" class="input-label">Bank Name<span
									class="required-asterisk">*</span></label> <span id="bankName_err"
									class="err-text"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="field-group">
								<input type="text" name="accountNo" id="accountNo" pattern="\d*"
									class="input-field" placeholder="Account Number"
									autocomplete="on"> <label for="accountNo"
									class="input-label">Account Number<span
									class="required-asterisk">*</span></label> <span id="accountNo_err"
									class="err-text"></span>

							</div>
						</div>


						<c:choose>
							<c:when test="${country == 'IN'}">
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="ifscCode" id="ifscCode"
											class="input-field"
											oninput="this.value = this.value.toUpperCase()"
											placeholder="IFSC Code" autocomplete="on"> <label
											for="ifscCode" class="input-label">IFSC Code<span
											class="required-asterisk">*</span></label> <span id="ifscCode_err"
											class="err-text"></span>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="field-group">
										<input type="text" name="routingNo" id="routingNo"
											pattern="\d*" maxlength="9" class="input-field"
											placeholder="IFSC Code" autocomplete="on"> <label
											for="routingNo" class="input-label">Routing Number<span
											class="required-asterisk">*</span></label> <span id="routingNo_err"
											class="err-text"></span>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">

									<div class="field-group select-field-group">
										<select name="accountType" id="accountType"
											class="input-field form-dropdown" required autocomplete="off">
											<option value="" selected>Account Type</option>
											<option value="Checking">Checking</option>
											<option value="Savings">Savings</option>
										</select> <label for="accountType" class="input-label">Select<span
											class="required-asterisk">*</span>
										</label> <span id="accountType_err" class="err-text"></span>
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
									onclick="save('#edit-financial-information','/updateSellerBankDetails',showFinancialDetails)">Save</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Financial Information popup ends -->

	<!-- Edit Technical Capabilities popup starts -->
	<div class="modal fade modal-xl custom-edit-modal"
		id="edit-technical-capabilities" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form id="edit-technical-capabilities-form">
					<div class="body">
						<div class="input-field-section mt-32">
							<h6 class="input-section-heading mb-16">Registered Address
								of Factory</h6>
							<div id="reg-addresses-of-factory-parent"></div>
						</div>
						<div class="input-field-section mt-32">
							<div class="row row-gap-16">
								<div class="col-lg-3 col-md-6 col-sm-12 col-12">
									<button class="btn-style-2 w-100" type="button"
										onclick="addAnotherRegAddressOfFactory()">+ Add New
										Factory</button>
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
										onclick="save('#edit-technical-capabilities','/updateSellerFactoryDetails',showTechnicalCapabilities)">Save</button>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Technical Capabilities popup ends -->

	<!-- Edit Signature popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-Account-turnover" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">

			<div class="modal-content">
				<form id="edit-Account-turnover-form">
					<div class="body">
						<!-- Financial Information Step-3 -->

						<div class="content">

							<div class="input-field-section mt-32">
								<h6 class="input-section-heading mb-16">Add annual turnover
									in the past 3 years</h6>
								<div class="row" style="width: 105%" id="annual-turnover-parent">
									<div class=" col-md-12 row gx-4">
										<h6 class="input-section-heading mb-8">1.</h6>
										<div class="col-lg-6 col-md-6 col-sm-12 mb-16">
											<div class="field-group select-field-group">
												<select name="annualTurnoverList[0].financialYear"
													id="turnover_financial_year_1"
													class="input-field form-dropdown" autocomplete="off">
													<option value="" selected>Financial year</option>
													<option value="2023-24">2023-24</option>
													<option value="2022-23">2022-23</option>
													<option value="2021-22">2021-22</option>
												</select> <label for="turnover_financial_year_1" class="input-label">Select</label>
												<span id="turnover_financial_year_1_err" class="err-text"></span>

											</div>
										</div>
										<div class=" col-md-6 col-sm-12 mb-16">
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
										onclick="save('#edit-Account-turnover','/updateSellerTurnoverDetails',showFinancialDetails)">Save</button>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>


		</div>
	</div>
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-Certificates" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form id="edit-Certificates-form">
					<div class="body">

						<div class="col-12">
							<div class="section-style-2">
								<div class="row row-gap-24" id="ModalCertificatesParent">
									<div class="col-12">
										<h6 class="section-heading">Certificates & Compliance</h6>
									</div>

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
										onclick="save('#edit-Certificates','/updateSellerCertifications',showCertificatesCompliance())">Save</button>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-CaseStudies" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form id="edit-CaseStudies-form">
					<div class="body">


						<div class="content">
							<div class="input-field-section mt-32">
								<!-- <h6 class="input-section-heading mb-16">Upload Certifications</h6> -->
								<div class="row row-gap-16">
									<div class="col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="card-style-1 project-case-stu-card-style-1">
											<h6 class="card-title">Project Case Studies</h6>

											<div class="col-md-6 col-sm-12 col-12">
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
													placeholder="Customer Testimonials / Awards"
													autocomplete="off"> <label
													for="testimonials_or_awards_0" class="input-label">Customer
													Testimonials / Awards</label> <span
													id="testimonials_or_awards_0_err" class="err-text"></span>

											</div>
										</div>
										<div class="col-lg-3 col-md-6 col-sm-12 col-12"
											id="testimonials-btn-1">
											<button class="btn-style-2 w-100" type="button"
												onclick="addAnotherTestimonialList()">+ Add Other</button>
										</div>
									</div>
								</div>
							</div>
							<div class="input-field-section mt-32">
								<div class="row row-gap-16">
									<div class="">
										<div class="card-style-1 project-case-stu-card-style-1 d-flex">
											<div class=" col-md-6 col-sm-12 col-12">
												<div class="field-group">
													<input type="date" name="declarationDate"
														class="input-field date-field auto-fill-date" required
														autocomplete="off"> <label for="date"
														style="background: var(--gray);" class="input-label">Date</label>
												</div>
											</div>
											<div class=" col-md-6 col-sm-12 col-12 mb-32">
												<div class="file-input-field-group">
													<input type="file" id="signatureFile_input"
														name="signatureFile" accept=".jpg, .png, .jpeg"
														class="input-field" placeholder="File" required
														autocomplete="off" hidden>
													<button class="input-btn" type="button"
														onclick="handleClick('signatureFile_input','signatureFile_text')">Choose
														File</button>
													<p id="signatureFile_text">No File Choosen</p>
												</div>
												<div class="fileType-and-maxFileSize">
													<p>Attach your signatureFile here</p>

													<span id="signatureFile_err" class="err-text"></span>
												</div>
											</div>
										</div>
									</div>
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
										onclick="save('#edit-CaseStudies','/updateSellerReferences',showReferences)">Save</button>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Edit Contact Person popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-ConsentForm" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<form id="edit-ConsentForm">
				<div class="modal-content">

					<div class="body" id="modalContactPerson">
						<h3 class="heading">Consent Form</h3>
						<input name="customerReferencePersonId" hidden>
						<div class="row row-gap-24">
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="customerReferencePersonName"
										id="customerReferencePersonName" class="input-field"
										placeholder="Name" autocomplete="on"> <label
										for="customerReferencePersonName" class="input-label">Name</label>
									<span id="customerReferencePersonName_err" class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="customerReferencePersonJobTitle"
										id="customerReferencePersonJobTitle" class="input-field"
										placeholder="Job Title" autocomplete="on" value="Developer">
									<label for="customerReferencePersonJobTitle"
										class="input-label">Job Title </label> <span
										id="customerReferencePersonJobTitle_err" class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="customerReferencePersonCompanyName"
										id="customerReferencePersonCompanyName" class="input-field"
										placeholder="Job Title" autocomplete="on" value=""> <label
										for="customerReferencePersonCompanyName" class="input-label">Company
										Name </label> <span id="customerReferencePersonCompanyName_err"
										class="err-text"></span>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="customerReferencePersonCompanyWebsite"
										id="customerReferencePersonCompanyWebsite" class="input-field"
										placeholder="Job Title" autocomplete="on" value=""> <label
										for="customerReferencePersonCompanyWebsite"
										class="input-label">Company Website </label> <span
										id="customerReferencePersonCompanyWebsite_err"
										class="err-text"></span>

								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="customerReferencePersonEmail"
										id="customerReferencePersonEmail" class="input-field"
										placeholder="Job Title" autocomplete="on" value=""> <label
										for="customerReferencePersonEmail" class="input-label">Email
									</label> <span id="customerReferencePersonEmail_err" class="err-text"></span>

								</div>
							</div>

							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="customerReferencePersonPhoneNo"
										pattern="/d*" maxlength="10"
										id="customerReferencePersonPhoneNo" class="input-field"
										placeholder="Phone" autocomplete="on" value=""> <label
										for="customerReferencePersonPhoneNo" class="input-label">Phone
										Number </label> <span id="customerReferencePersonPhoneNo_err"
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
										onclick="save('#edit-ConsentForm','/updateSellerCustomerContact', showSupplierReferenceProgram)">Save</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Edit Contact Person popup ends -->


	<!-- Edit Participation popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="edit-participation" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<form id="edit-participation">
				<div class="modal-content">

					<div class="body" id="modalContactPerson">
						<h3 class="heading">Consent Form</h3>
						<input name="customerReferencePersonId" hidden>
						<div class="row row-gap-24"></div>
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
									<button class="btn-style-4 btn-cancel" type="button"
										data-bs-dismiss="modal" aria-label="Close">Cancel</button>
									<button class="btn-style-1 btn-save" type="button"
										onclick="save('#edit-participation','/updateSellerCustomerContact', showSupplierReferenceProgram)">Save</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Edit Participation popup ends -->

	<!-- 	<!-- Edit Signature popup starts -->
	<!-- 	<div class="modal fade modal-lg custom-edit-modal" id="edit-signature" -->
	<!-- 		aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" -->
	<!-- 		tabindex="-1" data-keyboard="false" data-backdrop="static"> -->
	<!-- 		<div class="modal-dialog modal-dialog-centered"> -->
	<!-- 			<div class="modal-content"> -->
	<!-- 				<div class="body"> -->
	<!-- 					<h3 class="heading">Signature</h3> -->
	<!-- 					<div class="row row-gap-24"> -->
	<!-- 						<div class="col-12"> -->
	<!-- 							<div class="signature-card-1 custom-file-input-2"> -->
	<!-- 								<div class="signature-preview-area"> -->
	<!-- 									<input type="file" class="file-input" id="signature-input" -->
	<!-- 										accept=".png,.jpg,.jpeg" name="signature" hidden> <img -->
	<!-- 										class="img" src="assets/images/profile/signature.png" alt=""> -->
	<!-- 								</div> -->
	<!-- 								<div class="icon-box"> -->
	<!-- 									<img class="icon choose-new-signature-btn" -->
	<!-- 										src="assets/images/profile/replace.png" alt=""> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 				<div class="footer"> -->
	<!-- 					<div class="row"> -->
	<!-- 						<div class="col-12 d-flex justify-content-end"> -->
	<!-- 							<div class="div d-block d-sm-flex space-x-2 space-sm-x-0"> -->
	<!-- 								<button class="btn-style-4 btn-cancel" type="button" -->
	<!-- 									data-bs-dismiss="modal" aria-label="Close">Cancel</button> -->
	<!-- 								<button class="btn-style-1 btn-save" type="button">Save</button> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	<!-- Edit Signature popup ends -->

	<div class="modal fade modal-xl custom-edit-modal" id="edit-permission"
		aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
		tabindex="-1" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<form id="edit-permission-form">

						<div class="row row-gap-24">
							<div class="col-12">
								<h6 class="section-heading">Participation</h6>
							</div>

							<div class="col-12 ">
								<div class="seventhstepText">By participating in this
									program, we would like to showcase your company name, logo, and
									solution specifics for internal presentations, corporate
									intranet, case studies, and customer testimonial videos. In
									addition, please indicate which areas/activities your company
									is willing to participate in for external references. (Please
									select all options that apply)</div>
							</div>
							<div class="col-12">
								<h6 class="section-heading">External:</h6>
							</div>
							<div class="col-12" id="permission">
								<h6 class="seventhstepText">
									<input name="permissionModel.id" hidden> <input
										type="checkbox" name="permissionModel.presentations"
										id="presentations" class="mr-8 child-checkboxes"> <b>Presentations:</b>Use your
									company name, logo, and solution details in speeches and
									presentations.
								</h6>
								<h6 class="seventhstepText">
									<input type="checkbox"
										name="permissionModel.customerProfileOnWeb"
										id="customerProfileOnWeb" class="mr-8 child-checkboxes"> <b>Customer Profile on
										Web:</b>Display your company name, logo, and solution details on
									our website.
								</h6>
								<h6 class="seventhstepText">
									<input type="checkbox" name="permissionModel.rfp" id="rfp" class="mr-8 child-checkboxes">
									<b>RFP:</b>Use your company name and solution details to
									respond to customer requests for proposals.
								</h6>
								<h6 class="seventhstepText">
									<input type="checkbox"
										name="permissionModel.onlineDirectMarketingCampaigns"
										id="onlineDirectMarketingCampaigns" class="mr-8 child-checkboxes"> <b>Online/Direct
										Marketing Campaigns:</b>Use your company name, logo, and solution
									details in online and/or direct marketing campaigns.
								</h6>
								<h6 class="seventhstepText">
									<input type="checkbox" name="permissionModel.sponsoredEvents"
										id="sponsoredEvents" class="mr-8 child-checkboxes"> <b>Sponsored Events:</b>Participate
									in sponsored events and display your company name, logo, and
									solution details.
								</h6>
								<h6 class="seventhstepText">
									<input type="checkbox" name="permissionModel.caseStudy"
										id="caseStudy" class="mr-8 child-checkboxes"> <b>Case Study:</b>Use your company
									name and solution details in a case study brochure and
									presentation.
								</h6>
								<h6 class="seventhstepText">
									<input type="checkbox" name="permissionModel.pressAnalysts"
										id="pressAnalysts" class="mr-8 child-checkboxes"> <b>Press:</b>Meet with members of
									the media and be consulted each time your organization's name
									is used as a client reference.
								</h6>
								<h6 class="seventhstepText">

									<input type="checkbox"
										name="permissionModel.speakingEngagement"
										id="speakingEngagement" class="mr-8 child-checkboxes"> <b>Speaking Engagement:</b>Participate
									in speaking engagements to gain high-profile access to industry
									and media audiences and enhance your marketplace positioning.
								</h6>
								<h6 class="seventhstepText">
									<input type="checkbox" name="parentCheckbox" id="" class="mr-8 parent-checkbox" onclick="tickAllCheckboxes('parent-checkbox','child-checkboxes')"> <b>All
										activities:</b>Participate in all the activities in the Supplier
									Reference Program.
								</h6>
								<span id="check_one_checkbox_err" class="err-text"></span>
								<h6 class="seventhstepText">I, the undersigned, agree to
									participate in the Supplier Reference Program , I give my
									permission to use my company name, logo, and testimonials in
									its marketing campaigns, on its website, and in other
									promotional materials.</h6>

							</div>
							<div
								class="col-12 card-style-1 project-case-stu-card-style-1 d-flex"
								style="flex-direction: column;">
								<h6 class="section-heading mb-16">Signature</h6>

								<div style="width: 100%; gap: 20px; display: flex;">
									<div style="flex:1">
										<div class=" ">
											<div class="field-group">
												<input type="date" name="permissionModel.declerationDate"
													id="customerReferenceDeclerationDate"
													class="input-field date-field auto-fill-date" required
													autocomplete="off"> <label for="date"
													style="background: var(--gray);" class="input-label">Date</label>
											</div>
										</div>
									</div>
									<div class="" style="flex:2">
										<!-- 									<div class=" col-sm-6 col-md-6 col-lg-4" -->
										<!-- 										id="customerReferenceSignatureUrl" -->
										<!-- 										style="width: 300px; height: 50px;"> -->
										<!-- 										<img style="height: 100%; width: 100%"> -->
										<!-- 									</div> -->
										<div class="signature-card-1 custom-file-input-2 d-block">
											<div class="signature-preview-area">
												<input type="file" class="file-input" id="signature-input"
													accept=".png,.jpg,.jpeg"
													name="permissionModel.signatureFile" hidden> <img style="width:100%"
													class="img" id="customerReferenceSignatureUrl"
													src="assets/images/profile/signature.png" alt="">
											</div>
											
											<div class="icon-box">
												<img class="icon choose-new-signature-btn"
												src="assets/images/profile/replace.png" alt="">
											</div>
											<div>
												<span id="ref_signatureFile" class="err-text"></span>
											</div>
										</div>
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
											onclick="save('#edit-permission','/updateSellerPermission',showSupplierReferenceProgram)">Save</button>

									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade modal-lg custom-edit-modal" id="edit-W9Form"
		aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
		tabindex="-1" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<form id="edit-W9Form-form">
						<div class="input-field-section mt-32">
							<h6 class="input-section-heading mb-16">Click here to submit
								your W-9</h6>
							<p class="content">
								As a part of the onboarding process it is mandatory for you to
								submit us with a copy of your W-9 on file . If you have a copy
								of the same , please mail it to admin@cnerzy.com . If you don't
								have the W-9 on file please click here to submit your W-9 <a
									href="https://cnerzy.com/assets/onboarding_module/seller/W-9-Form.pdf"
									target="_blank">(hyper link to form shared as PDF, digital
									signature process can be set here)</a>
							</p>
							<p class="content">Ensure your W-9 form contains the
								following details:</p>
							<ul>
								<li>For Individuals or Sole Proprietors: First and last
									name, Leave the company name section blank</li>
								<li>For Companies: Provide the legal business name as
									listed on the SS4 form, Leave the individual name section blank
									unless a DBA is registered</li>
								<li>Federal Tax Classification: Select the appropriate box
									based on your IRS registration/SS4 form</li>
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
								<div class="">
									<div class="card-style-1" style="min-height: 0px;"
										id="modalW9Form"></div>
									<div class="fileType-and-maxFileSize">

										<span id="w9SubmissionForm_err" class="err-text"></span>
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
											onclick="save('#edit-W9Form','/updateSellerW9Form',showLegalInformation)">Save</button>

									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Profile pic popup starts-->
	<div class="modal fade custom-profile-pic-view-modal modal-sm"
		id="view-profile-pic" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<span class="close-btn" data-bs-dismiss="modal" aria-label="Close">&times;</span>
				<div id="singleCompanyLogo">

					<img class="modal-img" src="assets/images/profile/user.png"
						alt="Success Animation">
				</div>

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


	<script src="assets/js/index.js"></script>
	<script src="assets/js/custom-file-input-with-preview-for-profile.js"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/toastr.min.js"></script>




	<script>
		var ctx = "${pageContext.request.contextPath}"
		console.log("${role}")
		console.log("${country}")
		var userListJson;
		var role = "${role}"
		var BackendCountry = "${country}"
		var contextPath = "${pageContext.request.contextPath}"
		var isApproved = "${isApproved}"
		if (isApproved === "true") {
			$(".icon[alt='edit']").hide();
			$("#notice").show();
		}
		$(document).ready(function() {
			console.log("ready!");
			showCompanyInformation()
		});
	</script>


	<script src="assets/js/dropdown-toggle-seller.js"></script>
	<script src="assets/js/seller-profile.js"></script>
</body>

</html>