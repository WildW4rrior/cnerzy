<%@ include file="./taglibs.jsp" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>CNERZY | Requirements</title>
		<link rel="stylesheet" href="assets/css/style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
		<!-- for google icons -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!-- DataTables CSS -->

		<link href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css">
		<link rel="stylesheet" href="assets/css/registration.css">
		<!-- <link rel="stylesheet" href="assets/css/dashboard.css"> -->


	</head>
	<style>
		.mainDivSection3 .location {
			margin: 0
		}

		.mainDivSection3 .ratingDiv .ratings .rating {
			margin: 0;
			padding: 0.3rem 0;
		}
	</style>

	<body>

		<!------------- navbar starts here -------------->
		<c:import url="navbar.jsp"></c:import>
		<!------------- navbar ends here -------------->

		<!------------- page content starts here -------------->

		<div class="wrapper">
			<c:import url="sidebar.jsp"></c:import>


			<div class="main-content " id="tableDiv">
				<section class="projects mainShadow">
					<div class="heading">
						<div class="headingStatus">
							<h1 id="allHeader" class="active">All (0)</h1>
							<h1 id="inReviewHeader">In Review (0)</h1>
							<h1 id="wonHeader">Completed (0)</h1>
							<h1 id="lostHeader">Lost (0)</h1>
						</div>
						<div class="sorting ">
							<p>Sort by:</p>
							<div class="btn-group">
								<button class="btn  dropdown-toggle expand-icon " type="button"
									id="dropdownMenuClickableInside" data-bs-toggle="dropdown"
									data-bs-auto-close="inside" aria-expanded="true">Newest</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuClickableInside">
									<li><a class="dropdown-item disabled">Select</a></li>
									<li><a class="dropdown-item">Newest</a></li>
									<li><a class="dropdown-item">Oldest</a></li>
								</ul>
							</div>

						</div>
					</div>
					<div class="">

						<table id="sellerRequirement-table" class="" style="width: 100%">
							<tbody>
								<!-- DataTables will dynamically populate rows here -->
							</tbody>
						</table>

					</div>
				</section>
			</div>

			<!---------- For Upload or drag and drop --------->
			<div class="main-content" id="DiscussModal" style="display: none">
				<div class="row">
					<div class="col-12 col-sm-12 col-md-12 col-lg-12">
						<div class="breadcrumb-row d-flex">
							<div class="d-flex">
								<div class="breadcrumb-icon-box" onclick="replaceDiv('DiscussModal','tableDiv')">
									<img class="breadcrumb-icon" src="assets/icons/breadcrumb-arrow.svg" alt="">
								</div>
								<div class="breadcrumb-text" id="reqNo">
									Proj-ih12345
								</div>
							</div>
							<div>
								<button class="btn-outlined" data-bs-toggle="modal" data-bs-target="#withdraw-modal"
									id="WithdrawButton">Withdraw</button>
								<!-- <button class="btn-outlined" data-bs-toggle="modal"
									data-bs-target="#reject-modal">Reject</button> -->
							</div>
						</div>
						<div class="right-content">
							<div class="row row-gap-16">
								<div class="col-lg-8 col-md-12">
									<form action="" id="upload-document-form" enctype="multipart/form-data">
										<div class="custom-file-upload-section-1" id="document-upload-section">
											<div class="inner-1">
												<div class="click-area">
													<input name="addedForCid" id="addedForCid" hidden>
													<input name="reqId" id="reqId" hidden>

													<input type="file" name="file" id="document-file" hidden>
													<div class="icon-box">
														<img src="assets/icons/fileupload.svg" alt="">
													</div>
													<h4 class="text-center">Click to Upload <span>or drag and
															drop</span>
													</h4>
												</div>
												<h6 class="mt-8 mb-8 text-center">or</h6>
												<div class="field-group link-field-group">
													<div class="input-icon start">
														<img src="assets/icons/link.svg" alt="">
													</div>
													<input type="text" name="fileViaLink" id="document_link"
														autocomplete="off" class="input-field"
														placeholder="Paste Link Here">
													<div class="input-icon end">
														<img src="assets/icons/arrow-next.svg" alt="">
													</div>
													<span id="document_link_err" class="err-text"></span>
												</div>
												<div class="secure-box mt-32">
													<div class="icon-box mr-8">
														<img src="assets/icons/secure.svg" alt="">
													</div>
													<div class="text-box">
														<span>All uploads are secure and confidential.</span>
													</div>

												</div>
											</div>
											<div class="inner-2 d-none">
												<button class="btn-style-1 filename d-none"></button>
												<div><span id="file_err" class="err-text"></span></div>
												<div class="field-group link-field-group d-none">
													<div class="input-icon start">
														<img src="assets/icons/link.svg" alt="">
													</div>
													<span></span>
												</div>
												<span id="fileViaLink_err" class="err-text"></span>
												<div class="field-group textarea-field-group-1 mt-16 mb-32">
													<textarea name="description" id="document_description"
														class="input-field" placeholder="Brief Description here..."
														cols="100" autocomplete="off"></textarea>
													<span id="document_description_err" class="err-text"></span>
												</div>
												<div class="row">
													<div class="col-12 d-block d-sm-flex justify-content-end">
														<button class="btn-style-4 btn-cancel mr-16" type="button"
															onclick="chooseAgain('document-upload-section')">Cancel</button>
														<button class="btn-style-1 btn-save" type="submit">Save</button>
													</div>
												</div>
											</div>
										</div>
									</form>
									<div class="mt-32">
										<h5 class="mb-16">All Documents</h5>
										<div class="row row-gap-16" id="addDocumnetDiv">
											<div class="col-12">
												<div class="document-card-style-1 unread-doc">
													<div class="left">
														<div class="icon-box">
															<img src="assets/icons/file.svg" alt="icon">
														</div>
														<div>
															<p class="primary-text">NDA_Buyer_Seller.pdf</p>
															<p class="secondary-text">Lorem Ipsum is simply dummy text
																of
																the printing and typesetting industry.</p>
														</div>
													</div>
													<div class="right">
														<div class="from">
															<span>Received From Seller</span>
														</div>
														<p class="tertiary-text">Uploaded: 2 Days Ago</p>
													</div>
												</div>
											</div>
											<div class="col-12">
												<div class="document-card-style-1 read-doc">
													<div class="left">
														<div class="icon-box">
															<img src="assets/icons/link.svg" alt="icon">
														</div>
														<div>
															<p class="primary-text">NDA_Buyer_Seller.pdf</p>
															<p class="secondary-text">Lorem Ipsum is simply dummy text
																of
																the printing and typesetting industry.</p>
														</div>
													</div>
													<div class="right">
														<div class="from">
															<span>Document by Me</span>
														</div>
														<p class="tertiary-text">Uploaded: 2 Days Ago</p>
													</div>
												</div>
											</div>
											<div class="col-12">
												<div class="document-card-style-1 read-doc">
													<div class="left">
														<div class="icon-box">
															<img src="assets/icons/file.svg" alt="icon">
														</div>
														<div>
															<p class="primary-text">NDA_Buyer_Seller.pdf</p>
															<p class="secondary-text">Lorem Ipsum is simply dummy text
																of
																the printing and typesetting industry.</p>
														</div>
													</div>
													<div class="right">
														<div class="from">
															<span>Received From Seller</span>
														</div>
														<p class="tertiary-text">Uploaded: 2 Days Ago</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-12">

									<div class="" id="documnetsDicuessUser">
										<div class="card-type">
											
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- requirement details modal starts here -->
		<div class="modal fade modal-xl" id="requirement-details" tabindex="-1" aria-labelledby="requirement-details"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body p-0">
						<div class="section-style-3-parent">
							<div class="section-style-3">
								<div class="header">
									<div class="row row-gap-24">
										<div class="col-12 col-sm-6 col-md-6 col-lg-6">
											<h6 class="heading">ABC-fgh12341</h6>
											<p class="text">Feb 13, 12:28PM (7 days ago)</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6 col-lg-6 d-flex justify-content-end">
											<button class="outline-btn-style-3 mr-16" type="button">Show
												Interest</button>
											<button class="outline-btn-style-2" type="button">Not Interested</button>
										</div>
									</div>
								</div>
								<div class="row row-gap-24">
									<div class="col-12 col-sm-6 col-md-6 col-lg-6">
										<h6 class="heading">Title</h6>
										<p class="text">Lorem Ipsum is simply dummy text</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">Industry</h6>
										<p class="text">Aerospace</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">Services</h6>
										<p class="text">Aerospace</p>
									</div>
								</div>
							</div>
							<div class="section-style-3">
								<div class="row row-gap-24">
									<div class="col-12">
										<h6 class="heading">Brief Description</h6>
										<p class="text">Lorem Ipsum is simply dummy text of the printing and typesetting
											industry. Lorem Ipsum has been the industry's standard dummy text ever since
											the 1500s, when an unknown printer took a galley of type and scrambled it to
											make a type specimen book. It has survived not only five centuries, but also
											the leap into electronic typesetting, remaining essentially unchanged. It
											was popularised in the 1960s with the release of Letraset sheets containing
											Lorem Ipsum passages, and more recently with desktop publishing software
											like Aldus PageMaker including versions of Lorem Ipsum.</p>
									</div>
								</div>
							</div>
							<div class="section-style-3">
								<div class="row row-gap-24">
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">Quantity</h6>
										<p class="text">1,00,000</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">Material Specifications</h6>
										<p class="text">Lorem Ipsum, Lorem Ipsumr</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">Quality Specifications</h6>
										<p class="text">Lorem Ipsum, Lorem Ipsum</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">Packaging Specifications</h6>
										<p class="text">Lorem Ipsum, Lorem Ipsum</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">Logistics Specifications</h6>
										<p class="text">Lorem Ipsum, Lorem Ipsum</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">Delivery Timelines</h6>
										<p class="text">100</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6 col-lg-3">
										<h6 class="heading">Seller Location</h6>
										<p class="text">US</p>
									</div>
								</div>
							</div>
							<div class="section-style-3">
								<div class="row row-gap-24">
									<div class="col-12">
										<h6 class="heading">Seller Preferences</h6>
										<p class="text">Cnerzy recommended suppliers</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- requirement details modal starts here -->


		<!-- Timeline Popup starts here -->
		<div class="modal fade pm-dashboard-timeline modal-xl" id="timeline" tabindex="-1"
			aria-labelledby="timelineLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<img class="close-icon" src="assets/icons/close-modal.svg" alt="close" data-bs-dismiss="modal"
						aria-label="Close">
					<div class="modal-body">
						<div class="timeline-container">
							<div class="">
								<h5 class="title" id="timelineLabel">Requirement Timeline</h5>
								<p class="project-id-text" id="projectId"></p>
							</div>
							<div class="timeline">
								<div class="timeline-item " data-key="Requirement Intimation">
									<div class="icon"></div>
									<div class="text">Recieved </div>
									<div class="date">
									</div>
								</div>
								<div class="timeline-item " data-key="Discussion Initiated">
									<div class="icon"></div>
									<div class="text">Discussion</div>
									<div class="date">
									</div>
								</div>
								<div class="timeline-item " data-key="Negotiations">
									<div class="icon"></div>
									<div class="text">Negotiation</div>
									<div class="date">
									</div>
								</div>

								<div class="timeline-item" data-key="Contract Issued">
									<div class="icon"></div>
									<div class="text">Contract/PO</div>
									<div class="date">
									</div>
								</div>
								<div class="timeline-item" data-key="Project Kickoff">
									<div class="icon"></div>
									<div class="text">Kick-off</div>
									<div class="date">
									</div>
								</div>

								<!-- 							<div class="timeline-item" data-key="Contract Issued"> -->
								<!-- 								<div class="icon"></div> -->
								<!-- 								<div class="text">Contract Issued</div> -->
								<!-- 								<div class="date"> -->
								<!-- 								</div> -->
								<!-- 							</div> -->
								<!-- 							<div class="timeline-item" data-key="Project Kickoff"> -->
								<!-- 								<div class="icon"></div> -->
								<!-- 								<div class="text">Project Kickoff</div> -->
								<!-- 								<div class="date"> -->
								<!-- 								</div> -->
								<!-- 							</div> -->
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- Timeline Popup starts here -->


		<!-- Withdraw popup starts -->
		<div class="modal fade modal-lg custom-edit-modal custom-withdraw-modal" id="withdraw-modal" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<form action="" id="withdraw-form">
					<div class="modal-content">
						<div class="body">
							<input name="addedForCid" id="addedForCid" hidden>
							<input name="reqId" id="reqId" hidden>

							<h4 class="mb-32">Are you sure you want to withdraw from this discussion process? If yes,
								please select reason of withdrawal!</h4>
							<div class="container-fluid">
								<div class="checkbox-field-group mb-8 d-flex">
									<input type="checkbox" name="unfeasibleProjectScope" id="unfeasibleProjectScope"
										class="mr-8" autocomplete="off"><label for="unfeasibleProjectScope">Unfeasible
										project scope</label>
								</div>
								<div class="checkbox-field-group mb-8 d-flex">
									<input type="checkbox" name="paymentTermsNotSuitable" id="paymentTermsNotSuitable"
										class="mr-8" autocomplete="off"><label for="paymentTermsNotSuitable">Payment
										terms not suitable</label>
								</div>
								<div class="checkbox-field-group mb-8 d-flex">
									<input type="checkbox" name="projectTimelineNotAchievable"
										id="projectTimelineNotAchievable" class="mr-8" autocomplete="off"><label
										for="projectTimelineNotAchievable">Project timeline not achievable</label>
								</div>
								<div class="checkbox-field-group mb-8 d-flex">
									<input type="checkbox" name="clientExpectationsNotAligned"
										id="clientExpectationsNotAligned" class="mr-8" autocomplete="off"><label
										for="clientExpectationsNotAligned">Client expectations not aligned</label>
								</div>
								<div class="checkbox-field-group d-flex">
									<input type="checkbox" name="other" id="other" class="mr-8"
										autocomplete="off"><label for="other">Other</label>
								</div>
								<span class="err-text" id="checkboxes_err"></span>
								<div class="field-group textarea-field-group-1 mt-16 d-none" id="otherTextBox">
									<textarea name="otherText" id="otherText" class="input-field"
										placeholder="Brief Description here..." cols="100"></textarea>
									<span id="otherText_err" class="err-text"></span>
								</div>
							</div>
						</div>
						<div class="footer">
							<div class="row">
								<div class="col-12 d-flex justify-content-end">
									<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
										<button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal"
											aria-label="Close">Cancel</button>
										<button class="btn-style-1 btn-save" type="submit">Save</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- Withdraw popup ends -->

		<div class="modal fade custom-thank-you-modal " id="NDAdocument" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered" style="    min-height: -webkit-fill-available;">
				<div class="modal-content" style="width: 704px; margin: auto; height: auto;">
				<img class="close-icon" src="assets/icons/close-modal.svg" alt="close" data-bs-dismiss="modal"
					aria-label="Close">
				<img class="modal-img" src="assets/icons/Action-Required.svg" alt="Action-Required">
					<h2 class="modal-heading text-center mb-8"></h2>
					<p class="modal-para text-center">Please sign the NDA document
						sent to you via email to initiate the discussion with the buyer.</p>
				</div>
			</div>
		</div>

		<!-- Feedback Submitted(Withdraw-form) popup starts -->
		<div class="modal fade custom-thank-you-modal modal-lg" id="withdraw-feedback-submitted" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<img class="modal-img mb-16" src="assets/icons/Succeess Animation.svg" alt="Success Animation">
					<h2 class="modal-heading text-center mb-8">Feedback Submitted</h2>
					<p class="modal-para text-center">You have been successfully Withdraw from this discussion process.
					</p>
				</div>
			</div>
		</div>
		<!-- Feedback Submitted(Withdraw-form) popup ends -->

		<!-- Project Initiated popup starts -->
		<div class="modal fade custom-thank-you-modal modal-lg" id="project-initiated" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<img class="modal-img mb-16" src="assets/icons/Succeess Animation.svg" alt="Success Animation">
					<h2 class="modal-heading text-center mb-8">Project Initiated</h2>
					<p class="modal-para text-center">We're excited to inform you that you've been selected for the
						[ProjectID] project!
						You can now check the status in the Projects section.</p>
				</div>
			</div>
		</div>
		<!-- Project Initiated popup ends -->

		<!-- Project Initiated popup ends -->

		<div class="modal fade custom-thank-you-modal" id="NDABuyerdocument" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered" style="    min-height: -webkit-fill-available;">
				<div class="modal-content" style="width: 704px; margin: auto; height: auto;">
				<img class="close-icon" src="assets/icons/close-modal.svg" alt="close" data-bs-dismiss="modal"
					aria-label="Close">
				<img class="modal-img mb-16"
					src="assets/icons/Awaiting-Icon.svg" alt="Awaiting-icon">
					<h2 class="modal-heading text-center mb-8"></h2>
					<p class="modal-para text-center">Waiting for buyer to sign the NDA.</p>
				</div>
			</div>
		</div>


		<!-- Awaiting Shortlisting popup starts -->
		<div class="modal fade custom-thank-you-modal modal-lg simple-modal" id="awaiting-shortlisting"
			aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false"
			data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<img class="close-icon" src="assets/icons/close-modal.svg" alt="close" data-bs-dismiss="modal"
						aria-label="Close">
					<img class="modal-img mb-16" src="assets/icons/Awaiting-Icon.svg" alt="Awaiting-icon">
					<h2 class="modal-heading text-center mb-8">Awaiting Shortlisting</h2>
					<p class="modal-para text-center">Your application is being considered by the buyer. We'll notify
						you when a decision is made.</p>
				</div>
			</div>
		</div>
		<!-- Awaiting Shortlisting popup ends -->

		<!-- shortlisted-congratulations popup starts -->
		<div class="modal fade custom-thank-you-modal modal-lg" id="shortlisted-congratulations" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<img class="close-icon" src="assets/icons/close-modal.svg" alt="close" data-bs-dismiss="modal"
						aria-label="Close">
					<img class="modal-img mb-16" src="assets/icons/Succeess Animation.svg" alt="Success Animation">
					<h2 class="modal-heading text-center mb-8">Congratulations!<br> You've Been Shortlisted!</h2>
					<p class="modal-para text-center">To proceed further, please carefully review and sign the
						Non-Disclosure Agreement (NDA) sent to your email address.
					</p>
				</div>
			</div>
		</div>
		<!-- shortlisted-congratulations popup ends -->


		<!------------- page content ends here -------------->
	</body>




	<!-- script for withdraw form starts here -->
	<script>
		document.addEventListener("DOMContentLoaded", function () {
			const withdrawModal = document.querySelector('#withdraw-modal')
			const otherCheckboxField = withdrawModal.querySelector('#other');
			const otherTextCheckboxField = withdrawModal.querySelector('#otherTextBox');
			const otherText = withdrawModal.querySelector('#otherText');
			const checkboxInputs = withdrawModal.querySelectorAll('input');

			otherCheckboxField.addEventListener('click', function () {
				otherTextCheckboxField.classList.toggle('d-none');
				if (!otherTextCheckboxField.classList.contains('d-none')) {
					otherText.removeAttribute('required');
				} else {
					otherText.value = ''; // Clear the "Other" text input if the "Other" checkbox is unchecked
					showError('otherText_err', ''); // Clear the error message for "Other" text input
				}
			});

			function showError(id, errorMsg) {
				const errSpan = document.getElementById(id);
				errSpan.innerHTML = errorMsg;
			}

			function checkAtLeastOneCheckboxIsSelected() {
				let checked = false;
				for (const checkbox of checkboxInputs) {
					if (checkbox.checked) {
						checked = true;
						break;
					}
				}
				if (!checked) {
					showError('checkboxes_err', 'Please select any reason');
				} else {
					showError('checkboxes_err', '');
				}
				console.log('Any Checkbox checked-', checked);
				return checked;
			}

			function validateOtherText() {
				if (otherCheckboxField.checked && otherText.value.trim() === '') {
					showError('otherText_err', 'Brief Description is required');
					return false;
				} else {
					showError('otherText_err', '');
					return true;
				}
			}

			otherText.addEventListener('blur', function () {
				if (otherText.value.trim() === '') {
					showError('otherText_err', 'Brief Description is required');
				} else {
					showError('otherText_err', '');
				}
			})

			checkboxInputs.forEach(input => {
				input.addEventListener('change', function () {
					checkAtLeastOneCheckboxIsSelected();
				});
			});

			document.getElementById('withdraw-form').addEventListener('submit', function (e) {
				e.preventDefault(); // Prevent default form submission behavior
				const atLeastOneCheckboxSelected = checkAtLeastOneCheckboxIsSelected();
				const otherTextValid = validateOtherText();
				if (atLeastOneCheckboxSelected && otherTextValid) {
					// Get form data
					const form = document.getElementById('withdraw-form');
					const formData = new FormData(form);

					let formDataObj = {};
					formData.forEach((value, key) => {
						formDataObj[key] = value;
					});

					let json = JSON.stringify(updateRejectionReasons(formDataObj))
					console.log('form-data', json);
					var requestOptions = {
						method: 'POST',
						headers: {
							"Content-Type": "application/json", // Assuming you need to set this header
							// Add any other headers as needed
						},
						body: json
					};
					fetch(contextPath + "/sellerWithdrawnForReqId", requestOptions)
						.then(response => response.json())  // Parse the response as JSON
						.then(result => {

							if (result.status === 'true') {


								$("#withdraw-modal").modal('hide'); // Redirect to BuyersRequirementList
								$("#withdraw-feedback-submitted").modal('show')
								setTimeout(() => {
									location.reload();
								}, 3000);

							} else {
								toastr.error('Something went wrong');
							}
						})
					// Make API call with form data
				}
			});
		});
	</script>
	<!-- script for withdraw form ends here -->


	<!-- script for uploading document with description starts here -->
	<script>


		//----------------------------validation starts here---------------------------------
		// for validating file size
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
		// for showing error message
		function showError(id, errorMsg) {
			let errSpan = document.getElementById(id)
			if (errSpan) {
				errSpan.innerHTML = errorMsg
			}
		}

		// validationns for upload document or link
		const uploadDocumentForm = document.querySelector('#upload-document-form')
		var uploadDocumentFormInputs = uploadDocumentForm.querySelectorAll('input,select');
		var uploadDocumentFormErrorsArray = []
		for (let input of uploadDocumentFormInputs) {
			input.addEventListener('change', function () {
				validateUploadDocumentForm(input)
			})
		}

		document.querySelector('.custom-file-upload-section-1').addEventListener('fileDropped', function (e) {
			// Perform validation
			for (let input of uploadDocumentFormInputs) {
				if (input.name === 'file') {
					validateUploadDocumentForm(input);
				}
			}
		});
		function validateUploadDocumentForm(input) {
			let errorMessage = '';
			if (input.name == 'file') {
				if (input.files[0]) {
					let res = validateFileSize(input)
					if (!res) {
						if (!uploadDocumentFormErrorsArray.includes(input.name)) {
							uploadDocumentFormErrorsArray.push(input.name);
						}
						errorMessage = 'File size is too large';
						showError('file_err', errorMessage)
					} else {
						uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== input.name })
						showError('file_err', '')
					}
				} else {
					uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== input.name })
					showError('file_err', '')
				}

				showError('fileViaLink_err', '')
				uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== 'fileViaLink' })
				uploadDocumentForm.querySelector('input[name="fileViaLink"]').value = ''

			} else if (input.name == 'fileViaLink') {
				if (input.value != '') {
					const regex = /^(https?:\/\/)[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}(\/\S*)?$/;
					if (input.value.trim() == '' || !regex.test(input.value.trim())) {
						if (!uploadDocumentFormErrorsArray.includes(input.name)) {
							uploadDocumentFormErrorsArray.push(input.name);
						}
						errorMessage = 'Invalid file url';
						showError('fileViaLink_err', errorMessage)
					} else {
						showError('fileViaLink_err', '')
						uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== input.name })
					}
				} else {
					showError('fileViaLink_err', '')
					uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== input.name })
				}

				showError('file_err', '')
				uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== 'file' })
				document.getElementById('document-file').value = null;
			}

			console.log('errors-', uploadDocumentFormErrorsArray)
		}





		document.addEventListener("DOMContentLoaded", function () {
			document.getElementById('upload-document-form').addEventListener('submit', function (e) {
				e.preventDefault(); // Prevent default form submission behavior
				if (uploadDocumentFormErrorsArray.length == 0) {
					// Get form data
					const form = document.getElementById('upload-document-form');
					const formData = new FormData(form);

					let formDataObj = {};
					formData.forEach((value, key) => {
						formDataObj[key] = value;
					});

					let json = JSON.stringify(formDataObj);
					console.log('upload-document-form-data', json);

					var requestOptions = {
						method: 'POST',

						body: formData
					};
					fetch(contextPath + "/sendDocument", requestOptions)
						.then(response => response.json())  // Parse the response as JSON
						.then(result => {


							if (result.status === 'true') {
								chooseAgain('document-upload-section')
								var discussModalInputCid = $("#DiscussModal #addedForCid");
								var uploadLoiAndPoFormCid = $("#upload-loi-and-po-form #addedForCid ")
								var discussModalInputReqId = $("#DiscussModal #reqId");
								var uploadLoiAndPoFormReqId = $("#upload-loi-and-po-form #reqId")

								uploadLoiAndPoFormReqId.val(requirementId);
								discussModalInputReqId.val(requirementId);

								uploadLoiAndPoFormCid.val(sellerId);
								discussModalInputCid.val(sellerId);
								getDocumnets(sellerId, requirementId)

								toastr.success('Sucessfully Updated The Documents');


							} else {
								toastr.error('Something went wrong');
							}
						})
				}
				else {
					console.log('Please check errors', uploadDocumentFormErrorsArray)
				}
			});
		})
	</script>
	<!-- script for uploading document with description ends here -->


	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script src="assets/js/sellerRequirement-table.js"></script>
	<script src="assets/js/drag-and-drop-file.js"></script>


	<script>
		var requirementId;
		var sellerId;

		console.log("${role}");

		console.log("${role}")
		var userListJson;
		var contextPath = "${pageContext.request.contextPath}"
		const myHeaders = new Headers();
		myHeaders.append("Content-Type", "application/json");




		var requestOptions = {
			method: "GET",
			headers: myHeaders,

			redirect: "follow"
		};

		fetch(contextPath + "/getSellerRequirementList", requestOptions)
			.then(response => response.text())
			.then(result => {
				let userListJson = JSON.parse(result);
				// Filter out objects where the status is "In Review"
				userListJson = userListJson.filter(item => item.status !== "In Review");
				separatedData = processDataAndHeader(userListJson, "table");

				buyerTable(userListJson);
			})
			.catch(error => console.error("Error:", error));



		//-----------------------for fetching & showing cnerzy recommended sellers js starts-----------------


		var sellerCurrentPage = 1;
		var sellerRowsPerPage = 3;

		//for recommended sellers
		


		//-----------------------for fetching & showing cnerzy recommended sellers js ends-----------------

		// For example, you could show a modal and set its content based on the id
		// 		$('#requirement-details').modal('show');
		// $('#modalContent').text("Details for ID: " + id);

		function addToId(rowData, divId) {

			Object.keys(rowData).forEach(function(key) {
				var element = $("#" + data + " [name='" + key + "']");
				if (!element.length) {
					return;
				}

				var value = rowData[key] ? rowData[key] : "";

				if (key === 'comapnyLogoUrl') {
					var img = element.find('img');
					debugger
					if (img.length) {
						img.attr('src', value == "" ? "assets/icons/card-style-2-icon.svg" : value);
					}
					return
				}
				// else if (key === 'linkedInProfile' && element.is('a')) {
				// 	element.attr('href', value);
				// 	element.html(value);
				// } 
				else if (key === 'linkedInProfile') {
					if (value !== "") {
						let newElement = $('<a></a>').attr('href', value).html(value);
						element.replaceWith(newElement);
					} else {
						let newElement = $('<span></span>').html(value);
						element.replaceWith(newElement);
					}
				}
				else if (key === 'numberOfProjectsCompleted') {
					element.html(value === "" ? 0 + " Projects Completed" : value + " Projects Completed");
				} else if (key === 'ratings') {
					$("#" + data + " [name='ratings']").html("");
					var numOfRatings = value === "" ? 0 : value;

					if (numOfRatings % 1 !== 0) {
						// Extract the decimal part
						var decimalPart = numOfRatings % 1;

						// If the decimal part is less than 0.5, round down, otherwise round up
						numOfRatings = decimalPart < 0.5 ? Math.floor(numOfRatings) : Math.ceil(numOfRatings);
					}


					var content = `
		                <span class="text">${numOfRatings} Ratings</span>
		                <div class="stars">`;

					for (let i = 0; i < 5; i++) {
						if (i < numOfRatings) {
							content += `<i class="material-icons active">star</i>`;
						} else {
							content += `<i class="material-icons" >star_border</i>`;
						}
					}

					content += `</div>`;

					$("#" + data + " [name='ratings']").html(content);
				} else {
					if (key === "numberOfRatings" || key === 'comapnyLogoUrl') {
						return
					} else {
						element.html(value);
					}

				}
			});

		}

		function openDiscussModal(args) {
			if (args.isBuyerSignedNda && args.isNdaSendForSign && args.isSellerSignedNda) {
				if (args.status === "Won" || args.status === "Lost") {
					$("#WithdrawButton").hide();
				} else {
					$("#WithdrawButton").show();

				}


				sellerId = args.buyerCid
				requirementId = args.requirementId
				replaceDiv("tableDiv", "DiscussModal")
				getDocumnets(sellerId, requirementId)
				getBuyerProfile(sellerId)
				//add reqId

				var discussModalInputCid = $("#DiscussModal #addedForCid");
				var uploadLoiAndPoFormCid = $("#upload-loi-and-po-form #addedForCid ")
				var discussModalInputReqId = $("#DiscussModal #reqId");
				var uploadLoiAndPoFormReqId = $("#upload-loi-and-po-form #reqId")
				var rejectModalCid = $("#withdraw-modal #addedForCid ")
				var rejectModalReqId = $("#withdraw-modal #reqId")
				var breadCrum = $(".breadcrumb-text#reqNo")

				breadCrum.html(args.requirementNo)
				uploadLoiAndPoFormReqId.val(requirementId);
				discussModalInputReqId.val(requirementId);
				rejectModalCid.val(sellerId);

				rejectModalReqId.val(requirementId)
				uploadLoiAndPoFormCid.val(sellerId);
				discussModalInputCid.val(sellerId);



			} else {
				if (args.isNdaSendForSign) {
					if (!args.isBuyerSignedNda) {
						$("#NDABuyerdocument").modal("show")
						return
					}

					if (!args.isSellerSignedNda) {
						$("#NDAdocument").modal("show")
					}
				}
			}
		}


		function replaceDiv(replace, show) {

			$("#" + show).show();

			$("#" + replace).hide();

		}

		function getBuyerProfile(id) {


			var requestOptions = {
				method: "GET",
				headers: {
					"Content-Type": "application/json", // Assuming you need to set this header
					// Add any other headers as needed
				}
			};

			fetch(contextPath + "/getBuyerProfileData?id=" + sellerId, requestOptions)
				.then((response) => response.text())
				.then(result => {

					result = JSON.parse(result)

					
					sellerDivFunction(result, "documnetsDicuessUser")

				})
				.catch(error => console.error("Error:", error));

		}
		function updateRejectionReasons(data) {
			const rejectionReason = [];

			// Map the JSON keys to the corresponding human-readable rejection reasons
			const reasonsMap = {
				lackOfTechnicalCompetency: "Lack of Technical Competency",
				proposalLacsClarity: "Proposal Lacks Clarity",
				unacceptableTermsConditions: "Unacceptable Terms Conditions",
				unmetCommercialExpectations: "Unmet Commercial Expectations"
			};

			// Iterate over the keys in the reasonsMap
			for (const key in reasonsMap) {
				if (data[key] === "on") {
					if (data[key] === "other")
						return;

					rejectionReason.push(reasonsMap[key]);
					delete data[key];  // Remove the key from the data object
				}
			}

			// Add the otherText value if the 'other' reason is 'on'
			if (data.other === "on" || data.otherText) {
				rejectionReason.push(data.otherText);
				delete data.otherText;  // Remove the otherText key from the data object
			}

			// Remove the 'other' key from the data object
			delete data.other;

			// Join the array elements with a pipe separator and add it to the data object
			data.rejectionReasons = rejectionReason.join('|');

			return data;
		}






	</script>



	</html>