<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<h6 class="heading">Full Name</h6>
						<p class="text" id="name">xyz company LLP</p>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<div class="d-flex">
							<h6 class="heading">Email</h6>
						</div>
						<p class="text" id="email">user@company.com</p>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<h6 class="heading">Phone</h6>
						<p class="text" id="phone">+91 12121 2122</p>
					</div>
					<!-- <div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<h6 class="heading">Website</h6>
						<p class="text">www.company.com</p>
					</div> -->
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<h6 class="heading">Industry Classification</h6>
						<p class="text" id="industry">www.company.com</p>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<h6 class="heading">Industry Expertise</h6>
						<p class="text" id="expertise">linkedIn.com/in/username</p>
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
						<h6 class="heading">Street Address</h6>
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
			<div class="section-style-2">
				<div class="row row-gap-24">
					<div class="col-12">
						<h6 class="section-heading">Professional Information</h6>
					</div>

					<div id="Professional" class="row row-gap-24"></div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<h6 class="heading">Years of Experience in Project Management</h6>
						<p class="text" id="companyExperience">Developer</p>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<h6 class="heading">LinkedIn Profile URL</h6>
						<a href="" class="text" id="companyLinkedInUrl">+91 90265
							52789</a>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<h6 class="heading">Certifications</h6>
						<button class="btn-style-4 " id="relevantDocumentUrl"
							type="button">Document.pdf</button>
					</div>

				</div>



			</div>

		</div>

		<div class="col-12">
			<div class="section-style-2">
				<div class="row row-gap-24">
					<div class="col-12">
						<h6 class="section-heading">Legal Information</h6>
					</div>

					<div class="col-12 col-sm-6 col-md-6 col-lg-3 india">
						<h6 class="heading">PAN Number</h6>
						<p class="text" id="panNo"></p>
					</div>

					<div class="col-12 col-sm-6 col-md-6 col-lg-3 us">
						<h6 class="heading">EIN Number</h6>
						<p class="text" id="einnumber"></p>
					</div>

				</div>

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
							<p class="text" id="exp_projectsHandled">SBI</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Complexity of projects managed</h6>
							<p class="text" id="exp_projectsComplexity">38845472800</p>
						</div>
					</div>

					<div class="col-12">
						<h6 class="heading">Briefly describe your experience in
							project management</h6>
						<p class="text" id="exp_description">Lorem Ipsum is simply
							dummy text of the printing and typesetting industry. Lorem Ipsum
							has been the industry's standard dummy text ever since the 1500s,
							when an unknown printer took a galley of type and scrambled it to
							make a type specimen book. It has survived not only five
							centuries, but also the leap into electronic typesetting,
							remaining essentially unchanged.</p>
					</div>

				</div>

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


				</div>

			</div>
		</div>
		<div class="col-12">
			<div class="section-style-2">
				<div class="row row-gap-24">
					<div class="col-12">
						<h6 class="section-heading">Resume</h6>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-4">
						<button class="btn-style-4 " type="button" id="resumeLink"></button>
					</div>

				</div>

			</div>
		</div>

		<div class="col-12">
			<div class="section-style-2">
				<div class="row row-gap-24">
					<div class="col-12">
						<h6 class="section-heading">Signature</h6>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-4"
						id="singatureDocumentUrl">
						<img src="assets/images/profile/signature.png" alt="">
					</div>


				</div>

			</div>
		</div>


	</div>
</div>
