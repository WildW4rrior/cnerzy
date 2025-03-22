<%@ include file="./taglibs.jsp"%>


<!------------- page content starts here -------------->

<div class="col-12 col-sm-12 col-md-12 col-lg-12" id="editRequirment" style="display:none">
	<div class="breadcrumb-row d-flex">
		<div class="breadcrumb-left-col">
			<div class="breadcrumb-icon-box" onclick="firstCall()">
				<img class="breadcrumb-icon" style="cursor: pointer;" src="assets/icons/breadcrumb-arrow.svg"
					alt="">
			</div>
			<div class="breadcrumb-text" id="actionHeading">Edit an Existing Requirement</div>
		</div>
	</div>
	<div class="right-content">
		<div class="row row-gap-16">
			<div class="col-12">
				<div class="section-style-1">
					<div class="row row-gap-24">
						<div class="col-12 col-sm-6 col-md-6 col-lg-4">
						<p  class="text" id="editreEngagedSellerCid" hidden></p>
							<h6 class="heading">Title</h6>
							<p class="text" id="editjobPostTitle">Lorem Ipsum�is simply dummy text</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-4">
							<h6 class="heading">Industry</h6>
							<p class="text" id="editindustry">Aerospace</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-4">
							<h6 class="heading">Services</h6>
							<p class="text" id="editservice">Aerospace</p>
						</div>
					</div>
					<img class="icon" src="assets/icons/edit.svg" alt="edit"
						data-bs-toggle="modal" data-bs-target="#industry-and-service">
				</div>
			</div>
			<div class="col-12">
				<div class="section-style-1">
					<div class="row">
						<div class="col-12">
							<h6 class="heading">Brief Description</h6>
							<p class="text" id="editprojectDescription" style="word-wrap: break-word;">Lorem Ipsum�is simply dummy text of the
								printing and typesetting industry. Lorem Ipsum has been the
								industry's standard dummy text ever since the 1500s, when an
								unknown printer took a galley of type and scrambled it to make a
								type specimen book. It has survived not only five centuries, but
								also the leap into electronic typesetting, remaining essentially
								unchanged. It was popularised in the 1960s with the release of
								Letraset sheets containing Lorem Ipsum passages, and more
								recently with desktop publishing software like Aldus PageMaker
								including versions of Lorem Ipsum.</p>
						</div>
					</div>
					<img class="icon" src="assets/icons/edit.svg"
						data-bs-toggle="modal" data-bs-target="#edit-description"
						alt="edit">
				</div>
			</div>
			<div class="col-12">
				<div class="section-style-1">
					<div class="row row-gap-24">
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Quantity</h6>
							<p class="text" id="editquantityRequired">1,00,000</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Material Specifications</h6>
							<p class="text" id="editmaterialSpecifications">Lorem Ipsum, Lorem Ipsum</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Quality Specifications</h6>
							<p class="text" id="editqualitySpecifications">Lorem Ipsum, Lorem Ipsum</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Packaging Specifications</h6>
							<p class="text" id="editpackagingSpecifications">Lorem Ipsum, Lorem Ipsum</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Logistics Specifications</h6>
							<p class="text" id="editlogisticsSpecifications">1,00,000</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Delivery Timelines</h6>
							<p class="text" id="editdeliveryTimelines">1,00,000</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Seller Location</h6>
							<p class="text" id="editsellerLocation">US</p>
						</div>
					</div>
					<img class="icon" src="assets/icons/edit.svg"
						data-bs-toggle="modal" data-bs-target="#edit-specifications"
						alt="edit">
				</div>
			</div>
			<div class="col-12">
				<div class="section-style-1">
					<div class="row">
						<div class="col-12">
							<h6 class="heading">Seller Preferences</h6>
							<p class="text" id="editsellerPreference">Cnerzy recommended sellers</p>
						</div>
					</div>
					<img class="icon" src="assets/icons/edit.svg"
						data-bs-toggle="modal" id="editButtonForSellerPreferencer" data-bs-target="#edit-seller-preferences"
						alt="edit">
				</div>
			</div>
			<div class="col-12 d-flex justify-content-end">
				<button class="btn-style-1 mt-32" onclick="handleEditSubmit()">Post</button>
			</div>
		</div>
	</div>
</div>


<!------------- page content starts here -------------->

<!-- Edit Industry and Service popup starts -->
<div class="modal fade modal-lg custom-edit-modal"
	id="industry-and-service" aria-hidden="true"
	aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="body">
				<h3 class="heading">Edit Industry and Service</h3>
				<div class="row row-gap-24">
				<div class="col-lg-12 col-12">
				<input type="text" name="reEngagedSellerCid" class="input-field" hidden>
						
						<div class="field-group">
							<input type="text" name="jobPostTitle" class="input-field"
								placeholder="jobPostTitle" required autocomplete="off"
								> <label for="jobPostTitle"
								class="input-label">Title<span
								class="required-asterisk">*</span></label>
								<span id="e_jobPostTitle_err" class="err-text"></span>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-6">
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
							</label> <span id="e_industry_err" class="err-text"></span>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-6">
						<div
							class="field-group select-field-group select-field-group-toggle">
							<select name="service" id="service"
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
							</label> <span id="e_service_err" class="err-text"></span>

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
							<button class="btn-style-1 btn-save" onclick="save('#industry-and-service')">Save</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Edit Industry and Service popup ends -->


<!-- Edit Description popup starts -->
<div class="modal fade modal-lg custom-edit-modal" id="edit-description"
	aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
	tabindex="-1" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="body">
				<h3 class="heading">Edit Brief Description</h3>
				<div class="row row-gap-24">
					<div class="col-12">
						<div class="field-group">
							<textarea name="projectDescription" id="projectDescription"
								rows="8" class="input-field"
								placeholder="Brief Description of Project">Lorem Ipsum�is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</textarea>
							<label for="projectDescription" class="input-label">Brief
								Description of Project<span class="required-asterisk">*</span>
							</label>
							<span id="e_projectDescription_err" class="err-text"></span>
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
							<button class="btn-style-1 btn-save" onclick="save('#edit-description')">Save</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Edit Description popup ends -->


<!-- Edit Specifications popup starts -->
<div class="modal fade modal-lg custom-edit-modal"
	id="edit-specifications" aria-hidden="true"
	aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="body">
				<h3 class="heading">Edit Specifications</h3>
				<div class="row row-gap-24">
					<div class="col-lg-6 col-md-12 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="quantityRequired" class="input-field"
								placeholder="Quantity Required" required autocomplete="off"
								> <label for="quantityRequired"
								class="input-label">Quantity Required<span
								class="required-asterisk">*</span></label>
								<span id="e_quantityRequired_err" class="err-text"></span>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="materialSpecifications"
								class="input-field" placeholder="Material Specifications"
								required autocomplete="off"> <label
								for="materialSpecifications" class="input-label">Material
								Specifications<span class="required-asterisk">*</span>
							</label>
							<span id="e_materialSpecifications_err" class="err-text"></span>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="qualitySpecifications"
								class="input-field" placeholder="Quality Specifications"
								required autocomplete="off"> <label
								for="qualitySpecifications" class="input-label">Quality
								Specifications<span class="required-asterisk">*</span>
							</label>
							<span id="e_qualitySpecifications_err" class="err-text"></span>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="packagingSpecifications"
								class="input-field" placeholder="Packaging Specifications"
								required autocomplete="off"> <label
								for="packagingSpecifications" class="input-label">Packaging
								Specifications<span class="required-asterisk">*</span>
							</label>
							<span id="e_packagingSpecifications_err" class="err-text"></span>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="logisticsSpecifications"
								class="input-field" placeholder="Logistics Specifications"
								required autocomplete="off"> <label
								for="logisticsSpecifications" class="input-label">Logistics
								Specifications<span class="required-asterisk">*</span>
							</label>
							<span id="e_logisticsSpecifications_err" class="err-text"></span>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-12">
						<div class="field-group">
							<input type="text" name="deliveryTimelines" class="input-field"
								placeholder="Delivery Timelines" required autocomplete="off"
								value="2 Days"> <label for="deliveryTimelines"
								class="input-label">Delivery Timelines<span
								class="required-asterisk">*</span></label>
								<span id="e_deliveryTimelines_err" class="err-text"></span>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-12">
						<div class="field-group select-field-group">
							<select name="sellerLocation" id="sellerLocation"
								class="input-field form-dropdown" required autocomplete="off">
								<option value="" hidden></option>
								<option value="India" selected>India</option>
								<option value="US">US</option>
							</select> <label for="service" class="input-label">Choose a Seller
								Location<span class="required-asterisk">*</span>
							</label>
							<span id="e_sellerLocation_err" class="err-text"></span>
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
							<button class="btn-style-1 btn-save" onclick="save('#edit-specifications')">Save</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Edit Specifications popup ends -->


<!-- Edit Seller Preferences popup starts -->
<div class="modal fade modal-lg custom-edit-modal"
	id="edit-seller-preferences" aria-hidden="true"
	aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="body">
				<h3 class="heading">Edit Seller Preferences</h3>
				<div class="row row-gap-24">
					<div class="col-12">
						<div class="field-group select-field-group">
							<select name="sellerPreference" id="sellerPreference"
									class="input-field form-dropdown" required autocomplete="off">
								<option value="" selected>Preferred Sellers</option>
								<option value="Cnerzy recommended">Cnerzy
									recommended sellers</option>
								<option value="Previosly Engaged">Invite
									previously engaged sellers</option>
							</select> <label for="sellerPreferences" class="input-label">Preferred
								Sellers <span class="required-asterisk">*</span>
							</label>
							<span id="e_sellerPreference_err" class="err-text"></span>
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
							<button class="btn-style-1 btn-save" onclick="save('#edit-seller-preferences')">Save</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Edit Seller Preferences popup ends -->