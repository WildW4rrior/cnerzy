<%@ include file="./taglibs.jsp" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>CNERZY | Dashboard</title>


		<link rel="stylesheet" href="assets/css/style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />

		<link rel="stylesheet" href="assets/css/dashboard.css">
	</head>
	<style>
		@media only screen and (min-width: 992px) and (max-width: 1199px) {
			.ROW .timeline {
				overflow-x: auto;
			}
		}

		@media only screen and (max-width: 600px) {
			.ROW .timeline {
				overflow-x: auto;
			}
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

					</section>

					<section class="hightlights mainShadow">
						<h5 class="hightlight-heading">Projects</h5>
						<div class="summary">
							<div class="icon-container">
								<img class="icon" src="assets/icons/Total Requirement.svg">
								<div>
									<a href="project">
										<p>All</p>
										<h2 id="all"></h2>
									</a>
								</div>
							</div>
							<small class="vl"></small>
							<div class="icon-container">
								<img class="icon" src="assets/icons/In Review.svg">
								<div onclick="fillterRequirement('activeHeader')">

									<p>Active</p>
									<h2 id="active"></h2>
								</div>
							</div>
							<small class="vl"></small>
							<div class="icon-container">
								<img class="icon" src="assets/icons/Posted.svg">
								<div onclick="fillterRequirement('completedHeader')">
									<p>Completed</p>
									<h2 id="completed"></h2>
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
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuClickableInside">

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

					</section>


				</section>
			</div>
		</section>


		<div class="modal fade modal-xl custom-edit-modal buyers-projects-timeline" id="timeline" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<img class="close-icon" src="assets/icons/close-modal.svg" alt="close" data-bs-dismiss="modal"
						aria-label="Close">
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

		<!-- Profile Under Review popup starts -->
		<div class="modal fade modal-style-1 modal-lg" id="profile-under-review" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<img class="close-icon" src="assets/icons/close-modal.svg" alt="close" data-bs-dismiss="modal"
						aria-label="Close">
					<img class="modal-img" src="assets/icons/Awaiting-Icon.svg" alt="Awaiting-icon">
					<h2 class="modal-heading text-center">Welcome to Cnerzy! Your Profile is Under Review</h2>
					<p class="modal-para text-center">Get ready to join the Cnerzy community! Our admin team is
						reviewing your profile, and once you're approved, you'll become part of a vibrant community
						driving manufacturing success!</p>
				</div>
			</div>
		</div>
		<!-- Profile Under Review popup ends -->
	</body>
	<script>
		console.log("${pageContext.request.contextPath}", "${role}")
		var role = "${role}"
		var isApproved = "${isApproved}"
		$(function () {
			if (isApproved === "false") {
				$("#profile-under-review").modal("show");

			}
			var data = ${ data }
			console.log(data, "data")
			makingRows(data);

			const statusCounts = countStatuses(data);

			updateCounts(statusCounts);

		})
		function countStatuses(data) {
			const statusCounts = {
				ALL: data.length,
				ACTIVE: 0,
				COMPLETED: 0,
				IN_REVIEW: 0
			};

			data.forEach(item => {
				switch (item.status) {
					case 'In Review':
						statusCounts.ACTIVE++;
						break;
					case 'Completed':
						statusCounts.COMPLETED++;
						break;
					default:
						statusCounts.IN_REVIEW++;
						break;
				}
			});

			return statusCounts;
		}

		// Function to update the HTML with the counts
		function updateCounts(statusCounts) {
			document.getElementById('all').textContent = statusCounts.ALL;
			document.getElementById('active').textContent = statusCounts.ACTIVE;
			document.getElementById('completed').textContent = statusCounts.COMPLETED;
		}



		var projectCurrentPage = 1;
		var projectRowsPerPage = 5;


		function makingRows(data) {
			var table = document.getElementById("table");
			var rowsContainer = table.querySelector(".rows-container");
			if (!rowsContainer) {
				rowsContainer = document.createElement("div");
				rowsContainer.className = "rows-container";
				table.appendChild(rowsContainer);
			} else {
				rowsContainer.innerHTML = ""; // Clear existing rows
			}

			var startIndex = (projectCurrentPage - 1) * projectRowsPerPage;
			var endIndex = startIndex + projectRowsPerPage;

			for (var i = startIndex; i < endIndex && i < data.length; i++) {
				makeTableRow(data[i], i, rowsContainer)
			}

			renderPagination(data, ".projects #pagination", ".projects #pagination #paginationBotton", projectRowsPerPage, projectCurrentPage);
		}
		var timelineStatusCache = {};
		function fetchTimelineStatus(data, callback) {

			if (timelineStatusCache[data.reqUniqueCode]) {
				callback(timelineStatusCache[data.reqUniqueCode]);
			} else {
				// Simulate API call
				projectId = data.id;
				const requestOptions = {
					method: 'GET',
					headers: {
						'Content-Type': 'application/json'
					}
				};
				fetch(contextPath + "/getTimelineByProjectId?projectId=" + projectId, requestOptions)
					.then((response) => response.json())
					.then(result => {

						timelineStatusCache[data.reqUniqueCode] = result;
						console.log(timelineStatusCache, "sdfsdfsd")
						callback(result);

					})
					.catch(error => console.error("Error:", error));
			}

		}

		function makeTableRow(args, i, rowsContainer) {
			var div = document.createElement("div");
			div.className = "ROW";

			var sno = document.createElement("p");
			sno.className = "sno";
			sno.innerHTML = i + 1;

			var projectId = document.createElement("p");
			projectId.className = "projectId";
			projectId.innerHTML = args.reqUniqueCode;
			projectId.onclick = function () {
				params = {
					ProjectName: args.reqUniqueCode,

				};
				redirectToWithParams(contextPath + "/project", params)
			};

			var timeline = document.createElement("p");
			timeline.className = "timeline";
			timeline.innerHTML = "View";



			var statusDiv = document.createElement("div");
			statusDiv.className = "statusDiv";
			var status = document.createElement("p");

			status.innerHTML = args.status;

			statusDiv.appendChild(status);
			div.append(sno, projectId, timeline, statusDiv);

			rowsContainer.appendChild(div);
			fetchTimelineStatus(args, function (timelineData) {
				timeline.innerHTML = "View";
				timeline.onclick = function () {
					openTimeLine(args, timelineData);
					console.log(timelineData);
				};
				var recentStatus = determineMostRecentStatus(timelineData);

				updateStatusElement(status, recentStatus);

			});
		}

		function determineMostRecentStatus(timelineData) {
			var mostRecentEvent = null;
			var mostRecentTimestamp = -Infinity;

			for (var event in timelineData) {
				var timestamp = timelineData[event];
				if (timestamp !== null && timestamp > mostRecentTimestamp) {
					mostRecentTimestamp = timestamp;
					mostRecentEvent = event;
				}
			}

			return mostRecentEvent;
		}

		function updateStatusElement(statusElement, statusText) {

			// console.log(statusElement,statusText)
			// statusElement.className = "status";
			// statusElement.innerHTML = statusText;

			switch (statusText) {
				case 'Project Assigned':
					statusElement.className = "status project-assigned";
					statusElement.innerHTML = 'Project Assigned';
					break;
				default:
					statusElement.className = "status";
					statusElement.innerHTML = statusText;
			}

		}


		function renderPagination(data, paginationSelector, paginationButtonSelector, rowsPerPage, currentPage) {
			const totalPages = Math.ceil(data.length / rowsPerPage);
			const pagination = document.querySelector(paginationSelector);
			const paginationButton = document.querySelector(paginationButtonSelector);
			paginationButton.innerHTML = ""; // Clear existing pagination buttons

			// Create pagination container
			const container = document.createElement("div");
			container.className = "pagination";

			// Create left arrow
			const prevBtn = document.createElement("button");
			prevBtn.id = "prevBtn";
			prevBtn.innerHTML = "&lt;";
			prevBtn.disabled = currentPage === 1;
			prevBtn.onclick = function () {
				if (currentPage > 1) {
					currentPage--;
					if (rowsPerPage == 5) {
						projectCurrentPage--
						makingRows(data);
					} else if (rowsPerPage == 3) {
						sellerCurrentPage--
						sellerDivFunction(sellerData);
					}
					renderPagination(data, paginationSelector, paginationButtonSelector, rowsPerPage, currentPage);
				}
			};
			container.appendChild(prevBtn);

			// Create current page button
			const currentBtn = document.createElement("button");
			currentBtn.className = "current";
			currentBtn.textContent = currentPage;
			container.appendChild(currentBtn);

			// Create right arrow
			const nextBtn = document.createElement("button");
			nextBtn.id = "nextBtn";
			nextBtn.innerHTML = "&gt;";
			nextBtn.disabled = currentPage === totalPages;
			nextBtn.onclick = function () {
				if (currentPage < totalPages) {
					currentPage++;
					if (rowsPerPage == 5) {
						projectCurrentPage++
						makingRows(data);
					} else if (rowsPerPage == 3) {
						sellerCurrentPage++
						sellerDivFunction(sellerData);
					}
					renderPagination(data, paginationSelector, paginationButtonSelector, rowsPerPage, currentPage);
				}
			};
			container.appendChild(nextBtn);

			// Create page info
			const pageInfo = document.createElement("span");
			pageInfo.className = "pagination-info";
			pageInfo.textContent = `of ${totalPages}`;
			container.appendChild(pageInfo);

			paginationButton.appendChild(container);

			// Update page info in the pagination div
			const pageInfoDiv = pagination.querySelector("#page-info") || document.createElement("div");
			pageInfoDiv.id = "page-info";
			//		    pageInfoDiv.textContent = `Page ${currentPage} out of ${totalPages}`;
			//		    if (!pagination.contains(pageInfoDiv)) {
			//		        pagination.appendChild(pageInfoDiv);
			//		    }
		} var params;
		function fillterRequirement(args) {
			params = {
				fillter: args,
			};
			redirectToWithParams(contextPath + "/project", params)
		}
		function redirectToWithParams(baseUrl, params) {
			try {
				// Create a new URL object
				const url = new URL(baseUrl, window.location.origin); // Ensure it's a valid URL

				// Append each parameter to the URL
				Object.keys(params).forEach(key => url.searchParams.append(key, params[key]));

				// Redirect to the constructed URL
				window.location.href = url.toString();
			} catch (error) {
				console.error("Invalid URL:", error);
			}
		}







	</script>
	<script src="assets/js/index.js"></script>

	<script src="assets/js/dashboard.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	</html>