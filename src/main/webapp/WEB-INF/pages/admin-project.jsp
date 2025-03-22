<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ADMIN | PROJECTS</title>
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

</head>
<style>
table p {
	margin: 0
}
table {
	border: none;
	border-radius: 0;
}

.dataTables_scroll {
	border: 1px solid rgba(207, 207, 207, 1);
	border-radius: 12px;
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
#rating-and-review label::before, #sellerFeedback label::before, #buyerFeedback label::before{
    content: '\2022'; /* Custom bullet point (Unicode for bullet) */
    color:var(--dark-blue); /* Custom color */
    font-size: 1.2em; /* Custom size */
    font-weight: bold; /* Custom weight */
    margin-right: 5px; /* Space between bullet and text */
}
.companyIndustry{
margin-left: 5px;}
</style>

<body>

	<!------------- navbar starts here -------------->
	<c:import url="navbar.jsp"></c:import>
	<!------------- navbar ends here -------------->

	<!------------- page content starts here -------------->

	<div class="wrapper">
		<c:import url="sidebar.jsp"></c:import>

		<!------------ For All Seller's Projects ---------->
		<div class="main-content " id="tableDiv">
			<section class="projects mainShadow">
				<div class="heading">
					<div class="headingStatus">
						<h1 id="allHeader" class="active">All (0)</h1>
						<h1 id="inReviewHeader">In Execution (0)</h1>
						<h1 id="completedHeader">Completed (0)</h1>
					</div>
					<div class="sorting ">
						<p>Sort by:</p>
						<div class="btn-group">
							<button class="btn  dropdown-toggle expand-icon " type="button"
								id="dropdownMenuClickableInside" data-bs-toggle="dropdown"
								data-bs-auto-close="inside" aria-expanded="true">Newest</button>
							<ul class="dropdown-menu"
								aria-labelledby="dropdownMenuClickableInside">

								<li><a class="dropdown-item disabled">Select</a></li>
								<li><a class="dropdown-item">Newest</a></li>
								<li><a class="dropdown-item">Oldest</a></li>
							</ul>
						</div>
						<div class="dropdown"
							style="background: white; border-radius: var(--bs-border-radius)">
							<button class=" dropdown-toggle dropdown-toggle expand-icon"
								style="border: none;" type="button" id="exportDropdown"
								data-bs-toggle="dropdown" aria-expanded="false">Download</button>
							<ul class="dropdown-menu" aria-labelledby="exportDropdown">
								<li><button class="dropdown-item" id="exportCsvBtn">Export
										to CSV</button></li>
								<li><button class="dropdown-item" id="exportExcelBtn">Export
										to Excel</button></li>
							</ul>
						</div>

					</div>
				</div>
				<div class="">

					<table id="sellerProjects-table" class="" style="width: 100%">
						<tbody>
							<!-- DataTables will dynamically populate rows here -->
						</tbody>
					</table>
					<div id="NoData"
						style="display: none; flex: 1; justify-content: center; align-items: center; flex-direction: column;">
						<img class="icon" src="assets/icons/Group.svg"> No Data
						Available
					</div>
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
							<button class="nav-link" id="nav-feedback-tab"
								data-bs-toggle="tab" data-bs-target="#nav-feedback"
								type="button" role="tab" aria-controls="nav-feedback"
								aria-selected="false" onclick="getFeedBack()">Feedback</button>
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
											<p class="primary-text" id="projectPrice">&#8377;</p>
										</div>
									</div>
									<div class="item">
										<div class="item-content">
											<h6 class="secondary-text">In escrow</h6>
											<p class="primary-text" id="inEscrow">&#8377;</p>
										</div>
									</div>
									<div class="item">
										<div class="item-content">
											<h6 class="secondary-text" id="milestonesPaidText">Milestones
												paid (0)</h6>
											<p class="primary-text" id="milestonesPaid">&#8377;</p>
										</div>
									</div>
									<div class="item">
										<div class="item-content">
											<h6 class="secondary-text" id="milestonesDueText">Milestones
												Due (1)</h6>
											<p class="primary-text" id="milestonesDue">&#8377;</p>
										</div>
									</div>

								</div>
							</div>
							<h5 class="mt-32 mb-16">Milestone Timeline</h5>
							<div id="milestoneJurney"></div>
						</div>

						<div class="tab-pane fade" id="details" role="tabpanel"
							aria-labelledby="details-tab" tabindex="0">
							<div class="">
								<div class="row row-gap-16">
									<div class="row row-gap-16 col-lg-8 col-md-12"
										id="detailedPost">
										<div class="col-12">
											<div class="section-style-1">
												<div class="row row-gap-24">
													<div class="col-12 col-sm-6 col-md-6 col-lg-4">
														<h6 class="heading">Title</h6>
														<p class="text" id="jobPostTitle">Lorem Ipsum is
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
														<p class="text" id="projectDescription">Lorem
															Ipsum is simply dummy text of the printing and
															typesetting industry. Lorem Ipsum has been the industry's
															standard dummy text ever since the 1500s, when an unknown
															printer took a galley of type and scrambled it to make a
															type specimen book. It has survived not only five
															centuries, but also the leap into electronic typesetting,
															remaining essentially unchanged. It was popularised in
															the 1960s with the release of Letraset sheets containing
															Lorem Ipsum passages, and more recently with desktop
															publishing software like Aldus PageMaker including
															versions of Lorem Ipsum.</p>
													</div>
												</div>
											</div>
										</div>
										<div class="col-12">
											<div class="section-style-1">
												<div class="row row-gap-24">
													<div class="col-12 col-sm-6 col-md-6 col-lg-4">
														<h6 class="heading">Quantity</h6>
														<p class="text" id="quantityRequired">1,00,000</p>
													</div>
													<div class="col-12 col-sm-6 col-md-6 col-lg-4">
														<h6 class="heading">Material Specifications</h6>
														<p class="text" id="materialSpecifications">Lorem
															Ipsum, Lorem Ipsum</p>
													</div>
													<div class="col-12 col-sm-6 col-md-6 col-lg-4">
														<h6 class="heading">Quality Specifications</h6>
														<p class="text" id="qualitySpecifications">Lorem
															Ipsum, Lorem Ipsum</p>
													</div>
													<div class="col-12 col-sm-6 col-md-6 col-lg-4">
														<h6 class="heading">Packaging Specifications</h6>
														<p class="text" id="packagingSpecifications">Lorem
															Ipsum, Lorem Ipsum</p>
													</div>
													<div class="col-12 col-sm-6 col-md-6 col-lg-4">
														<h6 class="heading">Logistics Specifications</h6>
														<p class="text" id="logisticsSpecifications">1,00,000</p>
													</div>
													<div class="col-12 col-sm-6 col-md-6 col-lg-4">
														<h6 class="heading">Delivery Timelines</h6>
														<p class="text" id="deliveryTimelines">1,00,000</p>
													</div>
													<div class="col-12 col-sm-6 col-md-6 col-lg-4">
														<h6 class="heading">Seller Location</h6>
														<p class="text" id="sellerLocation">US</p>
													</div>
												</div>
											</div>
										</div>
										<div class="col-12 ">
											<div class="section-style-1">
												<div class="row">
													<div class="col-12">
														<h6 class="heading">Seller Preferences</h6>
														<p class="text" id="sellerPreference">Cnerzy
															recommended sellers</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-12">
										<div class="pm-card-style-1 mb-24" id="PMDiv">
											<div class="folder-list mb-16">
												<div class="img-box mr-8">
													<img src="assets/icons/pm.svg" alt="user">
												</div>
												<div class="title-box">
													<h6 id="name">Ashok Singh</h6>
													<span>Project Manager</span>
												</div>
											</div>
											<div class="contact-box">
												<div class="email" id="email">ashok.s@brainydx.com</div>
												<div class="phone" id="phone">+91 XXXX XXXX</div>
											</div>
										</div>

										<div>
											<div class="card-style-2 mb-24" style="max-width: 100%;"
												id="buyerProfile">
												<div class="card-type">
													<span>Buyer</span>
												</div>
												<div class="icon-box" style="width: 72px; height: 72px;"
													name="comapnyLogoUrl">
													<img class="icon"
														style="width: 100%; height: 100%; border-radius: 100%;"
														src="assets/icons/card-style-2-icon.svg" alt="">
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
														<span class="text"></span>
														<div class="stars"></div>
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
													<div class="icon-box" style="width: 72px; height: 72px;"
														name="comapnyLogoUrl">
														<img class="icon"
															style="width: 100%; height: 100%; border-radius: 100%;"
															src="assets/icons/card-style-2-icon.svg" alt="">
													</div>
													<div class="info">
														<h6 class="title" name="companyName">BrainyDX
															Technologies</h6>
														<span class="subtitle">Industry:<span
															name="companyIndustry"></span></span>
														<div class="location-info">
															<div class="left">
																<img src="assets/icons/location.svg" alt=""
																	class="location-icon"> <span
																	class="location-text" name="location">Delhi,
																	India</span>
															</div>
															<div class="right">
																<span class="text" name="numberOfProjectsCompleted">2
																	Projects Completed</span>
															</div>
														</div>
														<div class="ratings" name="ratings">
															<span class="text"></span>
															<div class="stars"></div>
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
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="nav-documents" role="tabpanel"
							aria-labelledby="nav-documents-tab" tabindex="0">
							<div class="row row-gap-16">
								<div class="col-lg-8 col-md-12">
									<div class="">
										<div class="row row-gap-16">
											<div class="" id="allDocuments">
												<div class="row row-gap-16" id="addDocumnetDiv"></div>
											</div>




										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-12">
									<div class="pm-card-style-1 mb-24" id="PMDiv">
										<div class="folder-list mb-16">
											<div class="img-box mr-8">
												<img src="assets/icons/pm.svg" alt="user">
											</div>
											<div class="title-box">
												<h6 id="name">Ashok Singh</h6>
												<span>Project Manager</span>
											</div>
										</div>
										<div class="contact-box">
											<div class="email" id="email">ashok.s@brainydx.com</div>
											<div class="phone" id="phone">+91 XXXX XXXX</div>
										</div>
									</div>

									<div>
										<div class="card-style-2 mb-24" style="max-width: 100%;"
											id="buyerProfile">
											<div class="card-type">
												<span>Buyer</span>
											</div>
											<div class="icon-box" style="width: 72px; height: 72px;"
												name="comapnyLogoUrl">
												<img class="icon"
													style="width: 100%; height: 100%; border-radius: 100%;"
													src="assets/icons/card-style-2-icon.svg" alt="">
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
													<span class="text"></span>
													<div class="stars"></div>
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
											<div class="icon-box" style="width: 72px; height: 72px;"
												name="comapnyLogoUrl">
												<img class="icon"
													style="width: 100%; height: 100%; border-radius: 100%;"
													src="assets/icons/card-style-2-icon.svg" alt="">
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
													<span class="text"></span>
													<div class="stars"></div>
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
										<div class="text">Kick-off</div>
										<div class="date"></div>
									</div>
									<div class="timeline-item " data-key="Project Manager Assigned">
										<div class="icon"></div>
										<div class="text">PM Assigned</div>
										<div class="date"></div>
									</div>
									<div class="timeline-item ">
										<div class="icon"></div>
										<div class="text">Escrow Created</div>
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
										<div class="text">Delivered</div>
										<div class="date"></div>
									</div>
									<div class="timeline-item">
										<div class="icon"></div>
										<div class="text">Feedback</div>
										<div class="date"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="tab-pane fade view-feedback" id="nav-feedback"
							role="tabpanel" aria-labelledby="nav-feedback-tab" tabindex="0">

							<nav class="mb-16 tabs-style-2-nav-container">
								<div class="nav nav-tabs" id="nav-tab" role="tablist">
									<button class="nav-link active" id="nav-buyer-tab"
										data-bs-toggle="tab" data-bs-target="#nav-buyer" type="button"
										role="tab" aria-controls="nav-buyer" aria-selected="true">Buyer</button>
									<button class="nav-link" id="seller-tab" data-bs-toggle="tab"
										data-bs-target="#sellerFeedback" type="button" role="tab"
										aria-controls="sellerFeedback" aria-selected="false">Seller</button>
								</div>
							</nav>

							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-buyer"
									role="tabpanel" aria-labelledby="nav-buyer-tab" tabindex="0">
									<div id="buyerFeedback">
										<div class="row row-gap-16 pt-32 mb-64" id="categorySeller">
											<div class="col-12">
												<h5 class="feedback-heading">Buyer experience with
													Seller</h5>
											</div>
											<div class="col-lg-8 col-md-12">
												<div class="rating-container">
													<div class="rating-section-1">
														<h6 class="heading">Product/Service Quality Rating:</h6>
														<p class="content">Evaluate the quality of products or
															services provided by the seller. This rating could be
															based on factors like:</p>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="productQuality">Product Quality</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="manufacturingPrecision">Manufacturing
																			Precision</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="design">Design</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="materialQuality">Material Quality</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="productionEfficiency">Production
																			Efficiency</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="compliance">Compliance</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="innovationAndCreativity">Innovation
																			& Creativity</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="adherenceToSpecification">Adherence
																			to specifications</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="rating-section-1 mt-32">
														<h6 class="heading">Communication Rating:</h6>
														<p class="content">Rate the seller's communication
															skills and responsiveness. This could include factors
															such as the timeliness of</p>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="responsesToInqueries">Responses to
																			inquiries</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="clarityOfCommunication">Clarity of
																			communication</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="professionalismInIntraction">Professionalism
																			in interactions</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="rating-section-1 mt-32">
														<h6 class="heading">Timeliness Rating:</h6>
														<p class="content">Assess the seller's ability to meet
															deadlines and deliver products or services on time. This
															rating could reflect the seller's punctuality in</p>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="respondingToOrders">Responding to
																			orders</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="shippingProducts">Shipping
																			products</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="competletingServices">Completing
																			services within agreed-upon timeframes</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="rating-section-1 mt-32">
														<h6 class="heading">Professionalism Rating:</h6>
														<p class="content">Evaluate the seller's
															professionalism and conduct during transactions. This
															could include factors such as</p>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="sellerProfessionalism">Honesty</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="transparency">Transparency</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="integrityInDealing">Integrity in
																			dealing</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="rating-section-1 mt-32">
														<h6 class="heading">Overall Experience Rating:</h6>
														<p class="content">Provide an overall rating based on
															the buyer's experience with the seller. This rating could
															reflect the buyer's satisfaction with the</p>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="transactionProcess">Transaction
																			process</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="qualityOfProductsOrServices">Quality
																			of products or services received, and whether they</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																		<label for="recommedSellerToOthers">Recommend
																			the seller to others</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-4"></div>
										</div>
										<div class="row row-gap-16">
											<div class="col-12">
												<h5 class="feedback-heading">Buyer experience with
													Cnerzy</h5>
											</div>
											<div class="col-lg-8 col-md-12" id="categoryPlatform">
												<div class="rating-container">
													<div class="rating-section-1">
														<h6 class="heading">Work Allocation:</h6>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																		<label for="clarityAndTransparency">Rate the
																			clarity and transparency of task assigned.</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="rating-section-1 mt-32">
														<h6 class="heading">Interaction with Sellers:</h6>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																		<label for="communication">Communication</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>

															</div>
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																		<label for="sellersResponsivenessAndCooperative">Were
																			sellers responsive and cooperative during the
																			project?</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																		<input type="number"
																			name="sellersResponsivenessAndCooperative"
																			id="sellersResponsivenessAndCooperative" hidden>
																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
													<div class="rating-section-1 mt-32">
														<h6 class="heading">Experience Gained:</h6>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																		<label for="cnerzyContributionInDevelopment">Rate
																			how Cnerzy has contributed to your professional
																			development.</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																		<input type="number"
																			name="cnerzyContributionInDevelopment"
																			id="cnerzyContributionInDevelopment" hidden>
																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="rating-section-1 mt-32">
														<h6 class="heading">Platform Usability:</h6>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																		<label
																			for="efficiencyOfPlatformFacilitiesInProjectMgt">Rate
																			how efficiently the platform facilitates project
																			management.</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																		<input type="number"
																			name="efficiencyOfPlatformFacilitiesInProjectMgt"
																			id="efficiencyOfPlatformFacilitiesInProjectMgt"
																			hidden>
																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="rating-section-1 mt-32">
														<h6 class="heading">Overall Experience:</h6>
														<div class="input-section">
															<div class="rating mb-2 mb-sm-2 mb-md-0">
																<div class="row w-100">
																	<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																		<label for="overallExperienceAsPM">Rate your
																			overall experience as a project manager on Cnerzy.</label>
																	</div>
																	<div
																		class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																		<input type="number" name="overallExperienceAsPM"
																			id="overallExperienceAsPM" hidden>
																		<div class="star-container">
																			<i class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i> <i
																				class="material-icons star">star_border</i>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-4"></div>
										</div>
									</div>
								</div>

								<div class="tab-pane fade" id="sellerFeedback"  role="tabpanel"
									aria-labelledby="seller-tab" tabindex="0">
									<div class="row row-gap-16 pt-32 mb-64" id="categoryBuyer">
										<div class="col-12">
											<h5 class="feedback-heading">Seller experience with
												Buyer</h5>
										</div>
										<div class="col-lg-8 col-md-12">
											<div class="rating-container">
												<div class="rating-section-1">
													<h6 class="heading">Clarity of Requirements Rating:</h6>
													<p class="content">Rate the clarity and completeness of
														the buyer's requirements. This rating could reflect the
														extent to which the buyer provides clear,</p>
													<div class="input-section">
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="detailedInstruction">Detailed
																		instructions</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="sepecificationsOfProductOrServices">Specifications
																		for products or services.</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="rating-section-1 mt-32">
													<h6 class="heading">Communication Rating:</h6>
													<p class="content">Evaluate the buyer's communication
														skills and responsiveness. This could include factors such
														as the</p>
													<div class="input-section">
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="clarityOfInstructions">Clarity of
																		instructions provided,</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="promptnessInRespondingToSellerInqueries">promptness
																		in responding to seller inquiries</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="willingnessToAddressAnyIssue">Willingness
																		to address any issues or concerns.</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="rating-section-1 mt-32">
													<h6 class="heading">Collaboration Rating:</h6>
													<p class="content">Rate the buyer's willingness to
														collaborate and work constructively with sellers. This
														could include factors such as</p>
													<div class="input-section">
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="flexibilityInChange">Flexibility in
																		accommodating changes,</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="OpennessToFeedback">Openness to
																		feedback</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="proactiveProblemSolving">Proactive
																		problem-solving</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="rating-section-1 mt-32">
													<h6 class="heading">Overall Experience Rating:</h6>
													<p class="content">Provide an overall rating based on
														the seller's experience with the buyer. This rating could
														reflect the seller's satisfaction with the</p>
													<div class="input-section">
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="transactionProcess">Transaction
																		process</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="buyerProfessionalism">Buyer's
																		professionalism</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row w-100">
																<div class="col-lg-6 col-md-6 col-sm-12 col-12">
																	<label for="engangeInFutureTransaction">Engage
																		in future transactions with the buyer</label>
																</div>
																<div
																	class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-4"></div>
									</div>
									<div class="row row-gap-16 mb-64">
										<div class="col-12">
											<h5 class="feedback-heading">Seller experience with
												Cnerzy</h5>
										</div>
										<div class="col-lg-8 col-md-12" id="categoryPlatform">
											<div class="rating-container">
												<div class="rating-section-1">
													<h6 class="heading">Lead Quality:</h6>
													<div class="input-section">
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row">
																<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																	<label for="qualityOfLeadsGenration">Rating
																		based on the quality of leads generated through the
																		platform in terms of relevance and likelihood of
																		conversion.</label>
																</div>
																<div
																	class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="rating-section-1 mt-32">
													<h6 class="heading">Communication Tools:</h6>
													<div class="input-section">
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row">
																<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																	<label for="effectivenessAndUsablityOfTools">Rate
																		the effectiveness and usability of communication tools
																		provided by the platform for interacting with buyers.</label>
																</div>
																<div
																	class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div class="rating-section-1 mt-32">
													<h6 class="heading">Platform Usability:</h6>
													<div class="input-section">
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row">
																<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																	<label for="overallUsablity">Rate the overall
																		usability and ease of use of the platform for managing
																		listings, orders, and other seller-related tasks.</label>
																</div>
																<div
																	class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="rating-section-1 mt-32">
													<h6 class="heading">Analytics and Insights:</h6>
													<div class="input-section">
														<div class="rating mb-2 mb-sm-2 mb-md-0">
															<div class="row">
																<div class="col-lg-6 col-md-8 col-sm-12 col-12">
																	<label for="effectivenessOfDashboard">Rating
																		based on the effectiveness of the dashboard in
																		providing a comprehensive view of progress and
																		updates, to track performance and make informed
																		decisions.</label>
																</div>
																<div
																	class="col-lg-6 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">

																	<div class="star-container">
																		<i class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i> <i
																			class="material-icons star">star_border</i>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-4"></div>
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
						<div class="timeline-item " data-key="Project Manager Assigned">
							<div class="icon"></div>
							<div class="text">Project Manager Assigned</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item ">
							<div class="icon"></div>
							<div class="text">Escrow Account Created</div>
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
									<img src="assets/icons/card-style-2-icon.svg" alt="">
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

	<!-- Milestone submit work popup starts -->
	<div class="modal fade modal-lg custom-edit-modal"
		id="milestone-submit-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<div class="input-field-section">
						<h5 class="mb-16">Milestone Submit Work</h5>
						<div class="row row-gap-16" id="Experience">
							<div class="col-12 col-sm-6 col-md-6 col-lg-5">
								<div class="file-input-field-group">
									<input type="file" id="document" name="document"
										class="input-field" placeholder="File" required
										autocomplete="off" hidden>
									<button class="input-btn" type="button"
										onclick="handleClick('document','document-text')">Choose
										File</button>
									<p id="document-text">No File Choosen</p>
								</div>
								<div class="fileType-and-maxFileSize">
									<p>Attach Relevant Certifications</p>
									<span id="document_err" class="err-text"></span>
								</div>
							</div>
							<div class="col-12">
								<div class="field-group textarea-field-group-1">
									<textarea name="document_description" id="document_description"
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
									<button class="btn-style-1 btn-save" type="submit">Save</button>
								</div>
							</div>
						</div>
					</div>

				</div>


			</div>
		</div>
	</div>
	<!-- Milestone submit work popup ends -->

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

	<!-- Project Completed popup starts -->
	<div class="modal fade custom-thank-you-modal modal-lg"
		id="project-completed" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="modal-img mb-16"
					src="assets/icons/Succeess Animation.svg" alt="Success Animation">
				<h2 class="modal-heading text-center mb-8">Completed</h2>
				<p class="modal-para text-center">Project completion with
					BrainyDX Technologies has been achieved.</p>
				<button class="btn-style-3 mt-32 mx-auto"
					data-bs-target="#final-review-modal" data-bs-toggle="modal"
					style="max-width: 324px;">Review and share your feedback</button>
			</div>
		</div>
	</div>
	<!-- Project Completed popup ends -->

	<!-- Final Review popup starts -->
	<div
		class="modal fade custom-thank-you-modal modal-xl final-review-modal"
		id="final-review-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<h5 id="review-page-heading" class="review-modal-heading mb-32">Tell
						us about your experience with Buyer</h5>
					<div class="final-review-stepper-container">
						<div class="step-container">
							<div class="step-info active">
								<div class="d-flex">
									<span class="step-circle">1</span>
									<!-- <div class="step-line"></div> -->
								</div>
								<span class="step-label">Buyer Rating</span>
							</div>
							<div class="step-info">
								<div class="d-flex">
									<span class="step-circle">2</span>
									<!-- <div class="step-line"></div> -->
								</div>
								<span class="step-label">Platform Rating</span>
							</div>
						</div>
						<form action="" id="rating-and-review">
							<div class="step">
								<div class="step-content">
									<div class="content">
										<div class="rating-container">
											<div class="rating-section-1 mt-32">
												<h6 class="heading">Clarity of Requirements Rating:</h6>
												<p class="content">Rate the clarity and completeness of
													the buyer's requirements. This rating could reflect the
													extent to which the buyer provides clear,</p>
												<div class="input-section">
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="detailedInstruction">Detailed
																	instructions</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="detailedInstruction"
																	id="detailedInstruction" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="sepecificationsOfProductOrServices">Specifications
																	for products or services.</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number"
																	name="sepecificationsOfProductOrServices"
																	id="sepecificationsOfProductOrServices" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="rating-section-1 mt-32">
												<h6 class="heading">Communication Rating:</h6>
												<p class="content">Evaluate the buyer's communication
													skills and responsiveness. This could include factors such
													as the</p>
												<div class="input-section">
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="clarityOfInstructions">Clarity of
																	instructions provided,</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="clarityOfInstructions"
																	id="clarityOfInstructions" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="promptnessInRespondingToSellerInqueries">promptness
																	in responding to seller inquiries</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number"
																	name="promptnessInRespondingToSellerInqueries"
																	id="promptnessInRespondingToSellerInqueries" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="willingnessToAddressAnyIssue">Willingness
																	to address any issues or concerns.</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="willingnessToAddressAnyIssue"
																	id="willingnessToAddressAnyIssue" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="rating-section-1 mt-32">
												<h6 class="heading">Collaboration Rating:</h6>
												<p class="content">Rate the buyer's willingness to
													collaborate and work constructively with sellers. This
													could include factors such as</p>
												<div class="input-section">
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="flexibilityInChange">Flexibility in
																	accommodating changes,</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="flexibilityInChange"
																	id="flexibilityInChange" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="OpennessToFeedback">Openness to
																	feedback</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="OpennessToFeedback"
																	id="OpennessToFeedback" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="proactiveProblemSolving">Proactive
																	problem-solving</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="proactiveProblemSolving"
																	id="proactiveProblemSolving" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="rating-section-1 mt-32">
												<h6 class="heading">Overall Experience Rating:</h6>
												<p class="content">Provide an overall rating based on
													the seller's experience with the buyer. This rating could
													reflect the seller's satisfaction with the</p>
												<div class="input-section">
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="transactionProcess">Transaction
																	process</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="transactionProcess"
																	id="transactionProcess" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="buyerProfessionalism">Buyer's
																	professionalism</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="buyerProfessionalism"
																	id="buyerProfessionalism" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row w-100">
															<div class="col-lg-9 col-md-6 col-sm-12 col-12">
																<label for="engangeInFutureTransaction">Engage
																	in future transactions with the buyer</label>
															</div>
															<div
																class="col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="engangeInFutureTransaction"
																	id="engangeInFutureTransaction" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="mt-64 d-flex justify-content-end">
											<button class="btn-style-1" type="button"
												onclick="nextStep()">Next</button>
										</div>
									</div>
								</div>
							</div>
							<div class="step">
								<div class="step-content">
									<div class="content">
										<div class="rating-container">
											<div class="rating-section-1 mt-32">
												<h6 class="heading">Lead Quality:</h6>
												<div class="input-section">
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row">
															<div class="col-lg-9 col-md-8 col-sm-12 col-12">
																<label for="qualityOfLeadsGenration">Rating
																	based on the quality of leads generated through the
																	platform in terms of relevance and likelihood of
																	conversion.</label>
															</div>
															<div
																class="col-lg-3 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="qualityOfLeadsGenration"
																	id="qualityOfLeadsGenration" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="rating-section-1 mt-32">
												<h6 class="heading">Communication Tools:</h6>
												<div class="input-section">
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row">
															<div class="col-lg-9 col-md-8 col-sm-12 col-12">
																<label for="effectivenessAndUsablityOfTools">Rate
																	the effectiveness and usability of communication tools
																	provided by the platform for interacting with buyers.</label>
															</div>
															<div
																class="col-lg-3 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number"
																	name="effectivenessAndUsablityOfTools"
																	id="effectivenessAndUsablityOfTools" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>

													</div>
												</div>
											</div>
											<div class="rating-section-1 mt-32">
												<h6 class="heading">Platform Usability:</h6>
												<div class="input-section">
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row">
															<div class="col-lg-9 col-md-8 col-sm-12 col-12">
																<label for="overallUsablity">Rate the overall
																	usability and ease of use of the platform for managing
																	listings, orders, and other seller-related tasks.</label>
															</div>
															<div
																class="col-lg-3 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="overallUsablity"
																	id="overallUsablity" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="rating-section-1 mt-32">
												<h6 class="heading">Analytics and Insights:</h6>
												<div class="input-section">
													<div class="rating mb-2 mb-sm-2 mb-md-0">
														<div class="row">
															<div class="col-lg-9 col-md-8 col-sm-12 col-12">
																<label for="effectivenessOfDashboard">Rating
																	based on the effectiveness of the dashboard in
																	providing a comprehensive view of progress and updates,
																	to track performance and make informed decisions.</label>
															</div>
															<div
																class="col-lg-3 col-md-4 col-sm-12 col-12 d-flex justify-content-md-end justify-content-start">
																<input type="number" name="effectivenessOfDashboard"
																	id="effectivenessOfDashboard" hidden>
																<div class="star-container">
																	<i class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i> <i
																		class="material-icons star">star_border</i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="mt-64 d-block d-sm-flex justify-content-end">
											<button class="btn-style-4 mr-16" type="button"
												onclick="prevStep()">Back</button>
											<button class="btn-style-1" type="submit"
												data-bs-toggle="modal"
												data-bs-target="#feeback-submitted-modal">Submit</button>
										</div>
									</div>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Final Review popup ends -->

	<!-- Feedback Submitted popup starts -->
	<div class="modal fade custom-thank-you-modal modal-lg"
		id="feeback-submitted-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="modal-img mb-16"
					src="assets/icons/Succeess Animation.svg" alt="Success Animation">
				<h2 class="modal-heading text-center mb-8">Feedback Submitted</h2>
				<p class="modal-para text-center">Your review and feedback have
					been successfully conveyed to the buyer and the platform.</p>
			</div>
		</div>
	</div>
	<!-- Feedback Submitted popup ends -->

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

<!-- script for rating and review form starts here -->
<script>
		document.getElementById('rating-and-review').addEventListener('submit', function (e) {
			e.preventDefault(); // Prevent default form submission behavior
			if (true) {
				// Get form data
				const form = document.getElementById('rating-and-review');
				const formData = new FormData(form);

				let formDataObj = {};
				formData.forEach((value, key) => {
					formDataObj[key] = value;
				});

				let json = JSON.stringify(formDataObj);
				console.log('rating-and-review form data', json);

				// Make API call with form data
			}
		});
	</script>
<!-- script for rating and review form ends here -->

<!-- jQuery (required for DataTables) -->

<script>

	
		var userListJson = ${ data };
		var contextPath = "${pageContext.request.contextPath}"
		userListJson = userListJson.filter(item => item.totalPrice !== 0 && item.totalPrice !== undefined);
		userListJson2 = userListJson.filter(item => item.totalPrice == 0 || item.totalPrice == undefined);

	</script>
	



<!-- jQuery (required for DataTables) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	

<!-- jQuery (required for DataTables) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- DataTables core library -->
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<!-- DataTables Select plugin (Enhances DataTables with row selection) -->
<script
	src="https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"></script>

<!-- DataTables Buttons plugin (Adds buttons for exporting data) -->
<script
	src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>

<!-- DataTables HTML5 Export Button (Provides HTML5 export options) -->
<script
	src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>

<!-- JSZip for DataTables Buttons (Required for Excel export) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.7.1/jszip.min.js"></script>

	

	
<script src="assets/js/adminProjects-table.js"></script>
<script src="assets/js/drag-and-drop-file.js"></script>
<script src="assets/js/index.js"></script>
<script src="assets/js/sellerFinalReview-stepper.js"></script>
<script src="assets/js/rating.js"></script>





</html>