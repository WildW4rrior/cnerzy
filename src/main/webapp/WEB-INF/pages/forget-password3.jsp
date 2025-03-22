<%@ include file="./taglibs.jsp" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forget Password | Step-3</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>

    <body>

        <div class="container-fluid login-banner"
            style="background-image: url('${pageContext.request.contextPath}/assets/banner/login_banner.png');">
            <div class="login-container">
                <div class="row common-spacing">
                    <div class="col-lg-4 col-md-12">
                        <div class="content">
                            <img class="logo" src="${pageContext.request.contextPath}/assets/images/Logo.png" alt="">
                            <h2 class="start-journey-heading">Start your journey with us</h2>
                            <p class="start-journey-text">Find top-rated world's best manufacturing partners here.</p>
                        </div>
                        <img class="illustration-img w-100"
                            src="${pageContext.request.contextPath}/assets/images/login_register/illustration.png"
                            alt="">
                    </div>
                    <div class="col-lg-8 col-md-12">
                        <h3 class="mb-16">Update password</h3>
                        <form action="${pageContext.request.contextPath}/user/reset/${userId}" method="post"
                            id="reset-password-form">
                            <div class="email-input-section">
                                <div class="row row-gap-16">
                                    <div class="col-12">
                                        <div class="field-group">
                                            <input type="password" name="password" id="password" class="input-field"
                                                placeholder="New Password" required autocomplete="off">
                                            <label for="password" class="input-label">New Password</label>
                                            <i class="toggle-password fa fa-fw fa-eye-slash"></i>
                                        </div>
                                        <span id="password_err" class="err-text"></span>
                                    </div>
                                    <div class="col-12">
                                        <div class="field-group">
                                            <input type="password" name="confirmnewpassword" id="confirmnewpassword"
                                                class="input-field" placeholder="Confirm Password" required
                                                autocomplete="off">
                                            <label for="confirmnewpassword" class="input-label">Confirm Password</label>
                                            <i class="toggle-password fa fa-fw fa-eye-slash"></i>
                                        </div>
                                        <span id="confirmnewpassword_err" class="err-text"></span>
                                    </div>
                                    <div class="col-12 set-new-password-col d-flex justify-content-end">
                                        <button class="btn-style-1" type="submit" onclick="handleSubmit()">Set New
                                            Password</button>
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

        <script>
            var resetPasswordForm = document.querySelector('#reset-password-form')
            var inputs = resetPasswordForm.querySelectorAll('input')
            var password = resetPasswordForm.querySelector('input[name="password"]')
            var cpassword = resetPasswordForm.querySelector('input[name="confirmnewpassword"]')

            function showError(id, errorMsg) {
                let errSpan = document.getElementById(id)
                if (errSpan) {
                    errSpan.innerHTML = errorMsg
                }
            }

            function checkRequiredFields() {
                // console.log("checkRequiredFields called")
                let allFilled = true;
                let firstRequiredField = null;
                for (let input of inputs) {
                    if (input.name == 'password' && input.value.trim() == '') {
                        allFilled = false;
                        showError('password_err', 'Password is Required')
                    } else if (input.name == 'confirmnewpassword' && input.value.trim() == '') {
                        allFilled = false;
                        showError('confirmnewpassword_err', 'Confirm Password is Required')
                    }
                    if (allFilled == false && firstRequiredField == null) {
                        firstRequiredField = input;
                    }
                }

                // console.log(firstRequiredField)
                // firstRequiredField.focus()
                if (firstRequiredField != null) {
                    firstRequiredField.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
                return allFilled;
            }

            let errorsArray = [];
            function validateForm(input) {
                let errorMessage = '';
                if (input.name == 'password') {
                    if (input.value != '') {
                        const hasLowerCase = /[a-z]/.test(input.value);
                        const hasUpperCase = /[A-Z]/.test(input.value);
                        const hasNumber = /[0-9]/.test(input.value);
                        const hasSpecialChar = /[^a-zA-Z0-9\s]/.test(input.value);

                        // Check for minimum length first
                        if (input.value.length < 8) {
                            if (!errorsArray.includes(input.name)) {
                                errorsArray.push(input.name);
                            }
                            showError('password_err', "Must have at least 8 characters.")
                        } else if (!hasLowerCase) {
                            if (!errorsArray.includes(input.name)) {
                                errorsArray.push(input.name);
                            }
                            showError('password_err', "Must contain a lowercase letter.")
                        } else if (!hasUpperCase) {
                            if (!errorsArray.includes(input.name)) {
                                errorsArray.push(input.name);
                            }
                            showError('password_err', "Must contain a uppercase letter.")
                        } else if (!hasNumber) {
                            if (!errorsArray.includes(input.name)) {
                                errorsArray.push(input.name);
                            }
                            showError('password_err', "Must contain a number.")
                        } else if (!hasSpecialChar) {
                            if (!errorsArray.includes(input.name)) {
                                errorsArray.push(input.name);
                            }
                            showError('password_err', "Must contain a special character")
                        } else if (input.value.includes(" ")) {
                            if (!errorsArray.includes(input.name)) {
                                errorsArray.push(input.name);
                            }
                            showError('password_err', "Space is not allowed.")
                        }
                        else {
                            showError('password_err', '')
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        }

                        if (cpassword.value.trim() != '') {
                            if (input.value != cpassword.value) {
                                if (!errorsArray.includes('confirmnewpassword')) {
                                    errorsArray.push('confirmnewpassword');
                                }
                                showError('confirmnewpassword_err', 'Password do not match')
                            } else {
                                showError('confirmnewpassword_err', '')
                                errorsArray = errorsArray.filter(function (e) { return e !== 'confirmnewpassword' })
                            }
                        }

                    } else {
                        showError('password_err', '')
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    }
                }
                else if (input.name == 'confirmnewpassword') {
                    if (input.value != '') {
                        if (input.value != password.value) {
                            if (!errorsArray.includes(input.name)) {
                                errorsArray.push(input.name);
                            }
                            errorMessage = 'Password do not match';
                            showError('confirmnewpassword_err', errorMessage)
                        } else {
                            showError('confirmnewpassword_err', '')
                            errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                        }
                    } else {
                        showError('confirmnewpassword_err', '')
                        errorsArray = errorsArray.filter(function (e) { return e !== input.name })
                    }
                }

            }

            for (let input of inputs) {
                input.addEventListener('blur', function () {
                    validateForm(input);
                });
            }
            for (let input of inputs) {
                input.addEventListener('change', function () {
                    validateForm(input);
                });
            }


            function handleSubmit() {
                $("#reset-password-form").submit(function (e) {
                    e.preventDefault();
                })
                if (checkRequiredFields() && errorsArray.length == 0) {
					$("#reset-password-form").off("submit");
					 $("#reset-password-form").submit();                   
					  console.log('reset-password')
                }

            }


        </script>

        <script src="${pageContext.request.contextPath}/assets/js/index.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    </body>

    </html>