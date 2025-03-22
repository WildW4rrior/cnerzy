
<%@ include file="./taglibs.jsp"%>
<!------------- navbar starts here1 -------------->
<nav class="navbar navbar-expand-lg bg-default custom-navbar sticky-top"
	id="main-header">
	<div class="container-fluid">
		<a class="navbar-brand text-light" href="#"> <img id="header-logo"
			src="${pageContext.request.contextPath}/assets/images/Logo-light.svg"
			alt="">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon text-light"> <img
				src="${pageContext.request.contextPath}/assets/icons/Hamburger.svg"
				alt="">
			</span>
		</button>
		<div class="collapse navbar-collapse justify-content-md-end"
			id="navbarSupportedContent">
			<div
				class="d-flex flex-lg-row flex-md-column flex-sm-column flex-column justify-content-lg-end justify-content-md-start justify-content-sm-start justify-content-start">
				<c:if test="${role eq 'ADMIN'}">
					<div class="search-box" id="searchBox">
						<img class="search-icon"
							src="${pageContext.request.contextPath}/assets/icons/search.svg"
							alt=""> <input class="search-input" type="search"
							id="tableSearch" placeholder="Search" aria-label="Search">

					</div>
					<!-- <button class="btn btn-outline-success" type="submit">Search</button> -->
				</c:if>
				<ul
					class="navbar-nav custom-nav-icon-box mb-lg-0 d-none d-sm-none d-md-none d-lg-flex"
					style="padding: 0">
					<li class="nav-item icon-btn dropdown" id="fetch-notifications">
						<a href="#" class="nav-link active text-light"
						id="openNotification" role="button" data-bs-toggle="dropdown"
						aria-expanded="false" data-bs-auto-close="outside"> <img
							id="bellIcon"
							src="${pageContext.request.contextPath}/assets/icons/bell.svg"
							alt="">
					</a>

						<ul class="dropdown-menu dropdown-menu-2" id="notification-list"
							style="padding: 0; min-width: 400px;">

						</ul>

					</li>

					<li class="nav-item icon-btn dropdown"><a href="#"
						class="nav-link text-light" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <img
							src="${pageContext.request.contextPath}/assets/icons/Profile-1.svg"
							alt="">
					</a>
						<ul class="dropdown-menu dropdown-menu-1">
							<li class="dropdown-list-item" id="profile"><a
								class="dropdown-item" href="profile">
									<div class="icon-box">
										<img
											src="${pageContext.request.contextPath}/assets/icons/Profile-1.svg"
											alt="Profile Icon">
									</div> <span class="dropdown-text">My Profile</span>
							</a></li>
							<li class="dropdown-list-item"><a class="dropdown-item"
								href="logout">
									<div class="icon-box">
										<img
											src="${pageContext.request.contextPath}/assets/icons/Logout_Icon.svg"
											alt="Logout Icon">
									</div> <span class="dropdown-text">Sign Out</span>
							</a></li>
						</ul></li>
				</ul>
				<ul
					class="navbar-nav mb-lg-0 d-block d-sm-block d-md-block d-lg-none">
					<li class="nav-item" id="fetch-notifications"><a
						class="nav-link active text-light" id="openMobileNotification"
						aria-current="page" href="#"> Notifications </a></li>
					<ul class="dropdown-menu dropdown-menu-2" id="notification-list"
						style="padding: 0; min-width: 400px;">

					</ul>
					<li class="nav-item"><a class="nav-link text-light" href="#">
							Profile </a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<script src="assets/js/notification.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
	var role = "${role}";
	if(role === "ADMIN"){
	
	function checkUrlForKeywords() {
	    // Get the current URL
	    const currentUrl = window.location.href;

	    // Define keywords to check for
	    const keywords = ['contracts', 'rfqs', 'project'];

	    // Check if any of the keywords are in the URL
	    return keywords.some(keyword => currentUrl.toLowerCase().includes(keyword));
	}

	// Example usage
		const searchBox = document.getElementById('searchBox');

	if (checkUrlForKeywords()) {
	
		
		searchBox.style.display = 'block'; // Show the search box
	

		console.log("The URL contains 'contracts', 'rfqs', or 'projects'.");
	} else {
		if(searchBox){
			searchBox.style.display = 'none'; // Hide the search box
	}
		console.log("The URL does not contain the specified keywords.");
	}
	}
	//for header bg color
	var navbar = document.getElementById("main-header");
	var logoEl = document.getElementById("header-logo")

	// Remove all role-based background classes first to avoid conflicts
	navbar.classList.remove('bg-default', 'bg-seller', 'bg-pm', 'bg-admin');
	console.log('role-->', role)
	if (role === "BUYER") {
		navbar.classList.add("bg-default");
	} else if (role === "SELLER") {
		navbar.classList.add("bg-seller");
		if (logoEl) {
			logoEl.src = contextPath + '/assets/images/logo-seller.svg';
		}
	} else if (role === "PM") {
		navbar.classList.add("bg-pm");
	} else {
		navbar.classList.add("bg-admin");
		var profileElement = document
		.querySelector(".dropdown-menu.dropdown-menu-1 #profile");
		if (profileElement) {
			profileElement.style.display = "none";
}
	}
</script>
<!------------- navbar ends here -------------->