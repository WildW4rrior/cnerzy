<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="right-content right-content-profile sellerProfiles">
	<div class="row row-gap-16">
		<div class="heading">
			<div class="headingStatus">
				<h1 id="CompanyInformation" class="active">Company Information</h1>
				<h1 id="LegalInformation">Legal Information</h1>
				<h1 id="FinancialDetails">Financial Details</h1>
				<h1 id="TechnicalCapabilities">Technical Capabilities</h1>
				<h1 id="CertificatesCompliance">Certificates & Compliance</h1>
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
									<p class="text" id="firstName">Ashok Singh</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Last Name</h6>
									<p class="text" id="lastName">Developer</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<div class="d-flex">
										<h6 class="heading">Email Address</h6>
										<span class="ml-8 verification-status">Unverified</span>
									</div>
									<p class="text" id="personalEmail">ashok.s@brainydx.com</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Country</h6>
									<p class="text" id="userCountry">+91 90265 52789</p>
								</div>
							</div>

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
							<div class="profile-pic-box" id="companyLogoUrl">
								<img class="" src="assets/images/profile/user.png" alt=""
									data-bs-toggle="modal" data-bs-target="#view-profile-pic">
							</div>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Industry Classification</h6>
							<p class="text" id="industryClassificaiton">xyz company LLP</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<div class="d-flex">
								<h6 class="heading">Industry Expertise</h6>
							</div>
							<p class="text" id="industryExpertise">user@company.com</p>
						</div>

						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Company Name</h6>
							<p class="text" id="companyName">xyz company LLP</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Company Website</h6>
							<p class="text" id="companyWebsite">www.company.com</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<div class="d-flex">
								<h6 class="heading">Company Email</h6>
							</div>
							<p class="text" id="companyEmail">user@company.com</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Phone</h6>
							<p class="text" id="companyPhone">+91 12121 2122</p>
						</div>

						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">LinkedIn Profile URL</h6>
							<p class="text" id="companyLinkedInUrl">linkedIn.com/in/username</p>
						</div>
					</div>

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
							<p class="text" id="streetAddress">A-125, Shahpur Jat</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">City</h6>
							<p class="text" id="city">Delhi</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">State</h6>
							<p class="text" id="state">Delhi</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Country</h6>
							<p class="text" id="country">India</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Pincode</h6>
							<p class="text" id="pincode">110049</p>
						</div>

					</div>

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
							<p class="text" id="buisnessRegNumber">U 52341 MP 2022 PTC
								052831</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Type of Company</h6>
							<p class="text" id="typeOfCompany">Partnership</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Date of Registration</h6>
							<p class="text" id="registrationDate">22 AAAAA0000A 1 Z 5</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3 india">
							<h6 class="heading">PAN Number</h6>
							<p class="text" id="panNo">Partnership</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3 india">
							<h6 class="heading">GSTIN Number</h6>
							<p class="text" id="gstNo">Partnership</p>
						</div>

						<div class="col-12 col-sm-6 col-md-6 col-lg-3 us">
							<h6 class="heading">D-U-N-S Number</h6>
							<p class="text" id="dunsNumber">Partnership</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3 us">
							<h6 class="heading">Tax Id. Number (EIN)</h6>
							<p class="text" id="taxIdNumber">Partnership</p>
						</div>


					</div>

				</div>
			</div>

			<div class="col-12 us" id="w9parent">
				<div class="section-style-2">
					<div class="row row-gap-24">
						<div class="col-12">
							<h6 class="section-heading">W-9 Submission Form</h6>
						</div>
						<div id="w9form"></div>



					</div>


				</div>
			</div>
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
							<p class="text" id="bankName">SBI</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Account Number</h6>
							<p class="text" id="accountNo">38845472800</p>
						</div>

						<div class="col-12 col-sm-6 col-md-6 col-lg-3 india">
							<h6 class="heading">IFSC Code</h6>
							<p class="text" id="ifscCode">SBIN0017333</p>
						</div>

						<div class="col-12 col-sm-6 col-md-6 col-lg-3 us">
							<h6 class="heading">Routing Number</h6>
							<p class="text" id="routingNo">Partnership</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3 us">
							<h6 class="heading">Account Type</h6>
							<p class="text" id="accountType">Partnership</p>
						</div>


					</div>

				</div>
			</div>
			<div class="col-12">
				<div class="section-style-2">
					<div class="row row-gap-24">
						<div class="col-12">
							<h6 class="section-heading">Add annual turnover in the past
								3 years</h6>
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
							<h6 class="section-heading">Details of manpower available in
								the factory</h6>
						</div>
						<table id="manpower" class="" style="width: 100%">

							<tbody>
								<!-- DataTables will dynamically populate rows here -->
							</tbody>
						</table>
						<div class="col-12">
							<h6 class="section-heading">List of Machining / Fabrication
								& Material Handling Facilities Available in the Factory</h6>
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
							<h6 class="section-heading">Add annual turnover in the past
								3 years</h6>
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
						</div>
						<div class="col-12" id="ProjectCaseStudies">

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
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-4">
							<div id="declarationDate"></div>
						</div>


					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-4" id="signatureUrl">

					</div>
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
								Thank you for your trust in Cnerzy, as a leading supplier in the
								manufacturing industry in India, we believe that your success
								story can inspire and benefit other businesses seeking similar
								services. By featuring your story on our platform, we aim to
								highlight your achievements and attract more customers who can
								benefit from your expertise and services.<br> <br>As
								one of our esteemed suppliers, we would like to invite you to
								participate in supplier reference program. By participating in
								this program, you will have the opportunity to feature in our
								marketing campaign, showcasing your business to a wider audience
								increasing your brand reach and attract new customers.<br>
								<br>There is no expiry date to your participation in our
								supplier reference program and you do not need to pay to join.
								Consider this as an extended marketing program for your
								organization.
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
							<p class="text" id="customerReferencePersonName">SBI</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Job Title</h6>
							<p class="text" id="customerReferencePersonJobTitle">38845472800</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Company Name</h6>
							<p class="text" id="customerReferencePersonCompanyName">SBIN0017333</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Company Website</h6>
							<p class="text" id="customerReferencePersonCompanyWebsite">SBIN0017333</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Phone Number</h6>
							<p class="text" id="customerReferencePersonPhoneNo">SBIN0017333</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Email</h6>
							<p class="text" id="customerReferencePersonEmail">SBIN0017333</p>
						</div>
					</div>


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
								program, we would like to showcase your company name, logo, and
								solution specifics for internal presentations, corporate
								intranet, case studies, and customer testimonial videos. In
								addition, please indicate which areas/activities your company is
								willing to participate in for external references. (Please
								select all options that apply)</div>
						</div>
						<div class="col-12">
							<h6 class="section-heading">External:</h6>
						</div>
						<div class="col-12" id="permission">
							<h6 class="seventhstepText">
								<input type="checkbox" name="presentations" id="presentations">
								<b>Presentations:</b> Use your company name, logo, and solution
								details in speeches and presentations.
							</h6>
							<h6 class="seventhstepText">
								<input type="checkbox" name="customerProfileOnWeb"
									id="customerProfileOnWeb"> <b>Customer Profile on
									Web:</b> Display your company name, logo, and solution details on
								our website.
							</h6>
							<h6 class="seventhstepText">
								<input type="checkbox" name="rfp" id="rfp"> <b>RFP:</b> Use
								your company name and solution details to respond to customer
								requests for proposals.
							</h6>
							<h6 class="seventhstepText">
								<input type="checkbox" name="onlineDirectMarketingCampaigns"
									id="onlineDirectMarketingCampaigns"> <b>Online/Direct
									Marketing Campaigns:</b>  Use your company name, logo, and solution
								details in online and/or direct marketing campaigns.
							</h6>
							<h6 class="seventhstepText">
								<input type="checkbox" name="sponsoredEvents"
									id="sponsoredEvents"> <b>Sponsored Events:</b> Participate
								in sponsored events and display your company name, logo, and
								solution details.
							</h6>
							<h6 class="seventhstepText">
								<input type="checkbox" name="caseStudy" id="caseStudy">
								<b>Case Study:</b> Use your company name and solution details in
								a case study brochure and presentation.
							</h6>
							<h6 class="seventhstepText">
								<input type="checkbox" name="pressAnalysts" id="pressAnalysts">
								<b> Press:</b>  Meet with members of the media and be consulted
								each time your organization's name is used as a client
								reference.
							</h6>
							<h6 class="seventhstepText">

								<input type="checkbox" name="speakingEngagement"
									id="speakingEngagement"> <b>Speaking Engagement:</b>  Participate
								in speaking engagements to gain high-profile access to industry
								and media audiences and enhance your marketplace positioning.
							</h6>
							<h6 class="seventhstepText">
								<input type="checkbox" name="" id="" disabled> <b>All
									activities:</b>  Participate in all the activities in the Supplier
								Reference Program.
							</h6>
							<h6 class="seventhstepText">I, the undersigned, agree to
								participate in the Supplier Reference Program , I give my
								permission to use my company name, logo, and testimonials in its
								marketing campaigns, on its website, and in other promotional
								materials.</h6>

						</div>
						<div class="col-12">
							<h6 class="section-heading">Signature</h6>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-4">
							<div id="customerReferenceDeclerationDate"></div>
						</div>
						<div class="col-12">
							<div class="col-12 col-sm-6 col-md-6 col-lg-4"
								id="customerReferenceSignatureUrl"></div>

						</div>
					</div>


				</div>


			</div>


		</div>
	</div>





</div>
