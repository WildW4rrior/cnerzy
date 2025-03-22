<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CNERZY | Dashboard</title>


<link rel="stylesheet" href="assets/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/dashboard.css">
</head>
<style>
.companyIndustry {
	margin-left: 5px;
}

</style>

<body>
	<c:import url="navbar.jsp"></c:import>
	<section class="wrapper">
		<div class="bodySection">


			<c:import url="sidebar.jsp"></c:import>
			<section class="content">
				<section class="WelcomHeader">
					<h1 class="welcome">Hi, ${welcome}</h1>
					<p class="PostaRequirement">
						<a href="postRequirement"><img src="assets/icons/add.svg"
							style="margin-right: 4px;" alt="+">Post a Requirement</a>
					</p>
				</section>

				<section class="hightlights mainShadow">
					<h5 class="hightlight-heading">Requirements</h5>
					<div class="summary">
						<div>

							<img class="icon" src="assets/icons/Total Requirement.svg">
							<div>
								<a href="BuyersRequirementList">
									<p>Total</p>
									<h2 id="total-requirements"></h2>
								</a>
							</div>

						</div>

						<small class="vl"></small>
						<div>
							<img class="icon" src="assets/icons/In Review.svg">

							<div onclick="fillterRequirement('postedHeader')">
								<p>In Review</p>
								<h2 id="in-review"></h2>
							</div>

						</div>
						<small class="vl"></small>
						<div>
							<img class="icon" src="assets/icons/Posted.svg">
							<div onclick="fillterRequirement('approvedHeader')">
								<p>Approved</p>
								<h2 id="posted"></h2>
							</div>
						</div>
						<small class="vl"></small>
						<div>
							<img class="icon" src="assets/icons/Rejected.svg">
							<div onclick="fillterRequirement('rejectedHeader')">
								<p>Rejected</p>
								<h2 id="rejected"></h2>
							</div>
						</div>
					</div>
				</section>

				<section class="projects mainShadow">

					<div class="heading">
						<h1>Projects</h1>
						<div class="sorting hidden" style="display: none">
							<p>Sort by:</p>
							<div class="btn-group">
								<button class="btn  dropdown-toggle expand-icon " type="button"
									id="dropdownMenuClickableInside" data-bs-toggle="dropdown"
									data-bs-auto-close="outside" aria-expanded="false">
									Newest</button>
								<ul class="dropdown-menu"
									aria-labelledby="dropdownMenuClickableInside">

									<li><a class="dropdown-item disabled" href="#">Select</a></li>
									<li><a class="dropdown-item" href="#">Newest</a></li>
									<li><a class="dropdown-item" href="#">Oldest</a></li>
								</ul>
							</div>

						</div>
					</div>
					<div class="table" id="table">
						<div class="header">
							<p class="sno">S.NO</p>
							<p class="projectId">ID</p>
							<p class="timeline" style="overflow: visible;">Timeline</p>
							<p class="status">Status</p>
						</div>
						<div class="rows-container"></div>
					</div>
					<div id="pagination">
						<div id="paginationBotton"></div>
					</div>
					<div id="NoData"
						style="display: none; flex: 1; justify-content: center; align-items: center; flex-direction: column;">
						<img class="icon" src="assets/icons/Group.svg"> No Data
						Available
					</div>

				</section>
				<c:if test="${role ne 'ADMIN' }">
					<section class="section3 mainShadow">
						<div class="heading">
							<h1>Previously engaged sellers</h1>
							<div class="sorting hidden" style="display: none">
								<p>Sort by:</p>
								<div class="btn-group">
									<button class="btn  dropdown-toggle expand-icon " type="button"
										id="dropdownMenuClickableInside" data-bs-toggle="dropdown"
										data-bs-auto-close="outside" aria-expanded="false">
										Newest</button>
									<ul class="dropdown-menu"
										aria-labelledby="dropdownMenuClickableInside">

										<li><a class="dropdown-item disabled" href="#">Select</a></li>
										<li><a class="dropdown-item" href="#">Newest</a></li>
										<li><a class="dropdown-item" href="#">Oldest</a></li>
									</ul>
								</div>
							</div>

						</div>
						<div class="mainDivSection3" id="mainDivSection3">
							<div class="rows-container"></div>

							<div id="pagination">
								<div id="paginationBotton"></div>
							</div>
							<div id="NoData"
								style="display: none; flex: 1; height: 100%; justify-content: center; align-items: center; flex-direction: column;">
								<img class="icon" style="padding-bottom: 14px"
									src="assets/icons/Group.svg"> No Data Available
							</div>
						</div>
					</section>
				</c:if>



			</section>
		</div>
	</section>


	<!-- <div class="modal fade" id="timeline" tabindex="-1"
		aria-labelledby="timelineLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div>

						<h5 class="modal-title" id="timelineLabel">Timeline</h5>
						<h2 class="" id="projectId"></h2>

					</div>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="progress-container">
							<div class="progress" id="progress"></div>
							<div class="emptyProgress" id="emptyProgress"></div>
							<div class="circle" data-step="1">
								<p>Requirement Posted</p>
								<small>Dec 24, 2023<br> 12:28 PM
								</small>
							</div>
							<div class="circle" data-step="2">
								<p>Requirement Approved</p>
								<small>Jan 03, 2024 <br>03:13 PM
								</small>
							</div>
							<div class="circle" data-step="3">
								<p class="errorP">Discussion Initiated</p>
								<small class="errorSmall">Jan 12, 2024 <br> 06:13
									PM
								</small>
							</div>
							<div class="circle" data-step="4">
								<p style="left: 60px;">Contract Issued</p>
								<small style="left: -8px;">Jan 20, 2024 <br>11:13
									AM
								</small>
							</div>
							<div class="circle" data-step="5">
								<p style="left: 52px">Project Kickoff</p>
								<small style="left: -5px">Jan 28, 2024 <br> 01:13
									PM
								</small>
							</div>
							<div class="circle" data-step="6">
								<p style="left: 60px">Milestone Execution</p>
								<small style="left: -15px;">Jan 20, 2024 <br>06:13
									PM
								</small>
							</div>
							<div class="circle" data-step="7">
								<p class="errorP">Project Completion</p>
								<small style="left: -22px;">Jan 20, 2024 <br>06:13
									PM
								</small>
							</div>
							<div class="circle" data-step="8">
								<p style="left: 57px">Review & Feedback</p>
								<small style="left: -16px;">Jan 20, 2024 <br>06:13
									PM
								</small>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div> -->

	<!-- Timeline Popup(Responsive) starts here -->
	<div
		class="modal fade modal-xl custom-edit-modal buyers-projects-timeline show"
		id="timeline" tabindex="-1" aria-labelledby="timelineLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close">
				<div class="modal-body">
					<div class="timeline-container" id="timelineContent">
						<div class="">
							<h5 class="title" id="timelineLabel">Timeline</h5>
							<p class="project-id-text" id="projectId"></p>
						</div>
						<div class="timeline">
							<div class="timeline-item " data-key="Requirement Posted">
								<div class="icon"></div>
								<div class="text">
									Posted
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item " data-key="Requirement Approved">
								<div class="icon"></div>
								<div class="text">
									Approved
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item " data-key="Sellers Intimated">
								<div class="icon"></div>
								<div class="text">
									Sellers <br> Intimated

								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item " data-key="Discussion Phase">
								<div class="icon"></div>
								<div class="text">
									Discussion
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item"
								data-key="Contract/ Purchase Order Issued">
								<div class="icon"></div>
								<div class="text">
									Contract/PO
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Project Kick-off">
								<div class="icon"></div>
								<div class="text">
									Kick-off
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Project Execution">
								<div class="icon"></div>
								<div class="text">
									In Execution
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Project Completion">
								<div class="icon"></div>
								<div class="text">
									Delivered
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Review & Feedback">
								<div class="icon"></div>
								<div class="text">
									Feedback
								</div>
								<div class="date"></div>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Timeline Popup(Responsive) starts here -->
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
									style="width: 72px; height: 72px;" id="comapnyLogoUrl">

									<img class="mr-16"
										style="width: 100%; height: 100%; border-radius: 100%;"
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
	<!-- Profile Under Review popup starts -->
	<div class="modal fade modal-style-1 modal-lg"
		id="profile-under-review" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<img class="close-icon" src="assets/icons/close-modal.svg"
					alt="close" data-bs-dismiss="modal" aria-label="Close"> <img
					class="modal-img" src="assets/icons/Awaiting-Icon.svg"
					alt="Awaiting-icon">
				<h2 class="modal-heading text-center">Welcome to Cnerzy! Your
					Profile is Under Review</h2>
				<p class="modal-para text-center">Get ready to join the Cnerzy
					community! Our admin team is reviewing your profile, and once
					you're approved, you'll become part of a vibrant community driving
					manufacturing success!</p>
			</div>
		</div>
	</div>
	<!-- Profile Under Review popup ends -->

</body>
<script>
	console.log("${pageContext.request.contextPath}", "${role}")
	var role = "${role}"
	var isApproved = "${isApproved}"
	var data;
	$(function() {
		if (isApproved === "false") {
			$("#profile-under-review").modal("show");

		}
		data = JSON.parse('${data}')
		makingRows(data);

	})
</script>

<script src="assets/js/buyerDashboard.js"></script>
<script src="assets/js/index.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

</html>