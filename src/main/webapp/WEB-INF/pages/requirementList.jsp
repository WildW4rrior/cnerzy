<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CNERZY | RFQs</title>
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
<link rel="stylesheet" href="assets/css/registration.css">
<link rel="stylesheet" href="assets/css/dashboard.css">

<link
	href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css"
	rel="stylesheet">
</head>
<style>
.requirementNo {
	margin: 0;
	cursor: pointer;
	min-width: 130px;
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

#tableDiv>section {
	display: flex;
	flex-direction: column;
	min-height: 596px;
	padding: 24px 32px;
}

#documnetsDicuessUser .companyImage {
	width: 48px;
	background-position: center;
	height: 48px;
	margin-bottom: 12px;
	background-image: url(../../assets/images/Ellipse.svg);
	background-size: cover;
	transform: scale(1.5);
}

#mainDivSection3 .buttonDiv .reEngage {
	height: auto !important
}

#comapnyLogoUrl img {
	height: 48px;
	width: 48px;
}

#mainDivSection4 .card-type {
	height: 26px;
	position: absolute;
	top: 20px;
	right: 25px;
}

div.saveIcon.red {
	background-color: rgba(26, 28, 67, 1);
}

.btn, .arrow {
	background-color: #fff;
}

#small button {
	display: flex;
	gap: 10px;
	justify-content: center;
}

#small small {
	line-height: 24px;
	font-family: var(--secondary-font);
	font-size: 20px;
	font-weight: 400;
}

.modal-content {
	height: auto
}

.recommended-sellers-section .card-type {
	background: rgba(255, 255, 255, 1);
	padding: 0 10px;
}

.rating {
	color: var(--dark-blue);
}

.reEngage:disabled {
	background: rgba(26, 28, 67, 0.5);
}

table p {
	margin: 0
}

.mainDivSection3 .location {
	margin: 0
}

.mainDivSection3 .ratingDiv .ratings .rating {
	margin: 0;
	padding: 0.3rem 0;
}

.mainDivSection3>.rows-container  p {
	margin-bottom: 0 !important;
}

.buttonDiv.nav-btns>button {
	padding: 0;
	height: 42px;
	width: 140px
}

.card-style-2 .info .ratings {
	margin: 0 !important;
	gap: 0;
}

.card-style-2 .nav-btns {
	margin-top: 20px !important;
}
/* 
.table-container{
	border: 1px solid rgba(207, 207, 207, 1); 
	border-radius: 12px;
	
}
#RFQsTable_wrapper{
	overflow-x: scroll;
}

#RFQsTable_wrapper table{
	border: none;
	border-radius: 0px;
}
#RFQsTable_wrapper::-webkit-scrollbar {
	width: 4px;
	height: 4px;
}
#RFQsTable_wrapper::-webkit-scrollbar-track {
	background: var(--gray-8);
	border-radius: 10px;
}
#RFQsTable_wrapper::-webkit-scrollbar-thumb {
	background: var(--gray-4);
	border-radius: 6px;
}
#RFQsTable_wrapper::-webkit-scrollbar-thumb:hover {
	background: var(--gray-4);
} */
.cards-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 20px;
	padding: 20px 0;
}

.card-skeleton {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.skeleton {
	background: #e0e0e0;
	background: linear-gradient(110deg, #ececec 8%, #f5f5f5 18%, #ececec 33%);
	border-radius: 5px;
	background-size: 200% 100%;
	animation: shimmer 1.5s infinite linear;
}

.card-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 20px;
}

.logo-skeleton {
	width: 40px;
	height: 40px;
	border-radius: 50%;
}

.bookmark-skeleton {
	width: 24px;
	height: 24px;
}

.title-skeleton {
	height: 24px;
	width: 80%;
	margin-bottom: 10px;
}

.industry-skeleton {
	height: 16px;
	width: 60%;
	margin-bottom: 15px;
}

.location-skeleton {
	height: 16px;
	width: 70%;
	margin-bottom: 15px;
}

.stars-container {
	display: flex;
	gap: 5px;
	margin-bottom: 20px;
}

.star-skeleton {
	width: 20px;
	height: 20px;
}

.buttons-container {
	display: flex;
	gap: 10px;
}

.button-skeleton {
	height: 40px;
	flex: 1;
}

@keyframes shimmer { 0% {
	background-position: -200% 0;
}

100%
{
background-position:200% 0;
}
}
@media ( max-width : 768px) {
	.cards-grid {
		grid-template-columns: 1fr;
	}
}

.disabled-button {
	background-color: rgba(26, 28, 67, 0.2); /* Background color */
	cursor: not-allowed; /* Cursor style */
	border: 1px solid #ccc;
	/* Optional: add border to visually indicate disabled state */
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
			<section class=" " style="padding: 0">
				<div class="heading">
					<div class="headingStatus">
						<h1 id="allHeader" class="active">All (0)</h1>
						<h1 id="postedHeader">In Review (0)</h1>
						<h1 id="approvedHeader">Posted (0)</h1>
						<h1 id="rejectedHeader">Rejected (0)</h1>
					</div>
					<div class="sorting ">
						<p>Sort by:</p>
						<div class="btn-group">
							<button class="btn dropdown-toggle expand-icon " type="button"
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

		<div class="main-content" id="sellerList" style="display: none">
			<div class="row">
				<div class="col-12 col-sm-12 col-md-12 col-lg-12">
					<div class="breadcrumb-row d-flex">
						<div class="d-flex">
							<div class="breadcrumb-icon-box"
								onclick="replaceDiv('sellerList','tableDiv')">
								<img class="breadcrumb-icon" style="cursor: pointer;"
									src="assets/icons/breadcrumb-arrow.svg" alt="">
							</div>
							<div class="breadcrumb-text" id="reqNo">ABC-fgh12341</div>
						</div>
					</div>
					<nav
						class="tabs-style-1-nav-container mb-16 d-none d-sm-none d-md-none d-lg-block">
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<button class="nav-link active " id="tab-1" data-bs-toggle="tab"
								data-bs-target="#tab-1-content" type="button" role="tab"
								aria-controls="tab-1-content" aria-selected="true">
								View <br>Requirement
							</button>
							<button class="nav-link " id="tab-2" data-bs-toggle="tab"
								data-bs-target="#tab-2-content" type="button" role="tab"
								aria-controls="tab-2-content" aria-selected="false">
								Recommended Sellers<br> <small style="margin: 0"
									class="tab-2-count"></small>
							</button>
							<button class="nav-link " id="tab-3" data-bs-toggle="tab"
								data-bs-target="#tab-3-content" type="button" role="tab"
								aria-controls="tab-3-content" aria-selected="false">
								Shortlisted<br> <small style="margin: 0"
									class="tab-3-count"></small>
							</button>
							<button class="nav-link " id="tab-4" data-bs-toggle="tab"
								data-bs-target="#tab-4-content" type="button" role="tab"
								aria-controls="tab-4-content" aria-selected="false">
								Final<br> <small style="margin: 0" class="tab-4-count">
								</small>
							</button>
						</div>
					</nav>
					<nav
						class="tabs-style-1-nav-container mb-16 d-block d-sm-block d-md-block d-lg-none"
						id="small">
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<button class="nav-link active " id="tab-1" data-bs-toggle="tab"
								data-bs-target="#tab-1-content" type="button" role="tab"
								aria-controls="tab-1-content" aria-selected="true">View
								Requirement</button>
							<button class="nav-link " id="tab-2" data-bs-toggle="tab"
								data-bs-target="#tab-2-content" type="button" role="tab"
								aria-controls="tab-2-content" aria-selected="false">
								Recommended Sellers<small style="margin: 0" class="tab-2-count"></small>
							</button>
							<button class="nav-link " id="tab-3" data-bs-toggle="tab"
								data-bs-target="#tab-3-content" type="button" role="tab"
								aria-controls="tab-3-content" aria-selected="false">
								Shortlisted<small style="margin: 0" class="tab-3-count"></small>
							</button>
							<button class="nav-link " id="tab-4" data-bs-toggle="tab"
								data-bs-target="#tab-4-content" type="button" role="tab"
								aria-controls="tab-4-content" aria-selected="false">
								Final<small style="margin: 0" class="tab-4-count"> </small>
							</button>
						</div>
					</nav>

					<div class="tab-content tabs-style-1-content-container"
						id="nav-tabContent">
						<div class="tab-pane fade active show right-content"
							id="tab-1-content" role="tabpanel" aria-labelledby="tab-1">
							<div class="row row-gap-16" id="detailedPost">
								<div class="col-12">
									<div class="section-style-1">
										<div class="row row-gap-24">
											<div class="col-12 col-sm-6 col-md-6 col-lg-4">
												<h6 class="heading">Title</h6>
												<p class="text" id="jobPostTitle">Lorem Ipsum is simply
													dummy text</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-4">
												<h6 class="heading">Industry Classification</h6>
												<p class="text" id="industry">Aerospace</p>
											</div>
											<div class="col-12 col-sm-6 col-md-6 col-lg-4">
												<h6 class="heading">Industry Expertise</h6>
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
												<p class="text" id="projectDescription">Lorem Ipsum is
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
						<div class="tab-pane fade right-content" id="tab-2-content"
							role="tabpanel" aria-labelledby="tab-2">

							<div class="heading">
								<div class="headingStatus">
									<h1 id="allHeader" class="active">All</h1>
									<h1 id="savedHeader">Saved</h1>
								</div>
								<div class="d-flex">
									<div class="search mr-16">
										<form action="" method="">
											<div class="search-box">
												<img class="search-icon"
													src="${pageContext.request.contextPath}/assets/icons/search.svg"
													alt=""> <input class="search-input" type="search"
													placeholder="Search" aria-label="Search">
											</div>
											<!-- <button class="btn btn-outline-success" type="submit">Search</button> -->
										</form>
									</div>
									<div class="sorting" id="sellerSorting">
										<p>Sort by:</p>
										<div class="btn-group">
											<button class="btn dropdown-toggle expand-icon" type="button"
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
							</div>

							<div class="recommended-sellers-section mt-32">
								<h5>Cnerzy recommended Sellers</h5>
								<c:if test="${role ne 'ADMIN' }">
									<div class="heading">
										<div class="sorting hidden" style="display: none">
											<p>Sort by:</p>
											<div class="btn-group">
												<button class="btn  dropdown-toggle expand-icon "
													type="button" id="dropdownMenuClickableInside"
													data-bs-toggle="dropdown" data-bs-auto-close="outside"
													aria-expanded="false">Newest</button>
												<ul class="dropdown-menu"
													aria-labelledby="dropdownMenuClickableInside">

													<li><a class="dropdown-item disabled" href="#">Select</a>
													</li>
													<li><a class="dropdown-item" href="#">Newest</a></li>
													<li><a class="dropdown-item" href="#">Oldest</a></li>
												</ul>
											</div>
										</div>

									</div>
									<div class="cards-grid" id="skeletonContainer">

										<!-- Skeleton cards will be inserted here -->
									</div>
									<div class="mainDivSection3" id="mainDivSection3">
										<div class="rows-container"></div>

										<div id="pagination">
											<div id="paginationBotton1"></div>
										</div>

									</div>
									<div id="NoData3"
										style="display: none; min-height: 350px; flex: 1; justify-content: center; align-items: center; flex-direction: column;">
										<img class="icon" src="assets/icons/Group.svg"> No Data
										Available
									</div>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade right-content" id="tab-3-content"
							role="tabpanel" aria-labelledby="tab-3">
							<div class="heading">
								<div class="headingStatus">
									<h1 id="allHeader" class="active">All</h1>
									<h1 id="inReviewHeader">In Review</h1>
									<h1 id="rejectedHeader">Rejected</h1>
								</div>

							</div>
							<div class="recommended-sellers-section mt-32">
								<h5>Cnerzy recommended Sellers</h5>
								<c:if test="${role ne 'ADMIN' }">
									<div class="heading">
										<div class="sorting hidden" style="display: none">
											<p>Sort by:</p>
											<div class="btn-group">
												<button class="btn  dropdown-toggle expand-icon "
													type="button" id="dropdownMenuClickableInside"
													data-bs-toggle="dropdown" data-bs-auto-close="outside"
													aria-expanded="false">Newest</button>
												<ul class="dropdown-menu"
													aria-labelledby="dropdownMenuClickableInside">

													<li><a class="dropdown-item disabled" href="#">Select</a>
													</li>
													<li><a class="dropdown-item" href="#">Newest</a></li>
													<li><a class="dropdown-item" href="#">Oldest</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="mainDivSection3" id="mainDivSection4">
										<div class="rows-container"></div>

										<div id="pagination2">
											<div id="paginationBotton2"></div>
										</div>

									</div>
									<div id="NoData2"
										style="display: none; min-height: 350px; flex: 1; justify-content: center; align-items: center; flex-direction: column;">
										<img class="icon" src="assets/icons/Group.svg"> No Data
										Available
									</div>
								</c:if>
							</div>
						</div>

						<div class="tab-pane fade right-content" id="tab-4-content"
							role="tabpanel" aria-labelledby="tab-4">
							<div class="custom-view-seller-modal" id="finalSeller">
								<div class="details">
									<div class="section row gx-0 row-gap-16">
										<div class="col-12 col-sm-6 col-md-6 col-lg-4">
											<div class="d-flex align-items-start"
												style="width: 48px; height: 48px;" id="comapnyLogoUrl">

												<img style="width: 100%; height: 100%;"
													src="assets/icons/Profile-1.svg" alt="">
												<h6 class="heading" id="companyName">
													BrainyDX <br>Technologies LLP
												</h6>
											</div>

										</div>
										<div class="col-12 col-sm-6 col-md-6 col-lg-4">
											<h6 class="heading">Industry Classification</h6>
											<p class="content" id="companyIndustry">Aerospace</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6 col-lg-4">
											<h6 class="heading">Industry Expertise</h6>
											<p class="content" id="companyExpertise">Aerospace</p>
										</div>
									</div>
									<div class="section row row-gap-16">
										<div class="col-12 col-sm-6 col-md-6 col-lg-4">
											<h6 class="heading">Location</h6>
											<p class="content" id="location">Delhi, India</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6 col-lg-4">
											<h6 class="heading">Projects Completed</h6>
											<p class="content" id="numberOfProjectsCompleted">Delhi,
												India</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6 col-lg-4">
											<h6 class="heading">RFQ's Participated</h6>
											<p class="content" style="flex-direction: row; gap: 10px">
												<small id="totalRFQParticipated"></small> out of <small
													id="totalRFQSent"></small>
											</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6 col-lg-4">
											<h6 class="heading">LinkedIn profile</h6>
											<p class="content" id="linkedInProfile">Delhi, India</p>
										</div>
									</div>
									<div class="section row">
										<div class="col-12">
											<h6 class="heading">Rating</h6>
											<div class="d-flex rating-info">
												<h6 class="heading text-nowrap">
													<span id="ratings" style="margin-right: 10px;"></span> out
													of 5
												</h6>
												<div class="stars text-nowrap"></div>
												<p class="content flex-row " style="gap: 0">
													<span id="numberOfRatings" style="margin-right: 10px;"></span>
													Ratings
												</p>
											</div>
										</div>
									</div>
									<div class="section row">
										<div class="col-12">
											<h6 class="heading">Showcase Case Study</h6>
											<div class="documents d-flex" id="projectCaseStudies">
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
									<div class="buttonDiv" style="margin: 1rem 0;">
										<button class="reEngage" id="workSpace">Workspace</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!---------- For Upload or drag and drop --------->
		<div class="main-content" id="DiscussModal" style="display: none">
			<div class="row">
				<div class="col-12 col-sm-12 col-md-12 col-lg-12">
					<div class="breadcrumb-row d-flex">
						<div class="d-flex">
							<div class="breadcrumb-icon-box"
								onclick="replaceDiv('DiscussModal','sellerList')">
								<img class="breadcrumb-icon"
									src="assets/icons/breadcrumb-arrow.svg" alt="">
							</div>
							<div class="breadcrumb-text" id="reqNo">Proj-ih12345</div>
						</div>
						<div>
							<!-- <button class="btn-outlined" data-bs-toggle="modal"
									data-bs-target="#withdraw-modal">Withdraw</button>
								 -->
							<button class="btn-outlined" id="rejectButton"
								data-bs-toggle="modal" data-bs-target="#reject-modal">Reject</button>
						</div>
					</div>
					<div class="right-content">
						<div class="row mb-32 row-gap-16">
							<div class="col-lg-8 col-md-12">
								<form id="upload-document-form" enctype="multipart/form-data">
									<div class="custom-file-upload-section-1"
										id="document-upload-section">
										<div class="inner-1">
											<div class="click-area">
												<input name="addedForCid" id="addedForCid" hidden> <input
													name="reqId" id="reqId" hidden> <input type="file"
													name="file" id="document-file" hidden>
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
														<p class="primary-text">NDA_Buyer_Seller.pdf</p>
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
							<div class="col-lg-4 col-md-12">
								<div class="card-style-3 mb-24">
									<h3 class="mb-24">We're good to go!</h3>
									<p class="mb-24">With your inquiry answered and terms
										agreed upon, let's lock it in with an LOI/PO!</p>
									<button class="btn-style-1 w-100" id="poLoi"
										data-bs-toggle="modal"
										data-bs-target="#upload-loi-and-po-modal" onclick="">Continue</button>
								</div>
								<div class="" id="documnetsDicuessUser">
									<div class="card-type"></div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Requirement Under Review popup starts -->
	<div class="modal fade modal-style-1 modal-lg"
		id="requirement-under-review" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close"> <img
					class="modal-img" src="assets/icons/Awaiting-Icon.svg"
					alt="Awaiting-icon">
				<h2 class="modal-heading text-center mb-8">Your Requirement is
					Under Review!</h2>
				<p class="modal-para text-center">Your requirement has been
					submitted and is currently under review by our team.</p>
			</div>
		</div>
	</div>
	<!-- Requirement Under Review popup ends -->

	<!-- View Profile popup starts -->
	<div class="modal fade modal-xl custom-view-seller-modal"
		id="seller-profile" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<h3 class="heading">Seller Profile</h3>
					<div class="details">
						<div class="section row gx-0 row-gap-16">
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<div class="d-flex align-items-start"
									style="width: 48px; height: 48px;" id="comapnyLogoUrl">

									<img class="mr-16" style="width: 100%; height: 100%;"
										src="assets/icons/Profile-1.svg" alt="">
									<h6 class="heading mb-0" id="companyName">
										BrainyDX <br>Technologies LLP
									</h6>
								</div>

							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Industry Classification</h6>
								<p class="content" id="companyIndustry">Aerospace</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Industry Expertise</h6>
								<p class="content" id="companyExpertise">Aerospace</p>
							</div>
						</div>
						<div class="section row row-gap-16">
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Location</h6>
								<p class="content" id="location">Delhi, India</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Projects Completed</h6>
								<p class="content" id="numberOfProjectsCompleted">Delhi,
									India</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">RFQ's Participated</h6>
								<p class="content" style="flex-direction: row; gap: 10px">
									<small id="totalRFQParticipated"></small> out of <small
										id="totalRFQSent"></small>
								</p>

							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">LinkedIn profile</h6>
								<p class="content" id="linkedInProfile">Delhi, India</p>
							</div>
						</div>
						<div class="section row">
							<div class="col-12">
								<h6 class="heading">Rating</h6>
								<div class="d-flex rating-info">
									<h6 class="heading text-nowrap">
										<span id="ratings" style="margin-right: 10px;"></span> out of
										5
									</h6>
									<div class="stars text-nowrap"></div>
									<p class="content flex-row " style="gap: 0">
										<span id="numberOfRatings" style="margin-right: 10px;"></span>
										Ratings
									</p>

								</div>
							</div>
						</div>
						<div class="section row">
							<div class="col-12">
								<h6 class="heading">Showcase Case Study</h6>
								<div class="documents d-flex" id="projectCaseStudies">
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
								<div class="text">Kickoff</div>
								<div class="date"></div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Timeline Popup starts here -->


	<!-- View Profile popup starts -->
	<div class="modal fade modal-xl custom-view-seller-modal"
		id="industry-and-service" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="body">
					<h3 class="heading">Seller Profile</h3>
					<div class="details">
						<div class="section row gx-0 row-gap-16">
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<div class="d-flex align-items-start"
									style="width: 48px; height: 48px;" id="comapnyLogoUrl">

									<img style="width: 100%; height: 100%;"
										src="assets/icons/Profile-1.svg" alt="">
									<h6 class="heading" id="companyName">
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
								<small id="totalRFQParticipated"></small> out of <small
									id="totalRFQSent"></small>

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
									<div class="stars"></div>
									<p class="content">12 Ratings</p>
								</div>
							</div>
						</div>
						<div class="section row">
							<div class="col-12">
								<h6 class="heading">Showcase Case Study</h6>
								<div class="documents d-flex" id="projectCaseStudies">
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

	<!-- Withdraw popup starts -->
	<div
		class="modal fade modal-lg custom-edit-modal custom-withdraw-modal"
		id="withdraw-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<form action="" id="withdraw-form">
				<div class="modal-content">
					<div class="body">
						<h4 class="mb-32">Are you sure you want to withdraw from this
							discussion process? If yes, please select reason of withdrawal!</h4>
						<div class="container-fluid">
							<div class="checkbox-field-group mb-8 d-flex">
								<input type="checkbox" name="unfeasibleProjectScope"
									id="unfeasibleProjectScope" class="mr-8" autocomplete="off"><label
									for="unfeasibleProjectScope">Unfeasible project scope</label>
							</div>
							<div class="checkbox-field-group mb-8 d-flex">
								<input type="checkbox" name="paymentTermsNotSuitable"
									id="paymentTermsNotSuitable" class="mr-8" autocomplete="off"><label
									for="paymentTermsNotSuitable">Payment terms not
									suitable</label>
							</div>
							<div class="checkbox-field-group mb-8 d-flex">
								<input type="checkbox" name="projectTimelineNotAchievable"
									id="projectTimelineNotAchievable" class="mr-8"
									autocomplete="off"><label
									for="projectTimelineNotAchievable">Project timeline not
									achievable</label>
							</div>
							<div class="checkbox-field-group mb-8 d-flex">
								<input type="checkbox" name="clientExpectationsNotAligned"
									id="clientExpectationsNotAligned" class="mr-8"
									autocomplete="off"><label
									for="clientExpectationsNotAligned">Client expectations
									not aligned</label>
							</div>
							<div class="checkbox-field-group d-flex">
								<input type="checkbox" name="other" id="other" class="mr-8"
									autocomplete="off"><label for="other">Other</label>
							</div>
							<span class="err-text" id="checkboxes_err"></span>
							<div class="field-group textarea-field-group-1 mt-16 d-none"
								id="otherTextBox">
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
									<button class="btn-style-4 btn-cancel" type="button"
										data-bs-dismiss="modal" aria-label="Close">Cancel</button>
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

	<!-- Reject popup starts -->
	<div class="modal fade modal-lg custom-edit-modal custom-reject-modal"
		id="reject-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<form action="" id="reject-form">
				<div class="modal-content">
					<input name="addedForCid" id="addedForCid" hidden> <input
						name="reqId" id="reqId" hidden>

					<div class="body">
						<h4 class="mb-32">Are you sure you want to reject this
							seller? If yes, please select reason of rejection!</h4>
						<div class="container-fluid">
							<div class="checkbox-field-group mb-8 d-flex">
								<input type="checkbox" name="lackOfTechnicalCompetency"
									id="lackOfTechnicalCompetency" class="mr-8" autocomplete="off"><label
									for="lackOfTechnicalCompetency">Lack of technical
									competency</label>
							</div>
							<div class="checkbox-field-group mb-8 d-flex">
								<input type="checkbox" name="proposalLacsClarity"
									id="proposalLacsClarity" class="mr-8" autocomplete="off"><label
									for="proposalLacsClarity">Proposal lacks clarity</label>
							</div>
							<div class="checkbox-field-group mb-8 d-flex">
								<input type="checkbox" name="unacceptableTermsConditions"
									id="unacceptableTermsConditions" class="mr-8"
									autocomplete="off"><label
									for="unacceptableTermsConditions">Unacceptable terms
									and conditions</label>
							</div>
							<div class="checkbox-field-group mb-8 d-flex">
								<input type="checkbox" name="unmetCommercialExpectations"
									id="unmetCommercialExpectations" class="mr-8"
									autocomplete="off"><label
									for="unmetCommercialExpectations">Unmet commercial
									expectations</label>
							</div>
							<div class="checkbox-field-group d-flex">
								<input type="checkbox" name="other" id="other" class="mr-8"
									autocomplete="off"><label for="other">Other</label>
							</div>
							<span class="err-text" id="checkboxes_err"></span>
							<div class="field-group textarea-field-group-1 mt-16 d-none"
								id="otherTextBox">
								<textarea name="otherText" id="otherText" class="input-field"
									placeholder="Brief Description here..." cols="100"></textarea>
								<span id="reject_modal_otherText_err" class="err-text"></span>
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
			</form>
		</div>
	</div>
	<!-- Reject popup ends -->

	<!-- Upload LOI and PO popup starts -->
	<div class="modal fade modal-xl custom-edit-modal"
		id="upload-loi-and-po-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form action="" id="upload-loi-and-po-form">
					<div class="body">
						<input name="addedForCid" id="addedForCid" hidden> <input
							name="reqId" id="reqId" hidden> <input
							name="reqUniqueCode" id="reqUniqueCode" hidden>

						<h4 class="mb-32">We're good to go! Please upload one of the
							required documents (LOI or PO) to continue.</h4>
						<div class="row row-gap-16">
							<div class="col-lg-6 col-md-12">
								<div class="custom-file-upload-section-1"
									id="loi-upload-section">
									<div class="inner-1">
										<div class="click-area">
											<input type="file" name="loiFile" id="document-file" hidden>
											<div class="icon-box">
												<img src="assets/icons/fileupload.svg" alt="">
											</div>
											<h4 class="text-center">
												Click to Upload <b>LOI</b> <span>or drag and drop</span>
											</h4>
										</div>
										<h6 class="mt-8 mb-8 text-center">or</h6>
										<div class="field-group link-field-group">
											<div class="input-icon start">
												<img src="assets/icons/link.svg" alt="">
											</div>
											<input type="text" name="loiLink" id="loi_document_link"
												autocomplete="off" class="input-field"
												placeholder="Paste Link Here">
											<div class="input-icon end">
												<img src="assets/icons/arrow-next.svg" alt="">
											</div>
											<span id="loi_document_link_err" class="err-text"></span>
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
											<span id="loiFile_err" class="err-text"></span>
										</div>
										<div class="field-group link-field-group d-none">
											<div class="input-icon start">
												<img src="assets/icons/link.svg" alt="">
											</div>
											<span></span>
										</div>
										<span id="loiLink" class="err-text"></span>
										<div class="field-group textarea-field-group-1 mt-16 mb-32">
											<textarea name="document_description"
												id="document_description" class="input-field"
												placeholder="Brief Description here..." cols="100"
												autocomplete="off"></textarea>
											<span id="document_description_err" class="err-text"></span>
										</div>
										<div class="row">
											<div class="col-12 d-block d-sm-flex justify-content-end">
												<button class="btn-style-4 btn-cancel m-0" type="button"
													onclick="chooseAgain('loi-upload-section')">Cancel</button>
												<!-- <button class="btn-style-1 btn-save" type="button" onclick="selectionDone('loi-upload-section')">Save</button> -->
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
							<div class="col-lg-6 col-md-12">
								<div class="custom-file-upload-section-1" id="po-upload-section">
									<div class="inner-1">
										<div class="click-area">
											<input type="file" name="poFile" id="document-file" hidden>
											<div class="icon-box">
												<img src="assets/icons/fileupload.svg" alt="">
											</div>
											<h4 class="text-center">
												Click to Upload <b>PO</b> <span>or drag and drop</span>
											</h4>
										</div>
										<h6 class="mt-8 mb-8 text-center">or</h6>
										<div class="field-group link-field-group">
											<div class="input-icon start">
												<img src="assets/icons/link.svg" alt="">
											</div>
											<input type="text" name="poLink" id="document_link"
												autocomplete="off" class="input-field"
												placeholder="Paste Link Here">
											<div class="input-icon end">
												<img src="assets/icons/arrow-next.svg" alt="">
											</div>
											<span id="po_document_link_err" class="err-text"></span>
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
											<span id="poFile_err" class="err-text"></span>
										</div>
										<div class="field-group link-field-group d-none">
											<div class="input-icon start">
												<img src="assets/icons/link.svg" alt="">
											</div>
											<span></span>
										</div>
										<span id="poLink" class="err-text"></span>
										<div class="field-group textarea-field-group-1 mt-16 mb-32">
											<textarea name="document_description"
												id="document_description" class="input-field"
												placeholder="Brief Description here..." cols="100"
												autocomplete="off"></textarea>
											<span id="document_description_err" class="err-text"></span>
										</div>
										<div class="row">
											<div class="col-12 d-block d-sm-flex justify-content-end">
												<button class="btn-style-4 btn-cancel m-0" type="button"
													onclick="chooseAgain('po-upload-section')">Cancel</button>
												<!-- <button class="btn-style-1 btn-save" type="button">Save</button> -->
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
									<button class="btn-style-1 btn-save" type="submit">Submit</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Upload LOI and PO popup ends -->

	<!-- Feedback Submitted(Withdraw-form) popup starts -->
	<div class="modal fade custom-thank-you-modal modal-lg"
		id="withdraw-feedback-submitted" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="modal-img mb-16"
					src="assets/icons/Succeess Animation.svg" alt="Success Animation">
				<h2 class="modal-heading text-center mb-8">Feedback Submitted</h2>
				<p class="modal-para text-center">You have been successfully
					Withdraw from this discussion process.</p>
			</div>
		</div>
	</div>
	<!-- Feedback Submitted(Withdraw-form) popup ends -->

	<!-- Feedback Submitted(Reject-form) popup starts -->
	<div class="modal fade custom-thank-you-modal modal-lg"
		id="reject-feedback-submitted" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="modal-img mb-16"
					src="assets/icons/Succeess Animation.svg" alt="Success Animation">
				<h2 class="modal-heading text-center mb-8">Feedback Submitted</h2>
				<p class="modal-para text-center">Your rejection request has
					been submitted for this seller.</p>
			</div>
		</div>
	</div>
	<!-- Feedback Submitted(Reject-form) popup ends -->

	<!-- Project Initiated popup starts -->
	<div class="modal fade custom-thank-you-modal modal-lg"
		id="project-initiated" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="modal-img mb-16" src="assets/icons/Awaiting-Icon.svg"
					alt="Awaiting-icon">
				<h2 class="modal-heading text-center mb-8">Contract Under
					Review</h2>
				<p class="modal-para text-center" id="reqNo">Your contract is
					under review by Cnerzy. we're making sure all details are squared
					away. your project will kick off shortly!</p>
			</div>
		</div>
	</div>
	<!-- Project Initiated popup ends -->

	<!-- Sign NDA popup starts -->
	<div class="modal fade modal-style-1 modal-lg" id="NDAdocument"
		aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
		tabindex="-1" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close"> <img
					class="modal-img" src="assets/icons/Action-Required.svg"
					alt="Action-Required">
				<h2 class="modal-heading text-center mb-8">Sign the NDA</h2>
				<p class="modal-para text-center">Please sign the NDA document
					sent to you via email to initiate the discussion with the seller.</p>
			</div>
		</div>
	</div>
	<!-- Sign NDA popup ends -->

	<!-- Submitted and Seller's reviews popup starts -->
	<div
		class="modal fade custom-thank-you-modal submitted-and-review-modal modal-lg"
		id="submitted-and-review" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<form id="submitted-and-review-form">

				<input name="addedForCid" id="addedForCid" hidden> <input
					name="reqId" id="reqId" hidden>


				<div class="modal-content">
					<img class="modal-img mb-16"
						src="assets/icons/Succeess Animation.svg" alt="Success Animation">
					<h2 class="modal-heading text-center mb-8">Submitted</h2>
					<p class="content m-0 text-center">Your LOI/PO Submitted to
						BrainyDX Technologies.</p>
					<hr style="color: #1a1c43">
					<h5 class="feedback-heading text-center mb-24">Give feedback
						to other rejected sellers.</h5>
					<div class="row row-gap-16" id="sellers-row">
						<div class="col-12 col-sm-12 col-md-12 col-lg-6">
							<div class="card-style-4">
								<div class="card-header">
									<div class="icon-box">
										<img class="icon" src="assets/icons/Profile-1.svg" alt="">
									</div>
									<div class="info">
										<h6 class="title">BrainyDX Technologies</h6>
										<span class="subtitle">Industry: Aerospace</span>
									</div>
								</div>
								<div class="card-body mt-16">
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="Negotiationstage"
											id="Negotiation stage" class="mr-8" autocomplete="off"><label
											for="Negotiation stage">Negotiation stage</label>
									</div>
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="LackOfTechnicalCompetency"
											id="LackOfTechnicalCompetency" class="mr-8"
											autocomplete="off"><label
											for="LackOfTechnicalCompetency">Lack of technical
											competency</label>
									</div>
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="proposalLacsClarity"
											id="proposalLacsClarity" class="mr-8" autocomplete="off"><label
											for="proposalLacsClarity">Proposal lacks clarity</label>
									</div>
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="unacceptableTermsConditions"
											id="unacceptableTermsConditions" class="mr-8"
											autocomplete="off"><label
											for="unacceptableTermsConditions">Unacceptable terms
											and conditions</label>
									</div>
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="unmetCommercialExpectations"
											id="unmetCommercialExpectations" class="mr-8"
											autocomplete="off"><label
											for="unmetCommercialExpectations">Unmet commercial
											expectations</label>
									</div>
									<div class="checkbox-field-group d-flex">
										<input type="checkbox" name="other" id="other" class="mr-8"
											autocomplete="off"><label for="other">Other</label>
									</div>
									<span class="err-text" id="checkboxes_err"></span>
									<div class="field-group textarea-field-group-1 mt-16 d-none"
										id="otherTextBox">
										<textarea name="otherText" id="otherText" class="input-field"
											placeholder="Brief Description here..." cols="100"></textarea>
										<span id="reject_modal_otherText_err" class="err-text"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-sm-12 col-md-12 col-lg-6">
							<div class="card-style-4">
								<div class="card-header">
									<div class="icon-box">
										<img class="icon" src="assets/icons/Profile-1.svg" alt="">
									</div>
									<div class="info">
										<h6 class="title">BrainyDX Technologies</h6>
										<span class="subtitle">Industry: Aerospace</span>
									</div>
								</div>
								<div class="card-body mt-16">
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="lackOfTechnicalCompetency"
											id="lackOfTechnicalCompetency" class="mr-8"
											autocomplete="off"><label
											for="lackOfTechnicalCompetency">Negotiation stage</label>
									</div>
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="proposalLacsClarity"
											id="proposalLacsClarity" class="mr-8" autocomplete="off"><label
											for="proposalLacsClarity">Lack of technical
											competency</label>
									</div>
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="proposalLacsClarity"
											id="proposalLacsClarity" class="mr-8" autocomplete="off"><label
											for="proposalLacsClarity">Proposal lacks clarity</label>
									</div>
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="unacceptableTermsConditions"
											id="unacceptableTermsConditions" class="mr-8"
											autocomplete="off"><label
											for="unacceptableTermsConditions">Unacceptable terms
											and conditions</label>
									</div>
									<div class="checkbox-field-group mb-8 d-flex">
										<input type="checkbox" name="unmetCommercialExpectations"
											id="unmetCommercialExpectations" class="mr-8"
											autocomplete="off"><label
											for="unmetCommercialExpectations">Unmet commercial
											expectations</label>
									</div>
									<div class="checkbox-field-group d-flex">
										<input type="checkbox" name="other" id="other" class="mr-8"
											autocomplete="off"><label for="other">Other</label>
									</div>
									<span class="err-text" id="checkboxes_err"></span>
									<div class="field-group textarea-field-group-1 mt-16 d-none"
										id="otherTextBox">
										<textarea name="otherText" id="otherText" class="input-field"
											placeholder="Brief Description here..." cols="100"></textarea>
										<span id="reject_modal_otherText_err" class="err-text"></span>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col-12 d-flex justify-content-end">
						<button class="btn-style-1" type="submit">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Submitted and Seller's reviews popup ends -->

	<!------------- page content ends here -------------->
</body>


<script>
	console.log("${role}");
	var contextPath = "${pageContext.request.contextPath}"
</script>
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
<script src="assets/js/drag-and-drop-file.js"></script>
<script src="assets/js/buyerRequirement.js"></script>





</html>