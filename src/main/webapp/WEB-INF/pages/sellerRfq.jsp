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
.requirementNo {
	margin: 0;
	cursor: pointer;
}

.dt-scroll-head {
	display: none
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

.modal-dialog.modal-dialog-centered {
	width: 1196px;
	max-width: 1196px;
	height: 514px;
}

.modal-content {
	height: 514px;
	border-radius: 12px;
}

.modal-header {
	padding: 40px 30px 12px 30px;
	border-bottom: 0 !important;
}

.modal-header h5 {
	font-family: Lora;
	font-size: 24px;
	font-weight: 600;
	text-align: left;
}

.modal-header #projectId {
	font-family: Chivo;
	font-size: 16px;
	font-weight: 400;
	text-align: left;
	color: rgba(0, 89, 169, 1);
}

.modal-content {
	height: auto;
}
.interested{
color: rgba(26, 28, 67, 1);

background: rgba(241, 241, 241, 1);
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
						<h1 id="inReviewHeader">In Review (0)</h1>
						<h1 id="shownInterestHeader">Shown Interest (0)</h1>
						<h1 id="wonHeader">Selected (0)</h1>
						<h1 id="lostHeader">Rejected (0)</h1>
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

					</div>
				</div>
				<div class="">

					<table id="RFQsTable" class="" style="width: 100%">

					</table>

				</div>
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
										class="col-12 col-sm-6 col-md-6 col-lg-6  justify-content-end" style="display:flex" id="interestedButtons">
										<button class="outline-btn-style-3 mr-16" id="Interest"
											type="button">Show Interest</button>
										<button class="outline-btn-style-2" id="notInterested"
											type="button">Not Interested</button>
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

	<!------------- page content ends here -------------->
</body>


<script>

		console.log("${role}")
		var role = "${role}"
		var userListJson;
		
		 var contextPath = "${pageContext.request.contextPath}"
		 var myHeaders = new Headers();
		 myHeaders.append("Content-Type", "application/json");
		  
		        const raw = JSON.stringify({status:""});

		        var requestOptions = {
		          method: "POST",
		          headers: myHeaders,
		          body: raw,
		          redirect: "follow"
		        };

		        fetch(contextPath+"/getSellerRequirementList", requestOptions)
			      .then((response) => response.text())
		          .then(result => {
		          
		            userListJson=JSON.parse(result)
		        	buyerTable(userListJson);
		        	separatedData = processDataAndHeader(userListJson);
		        	logQueryParams()
		            
		          })
		          .catch(error => console.error("Error:", error));

		        const progress = document.getElementById("progress");
		        const circles = document.querySelectorAll(".circle");

		        function setProgress(step) {
		        	circles.forEach((circle, index) => {
		        		if (index < step) circle.classList.add("active");
		        		else circle.classList.remove("active");
		        	});
		        	const actives = document.querySelectorAll(".container .active");
		        	progress.style.width = ((actives.length - 1) / (circles.length - 1)) * 100 + "%";
		        }

		        function updateProgress(maxStep, interval) {
		        	if (maxStep != 0) {
		        		for (let step = 1; step <= maxStep; step++) {
		        			setTimeout(() => {
		        				setProgress(step);
		        			}, step * interval);
		        		}
		        	} else {
		        		setProgress(0);
		        	}


		        }

	</script>


<script src="assets/js/sellerRFQs-table.js"></script>



</html>