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

<link rel="stylesheet" href="assets/css/dashboard.css">
</head>
<style>
.summary a {
	text-decoration: none;
}
</style>

<body>
	<c:import url="navbar.jsp"></c:import>
	<section class="wrapper">
		<div class="bodySection">


			<c:import url="sidebar.jsp"></c:import>
			<section class="content">

				<!-- <section class="WelcomHeader">
						<h1 class="welcome">${welcome}-Dashboard</h1>
						<p class="PostaRequirement">
							<i></i> <a href="postRequirement">Post a Requirement</a>
						</p>
					</section> -->

				<section class="hightlights mainShadow">
					<div class="d-flex align-items-center justify-content-between">
						<h5 class="hightlight-heading mb-0">Registrations</h5>
						<div class="sorting ">
							<p>Sort by:</p>
							<div class="btn-group" style="background-color: var(--gray);">
								<button class="btn dropdown-toggle expand-icon " type="button"
									id="dropdownMenuClickableInside" data-bs-toggle="dropdown"
									data-bs-auto-close="inside" aria-expanded="true">Buyer</button>
								<ul class="dropdown-menu"
									aria-labelledby="dropdownMenuClickableInside">

									<li><a class="dropdown-item disabled">Select</a></li>
									<li><a class="dropdown-item">Buyer</a></li>
									<li><a class="dropdown-item">Seller</a></li>
									<li><a class="dropdown-item">PM</a></li>
								</ul>
							</div>

						</div>
					</div>
					<div class="summary" id="summary">
						<div>
							<img class="icon" src="assets/icons/All Registration.svg">
							<div>
								<a href="buyerRegistration">
									<p>All Buyer's</p>
									<h2>20</h2>
								</a>
							</div>
						</div>
						<small class="vl"></small>
						<div>
							<img class="icon" src="assets/icons/Registration In Review.svg">
							<div onclick="fillterRequirement('inReviewHeader')">
								<p>In Review</p>
								<h2>4</h2>
							</div>
						</div>
						<small class="vl"></small>
						<div>
							<img class="icon" src="assets/icons/Approved.svg">
							<div onclick="fillterRequirement('approvedHeader')">
								<p>Approved</p>
								<h2>12</h2>
							</div>
						</div>
						<small class="vl"></small>
						<div onclick="fillterRequirement('rejectedHeader')">
							<img class="icon" src="assets/icons/Registration Rejected.svg">
							<div>
								<p>Rejected</p>
								<h2>4</h2>
							</div>
						</div>
						<small class="vl"></small>
						<div>
							<img class="icon" src="assets/icons/On Hold.svg">
							<div onclick="fillterRequirement('onHoldHeader')">
								<p>On Hold</p>
								<h2>4</h2>
							</div>
						</div>
					</div>
				</section>

				<section class="hightlights mainShadow">
					<h5 class="hightlight-heading">RFQ</h5>
					<div class="summary">
						<div>
							<img class="icon" src="assets/icons/Total Requirement.svg">
							<div>
								<a href="RFQs">
									<p>Total</p>
									<h2 id="total-requirements">20</h2>
								</a>
							</div>
						</div>
						<small class="vl"></small>
						<div>
							<img class="icon" src="assets/icons/In Review.svg">
							<div onclick="fillterRequirement('/RFQs','postedHeader')">
								<p>In Review</p>
								<h2 id="in-review">4</h2>
							</div>
						</div>
						<small class="vl"></small>
						<div>
							<img class="icon" src="assets/icons/Posted.svg">
							<div
								onclick="fillterRequirement('/RFQs','sellerIntimationHeader')">
								<p>Approved</p>
								<h2 id="Approved">12</h2>
							</div>
						</div>
						<small class="vl"></small>
						<div>
							<img class="icon" src="assets/icons/Rejected.svg">
							<div onclick="fillterRequirement('/RFQs','rejectedHeader')">

								<p>Rejected</p>
								<h2 id="rejected">4</h2>
							</div>
						</div>
					</div>
				</section>

				<section class="hightlights mainShadow">
					<h5 class="hightlight-heading">Projects</h5>
					<div class="summary">
						<div class="icon-container">
							<img class="icon" src="assets/icons/All project.svg">
							<div>
							<a href="project">
								<p>All</p>
								<h2 id="allProjects">12</h2>
								</a>
							</div>
						</div>
						<small class="vl"></small>
						<div class="icon-container">
							<img class="icon" src="assets/icons/In Execution.svg">
							<div onclick="fillterRequirement('/project','inReviewHeader')">
								<p>Active</p>
								<h2 id="activeProjects">8</h2>
							</div>
						</div>
						<small class="vl"></small>
						<div class="icon-container">
							<img class="icon" src="assets/icons/Completed.svg">
							<div onclick="fillterRequirement('/project','completedHeader')">
								<p>Completed</p>
								<h2 id="completedProjects">4</h2>
							</div>
						</div>
					</div>
				</section>

				<section class="projects mainShadow">
					<div class="heading">
						<h1 class="hightlight-heading">Projects</h1>
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
							<p class="timeline">Timeline</p>
							<p class="status">Status</p>
						</div>
						<div class="rows-container"></div>
					</div>
					<div id="pagination">
						<div id="paginationBotton"></div>
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
	<div class="modal fade  modal-xl custom-edit-modal buyers-projects-timeline show" id="timeline" tabindex="-1"
		aria-labelledby="timelineLabel" aria-hidden="true">
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
							<div class="timeline-item " data-key="Discussion Phase">
								<div class="icon"></div>
								<div class="text">
									Discussion
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Contract/ Purchase Order Issued">
								<div class="icon"></div>
								<div class="text">
									Contract/PO
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Project Kickoff">
								<div class="icon"></div>
								<div class="text">
									Kick-off
								</div>
								<div class="date"></div>
							</div>
							<div class="timeline-item" data-key="Project Execution">
								<div class="icon"></div>
								<div class="text">
									Milestone<br> Execution
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

</body>
<script>
		console.log("${pageContext.request.contextPath}", "${role}")
		var role = "${role}"
		var registrationData = JSON.parse('${registerationData}');
		var data = JSON.parse('${data}');

		$(function () {
			console.log(registrationData,data)
			callData(registrationData,data)
			
			// Assuming that you already have the initial table structure with class "table" in your HTML
			makingRows(data);

			console.log()
			
			// Start the progress update with a maximum step of 6 and an interval of 500ms (0.5 seconds)

		})

		/* for Requirement 
		var navLink = document.querySelector(".Post");
		var sub =  document.querySelector(".submenu.collapse");
		$(function () {
			sub.classList.add("show");
			navLink.classList.add("active");
		}) */

		
		




	</script>
<script src="assets/js/index.js"></script>
<script src="assets/js/adminDashboard.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

</html>