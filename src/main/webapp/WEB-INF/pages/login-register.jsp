<%@ include file="./taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>CNERZY | Login</title>

<c:import url="common-header-import.jsp"></c:import>


</head>
<style>
#loginForm .container, #registrationForm .container {
	padding: 0 13px !important;
}

p {
	margin: 0 !important
}
</style>
<body>

	<!-- <div class="container mt-5">
        <div class="input-box">
            <label class="label" for="">First Name</label>
            <input type="text" name="fname" id="fname" required>
        </div>
    </div> -->
	<div class="container-fluid login-banner"
		style="background-image: url('assets/banner/login_banner.png');">
		<div class="login-container">
			<div class="row common-spacing">
				<div class="col-lg-4 col-md-12">
					<div class="content">
						<img class="logo" src="assets/images/Logo.svg" alt="">
						<h2 class="start-journey-heading">Start your journey with us</h2>
						<p class="start-journey-text">Find world's best manufacturing
							partners here.</p>
					</div>
					<img class="illustration-img w-100"
						src="assets/images/login_register/illustration.png" alt="">
				</div>
				<div class="col-lg-8 col-md-12">
					<ul class="nav nav-pills tab-style-1" id="pills-tab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="pills-home-tab"
								data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
								role="tab" aria-controls="pills-home" aria-selected="true">Login</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="pills-profile-tab"
								data-bs-toggle="pill" data-bs-target="#pills-profile"
								type="button" role="tab" aria-controls="pills-profile"
								aria-selected="false">Sign Up</button>
						</li>
					</ul>
					<div class="tab-content tab-style-1-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<form id="loginForm" action="j_spring_security_check"
								method="POST" autocomplete="off">
								<div class="container">
									<div class="row user-type-row row-gap-16 col-gap-16" id="typeOfUser">
										<div
											class="col-md-2 col-sm-2 col-2 user-type-card user-type-card-login d-flex flex-row align-items-center justify-content-start">
											<input type="radio" name="type" checked value="Buyer">
											<label for="type">Buyer</label>
										</div>
										<div
											class="col-md-2 col-sm-2 col-2 user-type-card user-type-card-login d-flex flex-row align-items-center justify-content-start">
											<input type="radio" name="type" value="Seller"> <label
												for="type">Seller</label>
										</div>
										<div
											class="col-md-2 col-sm-2 col-2 user-type-card user-type-card-login d-flex flex-row align-items-center justify-content-start">
											<input type="radio" name="type" value="PM"> <label
												for="type">PM</label>
										</div>
									</div>
								</div>
								<div class="row user-input-row row-gap-16">
									<div class="col-sm-12">
										<div class="field-group">
											<input type="email" name="userName" class="input-field"
												placeholder="Email" required autocomplete="off"> <label
												for="userName" class="input-label">Email</label>
										</div>
										<!-- <div class="form-input-box">
                                            <input class="form-input" type="email" name="email" id="email" required>
                                            <label for="email">Email</label>
                                        </div> -->
									</div>
									<div class="col-sm-12">
										<div class="field-group">
											<input type="password" name="password" class="input-field"
												placeholder="Password" required autocomplete="off">
											<label for="password" class="input-label">Password</label> <i
												class="toggle-password fa fa-fw fa-eye-slash"></i>
										</div>
										<!-- <div class="form-input-box">
                                            <input class="form-input" type="password" name="password" id="password"
                                                required>
                                            <label for="password">Password</label>
                                        </div> -->
									</div>
								</div>
								<div class="row forgot-password-row">
									<div class="col d-flex align-items-center justify-content-end">
										<a class="link mt-16"
											href="${pageContext.request.contextPath}/forgotPassword">Forgot
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
						<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<form id="registrationForm" action="saveRegistration"
								method="post" autocomplete="off">
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
								<div
									class="row user-input-row justify-content-space-between row-gap-16">
									<div class="col-lg-6 col-md-12">
										<!-- <div class="form-input-box mr-10">
                                            <input class="form-input" type="text" name="fname" id="fname" required>
                                            <label for="fname">First Name</label>
                                        </div> -->
										<div class="field-group">
											<input type="text" name="firstName" id="registerFirstName"
												class="input-field" placeholder="First Name" required
												autocomplete="off"> <label for="firstName"
												class="input-label">First Name<span
												class="required-asterisk">*</span></label>
										</div>
										<p id="firstNameError" class="err-text"></p>
									</div>
									<div class="col-lg-6 col-md-12">
										<!-- <div class="form-input-box ml-10">
                                            <input class="form-input" type="text" name="lname" id="lname" required>
                                            <label for="lname">Last Name</label>
                                        </div> -->
										<div class="field-group">
											<input type="text" name="lastName" id="registerLastName"
												class="input-field" placeholder="Last Name"
												autocomplete="off"> <label for="lastName"
												class="input-label">Last Name</label>
										</div>
										<p id="lastNameError" class="err-text"></p>
									</div>
									<div class="col-lg-6 col-md-12">
										<!-- <div class="form-input-box mr-10">
                                            <input class="form-input" type="email" name="email" id="email" required>
                                            <label for="email">Email</label>
                                        </div> -->
										<div class="field-group">
											<input id="registerEmailId" type="email" name="emailId"
												class="input-field" placeholder="Email" required
												autocomplete="off"> <label for="emailId"
												class="input-label">Email<span
												class="required-asterisk">*</span></label>
										</div>
										<p id="emailError" class="err-text"></p>
									</div>
									<!-- <div class="col-lg-6 col-md-12">
                                        <div class="form-input-box mr-10">
                                            <input class="form-input" type="email" name="email" id="email" required>
                                            <label for="email">Email</label>
                                        </div>
                                    </div> -->
									<div class="col-lg-6 col-md-12">
										<!-- <div class="form-input-box ml-10">
                                            <input class="form-input" type="text" name="country" id="country" required>
                                            <label for="country">Country</label>
                                        </div> -->
										<div
											class="field-group select-field-group select-field-group-toggle">
											<select name="country" class="input-field form-dropdown"
												required>
												<option value="" selected hidden>Country</option>
												<option value="IN">India</option>
												<option value="US">United States</option>
											</select> <label for="country" class="input-label">Select<span
												class="required-asterisk">*</span></label>
										</div>
									</div>
									<div class="col-lg-6 col-md-12">
										<!-- <div class="form-input-box mr-10">
                                            <input class="form-input" type="password" name="password" id="password"
                                                required>
                                            <label for="password">Password</label>
                                        </div> -->
										<div class="field-group">
											<input type="password" id="registerPassword" name="password"
												class="input-field" placeholder="Password" required
												autocomplete="off"> <label for="password"
												class="input-label">Password<span
												class="required-asterisk">*</span></label> <i
												class="toggle-password fa fa-fw fa-eye-slash"></i>
										</div>
										<p id="passwordError" class="err-text"></p>
									</div>
									<div class="col-lg-6 col-md-12">
										<!-- <div class="form-input-box ml-10">
                                            <input class="form-input" type="password" name="cpassword" id="cpassword"
                                                required>
                                            <label for="cpassword">Confirm Password</label>
                                        </div> -->
										<div class="field-group">
											<input type="password" id="registerConfirmPassword"
												name="confirmPassword" class="input-field"
												placeholder="Confirm Password" required autocomplete="off">
											<label for="confirmPassword" class="input-label">Confirm
												Password<span class="required-asterisk">*</span>
											</label> <i class="toggle-password fa fa-fw fa-eye-slash"></i>
										</div>

									</div>

								</div>

								<div class="row get-to-know-about-row">
									<div
										class="col-12 d-flex align-items-center justify-content-start">
										<h6 class="mb-16 mt-32">Where did you get to know about
											us?</h6>
									</div>
									<div class="col-12">
										<!-- <div class="field-group select-field-group">
											<select name="referredFrom" id="reference"
												class="input-field form-dropdown" 
												autocomplete="off">
												<option value="" selected hidden></option>
												<option value="LinkedIn">LinkedIn</option>
												<option value="Others">Others</option>
											</select> <label for="referredFrom" class="input-label">Select</label>
										</div> -->
										<div
											class="field-group select-field-group select-field-group-toggle">
											<select name="referredFrom" id="reference"
												class="input-field form-dropdown" autocomplete="off">

												<option value="" selected>Choose an Option</option>
												<option value="LinkedIn">LinkedIn</option>

												<option value="Others">Others</option>
											</select><label for="referredFrom" class="input-label">Select</label>
											<span id="referredFrom_err" class="err-text"></span>
										</div>
									</div>



								</div>

								<!-- 	<div class="row terms-and-conditions-row">
									<div class="col-12">
										<div class="mt-32 mb-16">
											<input type="checkbox" name="termandconditions"
												id="termandconditions" class="termandconditions" required>
											<label class="termandconditionsLabel" for="termandconditions">I
												agree to the <a href="#">terms & conditions</a>
											</label>
										</div>
									</div>
									<div class="col-12">
										<div class="">
											<input type="checkbox" name="sendmeupdates"
												id="sendmeupdates" class="sendmeupdates"> <label
												class="sendmeupdatesLabel" for="sendmeupdates">Send
												me new updates from <a href="#">Cnerzy</a>
											</label>
										</div>
									</div>
								</div> -->
								<div class="row submit-btn-row">
									<div class="col d-flex align-items-center justify-content-end">
										<button id="register-btn" type="button" class="btn-style-1">
											Submit</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-row">
				<div class="col-12">
					<p class="text-center m-0">&copy; 2024 CNERZY. All Rights
						Reserved</p>
				</div>
			</div>
		</div>
	</div>

	<script>
	// JavaScript
	// const emailRegex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
       const emailRegex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|yahoo\.com|outlook\.com|icloud\.com|hotmail\.com)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;


	function validateEmail(email) {
	    return emailRegex.test(email);
	}
	var msg = "${msg}"
	if(msg!=""){
		toastr.success(msg);
	}

  
	var canSubmitForm= true;
	
        document.addEventListener("DOMContentLoaded", function () {
        	
            let userLoginCards = document.querySelectorAll('.user-type-card-login');
            let userRegisterCards = document.querySelectorAll('.user-type-card-register');

            userLoginCards.forEach(card => {
                card.addEventListener('click', () => {
                    let radio = card.children[0];
                    if (radio) {
                        radio.click();
                    }
                    userLoginCards.forEach(otherCard => {
                        if (otherCard !== card) {
                            otherCard.classList.remove('active');
                        }
                    });
                    card.classList.add('active');

                });
            });

            userRegisterCards.forEach(card => {
                card.classList.remove("active");
                card.addEventListener('click', () => {
                    let radio = card.children[0];
                    if (radio) {
                        radio.click();
                    }
                    userRegisterCards.forEach(otherCard => {
                        if (otherCard !== card) {
                            otherCard.classList.remove('active');
                        }
                    });
                    card.classList.add('active');


                });
            });
        });
     
        //Document On Ready
        $(document).ready(function() {
        	
        	  const firstNameInput = $('#registerFirstName');
              const lastNameInput = $('#registerLastName');

              function allowOnlyAlphabets(event) {
                  var input = event.target;
                  var value = input.value;
                  input.value = value.replace(/[^a-zA-Z]/g, '');
              }

              firstNameInput.on('input', allowOnlyAlphabets);
              lastNameInput.on('input', allowOnlyAlphabets);
        	// Password Strength Checker
        	const passwordInput = document.getElementById("registerPassword");
        	const passwordStrengthSuggestion = document.getElementById("passwordError");
        	passwordInput.addEventListener("blur", () => {
        	    const password = passwordInput.value;

        	    const hasLowerCase = /[a-z]/.test(password);
        	    const hasUpperCase = /[A-Z]/.test(password);
        	    const hasNumber = /[0-9]/.test(password);
        	    const hasSpecialChar = /[^a-zA-Z0-9\s]/.test(password);

        	    // Check for minimum length first
       			  if (password.length < 8) {
				       suggestion = "Must have at least 8 characters.";
				   } else if (!hasLowerCase) {
				       suggestion = "Must contain a lowercase letter.";
				   } else if (!hasUpperCase) {
				       suggestion = "Must contain a uppercase letter.";
				   } else if (!hasNumber) {
				       suggestion = "Must contain a number.";
				   } else if (!hasSpecialChar) {
				       suggestion = "Must contain a special character";
				   } else if(password.includes(" ")){
					   suggestion = "Space is not allowed.";
				   } 
				   else {
				       suggestion = "";
				   }
        	    passwordStrengthSuggestion.textContent = suggestion;
        	});
        	
        	//Session Scope Message of Invalid Login
        	const message = "${sessionScope.message}";
			  if (message) {
		        toastr.error(message);
		      }
			  
			  //Email Verificaiton Msg
			  const emailVerificationSent = "${emailVerificationSent}";
			  if (emailVerificationSent) {
		        toastr.success(emailVerificationSent);
		      }
        	
        	$("#registerEmailId").off().on("blur", async function() {
                let emailId = $(this).val();
                var type = $('input[name="userRole"]:checked').val();
                console.log(type);  
            	if(!validateEmail(emailId)){
            		
            		 $('#emailError').text('Invalid email format');
            		 console.log('Invalid email format');
            	}else{
            		
            	
                try {
                    let emailExists = await checkEmailExists(emailId,type);

                    if (emailExists === "true") {
                        $('#emailError').text('Email already exists.');
                        canSubmitForm = false;
                    } else {
                        $('#emailError').text('');
                        canSubmitForm = true;
                    }
                } catch (error) {
                    console.error("Error checking email existence:", error);
                    $('#emailError').text('An error occurred. Please try again.');
                }
            	}
            });
        	
        	options = {
        			  timeOut: 2000,
        			}
        	
        	if ("${pageName}"==="signup") {
        		$('#pills-profile-tab').tab('show');
            }
        	if("${emailVerificationstatus}"==="true"){
        		toastr.success("${emailVerificationmessage}");
        	}else if ("${emailVerificationstatus}"==="false"){
        		toastr.error("${emailVerificationmessage}");
        	}
        	
        	if ("${error}") {
                // Use Toastr to display the error message
                toastr.error("${error}");
            }
        });
        
     // On Click Register Button
        $('#register-btn').off().on('click', function(e) {
            validateAndSubmitForm(e); 
        });
     
     
        $('#loginFormSubmit').off().on('click', function(e) {
        	handleLogin(e); 
        });
        
     
     function handleLogin(e){
    	  e.preventDefault(); 
    	  const form = $("#loginForm"); 

    	    const userName = $("input[name='userName']").val();
    	    const password = $("input[name='password']").val();
    	    const userType = $("input[name='type']:checked").val(); 

    	    const modifiedUserName = userName + ":" + userType;

    	    let hiddenInput = $("input[name='modifiedUserName']");
    	    if (hiddenInput.length === 0) {
    	        hiddenInput = $('<input>')
    	            .attr('type', 'hidden')
    	            .attr('name', 'modifiedUserName');
    	        form.append(hiddenInput);
    	    }
    	    hiddenInput.val(modifiedUserName);

    	    form.attr('action', 'j_spring_security_check');
    	  	form.submit();
     }
     
     //Confirm Password On Blur Check
     $('#registerConfirmPassword').off().on('blur', function() {
    const password = $('#registerPassword').val();
    const confirmPassword = $('#registerConfirmPassword').val();

    if(password.includes(" ")){
    	$('#passwordError').text('Space is not allowed.');
    }else if (password !== confirmPassword) {
        $('#passwordError').text('Passwords do not match.');
    }else{
    	 if ($('#passwordError').text() === 'Passwords do not match.'){
    	$('#passwordError').text('');
    	 }
    }
});
     
     
     $('#registerFirstName').off().on('blur', function() {
    	  // Validate and handle first name
    	  if($(this).val().length === 0){
 		$('#firstNameError').text('');
 	}
    	  else if ($(this).val().length > 0 && $(this).val().length < 3) {
    	    $('#firstNameError').text('Invalid First Name');
    	  } else {
    	    $('#firstNameError').text('');
    	  }
    	});

    	$('#registerLastName').off().on('blur', function() {
    	  // Validate and handle last name
    	  if($(this).val().length ===0){
    		$('#lastNameError').text('');
    	}
    	  else if ($(this).val().length > 0 && $(this).val().length < 3) {
    	    $('#lastNameError').text('Invalid Last Name');
    	  } else {
    	    $('#lastNameError').text('');
    	  }
    	});
     
     
     $('#registerPassword').off().on('blur', function() {
    	    const password = $('#registerPassword').val();
    	    const confirmPassword = $('#registerConfirmPassword').val();
    	    if(password === ''){
    	    	$('#passwordError').text('');
    	    }
    	    
			if(confirmPassword!==''){
    	    if (password !== confirmPassword) {
    	        $('#passwordError').text('Passwords do not match.');
    	    }else{
    	    	 if ($('#passwordError').text() === 'Passwords do not match.'){
    	    	$('#passwordError').text('');
    	    	 }
    	    }
			}
    	});
        
        //Signup Form Handling
     // Signup Form Handling
async function validateAndSubmitForm(e) {
    e.preventDefault();
    
    
    const form = document.getElementById('registrationForm');
    const emailId = $('#registerEmailId').val();
    const password = $('#registerPassword').val();
    const confirmPassword = $('#registerConfirmPassword').val();
   
    let canSubmitForm = true;

    const firstNameInput = $('#registerFirstName');
    const lastNameInput = $('#registerLastName');

    const isFirstNameInvalid = firstNameInput.val().length < 3;
    const isLastNameInvalid = lastNameInput.val().length < 3;

    if (isFirstNameInvalid) {
    	if(firstNameInput.val().length ===0){
    		$('#firstNameError').text('First Name�is�required');
    		canSubmitForm=false;
    	}
    	else if (firstNameInput.val().length>0 && firstNameInput.val().length < 3) {
    	    $('#firstNameError').text('Invalid First Name');
    		canSubmitForm=false;
    	  } else {
    	    $('#firstNameError').text('');
    	  }
    } 

    if (isLastNameInvalid) {
    	if(lastNameInput.val().length!==0){
    	 $('#lastNameError').text('Invalid Last Name');
    	 canSubmitForm = false;
	  } else {
	    $('#lastNameError').text('');
	  }
    }
  

    // Check if the form is valid
    if (!form.checkValidity()) {
        form.reportValidity();
        return;
    }

    // Validate email
    if (!validateEmail(emailId)) {
        $('#emailError').text('Invalid email format');
        canSubmitForm = false;
    }
    
    if($('#passwordError').text()!==""){
    	 canSubmitForm = false;
    }
    

    // Validate password match
    if (password !== confirmPassword) {
        $('#passwordError').text('Passwords do not match.');
        canSubmitForm = false;
    }
	
    if($('#passwordError').text()!==''){
    	 canSubmitForm = false;
    }
    // Show error message if validation fails
    if (!canSubmitForm) {
   //     toastr.error("Invalid email or password. Please try again.");
        return;
    } 

    // Submit the form if all validations pass
    form.submit();
}

        
     // Duplicate Email Check
        async function checkEmailExists(email,type) {
        	
            try {
                let response = await fetch('checkEmailExist?emailId=' + email+"&userRole="+type);
                let data = await response.json();
                return data.status;
            } catch (error) {
                console.error('Error checking email:', error);
                return false;
            }
        	
        }
    

    /*     document.addEventListener("DOMContentLoaded", function () {
        	let arrowIconUrl = '${pageContext.request.contextPath}/assets/icons/close.png'
//              
      
            //----------------------------------------- js script for converting dropdown into textfield starts here --------------------------------------
            function convertDropdownToText(selectDropdownBox) {
                //get select dropdown
                let selectDropdown = selectDropdownBox.querySelector('select');
                // console.log(selectDropdown)

                // Get the label for the select dropdown
                let selectLabel = selectDropdownBox.querySelector('label');
                let selectErrorSpan = selectDropdownBox.querySelector('.err-text');
                // console.log(selectLabel)


                let inputCreated = false;

                // Listen for changes in the select dropdown
                selectDropdown.addEventListener('change', function () {
                    if (this.value == 'Others') {
                        if (inputCreated == false) {
                            // Create a new div for the input field
                            const inputDiv = document.createElement('div');
                            inputDiv.classList.add('new-field-group', 'input-created-box');
                            inputDiv.style.position = 'relative';

                            // Create a new input element
                            const inputField = document.createElement('input');
                            inputField.type = 'text';
                            inputField.name = selectDropdown.name;
                            inputField.id = selectDropdown.id;
                            inputField.classList.add('new-input-field');
                            inputField.placeholder = 'Please Specify';
                            inputField.required = false;
                            inputField.autocomplete = 'off';

                            // Create a new label for the input field
                            let label = selectLabel;
                            label.style.backgroundColor = 'white';
                            label.style.zIndex = '1';


                            // Create a new icon element
                            const iconSpan = document.createElement('span');
                            iconSpan.innerHTML = "<img class='created-input-icon'src=" + arrowIconUrl + " alt='x'>";
                            // iconSpan.style.position = 'absolute';
                            // iconSpan.style.right = '10px';
                            // iconSpan.style.transform = 'translateY(18px)';
                            iconSpan.classList = 'icon-span'
                            iconSpan.style.cursor = 'pointer !important';
                            iconSpan.addEventListener('click', function (event) {
                                event.preventDefault();
                                selectDropdown.required = false;
                                inputField.required = false;

                                selectDropdown.disabled = false;
                                inputField.disabled = true;
                                selectDropdownBox.style.display = 'block';
                                inputField.value = '';

                                selectDropdown.value = '';
                                inputDiv.style.display = 'none';
                                selectLabel.style.top = '-10px';
                                // selectLabel.style.top = '20px';
                                selectLabel.style.left = '18px';
                                selectLabel.style.transform = 'translate(0px,0px)';

                                // selectLabel.style.color = '#7a7a7a';
                                // selectLabel.style.fontSize = '16px';
                                selectDropdownBox.appendChild(selectLabel);
                                customSelectInitialization()


                            })

                            label = document.createElement('label')
                            label.classList = 'input-label'
                            label.setAttribute('for', selectDropdown.id)
                            if (selectDropdown.options[0].innerHTML == 'Choose an Option' && selectDropdown.name == 'referredFrom') {
                                label.innerHTML = ""
                            } else {
                                label.innerHTML = selectDropdown.options[0].innerHTML 
                            }
                            let errSpan = selectErrorSpan

                            // Append the input field and label to the new div
                            inputDiv.appendChild(inputField);
                            inputDiv.appendChild(label);
                            inputDiv.appendChild(iconSpan);
                            let parentElement = selectDropdownBox.parentElement
                            parentElement.appendChild(inputDiv);
                            parentElement.appendChild(errSpan);
                            // Show the input field div
                            selectDropdown.required = false;
                            inputField.required = false;

                            selectDropdown.disabled = true;
                                inputField.disabled = false;

                            inputDiv.style.display = 'block';
                            selectDropdownBox.style.display = 'none'; // Hide the select field group
                            inputCreated = true;
                            // if (inputDiv.style.display === 'block') {
                            //     inputField.focus();
                            //     console.log('input-focused')
                            // }
                            inputs = document.querySelectorAll('input,select');
                            setTimeout(() => {
                                inputField.focus();
                                setTimeout(() => {
                                    if (document.activeElement !== inputField) {
                                        inputField.focus();
                                    }
                                }, 100);
                            }, 100);

                            inputField.addEventListener('blur', function () {
                                // for (let input of inputs) {
                                //     if (input.name == 'reference') {
                                //         validateForm(input);
                                //     }
                                // }
                            })

                        }
                        else {
                            let inputDiv = selectDropdownBox.parentElement.querySelector('.input-created-box')
                            let inputField = inputDiv.querySelector('.new-input-field');
                            // inputDiv.appendChild(selectLabel);
                            inputDiv.style.display = 'block';
                            selectDropdown.required = false;
                            inputField.required = false;
                            selectDropdown.disabled = true;
                                inputField.disabled = false;
                            selectDropdownBox.style.display = 'none'; // Hide the select field group
                            if (inputDiv.style.display === 'block') {
                                inputField.focus();
                            }
                        }
                    }

                });
            }

            // Get all select dropdowns
            const selectDropdownsBoxes = document.querySelectorAll('.select-field-group-toggle');

            // Convert each select dropdown to text input when "Other" is selected
            selectDropdownsBoxes.forEach(function (selectDropdownBox) {
                convertDropdownToText(selectDropdownBox);
            });

            //----------------------------------------- js script for converting dropdown into textfield ends here --------------------------------------

        });
     */

         document.addEventListener("DOMContentLoaded", function () {
        	
        	let arrowIconUrl = '${pageContext.request.contextPath}/assets/icons/close.png'
//              
      
            //----------------------------------------- js script for converting dropdown into textfield starts here --------------------------------------
            function convertDropdownToText(selectDropdownBox) {
                //get select dropdown
                let selectDropdown = selectDropdownBox.querySelector('select');
                // console.log(selectDropdown)

                // Get the label for the select dropdown
                let selectLabel = selectDropdownBox.querySelector('label');
                let selectErrorSpan = selectDropdownBox.querySelector('.err-text');
                // console.log(selectLabel)


                let inputCreated = false;

                // Listen for changes in the select dropdown
                selectDropdown.addEventListener('change', function () {
                    if (this.value == 'Others') {
                        if (inputCreated == false) {
                            // Create a new div for the input field
                            const inputDiv = document.createElement('div');
                            inputDiv.classList.add('new-field-group', 'input-created-box');
                            inputDiv.style.position = 'relative';

                            // Create a new input element
                            const inputField = document.createElement('input');
                            inputField.type = 'text';
                            inputField.name = selectDropdown.name;
                            inputField.id = selectDropdown.id;
                            inputField.classList.add('new-input-field');
                            inputField.placeholder = 'Please Specify';
                            inputField.required = false;
                            inputField.autocomplete = 'off';

                            // Create a new label for the input field
                            let label = selectLabel;
                            label.style.backgroundColor = 'white';
                            label.style.zIndex = '1';


                            // Create a new icon element
                            const iconSpan = document.createElement('span');
                            iconSpan.innerHTML = "<img class='created-input-icon'src=" + arrowIconUrl + " alt='x'>";
                            // iconSpan.style.position = 'absolute';
                            // iconSpan.style.right = '10px';
                            // iconSpan.style.transform = 'translateY(18px)';
                            iconSpan.classList = 'icon-span'
                            iconSpan.style.cursor = 'pointer !important';
                            iconSpan.addEventListener('click', function (event) {
                                event.preventDefault();
                                selectDropdown.required = false;
                                inputField.required = false;

                                selectDropdown.disabled = false;
                                inputField.disabled = true;
                                selectDropdownBox.style.display = 'block';
                                inputField.value = '';

                                selectDropdown.value = '';
                                inputDiv.style.display = 'none';
                                selectLabel.style.top = '-10px';
                                // selectLabel.style.top = '20px';
                                selectLabel.style.left = '18px';
                                selectLabel.style.transform = 'translate(0px,0px)';

                                // selectLabel.style.color = '#7a7a7a';
                                // selectLabel.style.fontSize = '16px';
                                selectDropdownBox.appendChild(selectLabel);
                                customSelectInitialization()


                            })

                            label = document.createElement('label')
                            label.classList = 'input-label'
                            label.setAttribute('for', selectDropdown.id)
                            if (selectDropdown.options[0].innerHTML == 'Choose an Option' && selectDropdown.name == 'referredFrom') {
                                label.innerHTML = ""
                            } else {
                                label.innerHTML = selectDropdown.options[0].innerHTML 
                            }
                            let errSpan = selectErrorSpan

                            // Append the input field and label to the new div
                            inputDiv.appendChild(inputField);
                            inputDiv.appendChild(label);
                            inputDiv.appendChild(iconSpan);
                            let parentElement = selectDropdownBox.parentElement
                            parentElement.appendChild(inputDiv);
                            parentElement.appendChild(errSpan);
                            // Show the input field div
                            selectDropdown.required = false;
                            inputField.required = false;

                            selectDropdown.disabled = true;
                                inputField.disabled = false;

                            inputDiv.style.display = 'block';
                            selectDropdownBox.style.display = 'none'; // Hide the select field group
                            inputCreated = true;
                            // if (inputDiv.style.display === 'block') {
                            //     inputField.focus();
                            //     console.log('input-focused')
                            // }
                            inputs = document.querySelectorAll('input,select');
                            setTimeout(() => {
                                inputField.focus();
                                setTimeout(() => {
                                    if (document.activeElement !== inputField) {
                                        inputField.focus();
                                    }
                                }, 100);
                            }, 100);

                            inputField.addEventListener('blur', function () {
                                // for (let input of inputs) {
                                //     if (input.name == 'reference') {
                                //         validateForm(input);
                                //     }
                                // }
                            })

                        }
                        else {
                            let inputDiv = selectDropdownBox.parentElement.querySelector('.input-created-box')
                            let inputField = inputDiv.querySelector('.new-input-field');
                            // inputDiv.appendChild(selectLabel);
                            inputDiv.style.display = 'block';
                            selectDropdown.required = false;
                            inputField.required = false;
                            selectDropdown.disabled = true;
                                inputField.disabled = false;
                            selectDropdownBox.style.display = 'none'; // Hide the select field group
                            if (inputDiv.style.display === 'block') {
                                inputField.focus();
                            }
                        }
                    }

                });
            }

            // Get all select dropdowns
            const selectDropdownsBoxes = document.querySelectorAll('.select-field-group-toggle');

            // Convert each select dropdown to text input when "Other" is selected
            selectDropdownsBoxes.forEach(function (selectDropdownBox) {
                convertDropdownToText(selectDropdownBox);
            });

            //----------------------------------------- js script for converting dropdown into textfield ends here --------------------------------------

        });
     

  
     
    </script>
	<c:remove var="message" scope="session" />
	<script src="assets/js/index.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>