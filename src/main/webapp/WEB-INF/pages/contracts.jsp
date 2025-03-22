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
<link
	href="https://cdn.datatables.net/select/2.0.3/css/select.dataTables.css">

</head>
<style>
table {
	border: none;
	border-radius: 0;
}

.dataTables_scroll {
	border: 1px solid rgba(207, 207, 207, 1);
	border-radius: 12px;
}
table p {
	margin: 0
}

#projectManager-appoint thead {
	position: sticky;
	top: 0;
}

#productManagerTable {
	width: 100%;
}

tr.active {
	background: rgba(241, 241, 241, 1);
}

.disabled-button {
	background-color: rgba(26, 28, 67, 0.2); /* Background color */
	cursor: not-allowed; /* Cursor style */
	border: 1px solid #ccc;
	/* Optional: add border to visually indicate disabled state */
}

.companyIndustry {
	margin-left: 5px;
}
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
						<h1 id="inReviewHeader">In Review (0)</h1>
						<h1 id="projectExecutionHeader">Project Execution (0)</h1>
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

				</div>
			</section>
		</div>

		<!-- 		<!------------ For Single Project Detail(Before Project Initiation) --------->
		<!-- 		<div class="main-content " style="display: none" id="ProjectDetail"> -->
		<!-- 			<div class="row"> -->
		<!-- 				<div class="col-12 col-sm-12 col-md-12 col-lg-12"> -->
		<!-- 					<div class="breadcrumb-row d-flex"> -->
		<!-- 						<div class="breadcrumb-left-col"> -->
		<!-- 							<div class="breadcrumb-icon-box" -->
		<!-- 								onclick="replaceDiv('ProjectDetail','tableDiv')"> -->
		<!-- 								<img class="breadcrumb-icon" -->
		<!-- 									src="assets/icons/breadcrumb-arrow.svg" alt=""> -->
		<!-- 							</div> -->
		<!-- 							<div class="breadcrumb-text" id="requirementNo">ABC-fgh12341</div> -->
		<!-- 						</div> -->

		<!-- 						<div> -->
		<!-- 							<button class="btn-style-1" id="InitiateProject" -->
		<!-- 								style="display: none" data-bs-toggle="modal" data-bs-target="#">Initiate -->
		<!-- 								Project</button> -->

		<!-- 							<button class="btn-outlined" data-bs-toggle="modal" -->
		<!-- 								data-bs-target="#send-queries-modal">Send Queries</button> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 					<div class="heading"> -->
		<!-- 						<div class="headingStatus"> -->
		<!-- 							<h1 id="allHeader" class="active">All (0)</h1> -->
		<!-- 							<h1 id="inReviewHeader">In Review (0)</h1> -->
		<!-- 							<h1 id="completedHeader">Completed (0)</h1> -->
		<!-- 						</div> -->
		<!-- 						<div class="sorting "> -->
		<!-- 							<p>Sort by:</p> -->
		<!-- 							<div class="btn-group"> -->
		<!-- 								<button class="btn  dropdown-toggle expand-icon " type="button" -->
		<!-- 									id="dropdownMenuClickableInside" data-bs-toggle="dropdown" -->
		<!-- 									data-bs-auto-close="inside" aria-expanded="true">Newest</button> -->
		<!-- 								<ul class="dropdown-menu" -->
		<!-- 									aria-labelledby="dropdownMenuClickableInside"> -->

		<!-- 									<li><a class="dropdown-item disabled">Select</a></li> -->
		<!-- 									<li><a class="dropdown-item">Newest</a></li> -->
		<!-- 									<li><a class="dropdown-item">Oldest</a></li> -->
		<!-- 								</ul> -->
		<!-- 							</div> -->

		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 					<div class=""> -->

		<!-- 						<table id="sellerProjects-table" class="" style="width: 100%"> -->
		<!-- 							<tbody> -->
		<!-- 								DataTables will dynamically populate rows here -->
		<!-- 							</tbody> -->
		<!-- 						</table> -->

		<!-- 					</div> -->
		<!-- 					</section> -->
		<!-- 				</div> -->

		<!------------ For Single Project Detail(Before Project Initiation) --------->
		<div class="main-content " style="display: none" id="ProjectDetail">
			<div class="row">
				<div class="col-12 col-sm-12 col-md-12 col-lg-12">
					<div class="breadcrumb-row d-flex">
						<div class="breadcrumb-left-col">
							<div class="breadcrumb-icon-box"
								onclick="replaceDiv('ProjectDetail','tableDiv')">
								<img class="breadcrumb-icon"
									src="assets/icons/breadcrumb-arrow.svg" alt="">
							</div>
							<div class="breadcrumb-text" id="requirementNo">ABC-fgh12341</div>
						</div>

						<div>
							<button class="btn-style-1" id="InitiateProject"
								style="display: none" data-bs-toggle="modal"
								data-bs-target="#add-project-value-modal">Initiate
								Project</button>

							<button class="btn-outlined" data-bs-toggle="modal"
								data-bs-target="#send-queries-modal">Send Queries</button>
						</div>
					</div>
					<div class="heading">
						<div class="headingStatus">
							<h1 id="DocumentsHeader" class="active">Documents</h1>
							<h1 id="viewRequirementsHeader">View Requirements</h1>

						</div>

					</div>
					<div class="right-content">

						<div class="row row-gap-16">
							<div class="col-lg-8 col-md-12" id="rightSide">

								<div class="card-style-5" id="allDocuments">
									<div class="row row-gap-16" id="addDocumnetDiv"
										style="width: 100%">
										<h5 class="mb-16">All Documents</h5>
										<div class="row row-gap-16">
											<div class="col-12">
												<div class="document-card-style-1 unread-doc">
													<div class="left">
														<div class="icon-box">
															<img src="assets/icons/file.svg" alt="icon">
														</div>
														<div>
															<p class="primary-text">Tripartite_Agreement.Doc</p>
															<p class="secondary-text">Lorem Ipsum is simply dummy
																text of the printing and typesetting industry.</p>
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
															<p class="primary-text">Proposal.Pdf</p>
															<p class="secondary-text">Lorem Ipsum is simply dummy
																text of the printing and typesetting industry.</p>
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
															<p class="secondary-text">Lorem Ipsum is simply dummy
																text of the printing and typesetting industry.</p>
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
							</div>
							<div id="leftSide" class="col-lg-8 col-md-12"
								style="display: none">
								<div class="row row-gap-16 " id="detailedPost">
									<div class="col-12">
										<div class="section-style-1">
											<div class="row row-gap-24">
												<div class="col-12 col-sm-6 col-md-6 col-lg-4">
													<h6 class="heading">Title</h6>
													<p class="text" id="jobPostTitle">Lorem Ipsum is simply
														dummy text</p>
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
													<p class="text" id="projectDescription">Lorem Ipsum is
														simply dummy text of the printing and typesetting
														industry. Lorem Ipsum has been the industry's standard
														dummy text ever since the 1500s, when an unknown printer
														took a galley of type and scrambled it to make a type
														specimen book. It has survived not only five centuries,
														but also the leap into electronic typesetting, remaining
														essentially unchanged. It was popularised in the 1960s
														with the release of Letraset sheets containing Lorem Ipsum
														passages, and more recently with desktop publishing
														software like Aldus PageMaker including versions of Lorem
														Ipsum.</p>
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
													<p class="text" id="materialSpecifications">Lorem
														Ipsum, Lorem Ipsum</p>
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
							</div>
							<div class="col-lg-4 col-md-12 ">
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
								<div class="mb-24" id="projectManager-appoint-button">
									<button class="btn-outlined col-12 " data-bs-toggle="modal"
										data-bs-target="#projectManager-appoint">Appoint
										Project Manager</button>
								</div>
								<div>
									<div class="card-style-2 mb-24  custom-view-seller-modal"
										style="max-width: 100%;" id="buyerProfile">
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

									<div class="card-style-2  custom-view-seller-modal"
										style="max-width: 100%;" id="sellerProfile">
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
												<span class="text"> </span>
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
		</div>

		<!-- Edit Legal Information popup starts -->
		<div class="modal fade modal-lg custom-edit-modal"
			id="projectManager-appoint" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
			data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="body">
						<h3 class="heading">Select a Project Manager</h3>
						<div class="row row-gap-24 mb-32">
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
									</label> <span id="industry_err" class="err-text"></span>
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
									</select> <label for="industryExpertise" class="input-label">Select<span
										class="required-asterisk">*</span>
									</label> <span id="industryExpertise_err" class="err-text"></span>
								</div>
							</div>


						</div>
						<table id="productManagerTable">

						</table>
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-12 d-flex justify-content-end">
								<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">

									<button class="btn-style-1 btn-save" id="selectPMButtom"
										type="button">Assign</button>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Legal Information popup ends -->


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
						<h5 class="title" id="timelineLabel">Contract Timeline</h5>
						<p class="project-id-text" id="projectId">ASH-13510NVD</p>
					</div>

					<div class="timeline" id="timelineContent">
						<div class="timeline-item " data-key="Requirement Posted">
							<div class="icon"></div>
							<div class="text">Posted</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item " data-key="Requirement Approved">
							<div class="icon"></div>
							<div class="text">Approved</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item " data-key="Sellers Shortlisted">
							<div class="icon"></div>
							<div class="text">
								Sellers<br> Intimated
							</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item " data-key="Discussion Initiated">
							<div class="icon"></div>
							<div class="text">Discussion</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item " data-key="Negotiations">
							<div class="icon"></div>
							<div class="text">Negotiation</div>
							<div class="date"></div>
						</div>

						<div class="timeline-item" data-key="Contract Issued">
							<div class="icon"></div>
							<div class="text">Contract/PO</div>
							<div class="date"></div>
						</div>
						<div class="timeline-item" data-key="Project Kickoff">
							<div class="icon"></div>
							<div class="text">Kick-off</div>
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
									<h6 class="heading"></h6>
									<div class="stars"></div>
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


	<!-- Project Kickoff popup starts -->
	<div class="modal fade custom-thank-you-modal modal-lg "
		id="project-kickoff-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close"> <img
					class="modal-img mb-16" src="assets/icons/Succeess Animation.svg"
					alt="Success Animation">
				<h2 class="modal-heading text-center mb-8">Project Price Added
					Successfully!</h2>
				<p class="modal-para text-center" id="content">The project price
					has been added to [Project Name]. The tripartite agreement has been
					sent to the buyer and seller for their review and signature.</p>
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

	<!-- Add Project Value popup starts -->
	<div class="modal fade custom-edit-modal add-project-value-modal"
		id="add-project-value-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<form action="" id="add-project-value">
						<div class="input-field-section">
							<h5 class="mb-16">Please enter the total project value here.</h5>
							<div class="row row-gap-16" id="Experience">
								<div class="col-12">
									<div
										class="field-group d-flex position-relative align-items-center">
										<div class="input-group-prepend position-absolute"
											style="left: 10px; width: 32px; height: 32px;">
											<span class="input-group-text" id="basic-addon1"
												style="font-size: 12px; padding: 3px;">USD</span>
										</div>
										<input type="number" name="budgetAmount" id="project_value"
											required style="padding-left: 50px;" class="input-field"
											placeholder="Project Value" autocomplete="off"> <label
											for="project_value" style="left: 50px;" class="input-label">Project
											Value<span class="required-asterisk">*</span>
										</label>
									</div>
									<span id="project_value_err" class="err-text"></span>
								</div>

								<!-- 								<div class="col-12"> -->
								<!-- 									<div -->
								<!-- 										class="field-group d-flex position-relative align-items-center"> -->
								<!-- 										<div class="input-group-prepend position-absolute" -->
								<!-- 											style="left: 10px; width: 32px; height: 32px;"> -->
								<!-- 											<span class="input-group-text" id="basic-addon1" -->
								<!-- 												style="font-size: 12px; padding: 3px;">USD</span> -->
								<!-- 										</div> -->
								<!-- 										<input type="number" name="platform_fee" id="platform_fee" -->
								<!-- 											required style="padding-left: 50px;" class="input-field" -->
								<!-- 											placeholder="Platform Fee" autocomplete="off"> <label -->
								<!-- 											for="platform_fee" style="left: 50px;" class="input-label">Platform -->
								<!-- 											Fee<span class="required-asterisk">*</span> -->
								<!-- 										</label> -->
								<!-- 									</div> -->
								<!-- 									<span id="platform_fee_err" class="err-text"></span> -->
								<!-- 								</div> -->

							</div>
						</div>
						<div class="footer">
							<div class="row">
								<div class="col-12 d-flex justify-content-end">
									<div class="div d-block d-sm-flex space-x-2 space-sm-x-0">
										<button class="btn-style-4 btn-cancel" type="button"
											data-bs-dismiss="modal" aria-label="Close">Cancel</button>
										<button class="btn-style-1 btn-save" type="submit"
											onclick="handleAddProjectValue()">Save</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Add cProject Value popup ends -->


	<!------------- page content ends here -------------->
</body>




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

	

<script src="assets/js/adminContract-table.js"></script>
<script src="assets/js/drag-and-drop-file.js"></script>
<script src="assets/js/index.js"></script>
<script src="assets/js/rating.js"></script>

<script>

		console.log("${role}")
		var contextPath = "${pageContext.request.contextPath}"
		var userListJson;
		const myHeaders = new Headers();
		myHeaders.append("Content-Type", "application/json");
		var requestOptions = {
				method: "GET",
				headers: myHeaders,

				redirect: "follow"
			};


		//-------------------------------- validations starts here ---------------------
		let addProjectValueModal = document.querySelector('#add-project-value-modal');
		let inputs = addProjectValueModal.querySelectorAll('input,select,textarea');
		function showError(id, errorMsg) {
			let errSpan = document.getElementById(id)
			errSpan.innerHTML = errorMsg
		}
		function checkRequiredFields() {
			// console.log("checkRequiredFields called")
			let allFilled = true;
			let firstRequiredField = null;
			for (let input of inputs) {
				if (input.name == 'project_value' && input.value.trim() == '' && input.required) {
					allFilled = false;
					showError('project_value_err', 'Project Value is required')
				} else if (input.name == 'escrow_fee' && input.value.trim() == '' && input.required) {
					allFilled = false;
					showError('escrow_fee_err', 'Escrow Fee is required')
				}
				else if (input.name == 'platform_fee' && input.value.trim() == '' && input.required) {
					allFilled = false;
					showError('platform_fee_err', 'Platform Fee is required')
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
			if (input.name == 'project_value') {
				if (input.value != '') {
					const regex = /^\d+$/;
					if (!regex.test(input.value.trim())) {
						if (!errorsArray.includes(input.name)) {
							errorsArray.push(input.name);
						}
						errorMessage = 'Invalid Project Value';
						showError('project_value_err', errorMessage)
					} else {
						errorsArray = errorsArray.filter(function (e) { return e !== input.name })
						showError('project_value_err', '')
					}
				}
			} else if (input.name == 'escrow_fee') {
				if (input.value != '') {
					const regex = /^\d+$/;
					if (!regex.test(input.value.trim())) {
						if (!errorsArray.includes(input.name)) {
							errorsArray.push(input.name);
						}
						errorMessage = 'Invalid Escrow Fee';
						showError('escrow_fee_err', errorMessage)
					} else {
						errorsArray = errorsArray.filter(function (e) { return e !== input.name })
						showError('escrow_fee_err', '')
					}
				}
			}
			else if (input.name == 'platform_fee') {
				if (input.value != '') {
					const regex = /^\d+$/;
					if (!regex.test(input.value.trim())) {
						if (!errorsArray.includes(input.name)) {
							errorsArray.push(input.name);
						}
						errorMessage = 'Invalid Platform Fee';
						showError('platform_fee_err', errorMessage)
					} else {
						errorsArray = errorsArray.filter(function (e) { return e !== input.name })
						showError('platform_fee_err', '')
					}
				}
			}

			console.log(errorsArray)
		}

		for (let input of inputs) {
			input.addEventListener('blur', function () {
				validateForm(input);
			});
		}

		function handleAddProjectValue() {
			$("#add-project-value").submit(function (e) {
				e.preventDefault();
			})
			if (checkRequiredFields() && errorsArray.length == 0) {
				const button = document.querySelector('#add-project-value .btn-save');

				// Disable the button
				button.disabled = true;

				// Add the disabled-button class to apply additional styles
				button.classList.add('disabled-button');
				// Get form data
				const form = document.getElementById('add-project-value'); // Assuming 'add-project-value' is the ID of your form
				const formData = new FormData(form);

				let formDataObj = {};

				formData.forEach((value, key) => {
					formDataObj[key] = value;
				});
				// 				add totalPrice as the budgetAmount
				let json = JSON.stringify(formDataObj);
				console.log('form-data', formDataObj);
				const queryParams = {
					reqId: requirementId,
					budgetAmount: formDataObj.budgetAmount,
					totalPrice: formDataObj.budgetAmount
				};
				console.log(queryParams)

				const requestOptions = {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json'
					},
					body: JSON.stringify(queryParams)
				};
				fetch(contextPath + "/adminIntiateProject", requestOptions)
					.then((response) => response.text())
					.then(result => {
						console.log(result);
						result = JSON.parse(result)

					button.disabled = false;

					// Remove the disabled-button class
					button.classList.remove('disabled-button');
						$("#PMDiv").show()
						$("#InitiateProject").hide()
						$("#projectManager-appoint-button").hide()
						$("#add-project-value-modal").modal("hide")
						$("#projectManager-appoint").modal("hide")
						$("#project-kickoff-modal #content").html("The project price has been added to "+result.projectName+". The tripartite agreement has been sent to the buyer and seller for their review and signature.")
						$("#project-kickoff-modal").modal("show")
						

						// Redirect after 5 seconds
						setTimeout(function () {
							window.location.href = 'project'; // Replace '/project' with the desired URL
						}, 5000);

					})
					.catch(error => console.error("Error:", error));

			}

		}


	</script>

<script>
		var ctx = "${pageContext.request.contextPath}"
		// let arrowIconUrl = 'https://cnerzy.brainydxinnovate.in/public/assets/images/icons/close.png'
		let arrowIconUrl = ctx + '/assets/icons/close.png'

		//----------------------------------------- js script for converting dropdown into textfield starts here --------------------------------------
		function convertDropdownToText(selectDropdownBox) {
			//get select dropdown
			let selectDropdown = selectDropdownBox.querySelector('select');

			// Get the label for the select dropdown
			let selectLabel = selectDropdownBox.querySelector('label');
			let selectErrorSpan = selectDropdownBox.querySelector('.err-text');

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
						inputField.required = true;
						inputField.autocomplete = 'off';

						// Create a new label for the input field
						let label = selectLabel;
						label.style.backgroundColor = 'white';
						label.style.zIndex = '1';


						// Create a new icon element
						const iconSpan = document.createElement('span');
						iconSpan.innerHTML = "<img class='created-input-icon'src=" + arrowIconUrl + " alt='x'>";
						iconSpan.classList = 'icon-span'
						iconSpan.style.cursor = 'pointer !important';
						iconSpan.addEventListener('click', function (event) {
							event.preventDefault();
							selectDropdown.required = true;
							inputField.required = false;
							selectDropdown.disabled = false;
							inputField.disabled = true;
							selectDropdownBox.style.display = 'block';
							inputField.value = '';

							selectDropdown.value = '';
							inputDiv.style.display = 'none';
							selectLabel.style.top = '-10px';
							selectLabel.style.left = '18px';
							selectLabel.style.transform = 'translate(0px,0px)';

							selectDropdownBox.appendChild(selectLabel);
							customSelectInitialization()

							getAllInput()

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

						getAllInput()


						setTimeout(() => {
							inputField.focus();
							setTimeout(() => {
								if (document.activeElement !== inputField) {
									inputField.focus();
								}
							}, 100);
						}, 100);

						inputField.addEventListener('change', function () {
							if (inputField.id == 'industryClassificaiton') {
								const queryParams = {
									"industryClassificaiton": inputField.value,
									"industryExpertise": document.querySelector('#industryExpertise').value
								};
								makeApiCall(queryParams);
							} else if (inputField.id == 'industryExpertise') {
								const queryParams = {
									"industryClassificaiton": document.querySelector('#industryClassificaiton').value,
									"industryExpertise": inputField.value
								};
								makeApiCall(queryParams);
							}
						})

					}
					else {
						let inputDiv = selectDropdownBox.parentElement.querySelector('.input-created-box')
						let inputField = inputDiv.querySelector('.new-input-field');
						inputDiv.style.display = 'block';
						selectDropdown.disabled = true;
						inputField.disabled = false;
						selectDropdown.required = false;
						inputField.required = true;
						selectDropdownBox.style.display = 'none'; // Hide the select field group
						if (inputDiv.style.display === 'block') {
							inputField.focus();
						}
						getAllInput()
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
	</script>



</html>