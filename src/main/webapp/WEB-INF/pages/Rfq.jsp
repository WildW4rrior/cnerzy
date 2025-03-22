<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CNERZY | RFQs</title>
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/rfq.css">
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
<link rel="stylesheet" href="assets/css/registration.css">


<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>


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

.requirementNo {
	margin: 0;
	cursor: pointer;
}

.btn-style {
	font-family: var(--secondary-font);
	color: var(--white);
	font-size: 16px;
	text-align: center;
	background-color: var(--dark-blue);
	border-radius: 8px;
	border: none;
}

.btn-style-5 {
	font-family: var(--secondary-font);
	color: var(--dark-blue);
	font-size: 16px;
	text-align: center;
	background-color: var(--white);
	border-radius: 8px;
	border: 1px solid var(--dark-blue);
}

#status {
	padding: 4px 10px;
	text-wrap: nowrap;
	border-radius: 4px;
	height: fit-content;
}

.breadcrumb-row {
	justify-content: normal;
}

.section3 {
	border-radius: 12px;
	background: rgba(255, 255, 255, 1);
	padding: 2rem
}

.section3 .titleHeading {
	color: rgba(26, 28, 67, 1);
	font-family: Lora;
	font-size: 24px;
	font-weight: 500;
	line-height: 20px;
	text-align: left;
}
</style>

<body>

	<!------------- navbar starts here -------------->
	<c:import url="navbar.jsp"></c:import>
	<!------------- navbar ends here -------------->

	<!------------- page content starts here -------------->

	<div class="wrapper">
		<c:import url="sidebar.jsp"></c:import>


		<div class="main-content" id="tableDiv">
			<section class="projects mainShadow">
				<div class="heading">
					<div class="headingStatus">
						<h1 id="allHeader" class="active">All (0)</h1>
						<h1 id="postedHeader">In Review (0)</h1>
						<h1 id="sellerIntimationHeader">Seller Intimation (0)</h1>
						<h1 id="rejectedHeader">Rejected (0)</h1>

						<!-- 						<h1 id="wonHeader">Won (0)</h1> -->
						<!-- 						<h1 id="lostHeader">Lost (0)</h1> -->
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
				<div class="table-container">

					<table id="RFQsTable" class="" style="width: 100%">
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
		<div class="main-content" id="IntimatedSellerList"
			style="display: none">
			<section class="projects mainShadow">
				<div class="breadcrumb-row d-flex">
					<div class="breadcrumb-icon-box" id="backButton"
						onclick="replaceDiv('IntimatedSellerList','tableDiv')">
						<img class="breadcrumb-icon"
							src="assets/icons/breadcrumb-arrow.svg" alt="">
					</div>
					<div class="breadcrumb-text" id="breadcrumb-text"></div>
				</div>

				<section class="section3 mainShadow">
					<div class="heading">
						<div class="headingStatus">
							<h1 id="allHeader" class="active">All (0)</h1>
							<h1 id="pendingHeader">Pending (0)</h1>
							<h1 id="interestedHeader">Interested(0)</h1>
							<h1 id="notinterestedHeader">Not Interested (0)</h1>

							<!-- 						<h1 id="wonHeader">Won (0)</h1> -->
							<!-- 						<h1 id="lostHeader">Lost (0)</h1> -->
						</div>
					</div>
					<div class="titleHeading">
						<h1
							style="font-family: Lora; font-size: 24px; font-weight: 500; line-height: 20px; text-align: left;">Intimated
							Sellers List</h1>

					</div>
					<div class="mainDivSection3" id="mainDivSection3">
						<div class="rows-container"></div>

						<div id="pagination">
							<div id="paginationBotton"></div>
						</div>
						<div id="NoData"
							style="display: none; flex: 1; justify-content: center; align-items: center; flex-direction: column;">
							<img class="icon" src="assets/icons/Group.svg"> No Data
							Available
						</div>
					</div>
				</section>
			</section>
		</div>
	</div>

	<!-- requirement details modal starts here -->

	<div class="modal fade modal-xl" id="requirement-details" tabindex="-1"
		aria-labelledby="requirement-details" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body p-0">
					<div class="section-style-3-parent">
						<div class="section-style-3">
							<div class="header">
								<div class="row row-gap-24">
									<div class="col-12 col-sm-6 col-md-6 col-lg-6">
										<div class="d-flex align-items-center gap-3 ">
											<h6 class="heading" style="width: fit-content;" id="addedBy">ABC-fgh12341</h6>
											<span id="status"
												style="width: fit-content; height: fit-content;"></span>
										</div>
										<p class="text" id="dateAgo">Feb 13, 12:28PM (7 days ago)</p>

									</div>
									<div
										class="col-12 col-sm-6 col-md-6 col-lg-6 d-flex justify-content-end">
										<button class="btn-style-5 mr-16" id="rejectButton"
											type="button">Reject</button>
										<button class="btn-style" id="approveButton" type="button">Accept</button>
										<button class="btn-style" id="IntimatedSellers" type="button">Intimated
											Sellers List</button>

									</div>
								</div>
							</div>
							<div class="row row-gap-24">
								<div class="col-12 col-sm-6 col-md-6 col-lg-6">
									<h6 class="heading">Title</h6>
									<p class="text" id="jobPostTitle">Lorem Ipsum is simply
										dummy text</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Industry</h6>
									<p class="text" id="industry">Aerospace</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Services</h6>
									<p class="text" id="service">Aerospace</p>
								</div>
							</div>
						</div>
						<div class="section-style-3">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="heading">Brief Description</h6>
									<p class="text" id="projectDescription">Lorem Ipsum is
										simply dummy text of the printing and typesetting industry.
										Lorem Ipsum has been the industry's standard dummy text ever
										since the 1500s, when an unknown printer took a galley of type
										and scrambled it to make a type specimen book. It has survived
										not only five centuries, but also the leap into electronic
										typesetting, remaining essentially unchanged. It was
										popularised in the 1960s with the release of Letraset sheets
										containing Lorem Ipsum passages, and more recently with
										desktop publishing software like Aldus PageMaker including
										versions of Lorem Ipsum.</p>
								</div>
							</div>
						</div>
						<div class="section-style-3">
							<div class="row row-gap-24">
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Quantity</h6>
									<p class="text" id="quantityRequired">1,00,000</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Material Specifications</h6>
									<p class="text" id="materialSpecifications">Lorem Ipsum,
										Lorem Ipsumr</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Quality Specifications</h6>
									<p class="text" id="qualitySpecifications">Lorem Ipsum,
										Lorem Ipsum</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Packaging Specifications</h6>
									<p class="text" id="packagingSpecifications">Lorem Ipsum,
										Lorem Ipsum</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Logistics Specifications</h6>
									<p class="text" id="logisticsSpecifications">Lorem Ipsum,
										Lorem Ipsum</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Delivery Timelines</h6>
									<p class="text" id="deliveryTimelines">100</p>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<h6 class="heading">Seller Location</h6>
									<p class="text" id="sellerLocation">US</p>
								</div>
							</div>
						</div>
						<div class="section-style-3">
							<div class="row row-gap-24">
								<div class="col-12">
									<h6 class="heading">Seller Preferences</h6>
									<p class="text" id="sellerPreference">Cnerzy recommended
										suppliers</p>
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
	<div class="modal fade pm-dashboard-timeline modal-xl" id="timeline"
		tabindex="-1" aria-labelledby="timelineLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close">
				<div class="modal-body">
					<div class="timeline-container">
						<div class="">
							<h5 class="title" id="timelineLabel">Requirement Timeline</h5>
							<p class="project-id-text" id="projectId"></p>
						</div>
						<div class="timeline">
							<div class="timeline-item " data-key="Contract Issued">
								<div class="icon"></div>
								<div class="text">Contract Issued</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item " data-key="Project Kickoff">
								<div class="icon"></div>
								<div class="text">Project Kickoff</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item " data-key="Sellers Shortlisted">
								<div class="icon"></div>
								<div class="text">Sellers Intimated</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Discussions Initiated">
								<div class="icon"></div>
								<div class="text">Discussions Pgase</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-step="Negotiations">
								<div class="icon"></div>
								<div class="text">Negotiations</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Contract Issued">
								<div class="icon"></div>
								<div class="text">Contract/ Purchase Order Issued</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Project Kickoff">
								<div class="icon"></div>
								<div class="text">Project Kickoff</div>
								<div class="date"></div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Timeline Popup starts here -->

	<!------------- page content ends here -------------->
</body>


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


<script src="assets/js/RFQs-table.js"></script>


<script>
	console.log("${role}")
	var userListJson;
	var role = "${role}"
	var contextPath = "${pageContext.request.contextPath}"
</script>



</html>