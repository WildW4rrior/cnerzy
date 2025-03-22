//Define the DataTable instance variable outside the function
var buyerDataTable;
var SellerTables;
var companyIdForSeller;
$(document).ready(
	function () {
		console.log("${role}", "js")
		console.log("${pageContext.request.contextPath}", "js")
		if (role === "ADMIN") {
			var separatedData = processDataAndHeader(userListJson);



			buyerTable(separatedData["all"]);

			$("#inReviewHeader").click(function () {
				buyerTable(separatedData["inreview"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
			});
			$("#approvedHeader").click(function () {
				buyerTable(separatedData["approved"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
			});
			$("#rejectedHeader").click(function () {
				buyerTable(separatedData["rejected"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
			});
			$("#onHoldHeader").click(function () {
				buyerTable(separatedData["onhold"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
			});
			$("#allHeader").click(function () {
				buyerTable(separatedData["all"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
			});

			$(".dropdown-item").on("click", function () {
				var sortBy = $(this).text();
				switch (sortBy) {
					case "Newest":
						buyerDataTable.order([4, 'desc', 'custom-date-time-pre']).draw();
						$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
						break;
					case "Oldest":
						buyerDataTable.order([4, 'asc', 'custom-date-time-pre']).draw();
						$('#dropdownMenuClickableInside').html("Oldest"); // Update inner HTML of the element with ID 'sortingLabel'
						break;
					default:
					// Handle other sorting options if needed
				}
			});
		}
		$("#CompanyInformationContent").css("display", "flex");
		$(".sellerProfiles h1").click(function () {
			// Remove active class from all h1 elements
			$("h1").removeClass("active");

			// Add active class to the clicked h1 element
			$(this).addClass("active");

			// Get the id of the clicked h1 element
			var id = $(this).attr("id");

			// Hide the tableDiv by default
			$("#tableDiv").css("display", "none");

			// Show the appropriate content based on the clicked h1 element
			switch (id) {
				case "CompanyInformation":


					showCompanyInformation();
					break;
				case "LegalInformation":
					// Show relevant content for Legal Information
					// Assuming you have a function to handle this, for example:
					showLegalInformation();
					break;
				case "FinancialDetails":
					// Show relevant content for Financial Details
					// Assuming you have a function to handle this, for example:
					showFinancialDetails();
					break;
				case "TechnicalCapabilities":
					// Show relevant content for Technical Capabilities
					// Assuming you have a function to handle this, for example:
					showTechnicalCapabilities();
					break;
				case "CertificatesComzpliance":
					// Show relevant content for Certificates & Compliance
					// Assuming you have a function to handle this, for example:
					showCertificatesCompliance();
					break;
				case "References":
					// Show relevant content for References
					// Assuming you have a function to handle this, for example:
					showReferences();
					break;
				case "SupplierReferenceProgram":
					// Show relevant content for Supplier Reference Program
					// Assuming you have a function to handle this, for example:
					showSupplierReferenceProgram();
					break;
				default:
					// If no matching case, do nothing or handle as needed
					break;
			}
		});

	})


//----------------validation for seller Edit profile starts here---------------------
function showError(id, errorMsg) {
	let errSpan = document.getElementById(id)
	if (errSpan) {
		errSpan.innerHTML = errorMsg
	}
}
function validateFileSize(input) {
	let valid = true
	const file = input.files[0]
	if (file) {
		const limit = 10000;
		const size = file.size / 1024
		if (size > limit) {
			// console.log(size, limit, `File size must not be more than 10MB`)
			valid = false
		} else {
			valid = true
			// console.log('good-file-size', valid)
		}
	} else {
		valid = false
		// console.log('no-file-found', valid)
	}
	return valid
}

//------------Validations for Company Information(Step-1) starts--------------
function checkStep1RequiredInputs(inputs, modalId) {
	let allFilled = true;
	let firstRequiredField = null;
	for (let input of inputs) {
		if (modalId == '#edit-personal-detail') {
			if (input.name == 'firstName' && input.value.trim() == '') {
				allFilled = false;
				showError('firstName_err', 'First Name is Required')
			} else if (input.name == 'personalEmail' && input.value.trim() == '') {
				allFilled = false;
				showError('personalEmail_err', 'Email is Required')
			}
		}
		else if (modalId == '#edit-company-details') {
			if (input.name == 'industryClassificaiton' && input.required && input.value.trim() == '') {
				allFilled = false;
				showError('industryClassificaiton_err', 'Industry Classification Required')
			} else if (input.name == 'industryExpertise' && input.required && input.value.trim() == '') {
				allFilled = false;
				showError('industryExpertise_err', 'Industry Expertise Required')
			}
			else if (input.name == 'companyName' && input.value.trim() == '') {
				allFilled = false;
				showError('companyName_err', 'Company Name is Required')
			}
			else if (input.name == 'companyWebsite' && input.value.trim() == '') {
				allFilled = false;
				showError('companyWebsite_err', 'Website Url is Required')
			}
			else if (input.name == 'companyEmail' && input.value.trim() == '') {
				allFilled = false;
				showError('companyEmail_err', 'Company Email is Required')
			}
			else if (input.name == 'companyPhone' && input.value.trim() == '') {
				allFilled = false;
				showError('companyPhone_err', 'Phone Number is Required')
			}
		}
		else if (modalId == '#edit-company-address') {
			if (input.name == 'streetAddress' && input.value == '') {
				allFilled = false;
				showError('streetAddress_err', 'Street Address is Required')
			}
			else if (input.name == 'city' && input.value == '') {
				allFilled = false;
				showError('city_err', 'City Name is Required')
			}
			else if (input.name == 'state' && input.value == '') {
				allFilled = false;
				showError('state_err', 'State Name is Required')
			}
			else if (input.name == 'pincode' && input.value == '') {
				allFilled = false;
				showError('pincode_err', 'Pincode is Required')
			}
		}
		else if (modalId == '#edit-contact-person') {
			if (input.id.includes("contactPersonName_0") && input.required && input.value == '') {
				allFilled = false;
				showError(`contactPersonName_0_err`, 'Name is Required')
			}
			else if (input.id.includes("contactPersonDesignation_0") && input.required && input.value == '') {
				allFilled = false;
				showError(`contactPersonDesignation_0_err`, 'Designation is Required')
			}
			else if (input.id.includes("contactPersonEmail_0") && input.required && input.value == '') {
				allFilled = false;
				showError(`contactPersonEmail_0_err`, 'Company Email is Required')
			}
			else if (input.id.includes("contactPersonPhone_0") && input.required && input.value == '') {
				allFilled = false;
				showError(`contactPersonPhone_0_err`, 'Phone is Required')
			}
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
//----------#edit-personal-detail------------
var personalDetailsModal = document.querySelector('#edit-personal-detail');
var personalDetailsInputs = personalDetailsModal.querySelectorAll('input,select');
var personalDetailsErrorsArray = []
for (let input of personalDetailsInputs) {
	input.addEventListener('change', function () {
		validatePersonalDetail(input)
	})
}
function validatePersonalDetail(input) {
	let errorMessage = '';

	if (input.name == 'firstName') {
		if (input.value != '') {
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!personalDetailsErrorsArray.includes(input.name)) {
					personalDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid First Name';
				showError('firstName_err', errorMessage)
			} else {
				showError('firstName_err', '')
				personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('firstName_err', '')
			personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'lastName') {
		if (input.value != '') {
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!personalDetailsErrorsArray.includes(input.name)) {
					personalDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Last Name';
				showError('lastName_err', errorMessage)
			} else {
				showError('lastName_err', '')
				personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('lastName_err', '')
			personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'personalEmail') {
		if (input.value != '') {
			const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!personalDetailsErrorsArray.includes(input.name)) {
					personalDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Enter Company Email';
				showError('personalEmail_err', errorMessage)
			} else {
				personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
				showError('personalEmail_err', '')
			}
		} else {
			personalDetailsErrorsArray = personalDetailsErrorsArray.filter(function (e) { return e !== input.name })
			showError('personalEmail_err', '')
		}
	}
	console.log('errors-', personalDetailsErrorsArray)
}

//------------#edit-company-details-------------------------------
const getAllInput = function () {
	companyDetailsInputs = companyDetailsModal.querySelectorAll('input,select');
	console.log(companyDetailsInputs.length, 'called')
	for (let input of companyDetailsInputs) {
		input.addEventListener('blur', function () {
			validateCompanyDetail(input)
		});
	}
}

var companyDetailsModal = document.querySelector('#edit-company-details');
var companyDetailsInputs = companyDetailsModal.querySelectorAll('input,select');
var companyDetailsErrorsArray = []
for (let input of companyDetailsInputs) {
	input.addEventListener('change', function () {
		validateCompanyDetail(input)
	})
}

function validateCompanyDetail(input) {
	let errorMessage = '';
	if (input.name == 'companyLogo') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!companyDetailsErrorsArray.includes(input.name)) {
					companyDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('companyLogo_err', errorMessage)
			} else {
				companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
				showError('companyLogo_err', '')
			}
		} else {
			companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
			showError('companyLogo_err', '')
		}
	}
	else if (input.name == 'industryClassificaiton') {
		if (input.value != '') {
			const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyDetailsErrorsArray.includes(input.name)) {
					companyDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Industry Classification';
				showError('industryClassificaiton_err', errorMessage)
			} else {
				showError('industryClassificaiton_err', '')
				companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('industryClassificaiton_err', '')
			companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'industryExpertise') {
		if (input.value != '') {
			const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyDetailsErrorsArray.includes(input.name)) {
					companyDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Industry Expertise';
				showError('industryExpertise_err', errorMessage)
			} else {
				showError('industryExpertise_err', '')
				companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('industryExpertise_err', '')
			companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'companyName') {
		if (input.value != '') {
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyDetailsErrorsArray.includes(input.name)) {
					companyDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Company Name';
				showError('companyName_err', errorMessage)
			} else {
				showError('companyName_err', '')
				companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('companyName_err', '')
			companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'companyWebsite') {
		if (input.value != '') {
			const regex = /^(https?:\/\/)?([a-zA-Z0-9-]+\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\/\S*)?$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyDetailsErrorsArray.includes(input.name)) {
					companyDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Website Url';
				showError('companyWebsite_err', errorMessage)
			} else {
				showError('companyWebsite_err', '')
				companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('companyWebsite_err', '')
			companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'companyEmail') {
		if (input.value != '') {
			const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyDetailsErrorsArray.includes(input.name)) {
					companyDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Enter Company Email';
				showError('companyEmail_err', errorMessage)
			} else {
				showError('companyEmail_err', '')
				companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('companyEmail_err', '')
			companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'companyPhone') {
		if (input.value != '') {
			const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyDetailsErrorsArray.includes(input.name)) {
					companyDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Phone Number';
				showError('companyPhone_err', errorMessage)
			} else {
				showError('companyPhone_err', '')
				companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('companyPhone_err', '')
			companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'companyLinkedInUrl') {
		if (input.value != '') {
			const regex = /^https:\/\/(www\.)?linkedin\.com\/(in|company)\/[a-zA-Z0-9-]+\/?$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyDetailsErrorsArray.includes(input.name)) {
					companyDetailsErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid LinkedIn Url';
				showError('companyLinkedInUrl_err', errorMessage)
			} else {
				showError('companyLinkedInUrl_err', '')
				companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('companyLinkedInUrl_err', '')
			companyDetailsErrorsArray = companyDetailsErrorsArray.filter(function (e) { return e !== input.name })
		}
	}

	console.log('errors-', companyDetailsErrorsArray)
}

//--------------------------#edit-company-address--------------------------
var companyAddressModal = document.querySelector('#edit-company-address');
var companyAddressInputs = companyAddressModal.querySelectorAll('input,select');
var companyAddressErrorsArray = []
for (let input of companyAddressInputs) {
	input.addEventListener('change', function () {
		validateCompanyAddress(input)
	})
}
function validateCompanyAddress(input) {
	let errorMessage = '';

	if (input.name == 'streetAddress') {
		if (input.value != '') {
			const regex = /^[\w\s\d#,\-.]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyAddressErrorsArray.includes(input.name)) {
					companyAddressErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Address';
				showError('streetAddress_err', errorMessage)
			} else {
				showError('streetAddress_err', '')
				companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('streetAddress_err', '')
			companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'city') {
		if (input.value != '') {
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyAddressErrorsArray.includes(input.name)) {
					companyAddressErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid City Name';
				showError('city_err', errorMessage)
			} else {
				showError('city_err', '')
				companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('city_err', '')
			companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'state') {
		if (input.value != '') {
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyAddressErrorsArray.includes(input.name)) {
					companyAddressErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid State Name';
				showError('state_err', errorMessage)
			} else {
				showError('state_err', '')
				companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('state_err', '')
			companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'pincode') {
		if (input.value != '') {
			let regex;
			if (document.getElementById('country').value == 'IN') {
				regex = /^\d{6}$/
			} else {
				regex = /^\d{5}$/
			}
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!companyAddressErrorsArray.includes(input.name)) {
					companyAddressErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Pincode';
				showError('pincode_err', errorMessage)
			} else {
				showError('pincode_err', '')
				companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('pincode_err', '')
			companyAddressErrorsArray = companyAddressErrorsArray.filter(function (e) { return e !== input.name })
		}
	}

	console.log('errors-', companyAddressErrorsArray)
}

//--------------------------#edit-contact-person--------------------------
var contactPersonModal = document.querySelector('#edit-contact-person');
var contactPersonInputs = contactPersonModal.querySelectorAll('input,select');
function getContactPersonInputs() {
	contactPersonInputs = contactPersonModal.querySelectorAll('input,select');
	for (let input of contactPersonInputs) {
		input.addEventListener('change', function () {
			validateContactPerson(input)
		})
	}
}
var contactPersonErrorsArray = []
for (let input of contactPersonInputs) {
	input.addEventListener('change', function () {
		validateContactPerson(input)
	})
}
function validateContactPerson(input) {
	let errorMessage = '';

	if (input.id.includes("contactPersonName")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!contactPersonErrorsArray.includes(input.name)) {
					contactPersonErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Name';
				showError(`contactPersonName_${num}_err`, errorMessage)
			} else {
				showError(`contactPersonName_${num}_err`, '')
				contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`contactPersonName_${num}_err`, '')
			contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("contactPersonDesignation")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!contactPersonErrorsArray.includes(input.name)) {
					contactPersonErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Designation';
				showError(`contactPersonDesignation_${num}_err`, errorMessage)
			} else {
				showError(`contactPersonDesignation_${num}_err`, '')
				contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`contactPersonDesignation_${num}_err`, '')
			contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.id.includes("contactPersonEmail")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[a-zA-Z0-9._%+-]+@(?!gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!contactPersonErrorsArray.includes(input.name)) {
					contactPersonErrorsArray.push(input.name);
				}
				errorMessage = 'Enter Company Email';
				showError(`contactPersonEmail_${num}_err`, errorMessage)
			} else {
				showError(`contactPersonEmail_${num}_err`, '')
				contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`contactPersonEmail_${num}_err`, '')
			contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.id.includes("contactPersonPhone")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!contactPersonErrorsArray.includes(input.name)) {
					contactPersonErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Phone Number';
				showError(`contactPersonPhone_${num}_err`, errorMessage)
			} else {
				showError(`contactPersonPhone_${num}_err`, '')
				contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`contactPersonPhone_${num}_err`, '')
			contactPersonErrorsArray = contactPersonErrorsArray.filter(function (e) { return e !== input.name })
		}
	}

	console.log('errors-', contactPersonErrorsArray)
}
//------------Validations for Company Information(Step-1) ends--------------



//------------Validations for Company Information(Step-2) starts------------
function checkStep2RequiredInputs(inputs, modalId) {
	let allFilled = true;
	let firstRequiredField = null;
	for (let input of inputs) {
		if (modalId == '#edit-legal-information') {
			if (input.name == 'dunsNumber' && input.value == '') {
				allFilled = false;
				showError('dunsNumber_err', 'D-U-N-S Number Required')
			}
			else if (input.name == 'taxIdNumber' && input.value == '') {
				allFilled = false;
				showError('taxIdNumber_err', 'Tax Id Number (EIN) is Required')
			}
			else if (input.name == 'panNo' && input.value == '') {
				allFilled = false;
				showError('panNo_err', 'PAN Number is Required')
			}
			else if (input.name == 'gstNo' && input.value == '') {
				allFilled = false;
				showError('gstNo_err', 'GSTIN Number is Required')
			}
		} else if (modalId == '#edit-W9Form') {
			if (input.name == 'w9SubmissionForm' && !input.files[0]) {
				allFilled = false;
				showError('w9SubmissionForm_err', 'W-9 Submission Form Required')
			}
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

//-------------#edit-legal-information-------------
var legalInfoModal = document.querySelector('#edit-legal-information');
var legalInfoInputs = legalInfoModal.querySelectorAll('input,select');
var legalInfoErrorsArray = []
for (let input of legalInfoInputs) {
	input.addEventListener('change', function () {
		validateLegalInformation(input)
	})
}
function validateLegalInformation(input) {
	let errorMessage = '';

	if (input.name == 'typeOfBusinessEntity') {
		if (input.value != '') {
			const regex = /^[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!legalInfoErrorsArray.includes(input.name)) {
					legalInfoErrorsArray.push(input.name);
				}
				showError('typeOfBusinessEntity_err', 'Invalid Type')
			} else {
				showError('typeOfBusinessEntity_err', '')
				legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('typeOfBusinessEntity_err', '')
			legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'buisnessRegNumber') {
		if (input.value != '') {
			const regex = /^(?=.*[A-Z])(?=.*\d)[A-Z0-9]{21}$/;
			if (input.value.trim() == '' || !regex.test(input.value.toUpperCase().trim())) {
				if (!legalInfoErrorsArray.includes(input.name)) {
					legalInfoErrorsArray.push(input.name);
				}
				showError('buisnessRegNumber_err', 'Invalid Registration Number')
			} else {
				showError('buisnessRegNumber_err', '')
				legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('buisnessRegNumber_err', '')
			legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'registrationDate') {
		if (input.value != '') {
			function isPastDate(dateString) {
				const [year, month, day] = dateString.split('-').map(Number);// Parse the date components               
				const inputDate = new Date(year, month - 1, day);// Create a date object from the provided date             
				const currentDate = new Date();// Get the current date 
				currentDate.setHours(0, 0, 0, 0);// Set the current date to the start of the day (midnight)
				return inputDate < currentDate;// Compare the input date with the current date
			}

			if (!isPastDate(input.value)) {
				if (!legalInfoErrorsArray.includes(input.name)) {
					legalInfoErrorsArray.push(input.name);
				}
				showError('registrationDate_err', 'Invalid Date')
			} else {
				showError('registrationDate_err', '')
				legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('registrationDate_err', '')
			legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'dunsNumber') {
		if (input.value != '') {
			const regex = /^\d(?:-?\d){8}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!legalInfoErrorsArray.includes(input.name)) {
					legalInfoErrorsArray.push(input.name);
				}
				showError('dunsNumber_err', 'Invalid D-U-N-S Number')
			} else {
				showError('dunsNumber_err', '')
				legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('dunsNumber_err', '')
			legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'taxIdNumber') {
		if (input.value != '') {
			const regex = /^\d{2}-\d{7}$/;//for EIN(US) in XX-XXXXXXX
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!legalInfoErrorsArray.includes(input.name)) {
					legalInfoErrorsArray.push(input.name);
				}
				showError('taxIdNumber_err', 'Invalid Tax Id Number (EIN)')
			} else {
				showError('taxIdNumber_err', '')
				legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('taxIdNumber_err', '')
			legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'panNo') {
		if (input.value != '') {
			const regex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
			if (input.value.trim() == '' || !regex.test(input.value.toUpperCase().trim())) {
				if (!legalInfoErrorsArray.includes(input.name)) {
					legalInfoErrorsArray.push(input.name);
				}
				showError('panNo_err', 'Invalid PAN Number')
			} else {
				showError('panNo_err', '')
				legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('panNo_err', '')
			legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'gstNo') {
		if (input.value != '') {
			const regex = /^([0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}Z[0-9a-zA-Z]{1})$/;
			if (input.value.trim() == '' || !regex.test(input.value.toUpperCase().trim())) {
				if (!legalInfoErrorsArray.includes(input.name)) {
					legalInfoErrorsArray.push(input.name);
				}
				showError('gstNo_err', 'Invalid GSTIN Number')
			} else {
				showError('gstNo_err', '')
				legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('gstNo_err', '')
			legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	}

}


//-------------#edit-W9Form form-------------
var w9SubmissionModal = document.querySelector('#edit-W9Form');
var w9SubmissionInputs = w9SubmissionModal.querySelectorAll('input,select');
var w9SubmissionlErrorsArray = []
for (let input of w9SubmissionInputs) {
	input.addEventListener('change', function () {
		validatew9Submission(input)
	})
}

function validatew9Submission(input) {
	if (input.name == 'w9SubmissionForm') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!legalInfoErrorsArray.includes(input.name)) {
					legalInfoErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('w9SubmissionForm_err', errorMessage)
			} else {
				legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
				showError('w9SubmissionForm_err', '')
			}
		} else {
			legalInfoErrorsArray = legalInfoErrorsArray.filter(function (e) { return e !== input.name })
			showError('w9SubmissionForm_err', '')
		}
	}

	console.log('errors-', w9SubmissionlErrorsArray)
}


//-------------#edit-major-products-and-oems-------------
var productAndOemModal = document.querySelector('#edit-major-products-and-oems');
var productAndOemInputs = productAndOemModal.querySelectorAll('input,select');
function getProductAndOemInputs() {
	productAndOemInputs = productAndOemModal.querySelectorAll('input,select');
	for (let input of productAndOemInputs) {
		input.addEventListener('change', function () {
			validateProductAndOem(input)
		})
	}
}
var productAndOemErrorsArray = []
for (let input of productAndOemInputs) {
	input.addEventListener('change', function () {
		validateProductAndOem(input)
	})
}
function validateProductAndOem(input) {
	let errorMessage = '';

	if (input.id.includes("productName")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[A-Za-z0-9 & ()_/-]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!productAndOemErrorsArray.includes(input.name)) {
					productAndOemErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Product Name';
				showError(`productName_${num}_err`, errorMessage)
			} else {
				showError(`productName_${num}_err`, '')
				productAndOemErrorsArray = productAndOemErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`productName_${num}_err`, '')
			productAndOemErrorsArray = productAndOemErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.id.includes("oem_supplying_to")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!productAndOemErrorsArray.includes(input.name)) {
					productAndOemErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid OEM Name';
				showError(`oem_supplying_to_${num}_err`, errorMessage)
			} else {
				showError(`oem_supplying_to_${num}_err`, '')
				productAndOemErrorsArray = productAndOemErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`oem_supplying_to_${num}_err`, '')
			productAndOemErrorsArray = productAndOemErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.id.includes("oem_value")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!productAndOemErrorsArray.includes(input.name)) {
					productAndOemErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid OEM Name';
				showError(`oem_value_${num}_err`, errorMessage)
			} else {
				showError(`oem_value_${num}_err`, '')
				productAndOemErrorsArray = productAndOemErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`oem_value_${num}_err`, '')
			productAndOemErrorsArray = productAndOemErrorsArray.filter(function (e) { return e !== input.name })
		}
	}

	console.log('errors-', productAndOemErrorsArray)
}


//-------------#edit-major-customers-------------
var majorCustomersModal = document.querySelector('#edit-major-customers');
var majorCustomersInputs = majorCustomersModal.querySelectorAll('input,select');
function getMajorCustomersInputs() {
	majorCustomersInputs = majorCustomersModal.querySelectorAll('input,select');
	for (let input of majorCustomersInputs) {
		input.addEventListener('change', function () {
			validateMajorCustomers(input)
		})
	}
}
var majorCustomersErrorsArray = []
for (let input of majorCustomersInputs) {
	input.addEventListener('change', function () {
		validateMajorCustomers(input)
	})
}
function validateMajorCustomers(input) {
	let errorMessage = '';

	if (input.id.includes("customer_name")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[A-Za-z0-9 & ()_/-]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!majorCustomersErrorsArray.includes(input.name)) {
					majorCustomersErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Name';
				showError(`customer_name_${num}_err`, errorMessage)
			} else {
				showError(`customer_name_${num}_err`, '')
				majorCustomersErrorsArray = majorCustomersErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`customer_name_${num}_err`, '')
			majorCustomersErrorsArray = majorCustomersErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("customer_address")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[\w\s\d#,\-.]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!majorCustomersErrorsArray.includes(input.name)) {
					majorCustomersErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Address';
				showError(`customer_address_${num}_err`, errorMessage)
			} else {
				showError(`customer_address_${num}_err`, '')
				majorCustomersErrorsArray = majorCustomersErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`customer_address_${num}_err`, '')
			majorCustomersErrorsArray = majorCustomersErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("product_supplied")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[A-Za-z0-9 & ()_/-]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!majorCustomersErrorsArray.includes(input.name)) {
					majorCustomersErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Product/Service';
				showError(`product_supplied_${num}_err`, errorMessage)
			} else {
				showError(`product_supplied_${num}_err`, '')
				majorCustomersErrorsArray = majorCustomersErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`product_supplied_${num}_err`, '')
			majorCustomersErrorsArray = majorCustomersErrorsArray.filter(function (e) { return e !== input.name })
		}
	}


	console.log('errors-', majorCustomersErrorsArray)
}

//-------------#edit-logistics-provider-and-exporter-lists-------------
var logisticAndExporterModal = document.querySelector('#edit-logistics-provider-and-exporter-lists');
var logisticAndExporterInputs = logisticAndExporterModal.querySelectorAll('input,select');
function getLogisticAndExporterInputs() {
	logisticAndExporterInputs = logisticAndExporterModal.querySelectorAll('input,select');
	for (let input of logisticAndExporterInputs) {
		input.addEventListener('change', function () {
			validateLogisticAndExporter(input)
		})
	}
}
var logisticAndExporterErrorsArray = []
for (let input of logisticAndExporterInputs) {
	input.addEventListener('change', function () {
		validateLogisticAndExporter(input)
	})
}
function validateLogisticAndExporter(input) {
	let errorMessage = '';

	if (input.id.includes("provider_name")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[A-Za-z0-9 & ()_/-]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!logisticAndExporterErrorsArray.includes(input.name)) {
					logisticAndExporterErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Name';
				showError(`provider_name_${num}_err`, errorMessage)
			} else {
				showError(`provider_name_${num}_err`, '')
				logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`provider_name_${num}_err`, '')
			logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("provider_address")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[\w\s\d#,\-.]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!logisticAndExporterErrorsArray.includes(input.name)) {
					logisticAndExporterErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Address';
				showError(`provider_address_${num}_err`, errorMessage)
			} else {
				showError(`provider_address_${num}_err`, '')
				logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`provider_address_${num}_err`, '')
			logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("product_or_services")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[A-Za-z0-9 & ()_/-]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!logisticAndExporterErrorsArray.includes(input.name)) {
					logisticAndExporterErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Product/Service';
				showError(`product_or_services_${num}_err`, errorMessage)
			} else {
				showError(`product_or_services_${num}_err`, '')
				logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`product_or_services_${num}_err`, '')
			logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("export_country")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^[A-Za-z ]{2,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!logisticAndExporterErrorsArray.includes(input.name)) {
					logisticAndExporterErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Country Name';
				showError(`export_country_${num}_err`, errorMessage)
			} else {
				showError(`export_country_${num}_err`, '')
				logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`export_country_${num}_err`, '')
			logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("export_value")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^\d+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!logisticAndExporterErrorsArray.includes(input.name)) {
					logisticAndExporterErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Value';
				showError(`export_value_${num}_err`, errorMessage)
			} else {
				showError(`export_value_${num}_err`, '')
				logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`export_value_${num}_err`, '')
			logisticAndExporterErrorsArray = logisticAndExporterErrorsArray.filter(function (e) { return e !== input.name })
		}
	}


	console.log('errors-', logisticAndExporterErrorsArray)
}
//------------Validations for Company Information(Step-2) ends--------------


//------------Validations for Financial Information(Step-3) start-----------

function checkStep3RequiredInputs(inputs, modalId) {
	let allFilled = true;
	let firstRequiredField = null;
	for (let input of inputs) {
		if (modalId == '#edit-financial-information') {
			if (input.name == 'bankName' && input.value.trim() == '') {
				allFilled = false;
				showError('bankName_err', 'Bank Name is Required')
			}
			else if (input.name == 'accountNo' && input.value.trim() == '') {
				allFilled = false;
				showError('accountNo_err', 'Account Number is Required')
			}
			else if (input.name == 'routingNo' && input.value.trim() == '') {
				allFilled = false;
				showError('routingNo_err', 'Routing Number is Required')
			}
			else if (input.name == 'ifscCode' && input.value.trim() == '') {
				allFilled = false;
				showError('ifscCode_err', 'IFSC Code is Required')
			}
			else if (input.name == 'accountType' && input.value.trim() == '') {
				allFilled = false;
				showError('accountType_err', 'Account Type is Required')
			}

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


//-------------#edit-financial-information-------------
var finacialInfoModal = document.querySelector('#edit-financial-information');
var finacialInfoInputs = finacialInfoModal.querySelectorAll('input,select');
var finacialInfoErrorsArray = []
for (let input of finacialInfoInputs) {
	input.addEventListener('change', function () {
		validateFinancialInformation(input)
	})
}
function validateFinancialInformation(input) {
	let errorMessage = '';

	if (input.name == 'bankName') {
		if (input.value != '') {
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!finacialInfoErrorsArray.includes(input.name)) {
					finacialInfoErrorsArray.push(input.name);
				}
				showError('bankName_err', 'Invalid Bank Name')
			} else {
				showError('bankName_err', '')
				finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('bankName_err', '')
			finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'accountNo') {
		if (input.value != '') {
			const regex = /^\d{1,20}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!finacialInfoErrorsArray.includes(input.name)) {
					finacialInfoErrorsArray.push(input.name);
				}
				showError('accountNo_err', 'Invalid Account Number')
			} else {
				showError('accountNo_err', '')
				finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('accountNo_err', '')
			finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'routingNo') {
		if (input.value != '') {
			const regex = /^\d{9}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!finacialInfoErrorsArray.includes(input.name)) {
					finacialInfoErrorsArray.push(input.name);
				}
				showError('routingNo_err', 'Invalid Routing Number')
			} else {
				showError('routingNo_err', '')
				finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('routingNo_err', '')
			finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name == 'ifscCode') {
		if (input.value != '') {
			const regex = /^[A-Z]{4}0[A-Z0-9]{6}$/;
			if (input.value.trim() == '' || !regex.test(input.value.toUpperCase().trim())) {
				if (!finacialInfoErrorsArray.includes(input.name)) {
					finacialInfoErrorsArray.push(input.name);
				}
				showError('ifscCode_err', 'Invalid IFSC Code')
			} else {
				showError('ifscCode_err', '')
				finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('ifscCode_err', '')
			finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'accountType') {
		if (input.value != '') {
			const regex = /^[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!finacialInfoErrorsArray.includes(input.name)) {
					finacialInfoErrorsArray.push(input.name);
				}
				showError('accountType_err', 'Invalid Account Type')
			} else {
				showError('accountType_err', '')
				finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('accountType_err', '')
			finacialInfoErrorsArray = finacialInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	console.log('errors-', finacialInfoErrorsArray)
}


//-------------#edit-Account-turnover-------------
var annualTurnoverModal = document.querySelector('#edit-Account-turnover');
var annualTurnoverInputs = annualTurnoverModal.querySelectorAll('input,select');
function getAnnualTurnoverInputs() {
	annualTurnoverInputs = annualTurnoverModal.querySelectorAll('input,select');
	for (let input of annualTurnoverInputs) {
		input.addEventListener('change', function () {
			validateAnnualTurnover(input)
		})
	}
}
var annualTurnoverErrorsArray = []
for (let input of annualTurnoverInputs) {
	input.addEventListener('change', function () {
		validateAnnualTurnover(input)
	})
}
function validateAnnualTurnover(input) {
	let errorMessage = '';

	if (input.id.includes("turnover_value")) {
		if (input.value != '') {
			let nameArray = input.id.split("_")
			let num = nameArray[nameArray.length - 1]
			const regex = /^\d+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!annualTurnoverErrorsArray.includes(input.name)) {
					annualTurnoverErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Value';
				showError(`turnover_value_${num}_err`, errorMessage)
			} else {
				showError(`turnover_value_${num}_err`, '')
				annualTurnoverErrorsArray = annualTurnoverErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`turnover_value_${num}_err`, '')
			annualTurnoverErrorsArray = annualTurnoverErrorsArray.filter(function (e) { return e !== input.name })
		}
	}


	console.log('errors-', annualTurnoverErrorsArray)
}
//------------Validations for Financial Information(Step-3) ends------------

//------------Validations for Technical Capabilities(Step-4) starts----------
function showErrorForField(input, errorMsg) {
	let errSpan = input.closest('.field-group').querySelector('.err-text')
	if (errSpan) {
		errSpan.innerHTML = errorMsg
	}
}

//--------------#edit-technical-capabilities-----------------
var factoryInfoModal = document.querySelector('#edit-technical-capabilities');
var factoryInfoInputs = factoryInfoModal.querySelectorAll('input,select');
function getFactoryInfoInputs() {
	factoryInfoInputs = factoryInfoModal.querySelectorAll('input,select');
	for (let input of factoryInfoInputs) {
		input.addEventListener('change', function () {
			validateFactoryInfo(input)
		})
	}
}
var factoryInfoErrorsArray = []
for (let input of factoryInfoInputs) {
	input.addEventListener('change', function () {
		validateFactoryInfo(input)
	})
}
function validateFactoryInfo(input) {

	if (input.id.includes("factory_name")) {
		if (input.value != '') {
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!factoryInfoErrorsArray.includes(input.name)) {
					factoryInfoErrorsArray.push(input.name);
				}
				showErrorForField(input, 'Invalid Factory Name')
			} else {
				showErrorForField(input, '')
				factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showErrorForField(input, '')
			factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("area_in_square_mtr")) {
		if (input.value != '') {
			const regex = /^\d+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!factoryInfoErrorsArray.includes(input.name)) {
					factoryInfoErrorsArray.push(input.name);
				}
				showErrorForField(input, 'Invalid Area Value')
			} else {
				showErrorForField(input, '')
				factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showErrorForField(input, '')
			factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("factory_address")) {
		if (input.value != '') {
			const regex = /^[\w\s\d#,\-.]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!factoryInfoErrorsArray.includes(input.name)) {
					factoryInfoErrorsArray.push(input.name);
				}
				showErrorForField(input, 'Invalid Area Value')
			} else {
				showErrorForField(input, '')
				factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showErrorForField(input, '')
			factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("total_employees") || input.id.includes("supervisors") || input.id.includes("engg_degree_or_diploma") || input.id.includes("skilled_workers") || input.id.includes("design_department") || input.id.includes("quality_control_and_inspection")) {
		if (input.value != '') {
			const regex = /^\d+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!factoryInfoErrorsArray.includes(input.name)) {
					factoryInfoErrorsArray.push(input.name);
				}
				showErrorForField(input, 'Invalid')
			} else {
				showErrorForField(input, '')
				factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showErrorForField(input, '')
			factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("machining_facility_remark") || input.id.includes("inspection_facility_remark")) {
		if (input.value != '') {
			const regex = /^(?=.*[^\d\s])[A-Za-z0-9\s!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!factoryInfoErrorsArray.includes(input.name)) {
					factoryInfoErrorsArray.push(input.name);
				}
				showErrorForField(input, 'Invalid Description')
			} else {
				showErrorForField(input, '')
				factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showErrorForField(input, '')
			factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.id.includes("machining_facility") || input.id.includes("inspection_facility")) {
		if (input.value != '') {
			const regex = /^(?=.*[^\d\s])[A-Za-z0-9\s!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]+$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!factoryInfoErrorsArray.includes(input.name)) {
					factoryInfoErrorsArray.push(input.name);
				}
				showErrorForField(input, 'Invalid')
			} else {
				showErrorForField(input, '')
				factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showErrorForField(input, '')
			factoryInfoErrorsArray = factoryInfoErrorsArray.filter(function (e) { return e !== input.name })
		}
	}


	console.log('errors-', factoryInfoErrorsArray)
}
//------------Validations for Technical Capabilities(Step-4) ends------------

//------------Validations for Certificates & Compliance(Step-5) starts----------

//---- #edit-Certificates form----
var certificatesModal = document.querySelector('#edit-Certificates');
var certificatesErrorsArray = []
var certificatesInputs = []
function getCertificatesInputs() {
	certificatesInputs = certificatesModal.querySelectorAll('input,select');
	for (let input of certificatesInputs) {
		input.addEventListener('change', function () {
			validateCertificates(input)
		})
	}
}
getCertificatesInputs()

function validateCertificates(input) {
	if (input.name == 'isoCertificationFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!certificatesErrorsArray.includes(input.name)) {
					certificatesErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('isoCertificationUrl_err', errorMessage)
			} else {
				certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
				showError('isoCertificationUrl_err', '')
			}
		} else {
			certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
			showError('isoCertificationUrl_err', '')
		}
	}
	else if (input.name == 'asCertificationFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!certificatesErrorsArray.includes(input.name)) {
					certificatesErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('asCertificationUrl_err', errorMessage)
			} else {
				certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
				showError('asCertificationUrl_err', '')
			}
		} else {
			certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
			showError('asCertificationUrl_err', '')
		}
	}
	else if (input.name == 'oshaCertificationFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!certificatesErrorsArray.includes(input.name)) {
					certificatesErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('oshaCertificationUrl_err', errorMessage)
			} else {
				certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
				showError('oshaCertificationUrl_err', '')
			}
		} else {
			certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
			showError('oshaCertificationUrl_err', '')
		}

	}
	else if (input.name == 'fdaRegisterationFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!certificatesErrorsArray.includes(input.name)) {
					certificatesErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('fdaRegisterationUrl_err', errorMessage)
			} else {
				certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
				showError('fdaRegisterationUrl_err', '')
			}
		} else {
			certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
			showError('fdaRegisterationUrl_err', '')
		}

	}
	else if (input.name == 'laborLawComplianceFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!certificatesErrorsArray.includes(input.name)) {
					certificatesErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('laborLawComplianceUrl_err', errorMessage)
			} else {
				certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
				showError('laborLawComplianceUrl_err', '')
			}
		} else {
			certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
			showError('laborLawComplianceUrl_err', '')
		}

	}
	else if (input.name == 'indianStandardsComplianceFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!certificatesErrorsArray.includes(input.name)) {
					certificatesErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('indianStandardsComplianceUrl_err', errorMessage)
			} else {
				certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
				showError('indianStandardsComplianceUrl_err', '')
			}
		} else {
			certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
			showError('indianStandardsComplianceUrl_err', '')
		}

	}
	else if (input.name == 'environmentalRegulationsComplianceFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!certificatesErrorsArray.includes(input.name)) {
					certificatesErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('environmentalRegulationsComplianceUrl_err', errorMessage)
			} else {
				certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
				showError('environmentalRegulationsComplianceUrl_err', '')
			}
		} else {
			certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
			showError('environmentalRegulationsComplianceUrl_err', '')
		}

	}
	else if (input.name == 'otherCertificationsIndiaFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!certificatesErrorsArray.includes(input.name)) {
					certificatesErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('otherCertificationsIndiaUrl_err', errorMessage)
			} else {
				certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
				showError('otherCertificationsIndiaUrl_err', '')
			}
		} else {
			certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
			showError('otherCertificationsIndiaUrl_err', '')
		}

	} else if (input.name == 'otherCertificationsFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!certificatesErrorsArray.includes(input.name)) {
					certificatesErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('otherCertificationsUrl_err', errorMessage)
			} else {
				certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
				showError('otherCertificationsUrl_err', '')
			}
		} else {
			certificatesErrorsArray = certificatesErrorsArray.filter(function (e) { return e !== input.name })
			showError('otherCertificationsUrl_err', '')
		}

	}

	console.log('errors-', certificatesErrorsArray)
}
//------------Validations for Certificates & Compliance(Step-5) ends----------


//------------Validations for Testimonials or Awards(Step-6) starts----------

//------------#edit-CaseStudies--------------
var testimonialsModal = document.querySelector('#edit-CaseStudies');
var testimonialsInputs = testimonialsModal.querySelectorAll('input,select');
var testimonialsErrorsArray = []
testimonialsInputs.forEach(input => {
	input.addEventListener('change', function () {
		validateTestimonials(input)
	});
});

function getTestimonialsInputs() {
	testimonialsInputs = testimonialsModal.querySelectorAll('input,select');
	for (let input of testimonialsInputs) {
		input.addEventListener('change', function () {
			validateTestimonials(input)
		});
	}
}


function validateTestimonials(input) {
	if (input.name === 'signatureFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!testimonialsErrorsArray.includes(input.name)) {
					testimonialsErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('signatureFile_err', errorMessage)
			} else {
				testimonialsErrorsArray = testimonialsErrorsArray.filter(function (e) { return e !== input.name })
				showError('signatureFile_err', '')
			}
		} else {
			testimonialsErrorsArray = testimonialsErrorsArray.filter(function (e) { return e !== input.name })
			showError('signatureFile_err', '')
		}
	}
	else if (input.id.includes("testimonials_or_awards")) {
		let nameArray = input.id.split("_")
		let num = nameArray[nameArray.length - 1]

		if (input.value != '') {
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!testimonialsErrorsArray.includes(input.name)) {
					testimonialsErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Testimonials or Awards';
				showError(`testimonials_or_awards_${num}_err`, errorMessage)
			} else {
				showError(`testimonials_or_awards_${num}_err`, '')
				testimonialsErrorsArray = testimonialsErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError(`testimonials_or_awards_${num}_err`, '')
			testimonialsErrorsArray = testimonialsErrorsArray.filter(function (e) { return e !== input.name })
		}
	}
	else if (input.name === 'projectCaseStudies') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!testimonialsErrorsArray.includes(input.name)) {
					testimonialsErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('projectCaseStudiesFile_err', errorMessage)
			} else {
				testimonialsErrorsArray = testimonialsErrorsArray.filter(function (e) { return e !== input.name })
				showError('projectCaseStudiesFile_err', '')
			}
		} else {
			testimonialsErrorsArray = testimonialsErrorsArray.filter(function (e) { return e !== input.name })
			showError('projectCaseStudiesFile_err', '')
		}
	}

	console.log('errors-', testimonialsErrorsArray)
}
//------------Validations for Testimonials or Awards(Step-6) ends------------

//------------Validations for Consent Form(Step-7) starts----------

//-----------------#edit-ConsentForm------------
var consentFormModal = document.querySelector('#edit-ConsentForm');
var consentFormInputs = consentFormModal.querySelectorAll('input,select');
var consentFormErrorsArray = []
for (let input of consentFormInputs) {
	input.addEventListener('change', function () {
		validateConsentForm(input)
	})
}
function validateConsentForm(input) {
	let errorMessage = '';
	if (input.name == 'customerReferencePersonName') {
		if (input.value != '') {
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!consentFormErrorsArray.includes(input.name)) {
					consentFormErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Name';
				showError('customerReferencePersonName_err', errorMessage)
			} else {
				showError('customerReferencePersonName_err', '')
				consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('customerReferencePersonName_err', '')
			consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'customerReferencePersonJobTitle') {
		if (input.value != '') {
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!consentFormErrorsArray.includes(input.name)) {
					consentFormErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Job Title';
				showError('customerReferencePersonJobTitle_err', errorMessage)
			} else {
				showError('customerReferencePersonJobTitle_err', '')
				consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('customerReferencePersonJobTitle_err', '')
			consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'customerReferencePersonCompanyName') {
		if (input.value != '') {
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!consentFormErrorsArray.includes(input.name)) {
					consentFormErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Company Name';
				showError('customerReferencePersonCompanyName_err', errorMessage)
			} else {
				showError('customerReferencePersonCompanyName_err', '')
				consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('customerReferencePersonCompanyName_err', '')
			consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'customerReferencePersonCompanyWebsite') {
		if (input.value != '') {
			const regex = /^(https?:\/\/)?([a-zA-Z0-9-]+\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\/\S*)?$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!consentFormErrorsArray.includes(input.name)) {
					consentFormErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Website Url';
				showError('customerReferencePersonCompanyWebsite_err', errorMessage)
			} else {
				showError('customerReferencePersonCompanyWebsite_err', '')
				consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('customerReferencePersonCompanyWebsite_err', '')
			consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'customerReferencePersonEmail') {
		if (input.value != '') {
			const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!consentFormErrorsArray.includes(input.name)) {
					consentFormErrorsArray.push(input.name);
				}
				errorMessage = 'Enter Company Email';
				showError('customerReferencePersonEmail_err', errorMessage)
			} else {
				showError('customerReferencePersonEmail_err', '')
				consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('customerReferencePersonEmail_err', '')
			consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'customerReferencePersonPhoneNo') {
		if (input.value != '') {
			const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!consentFormErrorsArray.includes(input.name)) {
					consentFormErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Phone Number';
				showError('customerReferencePersonPhoneNo_err', errorMessage)
			} else {
				showError('customerReferencePersonPhoneNo_err', '')
				consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('customerReferencePersonPhoneNo_err', '')
			consentFormErrorsArray = consentFormErrorsArray.filter(function (e) { return e !== input.name })
		}
	}

	console.log('errors-', consentFormErrorsArray)
}

//---------------------------#edit-permission----------------------------
var permissionModal = document.querySelector('#edit-permission');
var permissionInputs = permissionModal.querySelectorAll('input,select');
var permissionErrorsArray = []
for (let input of permissionInputs) {
	input.addEventListener('change', function () {
		validatePermissionForm(input)
	})
}
function validatePermissionForm(input) {
	let errorMessage = '';


	if (input.name == 'permissionModel.signatureFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!permissionErrorsArray.includes(input.name)) {
					permissionErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('ref_signatureFile', errorMessage)
			} else {
				permissionErrorsArray = permissionErrorsArray.filter(function (e) { return e !== input.name })
				showError('ref_signatureFile', '')
			}
		} else {
			permissionErrorsArray = permissionErrorsArray.filter(function (e) { return e !== input.name })
			showError('ref_signatureFile', '')
		}
	}

	console.log('errors-', permissionErrorsArray)
}
//----Validations for Permission Checkboxes starts-----
function checkStep7RequiredInputs(inputs, modalId) {
	let requiredFilledStep7 = false;
	let anyChecked = false;

	const allCheckboxes = document.querySelectorAll('.child-checkboxes,.parent-checkbox');
	// console.log('allCheckboxes',allCheckboxes)
	for (let checkbox of allCheckboxes) {
		if (checkbox.checked) {
			anyChecked = true;
			break;
		}
	}

	if (anyChecked == true) {
		requiredFilledStep7 = true;
		console.log('required - error', requiredFilledStep7)
	}
	else {
		requiredFilledStep7 = false;
		showError('check_one_checkbox_err', 'Please check atleast one checkbox')
		console.log('required - error', requiredFilledStep7, errorMessage)
	}


	return requiredFilledStep7;
}

//----to reset error---------
const allPermissionCheckboxes = document.querySelectorAll('.child-checkboxes,.parent-checkbox');
// console.log('allPermissionCheckboxes', allPermissionCheckboxes)
for (let checkbox of allPermissionCheckboxes) {
	checkbox.addEventListener('click', function () {
		showError('check_one_checkbox_err', '')
	})
}

//------------Validations for Consent Form(Step-7) ends------------



//----------------validation for seller Edit profile ends here---------------------


function save(parentDivId, url, callThis) {
	var finalData = {};
	var formData = new FormData();
	// Collect data from generic forms (assuming they follow the same pattern)
	var inputs = $(parentDivId).find('input, select, textarea');

	let error;
	if (parentDivId == '#edit-personal-detail') {
		let isRequiredErr = checkStep1RequiredInputs(personalDetailsInputs, parentDivId)
		if (!isRequiredErr || personalDetailsErrorsArray.length != 0) {
			error = true
		}
	} else if (parentDivId == '#edit-company-details') {
		let isRequiredErr = checkStep1RequiredInputs(companyDetailsInputs, parentDivId)
		if (!isRequiredErr || companyDetailsErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-company-address') {
		let isRequiredErr = checkStep1RequiredInputs(companyAddressInputs, parentDivId)
		if (!isRequiredErr || companyAddressErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-contact-person') {
		let isRequiredErr = checkStep1RequiredInputs(contactPersonInputs, parentDivId)
		if (!isRequiredErr || contactPersonErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-legal-information') {
		let isRequiredErr = checkStep2RequiredInputs(legalInfoInputs, parentDivId)
		if (!isRequiredErr || legalInfoErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-W9Form') {
		// let isRequiredErr = checkStep2RequiredInputs(legalInfoInputs, parentDivId)
		if (w9SubmissionlErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-major-products-and-oems') {
		if (productAndOemErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-major-customers') {
		if (majorCustomersErrorsArray.length != 0) {
			error = true
		}
	} else if (parentDivId == '#edit-logistics-provider-and-exporter-lists') {
		if (logisticAndExporterErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-financial-information') {
		let isRequiredErr = checkStep3RequiredInputs(finacialInfoInputs, parentDivId)
		if (!isRequiredErr || finacialInfoErrorsArray.length != 0) {
			error = true
		}
	} else if (parentDivId == '#edit-Account-turnover') {
		if (annualTurnoverErrorsArray.length != 0) {
			error = true
		}
	} else if (parentDivId == '#edit-technical-capabilities') {
		if (factoryInfoErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-Certificates') {
		if (certificatesErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-CaseStudies') {
		if (testimonialsErrorsArray.length != 0) {
			error = true
		}
	} else if (parentDivId == '#edit-ConsentForm') {
		if (consentFormErrorsArray.length != 0) {
			error = true
		}
	} else if (parentDivId == '#edit-permission') {
		let isRequiredErr = checkStep7RequiredInputs(permissionInputs, parentDivId)
		if (!isRequiredErr || permissionErrorsArray.length != 0) {
			error = true
		}
	}
	if (error) {
		return; //no API call if found true(i.e Some Required fields are empty)
	}

	if (parentDivId !== "#edit-permission" || parentDivId !== "#edit-W9Form") {
		// Iterate through inputs to build formData
		inputs.each(function () {
			var input = $(this);
			var key = input.attr('name');
			var value = input.val();

			// Handle specific conditions for certain keys (if needed)
			if (key === "companyBankId" || key === "annualTurnoverId" || key === "addressId" || key === "contactPersonId") {
				value = (value === "") ? "" : value;
			}
			finalData[key] = value;


		});
		console.log(finalData)
	}

	// Determine which form data to collect based on parentDivId
	if (parentDivId === "#edit-company-details") {
		// Collect data from the company details modal
		var companyLogoInput = $("#ModalcompanyLogoUrl input[type='file']")[0].files[0];
		var companyLogoIdInput = $("#ModalcompanyLogoUrl input[name='companyLogoId']").val();

		// Append company logo data if available
		if (companyLogoInput) {
			formData.append('companyLogo', companyLogoInput);
			formData.append('companyLogoId', companyLogoIdInput);
		}
		urlDocumnet = "/updateBuyerCompanyDocuments"
		fromDataSend(parentDivId, urlDocumnet, formData, callThis, finalData, url)
	} else if (parentDivId === "#edit-signature") {
		// Collect data from the signature modal
		var companySignatureInput = $("#companySignature input[type='file']")[0].files[0];
		var companySignatureId = $("#companySignature input[id='companySignatureId']").val();

		// Append company signature data
		formData.append('companySignature', companySignatureInput);
		formData.append('companySignatureId', companySignatureId);
		urlDocumnet = "/updateBuyerCompanyDocuments"
		fromDataSend(parentDivId, urlDocumnet, formData, callThis, url)
	} else if (parentDivId === "#edit-CaseStudies") {

		var formId = parentDivId.replace("#", "") + "-form";
		formData = new FormData(document.getElementById(formId));
		for (var pair of formData.entries()) {
			console.log(pair[0] + ': ' + pair[1]);
		}
		fromDataSend(parentDivId, url, formData, callThis)
	} else if (parentDivId === "#edit-contact-person" || parentDivId === "#edit-Account-turnover" || parentDivId === "#edit-Certificates" || parentDivId === "#edit-permission" || parentDivId === "#edit-W9Form") {

		// Collect data from the contact person form
		var formId = parentDivId.replace("#", "") + "-form";
		formData = new FormData(document.getElementById(formId));
		fromDataSend(parentDivId, url, formData, callThis)
	} else if (parentDivId === "#edit-major-products-and-oems" || parentDivId === "#edit-Account-turnover" || parentDivId === "#edit-Certificates" || parentDivId === "#edit-major-customers" || parentDivId === "#edit-logistics-provider-and-exporter-lists" || parentDivId === "#edit-technical-capabilities") {
		factoryArray = []
		console.log(factoryArray)
		// Collect data from the contact person form
		var formId = parentDivId.replace("#", "") + "-form";
		formData = new FormData(document.getElementById(formId));

		if (parentDivId === "#edit-major-products-and-oems") {

			let isSupplyingToOEMRadioButtons = document.querySelectorAll('input[name="isSupplyingToOEM"]');
			isSupplyingToOEMValue = "false";
			isSupplyingToOEMRadioButtons.forEach(function (radioButton) {
				if (radioButton.checked && radioButton.value === 'yes') {
					isSupplyingToOEMValue = "true";
				}
			});

			// Append isSupplyingToOEM value to formData
			formData.append("isSupplyingToOEM", isSupplyingToOEMValue);
		}
		if (parentDivId === "#edit-logistics-provider-and-exporter-lists") {

			let isSupplyingToOEMRadioButtons = document.querySelectorAll('input[name="isSupplyingToOEM"]');
			isSupplyingToOEMValue = "false";
			isSupplyingToOEMRadioButtons.forEach(function (radioButton) {
				if (radioButton.checked && radioButton.value === 'yes') {
					isSupplyingToOEMValue = "true";
				}
			});

			// Append isSupplyingToOEM value to formData
			formData.append("isSupplyingToOEM", isSupplyingToOEMValue);
		}
		fromDataSend(parentDivId, url, formData, callThis)
	} else {
		sendData(parentDivId, url, finalData, callThis)
	}


	// Optional: Display formData for debugging
	for (var pair of formData.entries()) {
		console.log(pair[0] + ': ' + pair[1]);
	}

}


function sendData(parentDivId, url, finalData, callThis) {
	var myHeaders = new Headers();
	myHeaders.append("Content-Type", "application/json");


	var requestOptions = {
		method: "POST",
		headers: myHeaders,
		body: JSON.stringify(finalData),
		redirect: "follow",
	};

	fetch(contextPath + url, requestOptions)
		.then(response => response.json())  // Parse the response as JSON
		.then(result => {
			console.log(result);

			if (result.status === 'true') {

				if (typeof callThis === 'function') {
					console.log('Calling the third parameter function...');
					callThis();
				} else {
					console.warn('The third parameter is not a function or is undefined.');
				}
				toastr.success('Sucessfully Updated The Details');

				$(parentDivId).modal('hide'); // Redirect to BuyersRequirementList
			} else {
				toastr.error('Something went wrong');
			}

		})
}
function fromDataSend(parentDivId, urlDocumnet, formData, callThis, finalData, url) {
	// Construct fetch options
	var myHeaders = new Headers();
	myHeaders.append("Content-Type", "multipart/form-data");

	var requestOptions = {
		method: 'POST',
		hrader: myHeaders,
		body: formData
	};

	// Make the fetch request
	fetch(contextPath + urlDocumnet, requestOptions)
		.then(response => response.json())
		.then(result => {
			console.log(result);

			if (result.status === 'true' || (result.oemstatus === "true" && result.productstatus === "true") || (result.logisticstatus === "true" && result.exporterstatus === "true")) {
				// Call callback function if provided

				if (typeof callThis === 'function') {
					console.log('Calling the third parameter function...');
					callThis();
				} else {
					console.warn('The third parameter is not a function or is undefined.');
				}
				if (parentDivId == "#edit-company-details") {
					sendData(parentDivId, url, finalData, callThis)
				} else {
					toastr.success('Successfully Updated The Details');
				}
				$(parentDivId).modal('hide');
			} else {
				toastr.error('Something went wrong');
			}
		})
		.catch(error => {
			console.error('Error:', error);
			toastr.error('Failed to update details');
		});
}


var sellerId = ""
function showCompanyInformation() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}

	apiCall(sellerId, "/getSellerCompanyDetails")
		.then(data => {
			if (data) {
				console.log(data)
				addToId(data, companyIdForSeller)
				if (role === "SELLER")
					contactPerson(data)


				if (data.data.companyLogoUrl) {
					// Assuming relevantDocumentUrl is the id of the element
					const companyLogoUrl = document.getElementById("companyLogoUrl");
					const ModalcompanyLogoUrl = document.getElementById("ModalcompanyLogoUrl");
					const singleCompanyLogo = document.getElementById("singleCompanyLogo")


					forSignature(companyLogoUrl, data.data.companyLogoUrl)
					forSignature(ModalcompanyLogoUrl, data.data.companyLogoUrl)
					forSignature(singleCompanyLogo, data.data.companyLogoUrl)


					// Function to check if the URL points to a PDF

				}

				hideAllContent();
				$("#CompanyInformationContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});


}

function showLegalInformation() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerLegalDetails")
		.then(data => {
			if (data) {
				addToId(data, companyIdForSeller)

				if (role === "SELLER")
					console.log('seller', data)

				const otherColumns = [{
					data: null,
					title: "S.No",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "productName",
					title: "Name of Major Product",
					orderable: false,
				},


				];
				const oemColumns = [{
					data: null,
					title: "S.No",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "supplyingTo",
					title: "OEM Supplying to",
					orderable: false,
				},

				{
					data: "supplierSince",
					title: "Supplier Since (Year)",
					orderable: false,
				},

				{
					data: "value",
					title: "Value",
					orderable: false,
				},
				{
					data: "vendorRating",
					title: "Vendor Rating",
					orderable: false,
				},

				];
				const MajorCustomer = [{
					data: null,
					title: "S.No",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "name",
					title: "Customer’s Name",
					orderable: false,
				},

				{
					data: "address",
					title: "Address",
					orderable: false,
				},

				{
					data: "productSupplied",
					title: "Product Supplied",
					orderable: false,
				},


				];
				const Logistics = [{
					data: null,
					title: "S.No",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "name",
					title: "Customer’s Name",
					orderable: false,
				},

				{
					data: "address",
					title: "Address",
					orderable: false,
				},


				];
				const exporter = [{
					data: null,
					title: "S.No",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "financialYear",
					title: "Financial Year",
					orderable: false,
				},

				{
					data: "product",
					title: "Products / Services",
					orderable: false,
				},
				{
					data: "country",
					title: "Country",
					orderable: false,
				}, {
					data: "value",
					title: "Value",
					orderable: false,
				},

				];
				sellerTables("MajorProducts", otherColumns, data.data.productsList)
				sellerTables("OEMs", oemColumns, data.data.oemModels)
				sellerTables("MajorCustomers", MajorCustomer, data.data.majorCustomers)
				sellerTables("Logistics", Logistics, data.data.logisticServiceProvider)
				sellerTables("exporter", exporter, data.data.exporterList)
				if (data.data.isSupplyingToOEM === true) {
					document.querySelector('input[name="isSupplyingToOEM"][value="yes"]').checked = true;
					document.querySelector('#oem-details-parent').style.display = "block";
					addOEMDetails(data.data.oemModels)

				} else {
					document.querySelector('input[name="isSupplyingToOEM"][value="no"]').checked = true;
					document.querySelector('#oem-details-parent').style.display = "none";
					oemCount = 0
				}
				if (data.data.isLogisticServiceProvider === true) {
					document.querySelector('input[name="isLogisticServiceProvider"][value="yes"]').checked = true;
					document.querySelector('#logistic-service-provider-parent').style.display = "block";
					addLogisticServiceProvider(data.data.logisticServiceProvider)

				} else {
					document.querySelector('input[name="isLogisticServiceProvider"][value="no"]').checked = true;
					document.querySelector('#logistic-service-provider-parent').style.display = "none";
					providerCount = 0
				}
				if (data.data.isExporter === true) {
					document.querySelector('input[name="isExporter"][value="yes"]').checked = true;
					document.querySelector('#exporter-lists-parent').style.display = "block";
					addYearExportRow(data.data.exporterList)

				} else {
					document.querySelector('input[name="isExporter"][value="no"]').checked = true;
					document.querySelector('#exporter-lists-parent').style.display = "none";
					exporterListCount = 0
				}

				// Select the radio buttons
				let isSupplyingToOEMRadioButtons = document.querySelectorAll('input[name="isSupplyingToOEM"]');
				let isExporterRadioButtons = document.querySelectorAll('input[name="isExporter"]');
				let isLogisticServiceProviderRadioButtons = document.querySelectorAll('input[name="isLogisticServiceProvider"]');


				// Determine initial states and call handleRadioChange function
				isSupplyingToOEMRadioButtons.forEach(function (radioButton) {
					if (radioButton.checked) {
						handleRadioChange(radioButton.value, 'oem-details-parent', data.data.oemModels.length);
					}
					radioButton.addEventListener('change', function () {
						handleRadioChange(this.value, 'oem-details-parent', data.data.oemModels.length);
					});
				});


				isExporterRadioButtons.forEach(function (radioButton) {
					if (radioButton.checked) {
						handleRadioChange(radioButton.value, 'exporter-lists-parent', data.data.exporterList.length);
					}
					radioButton.addEventListener('change', function () {
						handleRadioChange(this.value, 'exporter-lists-parent', data.data.exporterList.length);
					});
				});
				isLogisticServiceProviderRadioButtons.forEach(function (radioButton) {
					if (radioButton.checked) {
						handleRadioChange(radioButton.value, 'logistic-service-provider-parent', data.data.logisticServiceProvider.length);
					}
					radioButton.addEventListener('change', function () {
						handleRadioChange(this.value, 'logistic-service-provider-parent', data.data.logisticServiceProvider.length);
					});
				});
				//				w9form
				var parent = document.getElementById("w9form");


				if (parent) {
					parent.innerHTML = ""
					const newDiv = document.createElement("div");
					newDiv.className = "";
					newDiv.innerHTML = `
                       <div class="col-lg-4 col-md-6 col-sm-12 col-12">
									
						<div class="file-input-field-group p-0" style="background: none">
							<input name="w9SubmissionId"
								value="${data.data.w9SubmissionId}" hidden> <input
								type="file" id="w9SubmissionForm_input"
								name="${data.data.w9SubmissionForm}" class="input-field"
								placeholder="File" required autocomplete="off" hidden>
							  <button class="input-btn" type="button" onclick="window.open('${data.data.w9SubmissionUrl}', '_blank')">Download</button>
      
						</div>
						<span id="w9SubmissionForm_err" class="err-text"></span>
					</div>
                    `;
					parent.appendChild(newDiv);
				}
				var parent2 = document.getElementById("modalW9Form");
				parent2.innerHTML = ""
				if (parent2) {
					const newDiv = document.createElement("div");
					newDiv.className = "";
					newDiv.innerHTML = `
                      <h6 class="card-title">
							W-9 Submission Form<span class="required-asterisk">*</span>
						</h6>
						<div class="file-input-field-group p-0">
						<input name="w9SubmissionId"
								value="${data.data.w9SubmissionId}" hidden>
							<input type="file" id="w9SubmissionForm" value="" name="w9SubmissionForm"
								class="input-field" placeholder="File" required
								autocomplete="off" accept=".pdf, .jpg, .png, .jpeg" hidden>
							<button class="input-btn" type="button"
								onclick="handleClick('w9SubmissionForm','w9SubmissionForm_text')">Choose
								File</button>
							<p id="w9SubmissionForm_text">No File Choosen</p>
						</div>
                    `;
					parent2.appendChild(newDiv);
				}


				//
				addMajorProduct(data.data.productsList)
				//				addLogisticServiceProvider(data.data.logisticServiceProvider)
				//				addYearExportRow(data.data.exporterList)
				addListOfMajorCustomer(data.data.majorCustomers)
				//				(exporterList)
				hideAllContent();
				$("#LegalInformationContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});
}

function showFinancialDetails() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerFinancialDetails")
		.then(data => {
			if (data) {
				console.log(data)
				addToId(data, companyIdForSeller)
				const otherColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "financialYear",
					title: "Financial Year",
					orderable: false,
				},
				{
					data: "turnover",
					title: "Annual Turnover",
					orderable: false,
				},


				];
				sellerTables("turnover", otherColumns, data.data.annualTurnoverList)

				hideAllContent();
				$("#FinancialDetailsContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});


}

function showTechnicalCapabilities() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerTechnicalDetails")
		.then(data => {
			if (data) {
				console.log(data)
				addToId(data, companyIdForSeller)

				const otherColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "totalEmployees",
					title: "Total No. of Employees",
					orderable: false,
				},
				{
					data: "supervisiors",
					title: "Supervisors",
					orderable: false,
				},
				{
					data: "enggDegreeOrDiploma",
					title: "Engg. Degree/Diploma Holders",
					orderable: false,
				},
				{
					data: "skilledWorkers",
					title: "Skilled Workers",
					orderable: false,
				},
				{
					data: "address",
					title: "Design Department",
					orderable: false,
				}, {
					data: "qualityAndInspection",
					title: "Quality Control & Inspection",
					orderable: false,
				},
				];
				const MachiningColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "details",
					title: "Details of facility available",
					orderable: false,
				},
				{
					data: "remarks",
					title: "Remarks if any ",
					orderable: false,
				},

				];
				const FactoryColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "factoryName",
					title: "Factory Name",
					orderable: false,
				},
				{
					data: "area",
					title: "Area in Square Meter",
					orderable: false,
				}, {
					data: "address",
					title: "Address",
					orderable: false,
				},

				];
				// Assuming factoryList is your array
				const Machining = [];
				const Inspection = [];
				data.data.factoryList.forEach(factory => {
					factory.facilityList.forEach(item => {
						if (item.type === "Machining") {
							Machining.push(item);
						}
						if (item.type === "Inspection") {
							Inspection.push(item);
						}
					});
				});
				console.log(Inspection, Machining)

				// Now newData will contain only the items where at least one facility has type "machining"

				sellerTables("Factory", FactoryColumns, data.data.factoryList)
				sellerTables("manpower", otherColumns, data.data.factoryList)
				sellerTables("Machining", MachiningColumns, Machining)
				sellerTables("Inspection", MachiningColumns, Inspection)
				addRegAddressOfFactory(data.data.factoryList, Machining, Inspection)

				hideAllContent();
				$("#TechnicalCapabilitiesContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});


}

function showCertificatesCompliance() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerCertificatesDetails")
		.then(data => {
			if (data) {
				console.log(data)
				let keysToMatch = []
				if (BackendCountry == "US") {
					keysToMatch = ['asCertificationUrl', 'fdaRegisterationUrl', 'isoCertificationUrl', 'oshaCertificationUrl', 'otherCertificationsUrl'];

				} else {
					keysToMatch = ['asCertificationUrl', 'environmentalRegulationsComplianceUrl', 'indianStandardsComplianceUrl', 'isoCertificationUrl', 'laborLawComplianceUrl', 'otherCertificationsUrl'];

				}

				const fieldNameMap = {
					asCertificationUrl: 'AS Certification',
					environmentalRegulationsComplianceUrl: 'Environmental Regulations Compliance',
					fdaRegisterationUrl: 'FDA Registration',
					indianStandardsComplianceUrl: 'Indian Standards Compliance',
					isoCertificationUrl: 'ISO Certification',
					laborLawComplianceUrl: 'Labor Law Compliance',
					oshaCertificationUrl: 'OSHA Certification',
					otherCertificationsUrl: 'Other Certifications'
				};

				// Accessing the name for a specific key
				console.log(fieldNameMap['asCertificationUrl']); // Output: AS Certification
				var CertificatesParent = document.getElementById("CertificatesParent");
				CertificatesParent.innerHTML = ""
				CertificatesParent.innerHTML = `<div class="col-12">
							<h6 class="section-heading">Certificates & Compliance</h6>
						</div>`
				for (const key of keysToMatch) {
					const url = data.data[key];
					if (url) {
						const fieldName = fieldNameMap[key]; // Get the corresponding field name from the map
						buildCertificatesCompliance(url, key, fieldName, "Download", `window.open('${url}', '_blank')`);
					} else {
						const fieldName = fieldNameMap[key]; // Get the corresponding field name from the map
						buildCertificatesCompliance("", key, fieldName, "", "");

					}
				}
				const ModalCertificatesParent = document.getElementById("ModalCertificatesParent");
				ModalCertificatesParent.innerHTML = "";
				for (const key of keysToMatch) {
					const url = data.data[key];
					const idKey = key.replace('Url', 'Id');
					const id = data.data[idKey];
					const fieldName = fieldNameMap[key];

					if (fieldName) { // Ensure fieldName exists in the map
						buildModalCertificatesCompliance(id, key, fieldName, url, ModalCertificatesParent);
					}
				}

				hideAllContent();
				$("#CertificatesComplianceContent").css("display", "flex");


				//for getting all certificate inputs after dom paint for validation
				getCertificatesInputs()
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});



}
function buildModalCertificatesCompliance(id, key, fieldName, url, CertificatesParent) {
	const inputId = `${key}_input`;
	const textId = `${key}_text`;
	const errId = `${key}_err`;

	const newDiv = document.createElement("div");
	newDiv.className = "col-lg-6 col-md-12 col-sm-12 col-12";

	newDiv.innerHTML = `
        <div class="card-style-1">
            <h6 class="card-title">${fieldName}</h6>
            <div class="file-input-field-group p-0">
                <input name="${key.replace('Url', 'Id')}" value="${id != null ? id : ""}" hidden>
                <input type="file" id="${inputId}" name="${key.replace('Url', 'File')}" class="input-field" accept=".pdf, .jpg, .png, .jpeg" placeholder="File" required autocomplete="off" hidden>
                <button class="input-btn" type="button" onclick="handleClick('${inputId}', '${textId}')">Choose File</button>
                <p id="${textId}">${url ? 'File Uploaded' : 'No File Chosen'}</p>
            </div>
            <span id="${errId}" class="err-text"></span>
        </div>
    `;

	CertificatesParent.appendChild(newDiv);
}

function buildCertificatesCompliance(url, key, fieldName, text, onclick) {
	var CertificatesParent = document.getElementById("CertificatesParent");
	var content = document.createElement('div');

	content.className = "col-lg-4 col-md-6 col-sm-12 col-12";
	content.innerHTML = `
        <div class="card-style-1">
            <h6 class="card-title">${fieldName}</h6>
            <div class="file-input-field-group p-0">
                <input type="file" id="indianStandardsComplianceFile_input"
                    name="indianStandardsComplianceFile" class="input-field"
                    placeholder="File" required autocomplete="off" hidden>
                 <button class="input-btn" type="button"
                   onclick="${onclick}">${text}</button>
        
            </div>
            <span id="indianStandardsComplianceFile_err" class="err-text"></span>
        </div>
    `;

	CertificatesParent.appendChild(content);
}

function showReferences() {
	let sellerId = companyIdForSeller ? companyIdForSeller.companyId : "";

	apiCall(sellerId, "/getSellerReferencesDetails")
		.then(data => {
			if (data) {
				console.log(data);

				const signatureImg = document.getElementById("signatureUrl");
				if (data.data.signatureUrl) {
					forSignature(signatureImg, data.data.signatureUrl);
				}

				const declarationDate = document.getElementById("declarationDate");
				declarationDate.innerHTML = data.data.declarationDate;

				const otherColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				}, {
					data: "description",
					title: "Customer Testimonials / Awards",
					orderable: false,
				}];

				sellerTables("Testimonials", otherColumns, data.data.testimonialsList);
				caseStudy(data.data.testimonialsList);

				var parent = document.getElementById("ProjectCaseStudies");
				parent.innerHTML = ""
				if (parent) {
					const newDiv = document.createElement("div");
					newDiv.className = "col-lg-4 col-md-6 col-sm-12 col-12";
					newDiv.innerHTML = `
                        <div class="card-style-1">
                            <h6 class="card-title">Project CaseStudy</h6>
                            <div class="file-input-field-group p-0">
                                <input name="projectCaseStudiesId" value="${data.data.projectCaseStudiesId}" hidden>
                                <input type="file" id="projectCaseStudiesFile_input" name="projectCaseStudiesFile" class="input-field" placeholder="File" required autocomplete="off" hidden>
                                <button class="input-btn" type="button" onclick="window.open('${data.data.projectCaseStudiesUrl}', '_blank')">Download</button>
                            </div>
                            <span id="projectCaseStudiesFile_err" class="err-text"></span>
                        </div>
                    `;
					parent.appendChild(newDiv);
				}

				hideAllContent();
				$("#ReferencesContent").css("display", "flex");

			}
		})
		.catch(error => {
			console.error('Error:', error);
		});
}

function showSupplierReferenceProgram() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerPermissionDetails")
		.then(data => {
			if (data) {
				console.log(data)
				addToId(data, companyIdForSeller)
				checkCheckbox(data.data.permissionModel)
				hideAllContent();
				$("#SupplierReferenceProgramContent").css("display", "flex");

			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});

}
function checkCheckbox(args) {
	// Set the ID in the modal
	$(".modal#edit-permission input[name='permissionModel.id']").val(args.id);

	// Update checkboxes
	Object.keys(args).forEach(function (key) {
		if (key === "signatureFile" || key === "id" || key === "declerationDate" || key === "signatureUrl") {
			return;
		}

		["#permission", ".modal#edit-permission #permission"].forEach(function (selector) {
			var checkbox = document.querySelector(`${selector} #${key}`);
			if (checkbox && checkbox.type === "checkbox") {
				if (selector === ".modal#edit-permission #permission") {
					checkbox = document.querySelector(`input[name='permissionModel.${key}']`);
				}
				checkbox.checked = args[key];


				if (selector === "#permission") {
					checkbox.disabled = true;
				}
			}
		});
	});

	// Update date and signature elements
	["#lastStepDiv", ".modal#edit-permission"].forEach(function (selector) {
		var date = document.querySelector(`${selector} #customerReferenceDeclerationDate`);
		var sign = document.querySelector(`${selector} #customerReferenceSignatureUrl`);

		if (selector === ".modal#edit-permission") {
			if (date) date.value = args.declerationDate || "";
			if (sign) {
				sign.setAttribute('src', "");
				sign.setAttribute('src', args.signatureUrl);
			}
		} else {
			if (date) date.innerHTML = args.declerationDate || "";
			if (sign && args.signatureUrl) forSignature(sign, args.signatureUrl);
		}
	});
}



function hideAllContent() {
	// Hide all content sections
	$("#CompanyInformationContent").css("display", "none");
	$("#LegalInformationContent").css("display", "none");
	$("#FinancialDetailsContent").css("display", "none");
	$("#TechnicalCapabilitiesContent").css("display", "none");
	$("#CertificatesComplianceContent").css("display", "none");
	$("#ReferencesContent").css("display", "none");
	$("#SupplierReferenceProgramContent").css("display", "none");
}


function sellerTables(tableId, columns, list) {
	console.log(tableId, columns, list)
	SellerTables = $("#" + tableId)
		.DataTable(
			{
				destroy: true,
				borderless: false,
				hover: false,
				selectable: false,
				responsive: false,
				dom: "t",
				autoWidth: false,
				paging: false,
				sm: false,
				data: list,
				stripeClasses: [],
				oLanguage: {
					sEmptyTable: `<div id="NoData2"
										style="display: flex;  min-height: 350px; flex: 1; justify-content: center; align-items: center; flex-direction: column;">
										<img style="position: initial; " class="icon" src="assets/icons/Group.svg"> No Data
										Available
									</div>`,
				},
				lengthMenu: [[15, 25, 50, 100, -1],
				[15, 25, 50, 100, "All"],],
				ordering: true,
				columns: columns,
				columnDefs: [{
					"defaultContent": "-",
					"targets": "_all"
				}],
				rowCallback: function (row, data, index) {
					$('td:eq(0)', row).html(index + 1);
				}
			});
}
function forSignature(div, url) {
	console.log(div)
	const isImage = (url) => {
		return url.match(/\.(jpeg|jpg|gif|png)$/) != null;
	};

	// Check if the provided URL is an image URL
	if (isImage(url)) {
		// Select the img element inside the specified div using jQuery
		var img = $("#" + div.id + " img");
		console.log(img)

		// Update the src attribute of the img element with the new URL
		img.attr('src', url);
	} else {
		console.error('Invalid image URL:', url);
	}
}


function apiCall(rowData, url) {
	return fetch(contextPath + url, {
		method: 'GET', // or 'GET', 'PUT', etc.
		headers: {
			'Content-Type': 'application/json'
			// Add any other headers if needed
		},
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.json();
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});
}

function addToId(rowData) {



	Object.keys(rowData.data).forEach(function (key) {
		var div = $(".sellerProfiles  [name='" + key + "']");


		var value = rowData.data[key] ? rowData.data[key] : "";

		if (key === "personalEmailVerified") {
			if (value === true) {
				$(".verification-status").addClass("green");
				$(".verification-status").html("verified");
			}

		} if (key === "contactPersonModels" && rowData.data.contactPersonModels.length > 0) {

			addModalInputs(rowData.data.contactPersonModels)


		} if (key === "annualTurnoverList" && rowData.data.annualTurnoverList.length > 0) {
			var country
			if (rowData.data.routingNo != "") {
				country = "US"
			} else {
				country = "IN"
			}
			editAnnualYearTurnover(rowData.data.annualTurnoverList, country)
		}

		if (key === "companyLogoUrl" || key === "companySignatureUrl" || key === "companyLogoId" || key === "companySignatureId") {
			var value = rowData.data[key] ? rowData.data[key] : "";

			if (key === "companyLogoId") {
				$("#ModalcompanyLogoUrl input[name='companyLogoId']").val(value);
			}
			if (key === "companySignatureId") {
				$("input[name='companySignatureId']").val(value);
			}
		} else if (!div.length) {
			if (key === "addressId" || key === "bankId" || key === "contactPersonId" || key === "annualTurnoverId" || key == "customerReferencePersonId") {
				div = $(".modal [name='" + key + "']");
				if (div.length) {
					div.html(value);
					div.val(value)
				}
			}
			return;
		} else {
			div.html(value);


		}
		var inputs = document.querySelectorAll('.custom-edit-modal input[name="' + key + '"]');
		var selects = document.querySelectorAll('.custom-edit-modal select[name="' + key + '"]');
		// console.log(selects)

		// Update the value of the matching input elements

		inputs.forEach(input => {
			if (input.type !== 'file') {  // Skip file inputs
				input.value = value;
			}
		});

		selects.forEach(select => {
			// Remove disabled attribute temporarily
			const wasDisabled = select.disabled;
			if (wasDisabled) {
				select.disabled = false;
			}

			let optionFound = false;
			Array.from(select.options).forEach(option => {
				if (option.value === value) {
					option.selected = true;
					optionFound = true;
				}
			});


			// If the option is not found, add a new one with the value and select it
			if (!optionFound) {
				if (value == "")
					return

				const newOption = new Option(value, value, true, true);
				select.add(newOption);
			}

			// Restore disabled attribute if it was previously set
			if (wasDisabled) {
				select.disabled = true;
			}
		});

	});

}


function handleBackClick() {

	var displayDiv = $("#BuyerDiv");
	var tableDiv = $("#tableDiv");
	tableDiv.show()
	displayDiv.hide();

}
function References(args) {
	var References = document.getElementById("References");
	References.innerHTML = "";
	References.innerHTML = `<div class="col-12">
                    <h6 class="section-heading">References</h6>
                </div>`;

	for (var i = 0; i < args.length; i++) {
		var content = document.createElement('div');

		if (args.length == 1) {
			content.className = "col-12 row row-gap-24 ";
		} else if (i == args.length - 1) {
			content.className = "col-12 row row-gap-24 ";
			content.style.padding = "20px 10px";
		} else {
			content.className = "col-12 row row-gap-24  borderBottom";
			content.style.padding = "20px 10px";

		}
		content.id = "mainRow";
		content.innerHTML = `
                    <h4  class="section-heading">${i + 1}.</h4>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <h6 class="heading">Name</h6>
                        <p class="text">${args[i].name}</p>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-6">
                        <h6 class="heading">Company/Organization</h6>
                        <p class="text">${args[i].companyName}</p>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <h6 class="heading">Email</h6>
                        <p class="text">${args[i].email}</p>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-3">
                        <h6 class="heading">Phone</h6>
                        <p class="text">${args[i].phone}</p>
                    </div>`;
		References.appendChild(content);
	}
}
function contactPerson(args) {
	var ContactPersonParent = document.getElementById("ContactPersonParent");
	ContactPersonParent.innerHTML = "";
	ContactPersonParent.innerHTML = `
        <div class="col-12">
            <h6 class="section-heading">Contact Person</h6>
        </div>`;

	for (var i = 0; i < args.data.contactPersonModels.length; i++) {
		var content = document.createElement('div');

		if (args.data.contactPersonModels.length == 1) {
			content.className = "col-12 row row-gap-24 ";
		} else if (i == args.data.contactPersonModels.length - 1) {
			content.className = "col-12 row row-gap-24 ";
			content.style.padding = "20px 10px";
		} else {
			content.className = "col-12 row row-gap-24  borderBottom";
			content.style.padding = "20px 10px";
		}

		content.id = "mainRow";
		content.innerHTML = `
            <div class="row row-gap-24">
                <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                    <h6 class="heading">Name</h6>
                    <p class="text">${args.data.contactPersonModels[i].name}</p>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                    <h6 class="heading">Designation</h6>
                    <p class="text">${args.data.contactPersonModels[i].designation}</p>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                    <h6 class="heading">Email</h6>
                    <p class="text">${args.data.contactPersonModels[i].email}</p>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                    <h6 class="heading">Phone</h6>
                    <p class="text">${args.data.contactPersonModels[i].phone}</p>
                </div>
            </div>`;

		if (i == 0 && isApproved !== "true") {
			var icon = document.createElement('div');
			icon.innerHTML = `
                <img class="icon" src="assets/icons/edit.svg" alt="edit" data-bs-toggle="modal" data-bs-target="#edit-contact-person">
            `;
			content.appendChild(icon);
		}

		ContactPersonParent.appendChild(content);
	}
}


function addModalInputs(contactPersonModels) {
	var ContactPersonParent = document.getElementById("modalContactPerson");
	ContactPersonParent.innerHTML = "";
	ContactPersonParent.innerHTML = `
       <h3 class="heading">Contact Person</h3>
					`;
	ContactPersonCount = contactPersonModels.length;
	for (var i = 0; i < contactPersonModels.length; i++) {
		var contact = contactPersonModels[i];
		var content = document.createElement('div');

		if (contactPersonModels.length == 1) {
			content.className = "col-12  ";
		} else if (i == contactPersonModels.length - 1) {
			content.className = "col-12  ";
			content.style.padding = "20px 10px";
		} else {
			content.className = "col-12   borderBottom";
			content.style.padding = "20px 10px";
		}

		content.id = "";
		if (i == 0) {
			content.innerHTML = `
			   <div class="row row-gap-24">
				   <h4>Contact Person ${i + 1}</h4>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
						
								<div class="field-group">
								<input name="contactPersonModels[${i}].id" value="${contact.id}" hidden>
									<input type="text" name="contactPersonModels[${i}].name" id="contactPersonName_${i}" class="input-field"
										placeholder="Name" required autocomplete="on" value="${contact.name}"> 
									<label for="contactPersonName_${i}" class="input-label">Name
										<span class="required-asterisk">*</span></label>
									<span id="contactPersonName_${i}_err" class="err-text larger-err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonModels[${i}].designation" id="contactPersonDesignation_${i}"
										class="input-field" placeholder="Designation" required
										autocomplete="on" value="${contact.designation}"> 
									<label for="contactPersonDesignation_${i}" class="input-label">Designation
										<span class="required-asterisk">*</span></label> 
									<span id="contactPersonDesignation_${i}_err" class="err-text larger-err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="contactPersonModels[${i}].email" id="contactPersonEmail_${i}"
										class="input-field" placeholder="Email" required
										autocomplete="on" value="${contact.email}"> 
									<label for="contactPersonEmail_${i}" class="input-label">Email
										<span class="required-asterisk">*</span></label> 
									<span id="contactPersonEmail_${i}_err" class="err-text larger-err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonModels[${i}].phone" id="contactPersonPhone_${i}" class="input-field"
										placeholder="Phone" required autocomplete="on"
										value="${contact.phone}" maxlength="10"> 
									<label for="contactPersonPhone_${i}" class="input-label">Phone
										<span class="required-asterisk">*</span></label> 
									<span id="contactPersonPhone_${i}_err" class="err-text larger-err-text"></span>
								</div>
							</div>
						</div>`;
		} else {
			content.innerHTML = `
			   <div class="row row-gap-24">
				   <h4>Contact Person ${i + 1}</h4>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
						
								<div class="field-group">
								<input name="contactPersonModels[${i}].id" value="${contact.id}" hidden>
									<input type="text" name="contactPersonModels[${i}].name" id="contactPersonName_${i}" class="input-field"
										placeholder="Name" autocomplete="on" value="${contact.name}"> 
									<label for="contactPersonName_${i}" class="input-label">Name</label>
									<span id="contactPersonName_${i}_err" class="err-text larger-err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonModels[${i}].designation" id="contactPersonDesignation_${i}"
										class="input-field" placeholder="Designation" 
										autocomplete="on" value="${contact.designation}"> 
									<label for="contactPersonDesignation_${i}" class="input-label">Designation</label> 
									<span id="contactPersonDesignation_${i}_err" class="err-text larger-err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="email" name="contactPersonModels[${i}].email" id="contactPersonEmail_${i}"
										class="input-field" placeholder="Email" 
										autocomplete="on" value="${contact.email}"> 
									<label for="contactPersonEmail_${i}" class="input-label">Email</label> 
									<span id="contactPersonEmail_${i}_err" class="err-text larger-err-text"></span>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="contactPersonModels[${i}].phone" id="contactPersonPhone_${i}" class="input-field"
										placeholder="Phone"  autocomplete="on"
										value="${contact.phone}" maxlength="10"> 
									<label for="contactPersonPhone_${i}" class="input-label">Phone</label> 
									<span id="contactPersonPhone_${i}_err" class="err-text larger-err-text"></span>
								</div>
							</div>
						</div>`;
		}

		ContactPersonParent.appendChild(content);
	}
	var buttonContent = document.createElement('div');
	buttonContent.innerHTML = `
        <button class="btn-style-2 w-100 mt-16" type="button"
            onclick="addNewContactPersonRow(${ContactPersonCount})">+ Add Other</button>`;

	ContactPersonParent.appendChild(buttonContent);

	//get all inputs that are created dynamically for validations
	getContactPersonInputs()
}


var ContactPersonCount
function addNewContactPersonRow() {
	// Assuming args is an array or collection of contacts
	ContactPersonCount++; // Increment the count
	var heading = ContactPersonCount

	ContactPersonCount
	var ContactPersonParent = document.getElementById("modalContactPerson");
	// Create a new row element
	var newRow = document.createElement('div');
	newRow.className = 'row row-gap-24';
	newRow.style.padding = "20px 10px";

	// Construct the HTML content for the new row

	newRow.innerHTML = `
    <h4>Contact Person ${heading}</h4>
        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
            <div class="field-group">
                <input name="contactPersonModels[${ContactPersonCount - 1}].id" hidden>
                <input type="text" name="contactPersonModels[${ContactPersonCount - 1}].name" id="contactPersonName_${ContactPersonCount - 1}" class="input-field"
                    placeholder="Name"  autocomplete="on"> 
                <label for="contactPersonName_${ContactPersonCount - 1}" class="input-label">Name
                    </label>
                <span id="contactPersonName_${ContactPersonCount - 1}_err" class="err-text larger-err-text"></span>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
            <div class="field-group">
                <input type="text" name="contactPersonModels[${ContactPersonCount - 1}].designation" id="contactPersonDesignation_${ContactPersonCount - 1}"
                    class="input-field" placeholder="Designation" 
                    autocomplete="on" > 
                <label for="contactPersonDesignation_${ContactPersonCount - 1}" class="input-label">Designation
                 </label> 
                <span id="contactPersonDesignation_${ContactPersonCount - 1}_err" class="err-text larger-err-text"></span>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
            <div class="field-group">
                <input type="email" name="contactPersonModels[${ContactPersonCount - 1}].email" id="contactPersonEmail_${ContactPersonCount - 1}"
                    class="input-field" placeholder="Email" 
                    autocomplete="on"> 
                <label for="contactPersonEmail_${ContactPersonCount - 1}" class="input-label">Email
                    </label> 
                <span id="contactPersonEmail_${ContactPersonCount - 1}_err" class="err-text larger-err-text"></span>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
            <div class="field-group">
                <input type="text" name="contactPersonModels[${ContactPersonCount - 1}].phone" id="contactPersonPhone_${ContactPersonCount - 1}" class="input-field"
                    placeholder="Phone"  autocomplete="on" maxlength="10"
                   > 
                <label for="contactPersonPhone_${ContactPersonCount - 1}" class="input-label">Phone
                    </label> 
                <span id="contactPersonPhone_${ContactPersonCount - 1}_err" class="err-text larger-err-text"></span>
            </div>
        </div>
    `;
	// Get the last child of ContactPersonParent
	var lastChild = ContactPersonParent.lastElementChild;

	// Insert the new row before the last child
	ContactPersonParent.insertBefore(newRow, lastChild);

	//get all inputs that are created dynamically for validations
	getContactPersonInputs()
}

function editAnnualYearTurnover(args, countrySelectedByUser) {
	// Assume annualTurnoverParent is the parent element where new rows will be added
	ContactAnnualYear = args.length
	const annualTurnoverParent = document.getElementById('annual-turnover-parent');
	annualTurnoverParent.innerHTML = ""
	// Iterate over each bank object in the args array
	for (let i = 0; i < args.length; i++) {
		const bank = args[i];
		const count = i + 1; // Use the current index + 1 for count

		// Create a new div element to hold the new fields
		const newDiv = document.createElement("div");
		newDiv.className = " col-md-12 row gx-4";

		// Set the content for the new section
		newDiv.innerHTML = `
            <h6 class="input-section-heading mb-8">${count}.</h6>
            <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
                <input id="" name="annualTurnoverList[${i}].id" value="${bank.id}" hidden>
                <div class="field-group select-field-group">
                    <select name="annualTurnoverList[${i}].financialYear" value="${bank.financialYear}" id="turnover_financial_year_${i}" class="input-field form-dropdown" autocomplete="off">
                          ${generateAnnualTurnoverOptions(bank.financialYear)}
                    </select>
                    <label for="turnover_financial_year_${i}" class="input-label">Select</label>
                    <span id="turnover_financial_year_${i}_err" class="err-text"></span>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
                <div class="field-group d-flex position-relative align-items-center">
                    <div class="input-group-prepend position-absolute" style="left: 10px; width: 32px; height: 32px;">
                        ${countrySelectedByUser === "IN" ? `
                            <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 4px;">INR</span>
                        ` : `
                            <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 3px;">USD</span>
                        `}
                    </div>
                    <input type="number" name="annualTurnoverList[${i}].turnover" value="${bank.turnover}" id="turnover_value_${i}" style="padding-left:50px;" class="input-field" placeholder="Annual Turnover" autocomplete="off">
                    <label for="turnover_value_${i}" style="left:50px;" class="input-label">Annual Turnover</label>
                </div>
                <span id="turnover_value_${i}_err" class="err-text"></span>
            </div>
        `;

		// Append the new section to the parent element
		annualTurnoverParent.appendChild(newDiv, countrySelectedByUser);
	}
	const addButtonDiv = document.createElement("div");
	addButtonDiv.className = "col-12 mt-16";
	addButtonDiv.innerHTML = `
        <button class="btn-style-2 w-100" type="button" onclick="addAnotherAnnualYearTurnover(${ContactAnnualYear}, '${countrySelectedByUser}')">+ Add Another</button>
    `;
	annualTurnoverParent.appendChild(addButtonDiv);

	//get all inputs that are created dynamically for validations
	getAnnualTurnoverInputs()
}
function generateAnnualTurnoverOptions(selectedOption) {
	var options = '<option value="" selected>Financial year</option>';
	for (let year = new Date().getFullYear(); year >= 1900; year--) {
		var optionValue = `${year - 1}-${String(year).slice(-2)}`;
		if (selectedOption && selectedOption === optionValue) {
			options += `<option value="${optionValue}" selected>${optionValue}</option>`;
		} else {
			options += `<option value="${optionValue}">${optionValue}</option>`;
		}
	}
	return options;
}
var ContactAnnualYear
function addAnotherAnnualYearTurnover(args, countrySelectedByUser) {
	// Assuming args is an array or collection of contacts

	ContactAnnualYear++; // Increment the count
	const annualTurnoverParent = document.getElementById('annual-turnover-parent');

	// Create a new div element to hold the new fields
	var newDiv = document.createElement("div");
	newDiv.className = "col-md-12 row  gx-4";

	// Set the content for the new section
	newDiv.innerHTML = `
        <h6 class="input-section-heading mb-8">${ContactAnnualYear}.</h6>
        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
            <div class="field-group select-field-group">
                <select name="annualTurnoverList[${ContactAnnualYear - 1}].financialYear" id="turnover_financial_year_${ContactAnnualYear - 1}" class="input-field form-dropdown"  autocomplete="off">
                    ${generateAnnualTurnoverOptions()}
                </select>
                <label for="turnover_financial_year_${ContactAnnualYear - 1}" class="input-label">Select</label>
                <span id="turnover_financial_year_${ContactAnnualYear - 1}_err" class="err-text"></span>

            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
            <div class="field-group d-flex position-relative align-items-center">

                <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                    ${countrySelectedByUser == "IN" ? `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 4px;">INR</span>
					                        ` : `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 3px;">USD</span>
					                        `} 
                                            </div>
                <input type="number" name="annualTurnoverList[${ContactAnnualYear - 1}].turnover" id="turnover_value_${ContactAnnualYear - 1}" style="padding-left:50px;" class="input-field" placeholder="Annual Turnover"  autocomplete="off">
                <label for="turnover_value_${ContactAnnualYear - 1}" style="left:50px;" class="input-label">Annual Turnover</label>

                </div>
                <span id="turnover_value_${ContactAnnualYear - 1}_err" class="err-text"></span>

        </div>
    `;

	var lastChild = annualTurnoverParent.lastElementChild;

	// Insert the new row before the last child
	annualTurnoverParent.insertBefore(newDiv, lastChild);


	//get all inputs that are created dynamically for validations
	getAnnualTurnoverInputs()

}
var caseStudyCounter;

function caseStudy(args) {
	caseStudyCounter = args.length;
	const editCaseStudies = document.getElementById('testimonials-list-parent');
	editCaseStudies.innerHTML = "";

	for (let i = 0; i < args.length; i++) {
		const count = i + 1;
		const bank = args[i];

		const newDiv = document.createElement("div");
		newDiv.className = "col-md-12 row gx-4";

		newDiv.innerHTML = `
            <div class="col-12">
                <h6 class="input-section-heading mb-8">${count}.</h6>
            </div>
            <input name="testimonialsList[${i}].id" value="${args[i].id}" hidden>
            <div class="col-lg-9 col-md-6 col-sm-12 col-12 mb-16">
                <div class="field-group">
                    <input type="text" name="testimonialsList[${i}].description" value="${args[i].description}"
                        id="testimonials_or_awards_${i}" class="input-field"
                        placeholder="Customer Testimonials / Awards" autocomplete="off">
                    <label for="testimonials_or_awards_${i}" class="input-label">Customer
                        Testimonials / Awards</label> 
                    <span id="testimonials_or_awards_${i}_err" class="err-text"></span>
                </div>
            </div>
            ${i == caseStudyCounter - 1 ? `
            <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="testimonials-btn-${i}">
                <button class="btn-style-2 w-100" type="button"
                    onclick="addAnotherTestimonialList()">+ Add Other</button>
            </div>` : ''}
        `;
		editCaseStudies.appendChild(newDiv);
	}

	//get all inputs that are created dynamically for validations
	getTestimonialsInputs()
}

function addAnotherTestimonialList() {
	const newIndex = caseStudyCounter++;
	const newDiv = document.createElement("div");
	newDiv.className = "col-md-12 row gx-4";
	newDiv.innerHTML = `
        <div class="col-12">
            <h6 class="input-section-heading mb-8">${newIndex + 1}.</h6>
        </div>
        <div class="col-lg-9 col-md-6 col-sm-12 col-12 mb-16">
            <div class="field-group">
             <input name="testimonialsList[${newIndex}].id" hidden>
           
                <input type="text" name="testimonialsList[${newIndex}].description"
                    id="testimonials_or_awards_${newIndex}" class="input-field"
                    placeholder="Customer Testimonials / Awards" autocomplete="off">
                <label for="testimonials_or_awards_${newIndex}" class="input-label">Customer
                    Testimonials / Awards</label> 
                <span id="testimonials_or_awards_${newIndex}_err" class="err-text"></span>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="testimonials-btn-${newIndex}">
            <button class="btn-style-2 w-100" type="button"
                onclick="addAnotherTestimonialList()">+ Add Other</button>
        </div>
    `;

	const editCaseStudies = document.getElementById('testimonials-list-parent');
	editCaseStudies.appendChild(newDiv);

	// Hide the previous "Add Other" button
	if (newIndex > 0) {
		const previousButton = document.getElementById(`testimonials-btn-${newIndex - 1}`);
		if (previousButton) {
			previousButton.style.display = 'none';
		}
	}

	//get all inputs that are created dynamically for validations
	getTestimonialsInputs()
}


// work to be done from here


var country = document.getElementById('country')

//function for adding List of Major Products
var parentElement = document.querySelector('#major-product-row');
var productCount
function addMajorProduct(args) {

	// Increment the product count
	productCount = args.length;
	parentElement.innerHTML = ""
	// Create a new column div
	for (i = 0; i < productCount; i++) {
		var newColumn = document.createElement('div');
		newColumn.className = 'col-lg-3 col-md-6 col-sm-12 col-12';
		newColumn.innerHTML = `<div class="field-group">
									<input name="productsList[${i}].id" value=${args[i].id} hidden>
                                    <input type="text" name="productsList[${i}].productName"  value="${args[i].productName}" id="productName_${i}" class="input-field"
                                        placeholder="Name of Major Product ${productCount}" autocomplete="off">
                                    <label for="productName_${i}" class="input-label">Name of Major Product
                                        ${i + 1}</label>
                                        <span id="productName_${i}_err" class="err-text"></span>
                                </div>`;

		// Append the new column to the parent element
		//    parentElement.insertBefore(newColumn, parentElement.lastElementChild);
		parentElement.appendChild(newColumn);

	}
	const buttonColumn = document.createElement('div');
	buttonColumn.className = 'col-lg-3 col-md-6 col-sm-12 col-12';
	buttonColumn.innerHTML = `<button class="btn-style-2 w-100" type="button" onclick="addAnotherMajorProduct()">+ Add Other</button>`;
	parentElement.appendChild(buttonColumn);

	//get all inputs that are created dynamically for validations
	getProductAndOemInputs()
}
function addAnotherMajorProduct() {
	// Increment the product count

	productCount++
	// Create a new column div
	var newColumn = document.createElement('div');
	newColumn.className = 'col-lg-3 col-md-6 col-sm-12 col-12';
	newColumn.innerHTML = `<div class="field-group">
									<input name="productsList[${productCount - 1}].id"  hidden>
                                    <input type="text" name="productsList[${productCount - 1}].productName" id="productName_${productCount - 1}" class="input-field"
                                        placeholder="Name of Major Product ${productCount}" autocomplete="off">
                                    <label for="productName_${productCount - 1}" class="input-label">Name of Major Product
                                        ${productCount}</label>
                                        <span id="productName_${productCount - 1}_err" class="err-text"></span>

                                </div>`;

	// Append the new column to the parent element
	parentElement.insertBefore(newColumn, parentElement.lastElementChild);

	//get all inputs that are created dynamically for validations
	getProductAndOemInputs()
}


//function for adding Another OEM Details Row
var oemParentRow = document.querySelector('#oem-details-parent');
var oemCount
function addOEMDetails(args) {
	// Increment the row count
	oemCount = args.length
	let countrySelected = country
	// Create a new row div
	for (let i = 0; i < args.length; i++) {
		var newRow = document.createElement('div');

		// Set inner HTML for the new row
		newRow.innerHTML = `
            <div class="row">
                                <h6 class="input-section-heading mb-8">${i + 1}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
           						 <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                <input name="oemModels[${i}].id" value="${args[i].id}" hidden>
                                    <input type="text" name="oemModels[${i}].supplyingTo" value="${args[i].supplyingTo}" id="oem_supplying_to_${i}" class="input-field"
                                        placeholder="OEM Supplying to"  autocomplete="off">
                                    <label for="oem_supplying_to_${i}" class="input-label">OEM Supplying to</label>
                                    <span id="oem_supplying_to_${i}_err" class="err-text"></span>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group">
                                    <select  name="oemModels[${i}].supplierSince" value="${args[i].supplierSince}" id="supplier_since_${i}"
                                        class="input-field form-dropdown"  autocomplete="off">
                                        ${generateYearOptions()}
                                        
                                    </select>
                                    <label for="supplier_since_${i}" class="input-label">Select
                                    </label>
                                    <span id="supplier_since_${i}_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group d-flex position-relative align-items-center">
                                <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                ${countrySelected != "US" ? `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 4px;">INR</span>
					                        ` : `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 3px;">USD</span>
					                        `} </div>
                                    <input type="number" name="oemModels[${i}].value" value="${args[i].value}" id="oem_value_${i}" style="padding-left:50px;"
                                        class="input-field" placeholder="Value"  autocomplete="off">
                                    <label for="oem_value_${i}" style="left:50px;" class="input-label">Value</label>

                                    </div>
                                    <span id="oem_value_${i}_err" class="err-text"></span>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group">
                                    <select value="${args[i].vendorRating}" name="oemModels[${i}].vendorRating" id="vendor_rating_${i}"
                                        class="input-field form-dropdown" autocomplete="off">
                                        <option value="" selected>Vendor Rating</option>
                                        <option value="5">5</option>
                                        <option value="4">4</option>
                                        <option value="3">3</option>
                                        <option value="2">2</option>
                                        <option value="1">1</option>
                                    </select>
                                    <label for="vendor_rating_${i}" class="input-label">Select</label>
                                    <span id="vendor_rating_${i}_err" class="err-text"></span>
                                </div>
                            </div></div>`;

		// Append the new row to the parent row
		oemParentRow.insertBefore(newRow, oemParentRow.lastElementChild);
		// oemParentRow.appendChild(newRow);
		customSelectInitialization()
	}

	updateSelectElements(args);

	//get all inputs that are created dynamically for validations
	getProductAndOemInputs()
}

function updateSelectElements(args) {
	args.forEach((item, index) => {
		// Update the supplierSince select element
		let supplierSinceSelect = document.querySelector(`select[name="oemModels[${index}].supplierSince"]`);
		if (supplierSinceSelect) {
			supplierSinceSelect.value = item.supplierSince;
			let optionFound = Array.from(supplierSinceSelect.options).some(option => option.value === item.supplierSince);
			if (!optionFound) {
				const newOption = new Option(item.supplierSince, item.supplierSince, true, true);
				supplierSinceSelect.add(newOption);
			}
		}

		// Update the vendorRating select element
		let vendorRatingSelect = document.querySelector(`select[name="oemModels[${index}].vendorRating"]`);
		if (vendorRatingSelect) {
			vendorRatingSelect.value = item.vendorRating;
			let optionFound = Array.from(vendorRatingSelect.options).some(option => option.value === item?.vendorRating?.toString());
			if (!optionFound) {
				const newOption = new Option(item.vendorRating, item.vendorRating, true, true);
				vendorRatingSelect.add(newOption);
			}
		}
	});
}

function addAnotherOEMDetails() {
	// Increment the row count
	oemCount++;
	let countrySelected = country;
	// Create a new row div
	var newRow = document.createElement('div');

	// Set inner HTML for the new row
	newRow.innerHTML = `
            <div class="row">
                                <h6 class="input-section-heading mb-8">${oemCount}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="oemModels[${oemCount - 1}].supplyingTo" id="oem_supplying_to_${oemCount - 1}" class="input-field"
                                        placeholder="OEM Supplying to"  autocomplete="off">
                                    <label for="oem_supplying_to_${oemCount - 1}" class="input-label">OEM Supplying to</label>
                                    <span id="oem_supplying_to_${oemCount - 1}_err" class="err-text"></span>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group">
                                    <select name="oemModels[${oemCount - 1}].supplierSince" id="supplier_since_${oemCount - 1}"
                                        class="input-field form-dropdown"  autocomplete="off">
                                        ${generateYearOptions()}
                                        
                                    </select>
                                    <label for="supplier_since_${oemCount - 1}" class="input-label">Select
                                    </label>
                                    <span id="supplier_since_${oemCount - 1}_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group d-flex position-relative align-items-center">
                                <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                ${countrySelected != "US" ? `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 4px;">INR</span>
					                        ` : `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 3px;">USD</span>
					                        `} </div>
                                    <input type="number" name="oemModels[${oemCount - 1}].value" id="oem_value_${oemCount - 1}" style="padding-left:50px;"
                                        class="input-field" placeholder="Value"  autocomplete="off">
                                    <label for="oem_value_${oemCount - 1}" style="left:50px;" class="input-label">Value</label>

                                    </div>
                                    <span id="oem_value_${oemCount - 1}_err" class="err-text"></span>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group">
                                    <select name="oemModels[${oemCount - 1}].vendorRating" id="vendor_rating_${oemCount - 1}"
                                        class="input-field form-dropdown" autocomplete="off">
                                        <option value="" selected>Vendor Rating</option>
                                        <option value="5">5</option>
                                        <option value="4">4</option>
                                        <option value="3">3</option>
                                        <option value="2">2</option>
                                        <option value="1">1</option>
                                    </select>
                                    <label for="vendor_rating_${oemCount - 1}" class="input-label">Select</label>
                                    <span id="vendor_rating_${oemCount - 1}_err" class="err-text"></span>

                                </div>
                            </div></div>`;

	// Append the new row to the parent row
	oemParentRow.insertBefore(newRow, oemParentRow.lastElementChild);
	// oemParentRow.appendChild(newRow);
	customSelectInitialization()

	//get all inputs that are created dynamically for validations
	getProductAndOemInputs()
}
//for Generating options
function generateYearOptions() {
	var currentYear = new Date().getFullYear();
	var options = '<option value="" selected>Supplier Since</option>';
	for (let year = currentYear; year >= 1900; year--) {
		options += `<option value="${year}">${year}</option>`;
	}
	return options;
}

//functions for Adding Another Customer 
var majorCustomerParent = document.querySelector('#list-of-major-customers-parent');
var customerRowCount

function addListOfMajorCustomer(args) {
	// Increment the row count
	customerRowCount = args.length
	majorCustomerParent.innerHTML = ""
	// Create a new row div
	for (let i = 0; i < args.length; i++) {
		var newList = document.createElement('div');

		// Set inner HTML for the new row
		newList.innerHTML = `<div class="row">
                                    <h6 class="input-section-heading mb-8">${i + 1}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                        <input name="majorCustomers[${i}].id" value="${args[i].id}" hidden>
                                            <input type="text" name="majorCustomers[${i}].name" value="${args[i].name}" id="customer_name_${i}" class="input-field"
                                                placeholder="Customer’s Name"  autocomplete="off">
                                            <label for="customer_name_${i}" class="input-label">Customer’s Name</label>
                                            <span id="customer_name_${i}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="majorCustomers[${i}].address" value="${args[i].address}" id="customer_address_${i}" class="input-field" placeholder="Address"
                                                 autocomplete="off">
                                            <label for="customer_address_${i}" class="input-label">Address</label>
                                            <span id="customer_address_${i}_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="majorCustomers[${i}].productSupplied" value="${args[i].productSupplied}" id="product_supplied_${i}" class="input-field"
                                                placeholder="Product Supplied"  autocomplete="off">
                                            <label for="product_supplied_${i}" class="input-label">Product Supplied</label>
                                            <span id="product_supplied_${i}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>`;

		// Append the new row to the parent row
		//	 majorCustomerParent.insertBefore(newList, majorCustomerParent.lastElementChild);
		majorCustomerParent.appendChild(newList);
	}

	//get all inputs that are created dynamically for validations
	getMajorCustomersInputs()
}

function addAnotherListOfMajorCustomer() {
	// Increment the row count
	customerRowCount++
	// Create a new row div
	var newList = document.createElement('div');

	// Set inner HTML for the new row
	newList.innerHTML = `<div class="row">
                                    <h6 class="input-section-heading mb-8">${customerRowCount}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                        <input name="majorCustomers[${customerRowCount - 1}].id"  hidden>
                                            <input type="text" name="majorCustomers[${customerRowCount - 1}].name"  id="customer_name_${customerRowCount - 1}" class="input-field"
                                                placeholder="Customer’s Name"  autocomplete="off">
                                            <label for="customer_name_${customerRowCount - 1}" class="input-label">Customer’s Name</label>
                                            <span id="customer_name_${customerRowCount - 1}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="majorCustomers[${customerRowCount - 1}].address"  id="customer_address_${customerRowCount - 1}" class="input-field" placeholder="Address"
                                                 autocomplete="off">
                                            <label for="customer_address_${customerRowCount - 1}" class="input-label">Address</label>
                                            <span id="customer_address_${customerRowCount - 1}_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="majorCustomers[${customerRowCount - 1}].productSupplied"  id="product_supplied_${customerRowCount - 1}" class="input-field"
                                                placeholder="Product Supplied"  autocomplete="off">
                                            <label for="product_supplied_${customerRowCount - 1}" class="input-label">Product Supplied</label>
                                            <span id="product_supplied_${customerRowCount - 1}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>`;

	// Append the new row to the parent row
	//	 majorCustomerParent.insertBefore(newList, majorCustomerParent.lastElementChild);
	majorCustomerParent.appendChild(newList);

	//get all inputs that are created dynamically for validations
	getMajorCustomersInputs()
}



//functions for Adding Another Logistics Service Provider 
var logisticServiceProviderParent = document.querySelector('#logistic-service-provider-parent');
var providerCount;
function addLogisticServiceProvider(args) {

	// Increment the row count
	providerCount = args.length

	// Create a new row div
	for (let i = 0; i < args.length; i++) {
		var providerRow = document.createElement('div');

		// Set inner HTML for the new row
		providerRow.innerHTML = `
            <div class="row">
                                    <h6 class="input-section-heading mb-8">${i + 1}.</h6>
                                    </div>
            <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                    
                                        <input name="logisticServiceProvider[${i}].id" value="${args[i].id}" hidden> 
                                        <div class="field-group">
                                            <input type="text" name="logisticServiceProvider[${i}].name" value="${args[i].name}" id="provider_name_${i}" class="input-field"
                                                placeholder="Name"  autocomplete="off">
                                            <label for="provider_name_${i}" class="input-label">Name</label>
                                            <span id="provider_name_${i}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="logisticServiceProvider[${i}].address" value="${args[i].address}" id="provider_address_${i}" class="input-field"
                                                placeholder="Address"  autocomplete="off">
                                            <label for="provider_address_${i}" class="input-label">Address</label>
                                            <span id="provider_address_${i}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="add-provider-${providerCount}-btn-col">
                                        <button class="btn-style-2 w-100" type="button" onclick="addAnotherLogisticServiceProvider()">+ Add Other</button>
                                    </div>
                                </div>

            `;

		// Append the new row to the parent row
		// logisticServiceProviderParent.insertBefore(providerRow, logisticServiceProviderParent.lastElementChild);
		logisticServiceProviderParent.appendChild(providerRow);

		const buttons = logisticServiceProviderParent.querySelectorAll('.btn-style-2');

		// Hide all buttons except the last one
		buttons.forEach((button, index) => {
			button.style.display = (index === buttons.length - 1) ? 'block' : 'none';
		});
	}

	//get all inputs that are created dynamically for validations
	getLogisticAndExporterInputs()
}
function addAnotherLogisticServiceProvider() {

	// Increment the row count
	providerCount++
	var modal = providerCount - 1
	// Create a new row div
	var providerRow = document.createElement('div');

	// Set inner HTML for the new row
	providerRow.innerHTML = `
            <div class="row">
                                    <h6 class="input-section-heading mb-8">${providerCount}.</h6>
                                    </div>
            <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                       <input name="logisticServiceProvider[${modal}].id"  hidden> 
                                       
                                            <input type="text" name="logisticServiceProvider[${modal}].name" id="provider_name_${modal}" class="input-field"
                                                placeholder="Name"  autocomplete="off">
                                            <label for="provider_name_${modal}" class="input-label">Name</label>
                                            <span id="provider_name_${modal}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="logisticServiceProvider[${modal}].address" id="provider_address_${modal}" class="input-field"
                                                placeholder="Address"  autocomplete="off">
                                            <label for="provider_address_${modal}" class="input-label">Address</label>
                                            <span id="provider_address_${modal}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="add-provider-${providerCount}-btn-col">
                                        <button class="btn-style-2 w-100" type="button" onclick="addAnotherLogisticServiceProvider()">+ Add Other</button>
                                    </div>
                                </div>

            `;


	// Append the new row to the parent row
	// logisticServiceProviderParent.insertBefore(providerRow, logisticServiceProviderParent.lastElementChild);
	logisticServiceProviderParent.appendChild(providerRow);
	const buttons = logisticServiceProviderParent.querySelectorAll('.btn-style-2');

	// Hide all buttons except the last one
	buttons.forEach((button, index) => {
		button.style.display = (index === buttons.length - 1) ? 'block' : 'none';
	});


	//get all inputs that are created dynamically for validations
	getLogisticAndExporterInputs()
}


function updateExpoterSelectElements(args) {
	args.forEach((item, index) => {
		// Update the supplierSince select element
		let supplierSinceSelect = document.querySelector(`select[name="exporterList[${index}].financialYear"]`);
		if (supplierSinceSelect) {
			supplierSinceSelect.value = item.financialYear;
			let optionFound = Array.from(supplierSinceSelect.options).some(option => option.value === item.financialYear);
			if (!optionFound) {
				const newOption = new Option(item.financialYear, item.financialYear, true, true);
				supplierSinceSelect.add(newOption);
			}
		}

		// Update the vendorRating select element
		let vendorRatingSelect = document.querySelector(`select[name="exporterList[${index}].country"]`);
		if (vendorRatingSelect) {
			vendorRatingSelect.value = item.country;
			let optionFound = Array.from(vendorRatingSelect.options).some(option => option.value === item.country.toString());
			if (!optionFound) {
				const newOption = new Option(item.country, item.country, true, true);
				vendorRatingSelect.add(newOption);
			}
		}
	});
}

//functions for Adding Another Exporter List
var exporterListsParent = document.querySelector('#exporter-lists-parent');
var exporterListCount
function addYearExportRow(args) {
	// Increment the row count
	exporterListCount = args.length
	// Create a new row div

	for (let i = 0; i < args.length; i++) {
		var newExporterList = document.createElement('div');

		// Set inner HTML for the new row
		newExporterList.innerHTML = `<div class="row">
                                    <h6 class="input-section-heading mb-8">${i + 1}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                        <input name="exporterList[${i}].id" value=${args[i].id} hidden>
                                            <select name="exporterList[${i}].financialYear" value=${args[i].financialYear} id="export_financial_year_${i}"
                                                class="input-field form-dropdown" autocomplete="off">
                                                ${generateFinancialYearOptions()}
                                            </select>
                                            <label for="export_financial_year_${i}" class="input-label">Select</label>
                                            <span id="export_financial_year_${i}_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="exporterList[${i}].product"  value=${args[i].product} id="product_or_services_${i}" class="input-field"
                                                placeholder="Product/Services" autocomplete="off">
                                            <label for="product_or_services_${i}" class="input-label">Product/Services</label>
                                            <span id="product_or_services_${i}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                      
                                        <div class="field-group select-field-group">
											<select name="exporterList[${i}].country" value=${args[i].country} id="export_country_${i}"
												class="input-field form-dropdown" autocomplete="off">
												<option value="" selected>Country</option>
												<option value="india">India</option>
												<option value="us">US</option>
											</select> <label for="export_country_${i}" class="input-label">Select</label>
											<span id="export_country_${i}_err" class="err-text"></span>
										</div>
                                           
                                       
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group d-flex position-relative align-items-center">
                                        <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                  ${country != "US" ? `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 4px;">INR</span>
					                        ` : `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 3px;">USD</span>
					                        `} 
                                            </div>
                                            <input type="number" name="exporterList[${i}].value" value=${args[i].value}   id="export_value_${i}" style="padding-left:50px;"
                                                class="input-field" placeholder="Value"  autocomplete="off">
                                            <label for="export_value_${i}" style="left:50px;" class="input-label">Value</label>
                                            </div>
                                            <span id="export_value_${i}_err" class="err-text"></span>
                                    </div>
                                </div>`;

		// Append the new row to the parent row
		exporterListsParent.insertBefore(newExporterList, exporterListsParent.lastElementChild);
		//	 exporterListsParent.appendChild(newExporterList);
		customSelectInitialization()

		//get all inputs that are created dynamically for validations
		getLogisticAndExporterInputs()
	}
	updateExpoterSelectElements(args)
}
function addAnotherYearExportRow() {
	// Increment the row count
	exporterListCount++
	var modal = exporterListCount - 1

	// Create a new row div
	var newExporterList = document.createElement('div');

	// Set inner HTML for the new row
	newExporterList.innerHTML = `<div class="row">
                                    <h6 class="input-section-heading mb-8">${exporterListCount}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group select-field-group">
                                            <select name="exporterList[${modal}].financialYear" id="export_financial_year_${modal}"
                                                class="input-field form-dropdown" autocomplete="off">
                                                ${generateFinancialYearOptions()}
                                            </select>
                                            <label for="export_financial_year_${modal}" class="input-label">Select</label>
                                            <span id="export_financial_year_${modal}_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="exporterList[${modal}].product" id="product_or_services_${modal}" class="input-field"
                                                placeholder="Product/Services" autocomplete="off">
                                            <label for="product_or_services_${modal}" class="input-label">Product/Services</label>
                                            <span id="product_or_services_${modal}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                      
                                        <div class="field-group select-field-group">
											<select name="exporterList[${modal}].country" id="export_country_${modal}"
												class="input-field form-dropdown" autocomplete="off">
												<option value="" selected>Country</option>
												<option value="india">India</option>
												<option value="us">US</option>
											</select> <label for="export_country_${modal}" class="input-label">Select</label>
											<span id="export_country_${modal}_err" class="err-text"></span>
										</div>
                                           
                                       
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group d-flex position-relative align-items-center">
                                        <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                  ${country != "US" ? `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 4px;">INR</span>
					                        ` : `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 3px;">USD</span>
					                        `} 
                                            </div>
                                            <input type="number" name="exporterList[${modal}].value"  id="export_value_${modal}" style="padding-left:50px;"
                                                class="input-field" placeholder="Value"  autocomplete="off">
                                            <label for="export_value_${modal}" style="left:50px;" class="input-label">Value</label>
                                            </div>
                                            <span id="export_value_${modal}_err" class="err-text"></span>
                                    </div>
                                </div>`;

	// Append the new row to the parent row
	exporterListsParent.insertBefore(newExporterList, exporterListsParent.lastElementChild);
	//	 exporterListsParent.appendChild(newExporterList);
	customSelectInitialization()

	//get all inputs that are created dynamically for validations
	getLogisticAndExporterInputs()
}
//for Generating finacial year options
function generateFinancialYearOptions() {
	var options = '<option value="" selected>Financial year</option>';
	for (let year = new Date().getFullYear(); year >= 1900; year--) {
		options +=
			`<option value="${year - 1}-${String(year).slice(-2)}">${year - 1}-${String(year).slice(-2)}</option>`;
	}
	return options;
}

//
////for options for initial render 
//function makeYearDropdown() {
//	// Get the element by ID
//	var yearDropdown = document.querySelector('#annual-turnover-parent #turnover_financial_year_1');
//	var yearDropdown1 = document.querySelector('#exporter-lists-parent #export_financial_year_1');
//	yearDropdown.innerHTML = ""
//	// Generate the financial year options
//	var options = generateFinancialYearOptions();
//	yearDropdown1.innerHTML = ""
//	yearDropdown1.innerHTML = options;
//	// Set the generated options as the inner HTML of the dropdown
//	yearDropdown.innerHTML = options;
//}
//function makeExporterYearDropdown() {
//	// Get the element by ID
//	var yearOmeDropdown = document.querySelector('#oem-details-parent #supplier_since_1');
//	// Generate the financial year options
//	var options = generateYearOptions();
//	yearOmeDropdown.innerHTML = options
//	// Set the generated options as the inner HTML of the dropdown
//}
//function initializeDropdowns() {
//	makeYearDropdown();
//	makeExporterYearDropdown();
//}
//// Call initializeDropdowns after the page is fully loaded
//document.addEventListener('DOMContentLoaded', initializeDropdowns);
//
//for hiding and showing sections based on radio inputs
function handleRadioChange(checkedValue, parentElementId, length) {
	let parentElement = document.getElementById(parentElementId);
	parentElement.style.display = checkedValue === 'yes' ? 'block' : 'none';

	if (checkedValue === 'yes' && length === 0) {
		if (parentElementId === "oem-details-parent")
			addAnotherOEMDetails();

		if (parentElementId === "exporter-lists-parent")
			addAnotherYearExportRow();

		if (parentElementId === "logistic-service-provider-parent")
			addAnotherLogisticServiceProvider();
	}
	if (checkedValue === 'no') {
		if (parentElementId === "oem-details-parent") {

			while (parentElement.childElementCount > 1) {
				parentElement.removeChild(parentElement.firstElementChild);
			}
			oemCount = 0
		}
		if (parentElementId === "exporter-lists-parent") {

			while (parentElement.childElementCount > 1) {
				parentElement.removeChild(parentElement.firstElementChild);
			}
			exporterListCount = 0
		}
		if (parentElementId === "logistic-service-provider-parent") {

			while (parentElement.childElementCount > 1) {
				parentElement.removeChild(parentElement.firstElementChild);
			}
			providerCount = 0
		}


	}

}

//functions for Technical capabilities
var regAddressesOfFactoryParent = document.querySelector('#reg-addresses-of-factory-parent');
var factoryCount;
var factoryArray = []

//functions for adding another factory
function addRegAddressOfFactory(args) {
	// Increment the row count
	regAddressesOfFactoryParent.innerHTML = ""
	factoryCount = args.length;
	factoryArray = []
	//	factoryArray.push({
	//		subListsCount: 1,
	//		machineListCount: 0,
	//		inspectionListCount: 0
	//	})	
	// Create a new div element to hold the new fields
	for (i = 0; i < factoryCount; i++) {


		var factory = args[i];
		var machineListData = [];
		var inspectionListData = [];

		factory.facilityList.forEach(facility => {
			if (facility.type === "Machining") {
				machineListData.push(facility);
			} else if (facility.type === "Inspection") {
				inspectionListData.push(facility);
			}
		});

		factoryArray.push({
			subListsCount: 0,
			machineListCount: machineListData?.length,
			inspectionListCount: inspectionListData?.length
		})

		console.log(factoryArray)

		var newAddressList = document.createElement("div");

		// Set the content for the new section
		newAddressList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${(i + 1)}.</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                <input   name="factoryList[${i}].id" value="${args[i].id}" hidden>
                                                    <input type="text" name="factoryList[${i}].factoryName" value="${args[i].factoryName}" id="factory_name_${i}" class="input-field"
                                                        placeholder="Factory Name"  autocomplete="off">
                                                    <label for="factory_name_${i}" class="input-label">Factory Name</label>
                                                    <span id="factory_name_${i}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="number" name="factoryList[${i}].area" value="${args[i].area}" id="area_in_square_mtr_${i}" class="input-field"
                                                        placeholder="Area in Square Meter"  autocomplete="off">
                                                    <label for="area_in_square_mtr_${i}" class="input-label">Area in Square
                                                        Meter</label>
                                                    <span id="area_in_square_mtr_${i}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="factoryList[${i}].address" value="${args[i].address}" id="factory_address_${i}" class="input-field"
                                                        placeholder="Address"  autocomplete="off">
                                                    <label for="factory_address_${i}" class="input-label">Address</label>
                                                    <span id="factory_address_${i}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="input-field-section mt-32 mb-32">
                                            <h6 class="input-section-heading mb-16">Details of manpower available in the
                                                factory
                                            </h6>
                                            <div class="row row-gap-16">
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${i}].totalEmployees" value="${args[i].totalEmployees}"  id="total_employees_${i}" class="input-field"
                                                            placeholder="Total No. of Employees" autocomplete="off">
                                                        <label for="total_employees_${i}" class="input-label">Total No. of
                                                            Employees</label>
                                                        <span id="total_employees_${i}_err" class="err-text"></span>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${i}].supervisiors" value="${args[i].supervisiors}" id="supervisors_${i}" class="input-field"
                                                            placeholder="Supervisors" autocomplete="off">
                                                        <label for="supervisors_${i}" class="input-label">Supervisors</label>
                                                        <span id="supervisors_${i}_err" class="err-text"></span>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${i}].enggDegreeOrDiploma" value="${args[i].supervisiors}" id="engg_degree_or_diploma_${i}"
                                                            class="input-field"
                                                            placeholder="Engg. Degree/Diploma Holders"
                                                            autocomplete="off">
                                                        <label for="engg_degree_or_diploma_${i}" class="input-label">Engg.
                                                            Degree/Diploma</label>
                                                        <span id="engg_degree_or_diploma_${i}_err" class="err-text"></span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${i}].skilledWorkers" value="${args[i].skilledWorkers}"  id="skilled_workers_${i}" class="input-field"
                                                            placeholder="Skilled Workers" autocomplete="off">
                                                        <label for="skilled_workers_${i}" class="input-label">Skilled
                                                            Workers</label>
                                                        <span id="skilled_workers_${i}_err" class="err-text"></span>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${i}].designDepartment" value="${args[i].designDepartment}"  id="design_department_${i}" class="input-field"
                                                            placeholder="Design Department" autocomplete="off">
                                                        <label for="design_department_${i}" class="input-label">Design
                                                            Department</label>
                                                        <span id="design_department_${i}_err" class="err-text"></span>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${i}].qualityAndInspection" value="${args[i].qualityAndInspection}" id="quality_control_and_inspection_${i}"
                                                            class="input-field"
                                                            placeholder="Quality Control & Inspection"
                                                            autocomplete="off">
                                                        <label for="quality_control_and_inspection_${i}"
                                                            class="input-label">Quality
                                                            Control &
                                                            Inspection</label>
                                                        <span id="quality_control_and_inspection_${i}_err"
                                                            class="err-text"></span>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="input-field-section mt-32">
											<h6 class="input-section-heading mb-16">List of Machining /
												Fabrication & Material Handling Facilities Available in the
												Factory</h6>
											<div id="machine-list-parent-${i}">
										
											</div>
											<div class="row row-gap-16">
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<button class="btn-style-2 w-100" type="button"
														onclick="addAnotherMachineList(${i})">+ Add Other</button>
												</div>
											</div>
										</div>
										
										<div class="input-field-section mt-32">
											<h6 class="input-section-heading mb-16">List of Inspection
												/ Testing Facilities Available in the Factory</h6>
											<div id="inspection-list-parent-${i}">
										
												
											</div>
											<div class="row row-gap-16">
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<button class="btn-style-2 w-100" type="button"
														onclick="addAnotherInspectionList(${i})">+ Add Other</button>
												</div>
											</div>
										</div>

                                        
                                        `;

		// Append the new section to the parent element

		// regAddressesOfFactoryParent.insertBefore(newAddressList, regAddressesOfFactoryParent.lastElementChild);
		regAddressesOfFactoryParent.appendChild(newAddressList);
		addInspectionList(i, inspectionListData)
		addMachineList(i, machineListData)
	}

	//get all inputs that are created dynamically for validations
	getFactoryInfoInputs()
}

function addMachineList(i, args) {
	var parent = document.getElementById(`machine-list-parent-${i}`);

	var subListsCount = factoryArray[i].subListsCount
	for (var j = 0; j < args.length; j++) {
		var newAddressList = document.createElement("div");

		// Set the content for the new section
		newAddressList.innerHTML = `
            <div class="row">
                <h6 class="input-section-heading mb-8">${i + 1}.${j + 1}</h6>
            </div>
            <div class="row row-gap-16 mb-16">
                <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                    <input hidden name="factoryList[${i}].facilityList[${subListsCount}].type" value="${args[j].type}">
                    <input hidden name="factoryList[${i}].facilityList[${subListsCount}].id" value="${args[j].id}">
                    
                    <input hidden name="factoryList[${i}].facilityList[${subListsCount}].factoryId" value="${args[j].factoryId}">
                    <div class="field-group">
                        <input type="text" name="factoryList[${i}].facilityList[${subListsCount}].details"
                            id="machining_facility_${i}_${j}" class="input-field"
                            placeholder="Details of facility available" value="${args[j].details}"
                            autocomplete="off">
                        <label for="machining_facility_${i}_${j}" class="input-label">Details of facility available</label>
                        <span id="machining_facility_${i}_${j}_err" class="err-text"></span>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                    <div class="field-group">
                        <input type="text" name="factoryList[${i}].facilityList[${subListsCount}].remarks"
                            id="machining_facility_remark_${i}_${j}" class="input-field" value="${args[j].remarks}"
                            placeholder="Remarks if any" autocomplete="off">
                        <label for="machining_facility_remark_${i}_${j}" class="input-label">Remarks if any</label>
                        <span id="machining_facility_remark_${i}_${j}_err" class="err-text"></span>
                    </div>
                </div>
            </div>`;

		parent.appendChild(newAddressList);
		factoryArray[i].subListsCount = factoryArray[i].subListsCount + 1
		subListsCount++

	}

	//get all inputs that are created dynamically for validations
	getFactoryInfoInputs()
}

function addInspectionList(i, args) {
	var parent = document.getElementById(`inspection-list-parent-${i}`);
	var subListsCount = factoryArray[i].subListsCount

	for (var j = 0; j < args.length; j++) {
		var newAddressList = document.createElement("div");

		// Set the content for the new section
		newAddressList.innerHTML = `
            <div class="row">
                <h6 class="input-section-heading mb-8">${i + 1}.${j + 1}</h6>
                <input hidden name="factoryList[${i}].facilityList[${subListsCount}].type" value="${args[j].type}">
                <input hidden name="factoryList[${i}].facilityList[${subListsCount}].id" value="${args[j].id}">
                   <input hidden name="factoryList[${i}].facilityList[${subListsCount}].factoryId" value="${args[j].factoryId}">
                 
            </div>
            <div class="row row-gap-16 mb-16">
                <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                    <div class="field-group">
                        <input type="text" name="factoryList[${i}].facilityList[${subListsCount}].details"
                            id="inspection_facility_${i}_${j}" class="input-field" value="${args[j].details}"
                            placeholder="Details of facility available" autocomplete="off">
                        <label for="inspection_facility_${i}_${j}" class="input-label">Details of facility available</label>
                        <span id="inspection_facility_${i}_${j}_err" class="err-text"></span>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                    <div class="field-group">
                        <input type="text" name="factoryList[${i}].facilityList[${subListsCount}].remarks"
                            id="inspection_facility_remark_${i}_${j}" class="input-field" value="${args[j].remarks}"
                            placeholder="Remarks if any" autocomplete="off">
                        <label for="inspection_facility_remark_${i}_${j}" class="input-label">Remarks if any</label>
                        <span id="inspection_facility_remark_${i}_${j}_err" class="err-text"></span>
                    </div>
                </div>
            </div>`;

		parent.appendChild(newAddressList);
		factoryArray[i].subListsCount = factoryArray[i].subListsCount + 1
		subListsCount++

	}

	//get all inputs that are created dynamically for validations
	getFactoryInfoInputs()
}

//functions for adding another machine list
function addAnotherMachineList(facCount) {
	let machiningListParent = document.querySelector(`#machine-list-parent-${facCount}`)
	// Increment the row MachineCount

	factoryArray[facCount].machineListCount = factoryArray[facCount].machineListCount + 1
	//	machineListCount = machineListCount + 1
	// var modal = machineListCount
	let subListsCount = factoryArray[facCount].subListsCount

	// Create a new div element to hold the new fields
	var newMachineList = document.createElement("div");

	// Set the content for the new section
	newMachineList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${(facCount + 1)}.${factoryArray[facCount].machineListCount}</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                            	<input hidden name="factoryList[${facCount}].facilityList[${subListsCount}].type"
													value="Machining">
													   <input hidden name="factoryList[${facCount}].facilityList[${subListsCount}].factoryId" value="${facCount}">
                 
											
                                                <div class="field-group">
                                                    <input type="text" name="factoryList[${facCount}].facilityList[${subListsCount}].details" id="machining_facility_${facCount}_${factoryArray[facCount].subListsCount}" class="input-field"
                                                        placeholder="Details of facility available"
                                                        autocomplete="off">
                                                    <label for="machining_facility_${facCount}_${factoryArray[facCount].subListsCount}" class="input-label">Details of
                                                        facility
                                                        available</label>
                                                        <span id="machining_facility_${facCount}_${factoryArray[facCount].subListsCount}_err"
                                                        class="err-text"></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="factoryList[${facCount}].facilityList[${subListsCount}].remarks" id="machining_facility_remark_${facCount}_${factoryArray[facCount].subListsCount}" class="input-field"
                                                        placeholder="Remarks if any"  autocomplete="off">
                                                    <label for="machining_facility_remark_${facCount}_${factoryArray[facCount].subListsCount}" class="input-label">Remarks if any</label>
                                                    <span id="machining_facility_remark_${facCount}_${factoryArray[facCount].subListsCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                        </div>`;

	// Append the new section to the parent element
	machiningListParent.appendChild(newMachineList);
	subListsCount++

	factoryArray[facCount].subListsCount = factoryArray[facCount].subListsCount + 1

	//get all inputs that are created dynamically for validations
	getFactoryInfoInputs()
}
//functions for adding another inspection list
function addAnotherInspectionList(facCount) {
	let inspectionListParent = document.querySelector(`#inspection-list-parent-${facCount}`);

	// Increment the row count
	factoryArray[facCount].inspectionListCount = factoryArray[facCount].inspectionListCount + 1

	// inspectionListCount = inspectionListCount + 1
	// machineListCount = machineListCount + 1

	// var modal = machineListCount
	let subListsCount = factoryArray[facCount].subListsCount
	// Create a new div element to hold the new fields
	var newInspectionList = document.createElement("div");

	// Set the content for the new section
	newInspectionList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${(facCount + 1)}.${(factoryArray[facCount].inspectionListCount)}</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                <input hidden name="factoryList[${facCount}].facilityList[${subListsCount}].type"
												value="Inspection">
													   <input hidden name="factoryList[${facCount}].facilityList[${subListsCount}].factoryId" value="${facCount}">
                 
                                                    <input type="text" name="factoryList[${facCount}].facilityList[${subListsCount}].details" id="inspection_facility_${facCount}_${factoryArray[facCount].subListsCount}" class="input-field"
                                                        placeholder="Details of facility available"  autocomplete="off">
                                                    <label for="inspection_facility_${facCount}_${factoryArray[facCount].subListsCount}" class="input-label">Details of facility
                                                        available</label>
                                                    <span id="inspection_facility_${facCount}_${factoryArray[facCount].subListsCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="factoryList[${facCount}].facilityList[${subListsCount}].remarks" id="inspection_facility_remark_${facCount}_${factoryArray[facCount].subListsCount}" class="input-field"
                                                        placeholder="Remarks if any"  autocomplete="off">
                                                    <label for="inspection_facility_remark_${facCount}_${factoryArray[facCount].subListsCount}" class="input-label">Remarks if any</label>
                                                    <span id="inspection_facility_remark_${facCount}_${factoryArray[facCount].subListsCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                        </div>`;

	// Append the new section to the parent element
	inspectionListParent.appendChild(newInspectionList);
	subListsCount++

	factoryArray[facCount].subListsCount = factoryArray[facCount].subListsCount + 1

	//get all inputs that are created dynamically for validations
	getFactoryInfoInputs()
}
//functions for Technical capabilities


//functions for adding another factory
function addAnotherRegAddressOfFactory(args) {
	// Increment the row count

	factoryArray.push({
		subListsCount: 2,
		machineListCount: 1,
		inspectionListCount: 1
	})

	// Create a new div element to hold the new fields
	var newAddressList = document.createElement("div");

	// Set the content for the new section
	newAddressList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${(factoryCount + 1)}.</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="factoryList[${factoryCount}].factoryName" id="factory_name_${factoryCount}" class="input-field"
                                                        placeholder="Factory Name"  autocomplete="off">
                                                    <label for="factory_name_${factoryCount}" class="input-label">Factory Name</label>
                                                    <span id="factory_name_${factoryCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="number" name="factoryList[${factoryCount}].area" id="area_in_square_mtr_${factoryCount}" class="input-field"
                                                        placeholder="Area in Square Meter"  autocomplete="off">
                                                    <label for="area_in_square_mtr_${factoryCount}" class="input-label">Area in Square
                                                        Meter</label>
                                                    <span id="area_in_square_mtr_${factoryCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                    <input type="text" name="factoryList[${factoryCount}].address" id="factory_address_${factoryCount}" class="input-field"
                                                        placeholder="Address"  autocomplete="off">
                                                    <label for="factory_address_${factoryCount}" class="input-label">Address</label>
                                                    <span id="factory_address_${factoryCount}_err" class="err-text"></span>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="input-field-section mt-32 mb-32">
                                            <h6 class="input-section-heading mb-16">Details of manpower available in the
                                                factory
                                            </h6>
                                            <div class="row row-gap-16">
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${factoryCount}].totalEmployees" id="total_employees_${factoryCount}" class="input-field"
                                                            placeholder="Total No. of Employees" autocomplete="off">
                                                        <label for="total_employees_${factoryCount}" class="input-label">Total No. of
                                                            Employees</label>
                                                        <span id="total_employees_${factoryCount}_err" class="err-text"></span>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${factoryCount}].supervisiors" id="supervisors_${factoryCount}" class="input-field"
                                                            placeholder="Supervisors" autocomplete="off">
                                                        <label for="supervisors_${factoryCount}" class="input-label">Supervisors</label>
                                                        <span id="supervisors_${factoryCount}_err" class="err-text"></span>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${factoryCount}].enggDegreeOrDiploma" id="engg_degree_or_diploma_${factoryCount}"
                                                            class="input-field"
                                                            placeholder="Engg. Degree/Diploma Holders"
                                                            autocomplete="off">
                                                        <label for="engg_degree_or_diploma_${factoryCount}" class="input-label">Engg.
                                                            Degree/Diploma</label>
                                                        <span id="engg_degree_or_diploma_${factoryCount}_err" class="err-text"></span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${factoryCount}].skilledWorkers" id="skilled_workers_${factoryCount}" class="input-field"
                                                            placeholder="Skilled Workers" autocomplete="off">
                                                        <label for="skilled_workers_${factoryCount}" class="input-label">Skilled
                                                            Workers</label>
                                                        <span id="skilled_workers_${factoryCount}_err" class="err-text"></span>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${factoryCount}].designDepartment" id="design_department_${factoryCount}" class="input-field"
                                                            placeholder="Design Department" autocomplete="off">
                                                        <label for="design_department_${factoryCount}" class="input-label">Design
                                                            Department</label>
                                                        <span id="design_department_${factoryCount}_err" class="err-text"></span>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                    <div class="field-group">
                                                        <input type="number" name="factoryList[${factoryCount}].qualityAndInspection" id="quality_control_and_inspection_${factoryCount}"
                                                            class="input-field"
                                                            placeholder="Quality Control & Inspection"
                                                            autocomplete="off">
                                                        <label for="quality_control_and_inspection_${factoryCount}"
                                                            class="input-label">Quality
                                                            Control &
                                                            Inspection</label>
                                                        <span id="quality_control_and_inspection_${factoryCount}_err"
                                                            class="err-text"></span>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="input-field-section mt-32">
											<h6 class="input-section-heading mb-16">List of Machining /
												Fabrication & Material Handling Facilities Available in the
												Factory</h6>
											<div id="machine-list-parent-${factoryCount}">
												<div>
													<div class="row">
														<h6 class="input-section-heading mb-8">${factoryCount + 1}.1</h6>
													</div>
													<div class="row row-gap-16 mb-16">
														<div class="col-lg-6 col-md-6 col-sm-12 col-12">
															<input hidden name="factoryList[${factoryCount}].facilityList[0].type"
																value="Machining">
															<div class="field-group">
																<input type="text" name="factoryList[${factoryCount}].facilityList[0].details"
																	id="machining_facility_${factoryCount}_0" class="input-field"
																	placeholder="Details of facility available"
																	autocomplete="off"> <label for="machining_facility_${factoryCount}_0"
																	class="input-label">Details
																	of facility available</label> <span
																	id="machining_facility_${factoryCount}_0_err" class="err-text"></span>
															</div>
														</div>
														<div class="col-lg-6 col-md-6 col-sm-12 col-12">
															<div class="field-group">
																<input type="text" name="factoryList[${factoryCount}].facilityList[0].remarks"
																	id="machining_facility_remark_${factoryCount}_0" class="input-field"
																	placeholder="Remarks if any" autocomplete="off"> <label
																	for="machining_facility_remark_${factoryCount}_0"
																	class="input-label">Remarks
																	if any</label> <span id="machining_facility_remark_${factoryCount}_0_err"
																	class="err-text"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row row-gap-16">
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<button class="btn-style-2 w-100" type="button"
														onclick="addAnotherMachineList(${(factoryCount)},${factoryArray[factoryCount - 1].subListsCount})">+ Add Other</button>
												</div>
											</div>
										</div>
										
										<div class="input-field-section mt-32">
											<h6 class="input-section-heading mb-16">List of Inspection
												/ Testing Facilities Available in the Factory</h6>
											<div id="inspection-list-parent-${factoryCount}">
												<div>
													<div class="row">
														<h6 class="input-section-heading mb-8">${factoryCount + 1}.1</h6>
														<input hidden name="factoryList[${factoryCount}].facilityList[1].type"
															value="Inspection">
													</div>
													<div class="row row-gap-16 mb-16">
														<div class="col-lg-6 col-md-6 col-sm-12 col-12">
															<div class="field-group">
																<input type="text" name="factoryList[${factoryCount}].facilityList[1].details"
																	id="inspection_facility_${factoryCount}_0" class="input-field"
																	placeholder="Details of facility available"
																	autocomplete="off"> <label for="inspection_facility_${factoryCount}_0"
																	class="input-label">Details
																	of facility available</label> <span
																	id="inspection_facility_${factoryCount}_0_err" class="err-text"></span>
		
															</div>
														</div>
														<div class="col-lg-6 col-md-6 col-sm-12 col-12">
															<div class="field-group">
																<input type="text" name="factoryList[${factoryCount}].facilityList[1].remarks"
																	id="inspection_facility_remark_${factoryCount}_0" class="input-field"
																	placeholder="Remarks if any" autocomplete="off"> <label
																	for="inspection_facility_remark_${factoryCount}_0"
																	class="input-label">Remarks
																	if any</label> <span id="inspection_facility_remark_${factoryCount}_0_err"
																	class="err-text"></span>
		
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row row-gap-16">
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12"></div>
												<div class="col-lg-3 col-md-6 col-sm-12 col-12">
													<button class="btn-style-2 w-100" type="button"
														onclick="addAnotherInspectionList(${(factoryCount)},${factoryArray[factoryCount - 1].subListsCount})">+ Add Other</button>
												</div>
											</div>
										</div>

                                        
                                        `;

	// Append the new section to the parent element

	// regAddressesOfFactoryParent.insertBefore(newAddressList, regAddressesOfFactoryParent.lastElementChild);
	regAddressesOfFactoryParent.appendChild(newAddressList);
	factoryCount = factoryCount + 1;

	//get all inputs that are created dynamically for validations
	getFactoryInfoInputs()
}





















document.addEventListener("DOMContentLoaded", function () {
	let dateFields = document.querySelectorAll('.auto-fill-date');
	for (let dateField of dateFields) {
		let currentDate = new Date();
		let year = currentDate.getFullYear();
		let month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
		let day = ('0' + currentDate.getDate()).slice(-2);
		let formattedDate = year + "-" + month + "-" + day;
		dateField.value = formattedDate;
		dateField.style.color = '#1A1C43';

	}
});
//----------------------------------------- js script for automatic date selection ends here --------------------------------------


//----------------------------------------- js script for custom date selection starts here --------------------------------------
document.addEventListener("DOMContentLoaded", function () {
	let dateFields = document.querySelectorAll('.date-field');
	for (let dateField of dateFields) {
		dateField.addEventListener('click', function () {
			dateField.style.color = '#1A1C43';
		});
		dateField.addEventListener('blur', function () {
			let value = dateField.value;
			let isValidDate = (new Date(value) !== "Invalid Date") && !isNaN(new Date(value));
			dateField.style.color = isValidDate ? '#1A1C43' : '#7a7a7a';
		});
	}
});