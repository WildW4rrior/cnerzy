<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CNERZY | Login</title>

<c:import url="common-header-import.jsp"></c:import>


</head>

<body>
	<div class="container-fluid login-banner"
		style="background-image: url('assets/banner/login_banner.png');">
		<div class="login-container">
			<div class="row common-spacing">
				<div class="col-lg-4 col-md-12">
					<div class="content">
						<img class="logo" src="assets/images/Logo.png" alt="">
						<h2 class="start-journey-heading">Start your journey with us</h2>
						<p class="start-journey-text">Find top-rated world's best
							manufacturing partners here.</p>
					</div>
					<img class="illustration-img w-100"
						src="assets/images/login_register/illustration.png" alt="">
				</div>
				<div class="col-lg-8 col-md-12">

					<div class="tab-content tab-style-1-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<form id="loginForm" action="j_spring_security_check"
								method="POST" autocomplete="off">
								<div class="">
									<div class="row user-type-row row-gap-16 col-gap-16">
										<div
											class="col-md-2 col-sm-2 col-2 user-type-card user-type-card-login d-flex flex-row align-items-center justify-content-start">
											<input type="radio" name="type" checked value="Admin">
											<label for="type">Admin</label>
										</div>
									</div>
								</div>
								<div class="row user-input-row row-gap-16">
									<div class="p-0">
										<div class="field-group">
											<input type="email" name="userName" class="input-field"
												placeholder="Email" required autocomplete="off"> <label
												for="userName" class="input-label">Email</label>
										</div>

									</div>
									<div class="p-0">
										<div class="field-group">
											<input type="password" name="password" class="input-field"
												placeholder="Password" required autocomplete="off">
											<label for="password" class="input-label">Password</label>
										</div>

									</div>
								</div>
								<div class="row forgot-password-row">
									<div class="col d-flex align-items-center justify-content-end">
										<a class="link mt-16" href="${pageContext.request.contextPath}/forgotPassword">Forgot
											Password?</a>
									</div>
								</div>
								<div class="row submit-btn-row">
									<div class="col d-flex align-items-center justify-content-end">
										<button type="button" id="loginFormSubmit" class="btn-style-1">
											Submit</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//Document On Ready
		$(document).ready(function() {

			const message = "${sessionScope.message}";
			if (message) {
				$("#myModal").modal("show");
				toastr.error(message);
			}
		});
		$('#loginFormSubmit').off().on('click', function(e) {
			handleLogin(e);
		});

		function handleLogin(e) {
			e.preventDefault();
			const form = $("#loginForm");
			const formData = form.serialize();
			const userName = $("input[name='userName']").val();
			const password = $("input[name='password']").val();
			const userType = $("input[name='type']:checked").val();

			const modifiedUserName = userName + ":" + userType;

			let hiddenInput = $("input[name='modifiedUserName']");
			if (hiddenInput.length === 0) {
				hiddenInput = $('<input>').attr('type', 'hidden').attr('name',
						'modifiedUserName');
				form.append(hiddenInput);
			}
			hiddenInput.val(modifiedUserName);

			form.attr('action', 'j_spring_security_check');
			form.submit();
		}
	</script>
	<script src="assets/js/index.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<c:remove var="message" scope="session" />
</body>

</html>