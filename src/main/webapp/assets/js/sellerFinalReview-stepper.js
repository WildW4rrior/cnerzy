// -----------------------------------------js script for stepper starts here--------------------------------------
let currentStep = 0;
const steps = document.querySelectorAll('.step');
const stepCircles = document.querySelectorAll('.step-info');
const submitBtn = document.getElementById('submit-btn');
let review_page_heading = document.querySelector('#review-page-heading');
// let navigateToBox = document.getElementById('navigate-to-box')
// console.log(steps)

function showError(id, errorMsg) {
    let errSpan = document.getElementById(id);
    if (errSpan) {
        errSpan.innerHTML = errorMsg;
        if (errorMsg !== "") {
            // Remove the error message after 5 seconds
            setTimeout(() => {
                errSpan.innerHTML = "";
            }, 5000);
        }
    } else {
        console.error(`Error span with ID '${id}' not found.`);
    }
}
function showErrorForField(input, errorMsg) {
	let errSpan = input.closest('.field-group').querySelector('.err-text')
	errSpan.innerHTML = errorMsg
}

let AllInputs = document.querySelectorAll('input, select');
console.log("all inputs", AllInputs.length)
const getAllInput = function() {
	AllInputs = document.querySelectorAll('input, select');
	console.log(AllInputs.length, 'called')
	for (let input of AllInputs) {
		input.addEventListener('blur', function() {
			validateStep1()
		});
	}
}

// ---------------------------------------step-1 functions-------------------------------------

// function validateStep1() {
//     let error = false;

//     let errorMessage = '';
//     for (let input of AllInputs) {
//         if (input.name == 'industryClassificaiton' && input.value != '' && input.required) {
//             // const regex = /^[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
//             const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
//             if (!regex.test(input.value.trim())) {
//                 errorMessage = 'Invalid Industry Classification';
//                 showError('industryClassificaiton_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('industryClassificaiton_err', '')
//             }

//         } else if (input.name == 'industryExpertise' && input.value != '' && input.required) {
//             // const regex = /^[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
//             const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
//             if (!regex.test(input.value.trim())) {
//                 errorMessage = 'Invalid Industry Expertise';
//                 showError('industryExpertise_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('industryExpertise_err', '')
//             }

//         }


//     }

//     for (let input of AllInputs) {
//         input.addEventListener('change', function () {
//             if (input.name == 'industryClassificaiton' && input.value == '') {
//                 // errorMessage = '';
//                 showError('industryClassificaiton_err', '')
//             } else if (input.name == 'industryExpertise' && input.value == '') {
//                 showError('industryExpertise_err', '')
//             }
//             else if (input.name == 'companyName' && input.value == '') {
//                 showError('companyName_err', '')
//             }
//         })
//     }

//     if (errorMessage == '') {
//         console.log('field - error', error, errorMessage)
//         error = false;
//     }
//     else {
//         error = true;
//         console.log('field - error', error, errorMessage)
//     }
//     return error;
// }

// function checkStep1RequiredInputs() {
//     let allRequiredFilled = false;
//     let errorMessage = '';
//     for (let input of AllInputs) {
//         if (input.name == 'industryClassificaiton' && input.required && input.value == '') {
//             errorMessage = 'Industry Classification Required';
//             showError('industryClassificaiton_err', errorMessage)
//         } else if (input.name == 'industryExpertise' && input.required && input.value == '') {
//             if (input.value == '') {
//                 errorMessage = 'Industry Expertise Required';
//                 showError('industryExpertise_err', errorMessage)
//             }
//         }
//         else if (input.name == 'companyName' && input.required && input.value == '') {
//             errorMessage = 'Company Name is Required';
//             showError('companyName_err', errorMessage)
//         }
//     }

//     if (errorMessage == '') {
//         console.log('required - error', allRequiredFilled, errorMessage)
//         allRequiredFilled = false;
//     }
//     else {
//         allRequiredFilled = true;
//         console.log('required - error', allRequiredFilled, errorMessage)
//     }
//     return allRequiredFilled;
// }



// // ---------------------------------------step-2 functions-------------------------------------
// function validateStep2() {
//     let error = false;
//     let errorMessage = '';

//     for (let input of AllInputs) {
//         if (input.name == 'buisnessRegNumber' && input.value != '') {
//             // const regex = /^(?=.*[A-Z])[A-Z0-9]{21}$/;
//             const regex = /^(?=.*[A-Z])(?=.*\d)[A-Z0-9]{21}$/;
//             if (!regex.test(input.value.toUpperCase().trim())) {
//                 errorMessage = 'Invalid Registration Number';
//                 showError('buisnessRegNumber_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('buisnessRegNumber_err', '')
//             }

//         }
//         else if (input.name == 'panNo' && input.value != '') {
//             const regex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
//             if (!regex.test(input.value.toUpperCase().trim())) {
//                 errorMessage = 'Invalid PAN Number';
//                 showError('panNo_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('panNo_err', '')
//             }
//         }


//     }


//     for (let input of AllInputs) {
//         input.addEventListener('change', function () {

//             if (input.name == 'buisnessRegNumber' && input.value == '') {
//                 showError('buisnessRegNumber_err', '')
//             }
//             else if (input.name == 'panNo' && input.value == '') {
//                 showError('panNo_err', '')
//             }

//         })


//     }

//     if (errorMessage == '') {
//         console.log('field - error', error, errorMessage)
//         error = false;
//     }
//     else {
//         error = true;
//         console.log('field - error', error, errorMessage)
//     }
//     return error;
// }

// function checkStep2RequiredInputs() {
//     let allRequiredFilled = false;

//     let errorMessage = '';
//     for (let input of AllInputs) {
//         if (input.name == 'dunsNumber' && input.required && input.value == '') {
//             errorMessage = 'D-U-N-S Number Required';
//             showError('dunsNumber_err', errorMessage)
//         }
//         else if (input.name == 'taxIdNumber' && input.required && input.value == '') {
//             errorMessage = 'Tax Id Number (EIN) is Required';
//             showError('taxIdNumber_err', errorMessage)
//         }
//         else if (input.name == 'panNo' && input.required && input.value == '') {
//             errorMessage = 'PAN Number is Required';
//             showError('panNo_err', errorMessage)
//         }
//         else if (input.name == 'gstNo' && input.required && input.value == '') {
//             errorMessage = 'GSTIN Number is Required';
//             showError('gstNo_err', errorMessage)
//         }


//     }
//     if (errorMessage == '') {
//         console.log('required - error', allRequiredFilled, errorMessage)
//         allRequiredFilled = false;
//     }
//     else {
//         allRequiredFilled = true;
//         console.log('required - error', allRequiredFilled, errorMessage)
//     }
//     return allRequiredFilled;
// }




function showStep(stepIndex) {
	steps.forEach((step, index) => {
		if (index === stepIndex) {
			step.classList.remove('d-none');
			stepCircles[index].classList.add('active');
			// setTimeout(() => {
			//     navigateToBox.scrollIntoView({ behavior: 'smooth', block: 'start' });
			// }, 0);
		} else {
			step.classList.add('d-none');
			stepCircles[index].classList.remove('active');
		}
	});

	if (stepIndex == 0) {
		review_page_heading.innerHTML = 'Feedback Parameters for Buyers: (Rate on a Scale of 1-5)'
	} else if (stepIndex == 1) {
		review_page_heading.innerHTML = 'Feedback Parameters for Platform'
	}

	// for (let input of AllInputs) {
	//     input.addEventListener('change', function () {
	//         validateStep1();
	//     });
	// }

}

function validateInputs(divId) {
	const container = document.getElementById(divId);

	if (!container) {
		console.error(`Container with ID '${divId}' not found.`);
		return false;
	}

	let isValid = true;
	const inputs = container.querySelectorAll('input[type="number"], input[type="hidden"]');

	inputs.forEach(input => {
		if (input.value.trim() === "") {
			isValid = false;
			toastr.error("These fields are required.");
		} else {
			showError(`error-Feedback`, ""); // Clear any previous error messages
		}
		input.addEventListener('input', () => clearError(`error-Feedback`));

	});

	return isValid;
}


function prevStep() {
	currentStep--;
	showStep(currentStep);
}

function nextStep(divId) {
	const isFormValid = validateInputs(divId);

	if (isFormValid) {
		// Proceed to the next step

		stepCircles[currentStep].classList.add('completed');
		currentStep++;
		showStep(currentStep);
		console.log("All inputs are valid. Proceeding to the next step.");
	} else {
		// Show an error message or handle the invalid form
		console.error("Form validation failed. Please fill in all required fields.");
	}



}


showStep(currentStep);



//----------------------------------------- js script for stepper ends here --------------------------------------


function handleSubmit(event) {
	console.log('handleSubmit called');
	const isValid = true;
	// const isValid = validateLastStep();

	if (isValid) {
		// Prevent form submission
		event.preventDefault();
		console.log('Form submission prevented due to validation errors.');
		return false;
	} else {
		// Allow form submission
		console.log('Form is valid. Submitting form.');
		return true;
	}
}

// function validateLastStep() {
//     const isFieldError = validateStep2();
//     const isEmptyRequiredField = checkStep2RequiredInputs();

//     if (isFieldError || isEmptyRequiredField) {
//         return true; // indicates errors
//     } else {
//         return false; // indicates no errors
//     }
// }

