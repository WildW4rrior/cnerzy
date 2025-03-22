

<div class="col-12 col-sm-12 col-md-12 col-lg-9 col-xl-8 col-xxl-8"
	id="CreateRequirement">
	<div class="breadcrumb-row d-flex">
		<div class="breadcrumb-left-col">
			<div class="breadcrumb-icon-box" id="backButton"
				onclick="replaceDiv('PostRequirement','CreateRequirement')">
				<img class="breadcrumb-icon" src="assets/icons/breadcrumb-arrow.svg"
					alt="">
			</div>
			<div class="breadcrumb-text">Create a New Requirement</div>
		</div>
	</div>
	<form id="post-requirement-form">
		<div class="right-content">
			<div class="input-field-section">
				<div class="row row-gap-16">
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<div
							class="field-group select-field-group select-field-group-toggle">
							<select name="industry" id="industryClassification"
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
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<div
							class="field-group select-field-group select-field-group-toggle">
							<select name="service" id="industryClassification"
								class="input-field form-dropdown" required autocomplete="off">
								<option value="" selected>Service</option>
								<option value="Precision Machining">Precision Machining</option>
								<option value="Injections Moulds">Injections Moulds</option>
								<option value="Die Casting Components">Die Casting Components</option>
								<option value="Sheet Metal / Stamping">Sheet Metal / Stamping</option>
								<option value="Forging">Forging</option>
								<option value="Sub-assembly">Sub-assembly</option>
								<option value="Aerospace Components">Aerospace Components</option>
								<option value="Engineering & Design Services">Engineering & Design Services</option>
								<option value="Prototyping">Prototyping</option>
								<option value="Others">Others</option>
							</select> <label for="service" class="input-label">Select<span
								class="required-asterisk">*</span>
							</label> <span id="service_err" class="err-text"></span>

						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<input type="text" name="reEngagedSellerCid" class="input-field" hidden>
						<div class="field-group">
						
							<input type="text" name="jobPostTitle" id="jobPostTitle"
								class="input-field" placeholder="Title for Job Post" required
								autocomplete="off"> <label for="jobPostTitle"
								class="input-label">Title for Job Post<span
								class="required-asterisk">*</span></label> <span id="jobPostTitle_err"
								class="err-text"></span>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="field-group">
							<textarea name="projectDescription" id="projectDescription"
								required id="projectDescription" class="input-field"
								placeholder="Brief Description of Project"></textarea>
							<label for="projectDescription" class="input-label">Brief
								Description of Project<span class="required-asterisk">*</span>
							</label> <span id="projectDescription_err" class="err-text"></span>

						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="quantityRequired" id="quantityRequired"
								class="input-field" placeholder="Quantity Required" required
								autocomplete="off"> <label for="quantityRequired"
								class="input-label">Quantity Required<span
								class="required-asterisk">*</span></label> <span
								id="quantityRequired_err" class="err-text"></span>

						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="materialSpecifications"
								id="materialSpecifications" class="input-field"
								placeholder="Material Specifications" required
								autocomplete="off"> <label for="materialSpecifications"
								class="input-label">Material Specifications<span
								class="required-asterisk">*</span></label> <span
								id="materialSpecifications_err" class="err-text"></span>

						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="qualitySpecifications"
								id="qualitySpecifications" class="input-field"
								placeholder="Quality Specifications" required autocomplete="off">
							<label for="qualitySpecifications" class="input-label">Quality
								Specifications<span class="required-asterisk">*</span>
							</label> <span id="qualitySpecifications_err" class="err-text"></span>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="packagingSpecifications"
								id="packagingSpecifications" class="input-field"
								placeholder="Packaging Specifications" required
								autocomplete="off"> <label for="packagingSpecifications"
								class="input-label">Packaging Specifications<span
								class="required-asterisk">*</span></label> <span
								id="packagingSpecifications_err" class="err-text"></span>

						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="logisticsSpecifications"
								id="logisticsSpecifications" class="input-field"
								placeholder="Logistics Specifications" required
								autocomplete="off"> <label for="logisticsSpecifications"
								class="input-label">Logistics Specifications<span
								class="required-asterisk">*</span></label> <span
								id="logisticsSpecifications_err" class="err-text"></span>

						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="deliveryTimelines"
								id="deliveryTimelines" class="input-field"
								placeholder="Delivery Timelines" required autocomplete="off">
							<label for="deliveryTimelines" class="input-label">Delivery
								Timelines<span class="required-asterisk">*</span>
							</label> <span id="deliveryTimelines_err" class="err-text"></span>

						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="field-group select-field-group">
							<select name="sellerLocation" id="sellerLocation"
								class="input-field form-dropdown" required autocomplete="off">
								<option value="" selected>Choose a Seller Location</option>
								<option value="India">India</option>
								<option value="US">US</option>
							</select> <label for="sellerLocation" class="input-label">Select<span
								class="required-asterisk">*</span></label> <span id="sellerLocation_err"
								class="err-text"></span>

						</div>
					</div>
				</div>
			</div>
			<div class="input-field-section mt-32">
				<h6 class="input-section-heading mb-16">Seller Preferences</h6>
				<div class="row row-gap-16">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="field-group select-field-group">
							<select name="sellerPreference" id="sellerPreference"
								class="input-field form-dropdown" required autocomplete="off">
								<option value="" selected>Preferred Sellers</option>
								<option value="Cnerzy recommended">Cnerzy recommended sellers</option>
								<option value="previously engaged">Invite
									previously engaged sellers</option>
							</select> <label for="sellerPreferences" class="input-label">
								Select<span class="required-asterisk">*</span>
							</label> <span id="sellerPreferences_err" class="err-text"></span>

						</div>
					</div>
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-12 d-flex justify-content-end">
						<button class="btn-style-1 mt-32" onclick="handleCreateSubmit()">Post</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<!------------- page content starts here -------------->

<!------------- page content ends here -------------->
<!-- Thank You popup starts -->
<div class="modal fade custom-thank-you-modal modal-lg"
	id="requirement-posted" aria-hidden="true"
	aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<img class="modal-img mb-16"
				src="assets/icons/Succeess Animation.svg" alt="Success Animation">
			<h2 class="modal-heading text-center mb-8">Thank You</h2>
			<p class="modal-para text-center" id="requirmentText">You've successfully posted your
				requirement ABC-fgh12345. Cnerzy will be reviewing your requirement
				in 1-2 days.</p>
		</div>
	</div>
</div>
<!-- Thank You popup ends -->
