<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget Password | Step-1</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>

    <div class="container-fluid login-banner" style="background-image: url('assets/banner/login_banner.png');">
        <div class="login-container">
            <div class="row common-spacing">
                <div class="col-lg-4 col-md-12">
                    <div class="content">
                        <img class="logo" src="assets/images/Logo.png" alt="">
                        <h2 class="start-journey-heading">Start your journey with us</h2>
                        <p class="start-journey-text">Find top-rated world's best manufacturing partners here.</p>
                    </div>
                    <img class="illustration-img w-100" src="assets/images/login_register/illustration.png" alt="">
                </div>
                <div class="col-lg-8 col-md-12">
                    <h3 class="mb-16">Recover your password</h3>
                    <p class="mb-0">Enter the email that you used when you signed up to recover your password. You will receive a password reset link.</p>
                    <form action="${pageContext.request.contextPath}/forgot/savelink"
						method="post">
	                    <div class="email-input-section">
	                        <div class="row">
	                            <div class="col-12">
	                            <div class="container">
									<div class="row user-type-row row-gap-16 col-gap-16">
										<div
											class="col-md-2 col-sm-2 col-2 user-type-card user-type-card-register d-flex flex-row align-items-center justify-content-start">
											<input type="radio" name="userRole" checked value="Buyer">
											<label for="userRole">Buyer</label>
										</div>
										<div
											class="col-md-2 col-sm-2 col-2 user-type-card user-type-card-register d-flex flex-row align-items-center justify-content-start">
											<input type="radio" name="userRole" value="Seller"> <label
												for="userRole">Seller</label>
										</div>
										<div
											class="col-md-2 col-sm-2 col-2 user-type-card user-type-card-register d-flex flex-row align-items-center justify-content-start">
											<input type="radio" name="userRole" value="PM"> <label
												for="userRole">PM</label>
										</div>
									</div>
								</div>
	                                <div class="field-group">
	                                    <input id="emailId" type="email" name="emailId" class="input-field" placeholder="Email" onchange="onChange()"
	                                        required autocomplete="off">
	                                    <label for="emailId" class="input-label">Email</label>
	                                </div>
	                            </div>
	                            <div class="error err-text" id="errorDiv">
	                            </div>
	                            <div class="col-12 send-link-btn-col d-flex justify-content-end">
	                                <!-- <button class="btn-style-1" type="button">Send Link</button> -->
	                                <button type="submit" class="btn-style-1">Send Link</button>
	                            </div>
	                        </div>
	                    </div>
                    </form>
                </div>
            </div>
            <div class="footer-row">
                <div class="col-12">
                    <p class="text-center m-0">&copy; 2024 CNERZY. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </div>

    
    <script src="${pageContext.request.contextPath}/assets/js/index.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script>
	var emailId = "${emailId}";
    	$(
    		function(){
        		
    			//var errorMsg = "${msg}";
    			const urlParams = new URLSearchParams(window.location.search);
    			var errorMsg = urlParams.get('msg');
    			if(errorMsg && errorMsg!=null && errorMsg!=""){
    				document.getElementById("errorDiv").innerText = "This email is not registered with us!";
    			}
    		});
    	    var input = document.getElementById("emailId");
    	    input.value = emailId;
    	    input.addEventListener("focus", function(event) {
				document.getElementById("errorDiv").innerText = "";
    	    });
    </script>
</body>

</html>