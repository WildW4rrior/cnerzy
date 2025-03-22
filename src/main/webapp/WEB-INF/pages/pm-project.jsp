<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PM | PROJECTS</title>
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
<!-- DataTables CSS -->

<link
	href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css">
<!-- <link rel="stylesheet" href="assets/css/dashboard.css"> -->
<link rel="stylesheet" href="assets/css/registration.css">
<link
	href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css"
	rel="stylesheet">


</head>
<style>
table p {
	margin: 0
}

#milestoneJurney button:disabled {
	opacity: .5;
	cursor: not-allowed;
}

.inactive {
	background: rgba(255, 255, 255, 1);
	color: rgba(122, 122, 122, 1);
	padding: 7px 21px;
	font-family: var(--secondary-font);
	font-size: 20px;
	border-radius: 6px;
	font-weight: 400;
}
</style>

<body>

	<!------------- navbar starts here -------------->
	<c:import url="navbar.jsp"></c:import>
	<!------------- navbar ends here -------------->

	<!------------- page content starts here -------------->

	<div class="wrapper">
		<c:import url="sidebar.jsp"></c:import>

		<!------------ For All PM's Projects ---------->
		<div class="main-content " id="tableDiv">
			<section class="projects mainShadow">
				<div class="heading">
					<div class="headingStatus">
						<h1 id="allHeader" class="active">All Projects (0)</h1>
						<h1 id="activeHeader">Active (0)</h1>
						<h1 id="completedHeader">Completed (0)</h1>
					</div>
					<div class="sorting ">
						<p>Sort by:</p>
						<div class="btn-group">
							<button class="btn  dropdown-toggle expand-icon" type="button"
								id="dropdownMenuClickableInside" data-bs-toggle="dropdown"
								data-bs-auto-close="inside" aria-expanded="true">Newest</button>
							<ul class="dropdown-menu"
								aria-labelledby="dropdownMenuClickableInside">

								<li><a class="dropdown-item disabled">Select</a></li>
								<li><a class="dropdown-item">Newest</a></li>
								<li><a class="dropdown-item">Oldest</a></li>
							</ul>
						</div>

					</div>
				</div>
				<div class="">

					<table id="pmProjects-table" class="" style="width: 100%">
						<tbody>
							<!-- DataTables will dynamically populate rows here -->
						</tbody>
					</table>

				</div>
			</section>
		</div>

		<!------------ For Single Project Detail(After Project Initiation) --------->
		<div class="main-content " id="SingleProjectDetail"
			style="display: none">
			<div class="row">
				<div class="col-12 col-sm-12 col-md-12 col-lg-12">
					<div class="breadcrumb-row d-flex">
						<div class="breadcrumb-left-col">
							<div class="breadcrumb-icon-box"
								onclick="replaceDiv('SingleProjectDetail','tableDiv')">
								<img class="breadcrumb-icon"
									src="assets/icons/breadcrumb-arrow.svg" alt="">
							</div>
							<div class="breadcrumb-text" id="requirementNo">ASH-13510NVD</div>
						</div>
						<div class="d-none" id="query-btn-box">
							<button class="btn-outlined" data-bs-toggle="modal"
								data-bs-target="#send-queries-modal">Send Queries</button>
						</div>
					</div>
					<nav class="mb-16 tabs-style-2-nav-container">
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<button class="nav-link active" id="nav-overview-tab"
								data-bs-toggle="tab" data-bs-target="#nav-overview"
								type="button" role="tab" aria-controls="nav-overview"
								aria-selected="true">Overview</button>
							<button class="nav-link" id="details-tab" data-bs-toggle="tab"
								data-bs-target="#details" type="button" role="tab"
								aria-controls="details" aria-selected="false">Details</button>
							<button class="nav-link" id="nav-documents-tab"
								data-bs-toggle="tab" data-bs-target="#nav-documents"
								type="button" role="tab" aria-controls="nav-documents"
								aria-selected="false">Documents</button>
							<button class="nav-link" id="nav-timeline-tab"
								data-bs-toggle="tab" data-bs-target="#nav-timeline"
								type="button" role="tab" aria-controls="nav-timeline"
								aria-selected="false" onclick="openTimeLine()">Timeline</button>
						</div>
					</nav>

					<div class="tab-content right-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-overview"
							role="tabpanel" aria-labelledby="nav-overview-tab" tabindex="0">
							<div class="section-style-4">
								<div class="item-container" id="price">
									<div class="item">
										<div class="item-content">
											<h6 class="secondary-text">Project price</h6>
											<p class="primary-text" id="projectPrice">&#8377; 2 Crore</p>
										</div>
									</div>
									<div class="item">
										<div class="item-content">
											<h6 class="secondary-text">In escrow</h6>
											<p class="primary-text" id="inEscrow">&#8377; 0.00</p>
										</div>
									</div>
									<div class="item">
										<div class="item-content">
											<h6 class="secondary-text" id="milestonesPaidText">Milestones
												paid (0)</h6>
											<p class="primary-text" id="milestonesPaid">&#8377; 0.00</p>
										</div>
									</div>
									<div class="item">
										<div class="item-content">
											<h6 class="secondary-text" id="milestonesDueText">Milestones
												Due (1)</h6>
											<p class="primary-text" id="milestonesDue">&#8377; 0.00</p>
										</div>
									</div>
									<!-- <div class="item">
									
										<div class="item-content">
											<h6 class="secondary-text">Total Charges</h6>
											<p class="primary-text" id="service">&#8377; 0.00</p>
										</div>
									</div> -->

								</div>
							</div>
							<div
								style="display: flex; align-items: center; justify-content: space-between;"
								class="mt-32 mb-16">
								<h5 class="">Milestone Timeline</h5>
								<div class=" justify-content-end align-items-center row-gap-16"
									id="paymentDiv" style="display: flex">
									<div>


										<h6 class="buyerPaymentOption-label mr-16 mb-2 mb-sm-0">Buyer
											Payment Option</h6>
										<input type="radio" name="buyerPaymentOption" class="mr-8"
											value="oneTime">One-Time <input type="radio"
											name="buyerPaymentOption" class="ml-16 mr-8"
											value="milestoneBased">Milestone-Based

									</div>

								</div>

								<div style="text-align: right; display: none" id="paymentOption"></div>
							</div>

							<div id="milestoneJurney"></div>
							<div class="mt-16">
								<button class="btn-style-1 add-milestone-btn"
									onclick="checkpaymantoption()">
									<img src="assets/icons/add.svg" alt="+">Add a New
									Milestone
								</button>
							</div>
						</div>

						<div class="tab-pane fade" id="details" role="tabpanel"
							aria-labelledby="details-tab" tabindex="0">
							<div class="row row-gap-16" id="detailedPost">
								<div class="col-12">
									<div class="section-style-1">
										<div class="row row-gap-24">
											<div class="col-12 col-sm-6 col-md-6 col-lg-4">
												<h6 class="heading">Title</h6>
												<p class="text" id="jobPostTitle">Lorem Ipsum�is
													simply dummy text</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-4">
												<h6 class="heading">Industry</h6>
												<p class="text" id="industry">Aerospace</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-4">
												<h6 class="heading">Services</h6>
												<p class="text" id="service">Aerospace</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="section-style-1">
										<div class="row">
											<div class="col-12">
												<h6 class="heading">Brief Description</h6>
												<p class="text" id="projectDescription">Lorem Ipsum�is
													simply dummy text of the printing and typesetting industry.
													Lorem Ipsum has been the industry's standard dummy text
													ever since the 1500s, when an unknown printer took a galley
													of type and scrambled it to make a type specimen book. It
													has survived not only five centuries, but also the leap
													into electronic typesetting, remaining essentially
													unchanged. It was popularised in the 1960s with the release
													of Letraset sheets containing Lorem Ipsum passages, and
													more recently with desktop publishing software like Aldus
													PageMaker including versions of Lorem Ipsum.</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="section-style-1">
										<div class="row row-gap-24">
											<div class="col-12 col-sm-6 col-md-6 col-lg-3">
												<h6 class="heading">Quantity</h6>
												<p class="text" id="quantityRequired">1,00,000</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-3">
												<h6 class="heading">Material Specifications</h6>
												<p class="text" id="materialSpecifications">Lorem Ipsum,
													Lorem Ipsum</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-3">
												<h6 class="heading">Quality Specifications</h6>
												<p class="text" id="qualitySpecifications">Lorem Ipsum,
													Lorem Ipsum</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-3">
												<h6 class="heading">Packaging Specifications</h6>
												<p class="text" id="packagingSpecifications">Lorem
													Ipsum, Lorem Ipsum</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-3">
												<h6 class="heading">Logistics Specifications</h6>
												<p class="text" id="logisticsSpecifications">1,00,000</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-3">
												<h6 class="heading">Delivery Timelines</h6>
												<p class="text" id="deliveryTimelines">1,00,000</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-3">
												<h6 class="heading">Seller Location</h6>
												<p class="text" id="sellerLocation">US</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="section-style-1">
										<div class="row">
											<div class="col-12">
												<h6 class="heading">Seller Preferences</h6>
												<p class="text" id="sellerPreference">Cnerzy recommended
													sellers</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="nav-documents" role="tabpanel"
							aria-labelledby="nav-documents-tab" tabindex="0">
							<div class="row row-gap-16">
								<div class="col-lg-8 col-md-12">
									<div class="">
										<div class="" id="allDocuments">
											<div class="row row-gap-16" id="addDocumnetDiv"></div>
										</div>

									</div>
								</div>
								<div class="col-lg-4 col-md-12">
									<div class="card-style-2 mb-24" style="max-width: 100%;"
										id="buyerProfile">
										<div class="card-type">
											<span>Buyer</span>
										</div>
										<div class="icon-box" style="width: 48px; height: 48px;"
											name="comapnyLogoUrl">
											<img class="icon" style="width: 100%; height: 100%;"
												src="assets/icons/Profile-1.svg" alt="">
										</div>
										<div class="info">
											<h6 class="title" name="companyName">BrainyDX
												Technologies</h6>
											<span class="subtitle">Industry:<span
												name="companyIndustry"></span></span>
											<div class="location-info">
												<div class="left">
													<img src="assets/icons/location.svg" alt=""
														class="location-icon"> <span class="location-text"
														name="location">Delhi, India</span>
												</div>
												<div class="right">
													<span class="text" name="numberOfProjectsCompleted">2
														Projects Completed</span>
												</div>
											</div>
											<div class="ratings" name="ratings">
												<span class="text">12 Ratings</span>
												<div class="stars">
													<i class="material-icons">star</i> <i
														class="material-icons">star</i> <i class="material-icons">star</i>
													<i class="material-icons">star</i> <i
														class="material-icons">star</i>
												</div>
											</div>
											<a href="https://www.linkedin.com/company/brainydx/"
												class="link" name="linkedInProfile">https://www.linkedin.com/company/brainydx/</a>
										</div>
										<!-- 										<div class="nav-btns"> -->
										<!-- 											<button class="btn-outlined" data-bs-toggle="modal" -->
										<!-- 												data-bs-target="#seller-profile-modal">View Profile</button> -->
										<!-- 										</div> -->
									</div>

									<div class="card-style-2" style="max-width: 100%;"
										id="sellerProfile">
										<div class="card-type">
											<span>Seller</span>

										</div>
										<div class="icon-box" style="width: 48px; height: 48px;"
											name="comapnyLogoUrl">
											<img class="icon" style="width: 100%; height: 100%;"
												src="assets/icons/Profile-1.svg" alt="">
										</div>
										<div class="info">
											<h6 class="title" name="companyName">BrainyDX
												Technologies</h6>
											<span class="subtitle">Industry:<span
												name="companyIndustry"></span></span>
											<div class="location-info">
												<div class="left">
													<img src="assets/icons/location.svg" alt=""
														class="location-icon"> <span class="location-text"
														name="location">Delhi, India</span>
												</div>
												<div class="right">
													<span class="text" name="numberOfProjectsCompleted">2
														Projects Completed</span>
												</div>
											</div>
											<div class="ratings" name="ratings">
												<span class="text">12 Ratings</span>
												<div class="stars">
													<i class="material-icons">star</i> <i
														class="material-icons">star</i> <i class="material-icons">star</i>
													<i class="material-icons">star</i> <i
														class="material-icons">star</i>
												</div>
											</div>
											<a href="https://www.linkedin.com/company/brainydx/"
												class="link" name="linkedInProfile">https://www.linkedin.com/company/brainydx/</a>
										</div>
										<!-- 										<div class="nav-btns"> -->
										<!-- 											<button class="btn-outlined" data-bs-toggle="modal" -->
										<!-- 												data-bs-target="#seller-profile-modal">View Profile</button> -->
										<!-- 										</div> -->
									</div>
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="nav-timeline" role="tabpanel"
							aria-labelledby="nav-timeline-tab" tabindex="0">

							<div class="timeline-container" id="insideTabs">
								<div class="">
									<h5 class="title" id="timelineLabel">Project Timeline</h5>
									<p class="project-id-text" id="projectId">ASH-13510NVD</p>
								</div>
								<div class="timeline" id="timelineTab">
									<div class="timeline-item " data-key="Project Kickoff">
										<div class="icon"></div>
										<div class="text">Project Kickoff</div>
										<div class="date"></div>
									</div>
									<div class="timeline-item">
										<div class="icon"></div>
										<div class="text">Milestone Name 1</div>
										<div class="date"></div>
									</div>
									<div class="timeline-item">
										<div class="icon"></div>
										<div class="text">Milestone Name 2</div>
										<div class="date"></div>
									</div>
									<div class="timeline-item">
										<div class="icon"></div>
										<div class="text">Project Completion</div>
										<div class="date"></div>
									</div>
									<div class="timeline-item">
										<div class="icon"></div>
										<div class="text">Review & Feedback</div>
										<div class="date"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>





	<!--Timeline popup starts -->
	<div
		class="modal fade modal-xl custom-edit-modal buyers-projects-timeline"
		id="timeline" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close">
				<div class="timeline-container">
					<div class="">
						<h5 class="title" id="timelineLabel">Project Timeline</h5>
						<p class="project-id-text" id="projectId">ASH-13510NVD</p>
					</div>
					<div class="timeline" id="timelineModal">
						<div class="timeline-item " data-key="Project Kickoff">
							<div class="icon"></div>
							<div class="text">Project Kickoff</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item">
							<div class="icon"></div>
							<div class="text">Milestone Name 1</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item">
							<div class="icon"></div>
							<div class="text">Milestone Name 2</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item">
							<div class="icon"></div>
							<div class="text">Project Completion</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item">
							<div class="icon"></div>
							<div class="text">Review & Feedback</div>
							<div class="date"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Timeline popup ends -->

	<!-- Send Queries popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="send-queries-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close">
				<form action="" id="upload-loi-and-po-form">
					<div class="body">
						<h4 class="mb-32">Upload Document for Query</h4>
						<div class="custom-file-upload-section-1" id="loi-upload-section">
							<div class="inner-1">
								<div class="click-area">
									<input type="file" name="file" id="document-file" hidden>
									<div class="icon-box">
										<img src="assets/icons/fileupload.svg" alt="">
									</div>
									<h4 class="text-center">
										Click to Upload <span>or drag and drop</span>
									</h4>
								</div>
								<h6 class="mt-8 mb-8 text-center">or</h6>
								<div class="field-group link-field-group">
									<div class="input-icon start">
										<img src="assets/icons/link.svg" alt="">
									</div>
									<input type="text" name="fileViaLink" id="query_document_link"
										autocomplete="off" class="input-field"
										placeholder="Paste Link Here">
									<div class="input-icon end">
										<img src="assets/icons/arrow-next.svg" alt="">
									</div>
									<span id="query_document_link_err" class="err-text"></span>
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
								<div>
									<span id="file_err" class="err-text"></span>
								</div>
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
											onclick="chooseAgain('loi-upload-section')">Cancel</button>
										<button class="btn-style-1 btn-save" type="button"
											onclick="QueryDone('loi-upload-section')">Save</button>
									</div>
								</div>
							</div>
							<!-- <div class="inner-3 d-none">
								<div class="icon-box">
									<img src="assets/icons/fileupload.svg" alt="">
								</div>
								<h4 class="filename-or-link-text mb-16"></h4>
								<p class="description-text"></p>
							</div> -->
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<!-- Send Queries popup ends -->

	<!-- View Profile popup starts -->
	<div class="modal fade modal-xl custom-view-seller-modal"
		id="seller-profile-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<h3 class="heading">Seller Profile</h3>
					<div class="details">
						<div class="section row row-gap-16">
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<div class="d-flex align-items-center">
									<img src="assets/icons/Profile-1.svg" alt="">
									<h6 class="heading">
										BrainyDX <br>Technologies LLP
									</h6>
								</div>

							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Industry</h6>
								<p class="content">Aerospace</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Services</h6>
								<p class="content">Aerospace</p>
							</div>
						</div>
						<div class="section row row-gap-16">
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Location</h6>
								<p class="content">Delhi, India</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Projects Completed</h6>
								<p class="content">Delhi, India</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">RFQ's Participated</h6>
								<p class="content">Delhi, India</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">LinkedIn profile</h6>
								<p class="content">Delhi, India</p>
							</div>
						</div>
						<div class="section row">
							<div class="col-12">
								<h6 class="heading">Rating</h6>
								<div class="d-flex rating-info">
									<h6 class="heading">4 out of 5</h6>
									<div class="stars">
										<i class="material-icons">star</i> <i class="material-icons">star</i>
										<i class="material-icons">star</i> <i class="material-icons">star</i>
										<i class="material-icons">star</i>
									</div>
									<p class="content">12 Ratings</p>
								</div>
							</div>
						</div>
						<div class="section row">
							<div class="col-12">
								<h6 class="heading">Showcase Case Study</h6>
								<div class="documents d-flex">
									<div class="mr-16">
										<div class="file">CaseStudy 1</div>
										<!-- <span class="size-text">(File size: 354 kb)</span> -->
									</div>
									<div class="">
										<div class="file">CaseStudy 1</div>
										<!-- <span class="size-text">(File size: 354 kb)</span> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="footer">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                            <div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
                                <button class="btn-style-4 btn-cancel" type="button" data-bs-dismiss="modal" aria-label="Close">Cancel</button>
                                <button class="btn-style-1 btn-save" type="button">Save</button>
                            </div>
                        </div>
                    </div>
                </div> -->
			</div>
		</div>
	</div>
	<!-- View Profile popup ends -->

	<!-- Raise a Flag popup starts -->
	<div class="modal fade modal-lg custom-edit-modal raise-a-flag-modal"
		id="raise-a-flag-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<form action="" id="raise-a-flag-modal-form">
						<input name="projectId" hidden> <input name="reqId" hidden>
						<input name="name" hidden>
						<div class="input-field-section">
							<h5 class="mb-16">Raise a Flag</h5>
							<div class="row row-gap-16" id="Experience">
								<div class="col-12 col-sm-6 col-md-6 col-lg-5">

									<div class="file-input-field-group">
										<input type="file" id="document" name="file"
											class="input-field" placeholder="File" required
											autocomplete="off" hidden>
										<button class="input-btn" type="button"
											onclick="handleClick('document','document-text')">Choose
											File</button>
										<p id="document-text">No File Choosen</p>
									</div>
									<div class="fileType-and-maxFileSize">
										<p>Attach your files</p>
										<span id="raise_flag_file_err" class="err-text"></span>
									</div>
								</div>
								<div class="col-12">
									<div class="field-group textarea-field-group-1">
										<textarea name="description" id="document_description"
											class="input-field" placeholder="Write here your feedback..."
											cols="100" autocomplete="off"></textarea>
										<span id="document_description_err" class="err-text"></span>
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
										<button class="btn-style-1 btn-save" onclick="raiseFlag()">Save</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>


			</div>
		</div>
	</div>
	<!-- Raise a Flag popup ends -->

	<!-- Add Milestone popup starts -->
	<div class="modal fade modal-lg custom-edit-modal add-milestone-modal"
		id="add-milestone-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<form id="add-milestone-form">
						<div class="input-field-section">
							<h5 class="mb-16">Add Milestone</h5>
							<div class="row row-gap-16" id="Experience">
								<div class="col-12">
									<input name="projectId" hidden> <input name="reqId"
										hidden>
									<div class="field-group">
										<input type="text" name="milestoneName" id="milestoneName"
											class="input-field" placeholder="Name of Milestone"
											autocomplete="off"> <label for="milestoneName"
											class="input-label">Name of Milestone<span
											class="required-asterisk">*</span></label> <span
											id="milestoneName_err" class="err-text"></span>
									</div>
								</div>
								<div class="col-12">
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
										<input type="number" name="amount" id="amount"
											style="padding-left: 50px;" class="input-field"
											placeholder="Value" autocomplete="off"> <label
											for="amount" style="left: 50px;" class="input-label">Value<span
											class="required-asterisk">*</span></label>
									</div>
									<span id="amount_err" class="err-text"></span>
								</div>
								<div class="col-12">
									<div class="field-group">
										<input type="number" name="quantity" id="quantity"
											class="input-field" placeholder="Quantity" autocomplete="off">
										<label for="quantity" class="input-label">Quantity<span
											class="required-asterisk">*</span></label> <span id="quantity_err"
											class="err-text"></span>
									</div>
								</div>
								<div class="col-12">
									<div class="field-group select-field-group">
										<select name="itemCategory" id="itemCategory"
											class="input-field form-dropdown" autocomplete="off">
											<option value="" selected>Item Category</option>
											<option value="Domain">Domain</option>
											<option value="Website">Website</option>
											<option value="Cars & Trucks">Cars & Trucks</option>
											<option value="Boats">Boats</option>
											<option value="Motorcycles">Motorcycles</option>
											<option value="Airplanes">Airplanes</option>
											<option value="Other Motor Vehicles">Other Motor
												Vehicles</option>
											<option value="Antiques & Collectibles">Antiques &
												Collectibles</option>
											<option value="Appliances">Appliances</option>
											<option value="Arts & Crafts">Arts & Crafts</option>
											<option value="Automotive or Industrial Parts">Automotive
												or Industrial Parts</option>
											<option value="Beauty & Health">Beauty & Health</option>
											<option value="Books & Magazines">Books & Magazines</option>
											<option value="Clothing & Accessories">Clothing &
												Accessories</option>
											<option value="Computer Hardware & Software">Computer
												Hardware & Software</option>
											<option value="Cosmetic Injectables">Cosmetic
												Injectables</option>
											<option value="Electronics">Electronics</option>
											<option value="Food">Food</option>
											<option value="Fine Art">Fine Art</option>
											<option value="Furniture">Furniture</option>
											<option value="Heavy Equipment & Machinery">Heavy
												Equipment & Machinery</option>
											<option value="Intellectual Property">Intellectual
												Property</option>
											<option value="IP Addresses">IP Addresses</option>
											<option value="Jewellery & Watches">Jewellery &
												Watches</option>
											<option value="Movies & Music">Movies & Music</option>
											<option value="Pets & Livestock">Pets & Livestock</option>
											<option value="Services">Services</option>
											<option value="Social Media Accounts">Social Media
												Accounts</option>
											<option value="Sports & Recreation">Sports &
												Recreation</option>
											<option value="Tickets & Events">Tickets & Events</option>
											<option value="Tools & Hardware">Tools & Hardware</option>
											<option value="Toys & Hobbies">Toys & Hobbies</option>
											<option value="Video Games & Consoles">Video Games &
												Consoles</option>
										</select> <label for="itemCategory" class="input-label">Select<span
											class="required-asterisk">*</span></label> <span
											id="itemCategory_err" class="err-text"></span>
									</div>
								</div>
								<div class="col-12">
									<div class="field-group">
										<input type="date" name="completionDate" id="completionDate"
											class="input-field date-field"
											placeholder="Milestone Due Date" autocomplete="off"> <label
											for="completionDate" class="input-label">Milestone Due Date<span class="required-asterisk">*</span>
										</label> <span id="completionDate_err" class="err-text"></span>
									</div>
								</div>
								<div class="col-12">
									<div class="field-group">
										<textarea name="description" id="description" rows="4"
											class="input-field" placeholder="Description"></textarea>
										<label for="description" class="input-label">Description<span
											class="required-asterisk">*</span></label> <span id="description_err"
											class="err-text"></span>
										<div id="wordCountDisplay" style="    float: inline-end;" class="word-count">0/250
											characters</div>
									</div>

								</div>

							</div>
						</div>
						<div class="footer">
							<div class="row">
								<div class="col-12 d-flex justify-content-end">
									<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
										<button class="btn-style-4 btn-cancel" type="button"
											data-bs-dismiss="modal" aria-label="Close"
											onclick="resetMilestoneForm()">Cancel</button>
										<button class="btn-style-1 btn-save" type="submit"
											onclick="handleCreateSubmit()">Save</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Add Milestone popup ends -->

	<!-- Project Payment Awaiting popup starts -->
	<div class="modal fade modal-style-1 modal-lg" id="project-awaiting"
		aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
		tabindex="-1" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close"> <img
					class="modal-img" src="assets/icons/Awaiting-Icon.svg"
					alt="Awaiting-icon">
				<h2 class="modal-heading text-center mb-8">Project Awaiting</h2>
				<p class="modal-para text-center">Your project is ready to
					start! We're waiting for the Admin to Initiate Project. Once
					Initiated, we can begin the project.</p>
			</div>
		</div>
	</div>
	<!-- Project Payment Awaiting popup ends -->
	<!-- Project Under Review popup starts -->
	<div class="modal fade modal-style-1 modal-lg"
		id="project-awaiting-triPart" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close"> <img
					class="modal-img mb-16" src="assets/icons/Succeess Animation.svg"
					alt="Success Animation">

				<h2 class="modal-heading text-center" id="heading"></h2>
				<p class="modal-para text-center" id="context"></p>
			</div>
		</div>
	</div>
	<!-- Project Under Review popup ends -->

	<!-- Project Kickoff popup starts -->
	<div
		class="modal fade custom-thank-you-modal modal-lg project-kickoff-modal"
		id="project-kickoff-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close">
				<!-- <img class="modal-img mb-16" src="assets/icons/Succeess Animation.svg" alt="Success Animation"> -->
				<h2 class="modal-heading text-center mb-8">Project Kickoff</h2>
				<p class="modal-para text-center">Please ensure you have
					accepted the transaction terms for a successful project initiation.</p>
			</div>
		</div>
	</div>
	<!-- Project Kickoff popup ends -->

	<!------------- page content ends here -------------->
</body>



<!-- script (To show and hide Send Queries Button when active tab is documents) starts here -->
<script>
		document.addEventListener('DOMContentLoaded', function () {
			let tabsContainer = document.querySelector('.tabs-style-2-nav-container');
			let buttons = tabsContainer.querySelectorAll('.nav-link');
			let quertBtnBox = document.getElementById('query-btn-box');
			buttons.forEach(button => {
				button.addEventListener('click', function () {
					if (!button.classList.contains('d-none')) {
						quertBtnBox.classList.add('d-none')
					}
					if (button.id == 'nav-documents-tab') {
						quertBtnBox.classList.remove('d-none')
					}
				})
			})
		})
	</script>
<!-- script (To show and hide Send Queries Button when active tab is documents) ends here -->

<!-- script for handling and validating Add Milestone form data starts here-->
<script>
document.getElementById("description").addEventListener("keyup", function() {
    const description = this.value;
    const charCount = description.length;
    const maxChars = 250;

    // Update word count display
    document.getElementById("wordCountDisplay").innerText = charCount + "/" + maxChars + " characters";

    // Enforce character limit
    if (charCount > maxChars) {
        document.getElementById("description_err").innerText = "You have reached the 250 character limit.";
        this.value = description.substring(0, maxChars); // Trim the text if over limit
    } else {
        document.getElementById("description_err").innerText = ""; // Clear error message if under limit
    }
});

		// document.getElementById('add-milestone-form').addEventListener('submit', function (e) {
		// 	e.preventDefault(); // Prevent default form submission behavior
		// 	if (true) {
		// 		// Get form data
		// 		const form = document.getElementById('add-milestone-form');
		// 		const formData = new FormData(form);

		// 		let formDataObj = {};
		// 		formData.forEach((value, key) => {
		// 			formDataObj[key] = value;
		// 		});

		// 		let json = JSON.stringify(formDataObj)
		// 		console.log('form-data', json);

		// 		// Make API call with form data
		// 	}
		// });


		//-------------------------------- validations starts here ---------------------
		let addMileStoneModal = document.querySelector('#add-milestone-modal');
		let inputs = addMileStoneModal.querySelectorAll('input,select,textarea');
		function showError(id, errorMsg) {
			let errSpan = document.getElementById(id)
			errSpan.innerHTML = errorMsg
		}
		function checkRequiredFields() {
			// console.log("checkRequiredFields called")
			let allFilled = true;
			let firstRequiredField = null;
			for (let input of inputs) {
				if (input.name == 'milestoneName' && input.value.trim() == '') {
					allFilled = false;
					showError('milestoneName_err', 'Name is required')
				}
				else if (input.name == 'amount' && input.value.trim() == '') {
					allFilled = false;
					showError('amount_err', 'Value is required')
				}
				else if (input.name == 'quantity' && input.value.trim() == '') {
					allFilled = false;
					showError('quantity_err', 'Quantity is required')
				} else if (input.name == 'completionDate' && input.value.trim() == '') {
					allFilled = false;
					showError('completionDate_err', 'Completion Date is required')
				}
				else if (input.name == 'itemCategory' && input.value.trim() == '') {
					allFilled = false;
					showError('itemCategory_err', 'Category is required')
				}
				else if (input.name == 'description' && input.value.trim() == '') {
					allFilled = false;
					showError('description_err', 'Description is required')
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

		let errorsArray = [];
		function validateForm(input) {
			// for (let input of inputs) {
			let errorMessage = '';
			if (input.name == 'milestoneName') {
				if (input.value != '') {
					const regex = /^(?=.*[A-Za-z])[A-Za-z0-9 ]{1,}$/;
					if (!regex.test(input.value.trim())) {
						if (!errorsArray.includes(input.name)) {
							errorsArray.push(input.name);
						}
						errorMessage = 'Invalid Milestone Name';
						showError('milestoneName_err', errorMessage)
					} else {
						errorsArray = errorsArray.filter(function (e) { return e !== input.name })
						showError('milestoneName_err', '')
					}
				} else {
					errorsArray = errorsArray.filter(function (e) { return e !== input.name })
					showError('milestoneName_err', '')
				}
			} else if (input.name == 'completionDate') {
				function isPastDate(dateString) {
					const [year, month, day] = dateString.split('-').map(Number);
					const inputDate = new Date(year, month - 1, day);
					const currentDate = new Date();
					currentDate.setHours(0, 0, 0, 0);
					return inputDate >= currentDate;
				}

				if (!isPastDate(input.value)) {
					errorMessage = 'Invalid Date';
					showError('completionDate_err', errorMessage)
				} else {
					showError('completionDate_err', '')
				}
			}
			else if (input.name == 'amount') {
				showError('amount_err', '')
			} 
			else if (input.name == 'quantity') {
				showError('quantity_err', '')
			} else if (input.name == 'itemCategory') {
				showError('itemCategory_err', '')
			}else if (input.name == 'description') {
				showError('description_err', '')
			}

			console.log(errorsArray)
		}

		for (let input of inputs) {
			input.addEventListener('blur', function () {
				validateForm(input);
			});
		}

		function handleCreateSubmit() {
			$("#add-milestone-form").submit(function (e) {
				e.preventDefault();
			})

			if (checkRequiredFields() && errorsArray.length == 0) {
				// Get form data
				const form = document.getElementById('add-milestone-form'); // Assuming 'add-milestone-form' is the ID of your form
				const formData = new FormData(form);

				let formDataObj = {};

				formData.forEach((value, key) => {
					formDataObj[key] = value;
				});

				let json = JSON.stringify(formDataObj);
				console.log('form-data', json);

				const requestOptions = {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json'
					},
					body: json
				};
				fetch(contextPath + "/createMilestone", requestOptions)
					.then((response) => response.text())
					.then(result => {

						

						result = JSON.parse(result)
						if(result.status==="false"){
							toastr.error(result.message);
							
						
						}else{
							var requestOptions1 = {
									method: "GET",


									redirect: "follow"
								};
								fetch(contextPath + "/getMilestoneByProject?id=" + projectId, requestOptions1)
									.then((response) => response.text())
									.then(result => {
										console.log(result);
										result = JSON.parse(result)
										updatePymentDiv(result)
										getMilestone(result)


									})
									.catch(error => console.error("Error:", error));

							
						}
						
						$("#add-milestone-modal").modal("hide")


					})
					.catch(error => console.error("Error:", error));

			}


		}
		document.getElementById('raise-a-flag-modal-form').addEventListener('submit', function (event) {
			event.preventDefault();

		});

	</script>
<!-- script for handling and validating Add Milestone form data starts here-->




<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/toastr.min.js"></script>

<script src="assets/js/pmProjects-table.js"></script>
<script src="assets/js/drag-and-drop-file.js"></script>
<script src="assets/js/index.js"></script>


<script>


		console.log("${role}")
		var userListJson = ${ data };
		var contextPath = "${pageContext.request.contextPath}"

		console.log(userListJson)
		buyerTable(userListJson.data);



	</script>



</html>