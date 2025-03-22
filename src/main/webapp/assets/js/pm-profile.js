

$(document).ready(function () {
	console.log("ready!");
	firstCall()
});

//===================== validation functions starts here=====================
function showError(id, errorMsg) {
	let errSpan = document.getElementById(id)
	errSpan.innerHTML = errorMsg
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

// for checking required fields modal's ID-wise
function checkRequiredFields(inputs, modalId) {
	// console.log("checkRequiredFields called")
	let allFilled = true;
	let firstRequiredField = null;
	for (let input of inputs) {
		if (modalId == '#edit-company-details') {
			if (input.name == 'name' && input.value.trim() == '') {
				allFilled = false;
				showError('name_err', 'Company Name is Required')
			} else if (input.name == 'email' && input.value.trim() == '') {
				allFilled = false;
				showError('email_err', 'Company Email is Required')
			}
			else if (input.name == 'phone' && input.value.trim() == '') {
				allFilled = false;
				showError('phone_err', 'Phone Number is Required')
			}
			else if (input.name == 'industry' && input.value.trim() == '' && input.required) {
				console.log(input)
				allFilled = false;
				showError('industry_err', 'Industry Classification is Required')
			}
			else if (input.name == 'expertise' && input.value.trim() == '' && input.required) {
				allFilled = false;
				showError('expertise_err', 'Industry Expertise is Required')
			}
		}
		else if (modalId == '#edit-company-address') {
			if (input.name == 'streetAddress' && input.value.trim() == '') {
				allFilled = false;
				showError('streetAddress_err', 'Street Name is Required')
			} else if (input.name == 'city' && input.value.trim() == '') {
				allFilled = false;
				showError('city_err', 'City Name is Required')
			} else if (input.name == 'state' && input.value.trim() == '') {
				allFilled = false;
				showError('state_err', 'State Name is Required')
			} else if (input.name == 'pincode' && input.value.trim() == '') {
				allFilled = false;
				showError('pincode_err', 'Pincode is Required')
			} else if (input.name == 'companyName[0].name' && input.value.trim() == '') {
				allFilled = false;
				showError('professionalInfoCompanyName_0_err', 'Company Name is Required')
			}
		}
		else if (modalId == '#edit-professional-information') {
			if (input.name == 'companyExperience' && input.value.trim() == '') {
				allFilled = false;
				showError('companyExperience_err', 'Experience is Required')
			}
		}
		else if (modalId == '#edit-legal-information') {
			if ((input.name == 'panNo' || input.name == 'EINNumber') && input.value.trim() == '') {
				allFilled = false;
				if (document.querySelector('#country').value === "US") {
					showError('EINNumber_err', 'EIN Number is Required')
				} else {
					showError('panNo_err', 'PAN Number is Required')
				}
			}
		}
		else if (modalId == '#edit-Resume') {
			if (input.name == 'resume' && !input.files[0]) {
				allFilled = false;
				showError('Resume_err', 'Resume is Required')
			}
		}
		else if (modalId == '#edit-signature') {
			if (input.name == 'SingatureDocument' && !input.files[0]) {
				allFilled = false;
				showError('signature_err', 'Signature is Required')
			}
		}
		else if (false) {
			if (input.name == 'declaration' && input.checked == false) {
				allFilled = false;
				showError('declaration_err', 'Please check declaration')
			} else if (input.name == 'terms_and_conditions' && input.checked == false) {
				allFilled = false;
				showError('terms_and_conditions_err', 'Please check terms and conditions')
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

//---------for personal Information----------
var personalInformationModal = document.querySelector('#edit-company-details');
var personalInformationInputs = personalInformationModal.querySelectorAll('input,select');
var personalInformationErrorsArray = []
for (let input of personalInformationInputs) {
	input.addEventListener('change', function () {
		validatePersonalInformation(input)
	})
}
function validatePersonalInformation(input) {
	let errorMessage = '';

	if (input.name == 'name') {
		if (input.value != '') {
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!personalInformationErrorsArray.includes(input.name)) {
					personalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Full Name';
				showError('name_err', errorMessage)
			} else {
				showError('name_err', '')
				personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('name_err', '')
			personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
		}
	} else if (input.name == 'email') {
		if (input.value != '') {
			const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!personalInformationErrorsArray.includes(input.name)) {
					personalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Enter Company Email';
				showError('email_err', errorMessage)
			} else {
				personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('email_err', '')
			}
		} else {
			personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('email_err', '')
		}
	} else if (input.name == 'phone') {
		if (input.value != '') {
			const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
			if (!regex.test(input.value.trim())) {
				if (!personalInformationErrorsArray.includes(input.name)) {
					personalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Phone Number';
				showError('phone_err', errorMessage)
			} else {
				personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('phone_err', '')
			}
		} else {
			personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('phone_err', '')
		}
	} else if (input.name == 'industry') {
		if (input.value != '') {
			const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
			if (!regex.test(input.value.trim().trim())) {
				if (!personalInformationErrorsArray.includes(input.name)) {
					personalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Industry Classification';
				showError('industry_err', errorMessage)
			} else {
				personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('industry_err', '')
			}
		} else {
			personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('industry_err', '')
		}
	}
	else if (input.name == 'expertise') {
		if (input.value != '') {
			const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
			if (!regex.test(input.value.trim().trim())) {
				if (!personalInformationErrorsArray.includes(input.name)) {
					personalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Industry Expertise';
				showError('expertise_err', errorMessage)
			} else {
				personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('expertise_err', '')
			}
		} else {
			personalInformationErrorsArray = personalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('expertise_err', '')
		}
	}
	console.log('errors-', personalInformationErrorsArray)
}

//---------for address Information----------
var addressInformationModal = document.querySelector('#edit-company-address');
var addressInformationInputs = addressInformationModal.querySelectorAll('input,select');
var addressInformationErrorsArray = []
for (let input of addressInformationInputs) {
	input.addEventListener('change', function () {
		validateAddressInformation(input)
	})
}
function validateAddressInformation(input) {
	let errorMessage = '';
	if (input.name == 'streetAddress') {
		if (input.value != '') {
			const regex = /^[\w\s\d#,\-.]+$/;
			if (!regex.test(input.value.trim())) {
				if (!addressInformationErrorsArray.includes(input.name)) {
					addressInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Street Name';
				showError('streetAddress_err', errorMessage)
			} else {
				addressInformationErrorsArray = addressInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('streetAddress_err', '')
			}
		} else {
			addressInformationErrorsArray = addressInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('streetAddress_err', '')
		}
	} else if (input.name == 'city') {
		if (input.value != '') {
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (!regex.test(input.value.trim())) {
				if (!addressInformationErrorsArray.includes(input.name)) {
					addressInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid City Name';
				showError('city_err', errorMessage)
			} else {
				addressInformationErrorsArray = addressInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('city_err', '')
			}
		} else {
			addressInformationErrorsArray = addressInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('city_err', '')
		}
	} else if (input.name == 'state') {
		if (input.value != '') {
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (!regex.test(input.value.trim())) {
				if (!addressInformationErrorsArray.includes(input.name)) {
					addressInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid State Name';
				showError('state_err', errorMessage)
			} else {
				addressInformationErrorsArray = addressInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('state_err', '')
			}
		} else {
			addressInformationErrorsArray = addressInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('state_err', '')
		}
	} else if (input.name == 'pincode') {
		if (input.value != '') {
			if (document.querySelector('#country').value === "US") {
				var regex = /^\d{5}$/
			} else {
				var regex = /^\d{6}$/
			}
			if (!regex.test(input.value.trim())) {
				if (!addressInformationErrorsArray.includes(input.name)) {
					addressInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Pincode';
				showError('pincode_err', errorMessage)
			} else {
				addressInformationErrorsArray = addressInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('pincode_err', '')
			}
		} else {
			addressInformationErrorsArray = addressInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('pincode_err', '')
		}
	}
	console.log('errors-', addressInformationErrorsArray)
}

//---------for professional Information----------
var professionalInformationModal = document.querySelector('#edit-professional-information');
var professionalInformationInputs = professionalInformationModal.querySelectorAll('input,select');
var professionalInformationErrorsArray = []
for (let input of professionalInformationInputs) {
	input.addEventListener('change', function () {
		validateProfessionalInformation(input)
	})
}
function validateProfessionalInformation(input) {
	let errorMessage = '';
	if (input?.id?.includes("professionalInfoCompanyName")) {
		let nameArray = input.id.split("_")
		let num = nameArray[nameArray.length - 1];
		if (input.value != '') {
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (!regex.test(input.value.trim())) {
				if (!professionalInformationErrorsArray.includes(input.name)) {
					professionalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Company Name';
				showError('professionalInfoCompanyName_' + num + '_err', errorMessage)
			} else {
				professionalInformationErrorsArray = professionalInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('professionalInfoCompanyName_' + num + '_err', '')
			}
		} else {
			professionalInformationErrorsArray = professionalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('professionalInfoCompanyName_' + num + '_err', '')
		}
	}
	else if (input.name == 'companyExperience') {
		if (input.value != '') {
			const regex = /^(?:0|[1-9][0-9]?|100)$/;
			if (!regex.test(input.value.trim())) {
				if (!professionalInformationErrorsArray.includes(input.name)) {
					professionalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Experience';
				showError('companyExperience_err', errorMessage)
			} else {
				professionalInformationErrorsArray = professionalInformationErrorsArray.filter(function (e) { return e !== input.name })

				showError('companyExperience_err', '')
			}
		} else {
			professionalInformationErrorsArray = professionalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('companyExperience_err', '')
		}
	}
	else if (input.name == 'companyLinkedInUrl') {
		if (input.value != '') {
			const regex = /^https:\/\/(www\.)?linkedin\.com\/(in|company)\/[a-zA-Z0-9-]+\/?$/
			if (!regex.test(input.value.trim())) {
				if (!professionalInformationErrorsArray.includes(input.name)) {
					professionalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid LinkedIn Url';
				showError('companyLinkedInUrl_err', errorMessage)
			} else {
				professionalInformationErrorsArray = professionalInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('companyLinkedInUrl_err', '')
			}
		} else {
			professionalInformationErrorsArray = professionalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('companyLinkedInUrl_err', '')
		}
	}
	else if (input.name == 'relevantDocuments') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!professionalInformationErrorsArray.includes(input.name)) {
					professionalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('relevantDocuments_err', errorMessage)
			} else {
				professionalInformationErrorsArray = professionalInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('relevantDocuments_err', '')
			}
		} else {
			professionalInformationErrorsArray = professionalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('relevantDocuments_err', '')
		}
	}
	console.log('errors-', professionalInformationErrorsArray)
}

//---------for legal Information----------
var legalInformationModal = document.querySelector('#edit-legal-information');
var legalInformationInputs = legalInformationModal.querySelectorAll('input,select');
var legalInformationErrorsArray = []
for (let input of legalInformationInputs) {
	input.addEventListener('change', function () {
		validateLegalInformation(input)
	})
}
function validateLegalInformation(input) {
	let errorMessage = '';
	if (input.name == 'panNo') {
		if (input.value != '') {
			const regex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
			if (!regex.test(input.value.toUpperCase().trim())) {
				if (!legalInformationErrorsArray.includes(input.name)) {
					legalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid PAN Number';
				showError('panNo_err', errorMessage)
			} else {
				legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('panNo_err', '')
			}
		} else {
			legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('panNo_err', '')
		}
	}
	else if (input.name == 'EINNumber') {
		if (input.value != '') {
			var regex = /^\d{2}-\d{7}$/;
			if (!regex.test(input.value.toUpperCase().trim())) {
				if (!legalInformationErrorsArray.includes(input.name)) {
					legalInformationErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid EIN Number';
				showError('EINNumber_err', errorMessage)
			} else {
				legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
				showError('EINNumber_err', '')
			}
		} else {
			legalInformationErrorsArray = legalInformationErrorsArray.filter(function (e) { return e !== input.name })
			showError('EINNumber_err', '')
		}
	}
	console.log('errors-', legalInformationErrorsArray)
}

//---------for Project Management Experience----------
var pmExperienceModal = document.querySelector('#edit-PM-Experience');
var pmExperienceInputs = pmExperienceModal.querySelectorAll('input,select');
var pmExperienceErrorsArray = []
for (let input of pmExperienceInputs) {
	input.addEventListener('change', function () {
		validatePmExperience(input)
	})
}
function validatePmExperience(input) {
	let errorMessage = '';

	console.log('errors-', pmExperienceErrorsArray)
}

//---------for Reference----------
var pmReferenceModal = document.querySelector('#edit-PM-Refrence');
var pmReferenceInputs;
var pmReferenceErrorsArray = []
function getPmAllReferenceInputs() {
	pmReferenceInputs = pmReferenceModal.querySelectorAll('input,select');
	// console.log('pmReferenceInputs',pmReferenceInputs)
	for (let input of pmReferenceInputs) {
		input.addEventListener('change', function () {
			validatePmReference(input)
		})
	}
}
getPmAllReferenceInputs()
function validatePmReference(input) {
	let errorMessage = '';
	if (input?.id?.includes("refName")) {
		let nameArray = input.id.split("_");
		let num = nameArray[nameArray.length - 1];
		if (input.value != '') {
			const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
			if (!regex.test(input.value.trim())) {
				if (!pmReferenceErrorsArray.includes(input.name)) {
					pmReferenceErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Name';
				showError('refName_' + num + '_err', errorMessage);
			} else {
				pmReferenceErrorsArray = pmReferenceErrorsArray.filter(function (e) { return e !== input.name });
				showError('refName_' + num + '_err', '');
			}
		} else {
			pmReferenceErrorsArray = pmReferenceErrorsArray.filter(function (e) { return e !== input.name });
			showError('refName_' + num + '_err', '');
		}
	}
	else if (input?.id?.includes("refCompany")) {
		let nameArray = input.id.split("_");
		let num = nameArray[nameArray.length - 1];
		if (input.value != '') {
			const regex = /^[A-Za-z0-9 ]{3,}$/;
			if (!regex.test(input.value.trim())) {
				if (!pmReferenceErrorsArray.includes(input.name)) { pmReferenceErrorsArray.push(input.name); };
				errorMessage = 'Invalid Company Name';
				showError('refCompany_' + num + '_err', errorMessage);
			} else {
				pmReferenceErrorsArray = pmReferenceErrorsArray.filter(function (e) { return e !== input.name });
				showError('refCompany_' + num + '_err', '');
			}
		} else {
			pmReferenceErrorsArray = pmReferenceErrorsArray.filter(function (e) { return e !== input.name });
			showError('refCompany_' + num + '_err', '');
		}
	} else if (input?.id?.includes("refEmail")) {
		let nameArray = input.id.split("_")
		let num = nameArray[nameArray.length - 1];
		if (input.value != '') {
			const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
			if (!regex.test(input.value.trim())) {
				if (!pmReferenceErrorsArray.includes(input.name)) {
					pmReferenceErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Email';
				showError('refEmail_' + num + '_err', errorMessage)
			} else {
				pmReferenceErrorsArray = pmReferenceErrorsArray.filter(function (e) { return e !== input.name })
				showError('refEmail_' + num + '_err', '')
			}
		} else {
			pmReferenceErrorsArray = pmReferenceErrorsArray.filter(function (e) { return e !== input.name })
			showError('refEmail_' + num + '_err', '')
		}
	}
	else if (input?.id?.includes("refPhone")) {
		let nameArray = input.id.split("_")
		let num = nameArray[nameArray.length - 1];
		if (input.value != '') {
			const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
			if (!regex.test(input.value.trim())) {
				if (!pmReferenceErrorsArray.includes(input.name)) {
					pmReferenceErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Phone Number';
				showError('refPhone_' + num + '_err', errorMessage)
			} else {
				pmReferenceErrorsArray = pmReferenceErrorsArray.filter(function (e) { return e !== input.name })
				showError('refPhone_' + num + '_err', '')
			}
		} else {
			pmReferenceErrorsArray = pmReferenceErrorsArray.filter(function (e) { return e !== input.name })
			showError('refPhone_' + num + '_err', '')
		}
	}
	console.log('errors-', pmReferenceErrorsArray)
}

//---------for Resume----------
var resumeModal = document.querySelector('#edit-Resume');
var resumeInputs = resumeModal.querySelectorAll('input');
var resumeUploadErrorsArray = []
for (let input of resumeInputs) {
	input.addEventListener('change', function () {
		validateUploadResume(input)
	})
}
function validateUploadResume(input) {
	let errorMessage = '';

	if (input.name == 'Resume') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!resumeUploadErrorsArray.includes(input.name)) {
					resumeUploadErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('Resume_err', errorMessage)
			} else {
				resumeUploadErrorsArray = resumeUploadErrorsArray.filter(function (e) { return e !== input.name })
				showError('Resume_err', '')
			}
		} else {
			resumeUploadErrorsArray = resumeUploadErrorsArray.filter(function (e) { return e !== input.name })
			showError('Resume_err', '')
		}
	}

	console.log('errors-', resumeUploadErrorsArray)
}

//---------for Signature----------
var signatureModal = document.querySelector('#edit-signature');
var signatureInputs = signatureModal.querySelectorAll('input');
var signatureUploadErrorsArray = []
for (let input of signatureInputs) {
	input.addEventListener('change', function () {
		validateUploadSignature(input)
	})
}
function validateUploadSignature(input) {
	let errorMessage = '';

	if (input.name == 'singatureDocument') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!signatureUploadErrorsArray.includes(input.name)) {
					signatureUploadErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('signatureDocument_err', errorMessage)
			} else {
				signatureUploadErrorsArray = signatureUploadErrorsArray.filter(function (e) { return e !== input.name })
				showError('signatureDocument_err', '')
			}
		} else {
			signatureUploadErrorsArray = signatureUploadErrorsArray.filter(function (e) { return e !== input.name })
			showError('signatureDocument_err', '')
		}
	}

	console.log('errors-', signatureUploadErrorsArray)
}

//===================== validation functions ends here=======================


function firstCall() {


	var myHeaders = new Headers();
	myHeaders.append("Content-Type", "application/json");


	var requestOptions = {
		method: "GET",
		headers: myHeaders,
		redirect: "follow"
	};

	fetch(contextPath + "/getPmDetails?companyId=", requestOptions)
		.then(response => response.json())  // Parse the response as JSON
		.then(result => {
			console.log(result);

			RequirementList = result.data
			addToId(result.data)
			References(result.data.pmRefrenceModels)
			companyPM(result.data.companyName ?? [])

			if (result.data.singatureDocumentUrl) {
				// Assuming relevantDocumentUrl is the id of the element
				const singatureDocumentUrl = document.getElementById("singatureDocumentUrl");
				const companySignature = document.getElementById("companySignature")
				forSignature(companySignature, result.data.singatureDocumentUrl)

				forSignature(singatureDocumentUrl, result.data.singatureDocumentUrl)
				// Function to check if the URL points to a PDF

			}


		})
		.catch(error => console.error("Error:", error));
}

function addToId(rowData) {
	Object.keys(rowData).forEach(function (key) {
		var div = $("#profile [name='" + key + "']");



		// Get the value from rowData, default to "" if not present
		var value = rowData[key] ? rowData[key] : "";

		if (key === "relevantDocumentUrl" || key === "resumeLink" || key === "singatureDocumentUrl" || key === "relevantDocumentId" || key === "resumeId" || key === "signatureDocumentId") {
			value = rowData[key] ? rowData[key] : "";
			var div = $(".modal [name='" + key + "']");
			if (key === "relevantDocumentId") {
				if (div.length) {
					div.html(value);
				}

			} if (key === "relevantDocumentUrl") {
				let buttons = document.getElementsByName("relevantDocumentUrlProfile");
				documents(buttons, key, value, "Document")
			}

			if (key === "resumeId") {
				if (div.length) {
					div.html(value);
				}
			}
			if (key === "resumeLink") {
				let buttons = document.getElementsByName("resumeLinkProfile");
				documents(buttons, key, value, "Resume")
			}

			if (key === "signatureDocumentId") {
				if (div.length) {
					div.html(value);
				}
			}
			if (key === "resumeLink") {
				let buttons = document.getElementsByName("resumeLinkProfile");
				documents(buttons, key, value, "Resume")
			}
		} else if (!div.length) {
			if (key === "addressId" || key === "exp_id") {
				div = $(".modal [name='" + key + "']");
				if (div.length) {
					div.html(value);
				}
			}
			return;
		} else {
			div.html(value);

		}

		var inputs = document.querySelectorAll('.custom-edit-modal input[name="' + key + '"]');
		var selects = document.querySelectorAll('.custom-edit-modal select[name="' + key + '"]');
		var textArea = document.querySelectorAll('.custom-edit-modal textarea[name="' + key + '"]');

		// console.log(selects)

		// Update the value of the matching input elements

		inputs.forEach(input => {
			input.value = value;
		});
		textArea.forEach(input => {
			input.value = value;
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
				const newOption = new Option(value, value, true, true);
				select.add(newOption);
			}

			// Restore disabled attribute if it was previously set
			if (wasDisabled) {
				select.disabled = true;
			}
		});
	})
}
function documents(buttons, key, value, text) {
    if (buttons.length > 0) {
        let button = buttons[0];
        var url = value.toLowerCase();
        var isImage = url.endsWith(".jpg") || url.endsWith(".jpeg") || url.endsWith(".png") || url.endsWith(".gif");
        var isPdf = url.endsWith(".pdf");

        if (isImage || isPdf || url.startsWith("http")) {
            // Set the button's text and attach an onclick event
            button.innerHTML = text;
            button.style.display = 'inline-block';  // Make sure the button is visible
            button.onclick = function() {
                window.open(value, '_blank'); // Open the link in a new tab
            };
        } else {
            // Hide or remove the button if URL is not valid
            button.style.display = 'none'; // Hide the button
            button.onclick = null;  // Remove any existing click event
        }
    }
}

function save(url, formId) {
	var Body;

	// validate here first
	let parentDivId = formId.replace(/-form$/, '');
	let error;
	// console.log('parentDivId',parentDivId)
	if (parentDivId == '#edit-company-details') {
		let isRequiredErr = checkRequiredFields(personalInformationInputs, parentDivId)
		if (!isRequiredErr || personalInformationErrorsArray.length != 0) {
			error = true
		}
	} else if (parentDivId == '#edit-company-address') {
		let isRequiredErr = checkRequiredFields(addressInformationInputs, parentDivId)
		if (!isRequiredErr || addressInformationErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-professional-information') {
		let isRequiredErr = checkRequiredFields(professionalInformationInputs, parentDivId)
		if (!isRequiredErr || professionalInformationErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-legal-information') {
		let isRequiredErr = checkRequiredFields(legalInformationInputs, parentDivId)
		if (!isRequiredErr || legalInformationErrorsArray.length != 0) {
			error = true
		}
	} else if (parentDivId == '#edit-PM-Experience') {
		if (pmExperienceErrorsArray.length != 0) {
			error = true
		}
	} else if (`#${parentDivId}` == '#edit-PM-Refrence') {
		if (pmReferenceErrorsArray.length != 0) {
			error = true
		}
	}else if (parentDivId == '#edit-Resume-form') {
		if (resumeUploadErrorsArray.length != 0) {
			error = true
		}
	}else if (parentDivId == '#edit-signature-form') {
		if (signatureUploadErrorsArray.length != 0) {
			error = true
		}
	}


	if (error) {
		return; //no API call if found true(i.e Some Required fields are empty)
	}

	if (url === "/updatePMProfessionalDetails") {
		var finalData = {};

		// Collect form data
		var form = document.getElementById(formId);
		var formData = new FormData(form);

		// Populate finalData with form data
		formData.forEach((value, key) => {
			finalData[key] = value;
		});
		console.log(finalData)

		Body = formData
		formId = "#" + formId.replace(/-form$/, '');


	} else if (url === "/updatePMProfessionalDetails" || url === "/updatePMResume" || url === "updatePMProfessionalDetails" || url === "/saveOrUpdatePMReference") {
		var finalData = {};

		// Collect form data
		var form = document.getElementById(formId);
		var formData = new FormData(form);

		// Populate finalData with form data
		formData.forEach((value, key) => {
			finalData[key] = value;
		});
		console.log(finalData)

		Body = formData
		formId = "#" + formId.replace(/-form$/, '');


	} else {
		var finalData = {};
		// Get all input, select, and textarea elements from the parent div
		var inputs = $(formId).find('input, select, textarea');

		// Iterate through the inputs to find the one with ID "profile-pic-input"

		// Check if any inputs were found
		if (inputs.length === 0) {
			console.error("No input or select elements found within the parent div.");
			return;
		}
		// Check if the specific div with id 'edit{key}' exists

		// Iterate over each input element
		inputs.each(function () {
			// Get the input element
			var input = $(this);
			var key = input.attr('name'); // Get the name of the input element
			var value = input.val(); // Get the value of the input element



			if (key === "addressId" || key === "exp_id") {

				value = input.text() == "" ? "" : input.text();
			}
			if (key === "relevantDocumentUrl" || key === "resumeLink" || key === "singatureDocumentUrl" || key === "relevantDocumentId" || key === "signatureDocumentId" || key === "resumeId" || key === "relevantDocuments") {
				return
			}

			finalData[key] = value;



		});
		console.log(finalData)


		var myHeaders = new Headers();
		myHeaders.append("Content-Type", "application/json");
		Body = JSON.stringify(finalData)

	}




	var requestOptions = {
		method: 'POST',
		headers: myHeaders,
		body: Body
	};
	fetch(contextPath + url, requestOptions)
		.then(response => response.json())  // Parse the response as JSON
		.then(result => {
			console.log(result);

			if (result.status === 'true') {

				firstCall()
				toastr.success('Sucessfully Updated The Details');
				$(formId).modal('hide'); // Redirect to BuyersRequirementList


			} else {
				toastr.error('Something went wrong');
			}
		})

}
var count;
var companyColCount = count;
function companyPM(args) {
	var Professional = document.getElementById("Professional");

	var companyName = document.getElementById("company-parent-row");
	count = args.length;
	companyColCount = count

	if (args.length != 0) {

		Professional.innerHTML = "";
		companyName.innerHTML = "";

		for (var i = 0; i < args.length; i++) { // Corrected the loop syntax
			var content = `<div class="col-12 col-sm-6 col-md-6 col-lg-6">
                            <h6 class="heading">Company Name ${i + 1}</h6>
                            <p class="text">${args[i]}</p> <!-- Insert actual company name from args -->
                        </div>`;
			var modalContent =
				`<div class="col-md-6 col-sm-12 col-12">
								<div class="field-group">
									<input type="text" name="companyName[${i}]" value="${args[i]}"
										id="professionalInfoCompanyName_${i}" class="input-field"
										placeholder="Company Name ${i + 1}" required autocomplete="off">
									<label for="professionalInfoCompanyName_${i}" class="input-label">Company
										Name ${i + 1}${i === 0 ? '<span class="required-asterisk">*</span>' : ''}
									</label> <span id="professionalInfoCompanyName_${i}_err" class="err-text"></span>
								</div>
							</div>`






			Professional.innerHTML += content;
			companyName.innerHTML += modalContent

		}
		var modalContent = `<div class="col-md-6 col-sm-12 col-12">
									<button class="btn-style-2 w-100" type="button"
										onclick="addNewCompanyColumn()">+ Add Other</button>
								</div>`
		companyName.innerHTML += modalContent

	}
}

var ReferencesCount;
function References(args) {
	var References = document.getElementById("References");
	var ReferencesModal = document.getElementById("References-modal");
	ReferencesModal.innerHTML = "";
	ReferencesModal.innerHTML = `<div class="col-12">
                    <h6 class="section-heading">References</h6>
                </div>`;

	References.innerHTML = "";
	References.innerHTML = `<div class="col-12">
                    <h6 class="section-heading">References</h6>
                </div>`;
	ReferencesCount = args.length;

	for (var i = 0; i < args.length; i++) {
		var content = document.createElement('div');

		if (args.length == 1) {
			content.className = "col-12 row row-gap-24 ";
		} else if (i == args.length - 1) {
			content.className = "col-12 row row-gap-24 ";
			content.style.padding = "20px 10px";
		} else {
			content.className = "col-12 row  borderBottom";
			content.style.padding = "20px 10px";

		}
		content.id = "mainRow";
		content.innerHTML = `
                    <h4  class="section-heading">${i + 1}.</h4>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <h6 class="heading">Name</h6>
                        <p class="text">${args[i].name}</p>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <h6 class="heading">Company/Organization</h6>
                        <p class="text">${args[i].companyName}</p>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <h6 class="heading">Email</h6>
                        <p class="text">${args[i].email}</p>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <h6 class="heading">Phone</h6>
                        <p class="text">${args[i].phone}</p>
                    </div>`;

		var modalContent = `
    <div class="row row-gap-16 pr-0">
        <h6 class="input-section-heading mb-8">${i + 1}.</h6>
          <input  vlaue="" name="pmRefrenceModels[${i}].id" value="${args[i].id}" hidden>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 pr-0">
            <div class="field-group">
                <input type="text" id="refName_${i}" name="pmRefrenceModels[${i}].name" class="input-field" value="${args[i].name}" placeholder="Name" autocomplete="off">
                <label for="refName_${i}" class="input-label">Name</label>
                <span class="err-text" id="refName_${i}_err"></span>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 pr-0">
            <div class="field-group">
                <input type="text" id="refCompany_${i}" name="pmRefrenceModels[${i}].companyName" class="input-field" value="${args[i].companyName}" placeholder="Company Name" autocomplete="off">
                <label for="refCompany_${i}" class="input-label">Company Name</label>
                <span class="err-text" id="refCompany_${i}_err"></span>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 pr-0">
            <div class="field-group">
                <input type="text" id="refEmail_${i}" name="pmRefrenceModels[${i}].email" class="input-field" placeholder="Email" value="${args[i].email}" autocomplete="off">
                <label for="refEmail_${i}" class="input-label">Email</label>
                <span class="err-text" id="refEmail_${i}_err"></span>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 pr-0">
            <div class="field-group">
                <input type="text" id="refPhone_${i}" name="pmRefrenceModels[${i}].phone" class="input-field" placeholder="Phone" value="${args[i].phone}" autocomplete="off" maxlength="10">
                <label for="refPhone_${i}" class="input-label">Phone</label>
                <span class="err-text" id="refPhone_${i}_err"></span>
            </div>
        </div>
    </div>`;

		ReferencesModal.innerHTML += modalContent
		References.appendChild(content);
	}
	var modalContent = `<div class="col-lg-6 col-md-6 col-sm-12 col-12">
									<button class="btn-style-2 w-100" type="button"
										onclick="addNewReferencesColumn()">+ Add Other</button>
								</div>`
	ReferencesModal.innerHTML += modalContent

	//get all pm reference inputs (again for recently added)
	getPmAllReferenceInputs()

}
function addNewReferencesColumn() {
	var ReferencesModal = document.getElementById("References-modal");
	i = ReferencesCount
	let inputFieldStr = `
  
        <h6 class="input-section-heading mb-8">${i + 1}.</h6>
      
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 pr-0">
            <div class="field-group">
                <input type="text" id="refName_${i}" name="pmRefrenceModels[${i}].name" class="input-field"  placeholder="Name" autocomplete="off">
                <label for="refName_${i}" class="input-label">Name</label>
                <span class="err-text" id="refName_${i}_err"></span>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 pr-0">
            <div class="field-group">
                <input type="text" id="refCompany_${i}" name="pmRefrenceModels[${i}].companyName" class="input-field"  placeholder="Company Name" autocomplete="off">
                <label for="refCompany_${i}" class="input-label">Company Name</label>
                <span class="err-text" id="refCompany_${i}_err"></span>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 pr-0">
            <div class="field-group">
                <input type="text" id="refEmail_${i}" name="pmRefrenceModels[${i}].email" class="input-field" placeholder="Email"  autocomplete="off">
                <label for="refEmail_${i}" class="input-label">Email</label>
                <span class="err-text" id="refEmail_${i}_err"></span>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 pr-0">
            <div class="field-group">
                <input type="text" id="refPhone_${i}" name="pmRefrenceModels[${i}].phone" class="input-field" placeholder="Phone"  autocomplete="off" maxlength="10">
                <label for="refPhone_${i}" class="input-label">Phone</label>
                <span class="err-text" id="refPhone_${i}_err"></span>
            </div>
        </div>`;

	var newDiv = document.createElement('div');
	newDiv.className = "row row-gap-16 pr-0"
	newDiv.innerHTML = inputFieldStr;

	ReferencesModal.insertBefore(newDiv, ReferencesModal.lastElementChild);

	ReferencesCount = ReferencesCount + 1;
	//get all pm reference inputs (again for recently added)
	getPmAllReferenceInputs()
}

function addNewCompanyColumn() {
	var companyParentRow = document.getElementById("company-parent-row");

	let newCompanycol = document.createElement('div');
	newCompanycol.className = 'col-md-6 col-sm-12 col-12'
	let inputFieldStr = '<div class="field-group"><input type="text" name="companyName[' + companyColCount + ']" id="professionalInfoCompanyName_' + companyColCount + '" class="input-field" placeholder="Company Name ' + (companyColCount + 1) + '" required autocomplete="off"><label for="professionalInfoCompanyName_' + companyColCount + '" class="input-label">Company Name ' + (companyColCount + 1) + '</label><span id="professionalInfoCompanyName_' + companyColCount + '_err" class="err-text"></span></div>';

	newCompanycol.innerHTML = inputFieldStr;
	companyParentRow.insertBefore(newCompanycol, companyParentRow.lastElementChild);
	companyColCount = companyColCount + 1;
	//                    getAllInputs()
}

function forSignature(div, url) {
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

//----------------------------------------- js script for converting dropdown into textfield starts here --------------------------------------
document.addEventListener("DOMContentLoaded", function () {
	var arrowIconUrl = contextPath + '/assets/icons/close.png'
	//     	let arrowIconUrl  = '${pageContext.request.contextPath}/assets/icons/arrow.png'
	//     	let closeIconUrl = '../assets/icons/close.png'

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
					inputField.required = true;
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
						if (inputField.name == 'industry') {
							showError('industry_err', '')
						} else if (inputField.name == 'expertise') {
							showError('expertise_err', '')
						}
						event.preventDefault();
						selectDropdown.required = true;
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
						personalInformationInputs = personalInformationModal.querySelectorAll('input,select');
					})

					label = document.createElement('label')
					label.classList = 'input-label'
					label.setAttribute('for', selectDropdown.id)
					if (selectDropdown.options[0].innerHTML == 'Choose an Option' && selectDropdown.name == 'reference') {
						label.innerHTML = ""
					} else {
						label.innerHTML = selectDropdown.options[0].innerHTML + "<span class='required-asterisk'>*</span>"
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
					inputField.required = true;
					selectDropdown.disabled = true;
					inputField.disabled = false;

					inputDiv.style.display = 'block';
					selectDropdownBox.style.display = 'none'; // Hide the select field group
					inputCreated = true;
					personalInformationInputs = personalInformationModal.querySelectorAll('input,select');
					// if (inputDiv.style.display === 'block') {
					//     inputField.focus();
					//     console.log('input-focused')
					// }

					setTimeout(() => {
						inputField.focus();
						setTimeout(() => {
							if (document.activeElement !== inputField) {
								inputField.focus();
							}
						}, 100);
					}, 100);

					inputField.addEventListener('blur', function () {
						if (inputField.name == 'industry' || inputField.name == 'expertise') {
							validatePersonalInformation(inputField)
							// console.log('validate-here')
						}
					})

				}
				else {
					let inputDiv = selectDropdownBox.parentElement.querySelector('.input-created-box')
					let inputField = inputDiv.querySelector('.new-input-field');
					// inputDiv.appendChild(selectLabel);
					inputDiv.style.display = 'block';
					selectDropdown.required = false;
					inputField.required = true;
					selectDropdown.disabled = true;
					inputField.disabled = false;
					selectDropdownBox.style.display = 'none'; // Hide the select field group
					if (inputDiv.style.display === 'block') {
						inputField.focus();
					}
					personalInformationInputs = personalInformationModal.querySelectorAll('input,select');
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

});
//----------------------------------------- js script for converting dropdown into textfield ends here --------------------------------------