<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<style>
		li.sidebar-item.active a.sidebar-link {
			border-radius: 8px;
			background-color: var(--dark-blue);
		}

		li.sidebar-item.active a.sidebar-link span {
			color: var(--white);
		}

		li.sidebar-item.active a.sidebar-link .icon {
			display: none;
		}

		li.sidebar-item.active a.sidebar-link .hover-icon {
			display: block;
		}

		/* Ensure hover-icon is initially hidden */
		a.sidebar-link .hover-icon {
			display: none;
		}

		/* Ensure icon is initially visible */
		a.sidebar-link .icon {
			display: block;
		}
	</style>
	<aside id="sidebar" class="d-none d-sm-none d-md-block d-lg-block fixed vh-100">
		<div class="d-flex toggle-btn-container">
			<button class="toggle-btn" type="button">
				<img class="icon" src="assets/icons/Right.svg" alt="">
			</button>
			<!-- <div class="sidebar-logo">
                    <a href="#">Logo</a>
                </div> -->
		</div>
		<ul class="sidebar-nav">
			<li class="sidebar-item"><a href="dashboard" class="sidebar-link "> <img class="icon"
						src="assets/icons/Dashboard.svg" alt=""> <img class="hover-icon"
						src="assets/icons/Dashboard_Selected.svg" alt="">
					<span>Dashboard</span>
				</a></li>
			<c:choose>
				<c:when test="${role eq 'ADMIN'}">
					<li class="sidebar-item"><a href="#" class="sidebar-link collapsed has-dropdown d-flex"
							data-bs-toggle="collapse" data-bs-target="#requirement" aria-expanded="false"
							aria-controls="requirement"> <img class="icon" src="assets/icons/Registration.svg" alt="">
							<img class="hover-icon" src="assets/icons/Registration_Selected.svg" alt="">
							<span>Registrations</span>
						</a>
						<ul id="requirement" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
							<li class="sidebar-item"><a href="buyerRegistration" class="sidebar-link"> <img class="icon"
										src="assets/icons/Users.svg" alt=""> <img class="hover-icon"
										src="assets/icons/Users_Selected.svg" alt=""> <span>Buyers</span>
								</a></li>
							<li class="sidebar-item"><a href="sellerRegistration" class="sidebar-link"> <img
										class="icon" src="assets/icons/Users.svg" alt=""> <img class="hover-icon"
										src="assets/icons/Users_Selected.svg" alt=""> <span>Sellers</span>
								</a></li>
							<li class="sidebar-item"><a href="pmRegistration" class="sidebar-link"> <img class="icon"
										src="assets/icons/Users.svg" alt=""> <img class="hover-icon"
										src="assets/icons/Users_Selected.svg" alt=""> <span>Project
										Managers</span>
								</a></li>
						</ul>
					</li>
					<li class="sidebar-item"><a href="RFQs" class="sidebar-link ">
							<img class="icon" src="assets/icons/RFQs.svg" alt=""> <img class="hover-icon"
								src="assets/icons/RFQs_Selected.svg" alt="">
							<span>RFQs</span>
						</a></li>
					<li class="sidebar-item"><a href="Contracts" class="sidebar-link "> <img class="icon"
								src="assets/icons/Contracts.svg" alt=""> <img class="hover-icon"
								src="assets/icons/Contracts_Selected.svg" alt=""> <span>Contracts</span>
						</a></li>
				</c:when>
				<c:when test="${role eq 'BUYER'}">



					<li class="sidebar-item"><a href="#" class="sidebar-link collapsed has-dropdown d-flex"
							data-bs-toggle="collapse" data-bs-target="#requirement" aria-expanded="false"
							aria-controls="requirement"> <img class="icon" src="assets/icons/Buyer_Requirement.svg" alt="">
							<img class="hover-icon" src="assets/icons/Buyer_Requirement_Selected.svg" alt="">
							<span>Requirements</span>
						</a>
						<ul id="requirement" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
							<li class="sidebar-item"><a href="postRequirement" class="sidebar-link"> <img class="icon"
										src="assets/icons/Post_Requirement.svg" alt=""> <img class="hover-icon"
										src="assets/icons/Post_Requirement_Selected.svg" alt=""> <span>Post a
										Requirement</span>
								</a></li>
							<li class="sidebar-item"><a href="BuyersRequirementList" class="sidebar-link"> <img
										class="icon" src="assets/icons/Requirement_List.svg" alt=""> <img
										class="hover-icon" src="assets/icons/Requirement_List_Selected.svg" alt="">
									<span>Requirement List</span>
								</a></li>
						</ul>
					</li>
				</c:when>
				<c:when test="${role eq 'SELLER'}">
					<li class="sidebar-item"><a href="RFQs" class="sidebar-link ">
						    <img class="icon" src="assets/icons/RFQs.svg" alt="">
							<img class="hover-icon" src="assets/icons/RFQs_Selected.svg" alt="">
							<span>RFQs</span>
						</a></li>
					<li class="sidebar-item"><a href="sellerRequirement" class="sidebar-link ">
							<img class="icon" src="assets/icons/Seller_Requirements.svg" alt="">
							<img class="hover-icon" src="assets/icons/Seller_Requirements_Selected.svg" alt="">
							<span>Requirements</span>
						</a></li>

				</c:when>
			</c:choose>
			<li class="sidebar-item"><a href="project" class="sidebar-link"> <img class="icon"
						src="assets/icons/Projects.svg" alt=""> <img class="hover-icon"
						src="assets/icons/Projects_Selected.svg" alt="">
					<span>Projects</span>
				</a></li>
		</ul>

		<!-- <div class="sidebar-footer">
                <a href="#" class="sidebar-link">
                    <img src="assets/icons/Projects.svg" alt="">
                    <span>Logout</span>
                </a>
            </div> -->
	</aside>

	<script>
		document.addEventListener('DOMContentLoaded', function () {
			var url = window.location.href;

			// For sidebar menu entirely but not cover treeview
			document.querySelectorAll('ul.sidebar-nav li.sidebar-item a').forEach(
				function (link) {
					if (url.includes(link.href)) {
						let listItem = link.closest('li.sidebar-item');
						listItem.classList.add('active');

						// Open parent dropdowns if they exist
						let parentItem = listItem;
						while (parentItem) {
							let parentDropdown = parentItem
								.querySelector('ul.sidebar-dropdown');
							if (parentDropdown) {
								parentDropdown.classList.add('show'); // Use 'show' to display the dropdown
								let parentLink = parentItem
									.querySelector('a.has-dropdown');
								if (parentLink) {
									parentLink.setAttribute('aria-expanded',
										'true');
									parentLink.classList.remove('collapsed');
									parentItem = parentLink
										.closest('.sidebar-item');
								} else {
									parentItem = null;
								}
							} else {
								parentItem = null;
							}
						}
					}
				});
		});
		const hamBurger = document.querySelector(".toggle-btn");
		const icon = hamBurger.querySelector('.icon')

		hamBurger.addEventListener("click", function () {
			document.querySelector("#sidebar").classList.toggle("expand");
			icon.classList.toggle('rotate')
		});

	</script>