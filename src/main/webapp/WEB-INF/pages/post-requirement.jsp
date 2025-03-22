<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CNERZY | Post Requirement</title>
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

<link
	href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="assets/css/dashboard.css">

</head>
<style>
#createNewDiv, #backButton {
	cursor: pointer;
}

#comapnyLogoUrl img {
	width: 50%;
}
</style>
<body>

	<!------------- NavBar here -------------->
	<c:import url="navbar.jsp"></c:import>
	<!------------- navbar ends here -------------->

	<!------------- page content starts here -------------->

	<div class="wrapper">
		<c:import url="sidebar.jsp"></c:import>
		<div class="main-content">
			<div class="row">
			<p name="reEngagedSellerName"></p>
				<c:import url="createRequirement.jsp"></c:import>
				<div id="EditRepost">
				<c:import url="edit-requirement.jsp"></c:import>
				</div>
				<div class="col-12 col-sm-12 col-md-12 col-lg-9"
					id="PostRequirement">
					<div class="breadcrumb-row d-flex">

						<div class="breadcrumb-text">Post a Requirement</div>
						
					</div>
					<div class="right-content">
						<form action="" id="post-requirement-1-form">
							<div class="row row-gap-16">
								<div class="col-12">
									<div class="radio-style-1">
										<div class="input-container" id="createNewDiv"
											onclick="replaceDiv('CreateRequirement','PostRequirement',)">
											<!-- <input type="radio" name="taskToBeDone" hidden
												value="Create a New Requirement">  -->
                                                <span>Create
												a New Requirement</span>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="radio-style-1" id="edit-existing-req">
										<!-- <input type="radio" name="taskToBeDone" hidden
											value="Edit an Existing Requirement">  -->
                                            <select
											name="dropdown1" id="dropdown1"
											class="form-dropdown existing-req-select">
											<option value="" hidden>Edit an Existing Requirement</option>
											<option value="Requirement1">Requirement1</option>
											<option value="Requirement2">Requirement2</option>
											<option value="Requirement3">Requirement3</option>
											<option value="Requirement4">Requirement4</option>
											<option value="Requirement5">Requirement5</option>
										</select>
									</div>
								</div>
								<div class="col-12">
									<div class="radio-style-1">
										<!-- <input type="radio" name="taskToBeDone" hidden
											value="Repost a Requirement">  -->
                                            <select
											name="dropdown2" id="dropdown2"
											class="form-dropdown existing-req-select">
											<option value="" hidden>Repost a Requirement</option>
											<option value="Requirement1">Requirement1</option>
											<option value="Requirement2">Requirement2</option>
											<option value="Requirement3">Requirement3</option>
											<option value="Requirement4">Requirement4</option>
											<option value="Requirement5">Requirement5</option>
										</select>
									</div>
								</div>
								<div class="col-12 d-flex justify-content-end">
									<button class="btn-style-1 mt-32">Next</button>
								</div>
							</div>
						</form>


						<!-- -------------------------------------------------------------------- -->



						<h6 class="section-heading mt-32 mb-32" id="">Previously
							engaged sellers</h6>
					<div class="mainDivSection3" id="mainDivSection3">

							<div class="rows-container">
								<div class="col-12 col-sm-12 col-md-6 col-lg-6 "></div>
							</div>
							<div id="NoData"
								style="display:none;flex: 1; justify-content: center; align-items: center; flex-direction: column;">
								<img class="icon" src="assets/icons/Group.svg"> No Data
								Available
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!------------- page content starts here -------------->


	<!-- View Description popup starts -->
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
							
								<div class="d-flex align-items-start" style="width: 72px; height: 72px;" id="comapnyLogoUrl">

									<img class="mr-16" style="width: 100%; height: 100%; border-radius: 100%;" src="assets/icons/Profile-1.svg" alt="">
									<h6 class="heading mb-0" id="companyName">
										BrainyDX <br>Technologies LLP
									</h6>
								</div>

							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Industry</h6>
								<p class="content" id="companyIndustry"></p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Services</h6>
								<p class="content" id="companyExpertise"></p>
							</div>
						</div>
						<div class="section row row-gap-16">
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Location</h6>
								<p class="content" id="location"></p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">Projects Completed</h6>
								<p class="content" id="numberOfProjectsCompleted"></p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">RFQ's Participated</h6>
								<p class="content" id="totalRFQParticipated"></p>
							</div>
							<div class="col-12 col-sm-6 col-md-6 col-lg-4">
								<h6 class="heading">LinkedIn profile</h6>
								<p class="content" id="linkedInProfile"></p>
							</div>
						</div>
						<div class="section row">
								<div class="col-12">
									<h6 class="heading">Rating</h6>
									<div class="d-flex rating-info">
										<h6 class="heading text-nowrap"><span id="ratings" style="margin-right:10px;"></span>  out of 5</h6>
										<div class="stars text-nowrap">
										
										</div>
										<p class="content flex-row " style="gap:0"><span id="numberOfRatings" style="margin-right:10px;"></span> Ratings</p>
									</div>
								</div>
							</div>
						<div class="section row">
							<div class="col-12">
								<h6 class="heading">Showcase Case Study</h6>
								<div class="documents d-flex">
										
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
	<!-- View Description popup ends -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/toastr.min.js"></script>

	<script>
	
	 var RequirementList;
	 const myHeaders = new Headers();
	 var contextPath = "${pageContext.request.contextPath}";
	 
	

            //-------------------------------- validations ends here ---------------------
</script>


	<script src="assets/js/index.js"></script>
	<script src="assets/js/postRequirement.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>