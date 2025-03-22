<%@ include file="./taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget Password | Step-2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>

    <div class="container-fluid login-banner" style="background-image: url('${pageContext.request.contextPath}/assets/banner/login_banner.png');">
        <div class="login-container">
            <div class="row common-spacing">
                <div class="col-lg-4 col-md-12">
                    <div class="content">
                        <img class="logo" src="${pageContext.request.contextPath}/assets/images/Logo.png" alt="">
                        <h2 class="start-journey-heading">Start your journey with us</h2>
                        <p class="start-journey-text">Find top-rated world's best manufacturing partners here.</p>
                    </div>
                    <img class="illustration-img w-100" src="${pageContext.request.contextPath}/assets/images/login_register/illustration.png" alt="">
                </div>
                <div class="col-lg-8 col-md-12 d-flex flex-column justify-content-center">
                    <h3 class="mb-16">We have sent you an email with a link to reset your password.</h3>
                    <p class="mb-0">Check your spam and promotions folder if it doesn't appear in your main mailbox.</p>
                    <div class="d-flex justify-content-end">
                        <button id="resend" class="btn-style-1 mt-64" type="button">Resend</button>
                    </div>
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
    		var type = "${userRole}";
    		console.log(type)
    		
                var resendButton = document.getElementById("resend");
                resendButton.addEventListener("click", function() {
                	fetch("${pageContext.request.contextPath}/forgot/savelink?emailId="+emailId+"&type="+type);
                    resendButton.disabled = true;
                    resendButton.style.cursor = "not-allowed";
                    resendButton.style.backgroundColor = "#D3D3D3";
                    setTimeout(function() {
                        resendButton.disabled = false;
                        resendButton.style.backgroundColor = "#1a1c43";
                        resendButton.style.cursor = "pointer";
                    }, 30000);
                });		
    	
    </script>
</body>

</html>