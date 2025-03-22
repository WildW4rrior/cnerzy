function replaceDiv(show, hidden) {
	var replce = document.getElementById(show);
	var newDiv = document.getElementById(hidden);


	replce.style.display = "block";
	newDiv.style.display = "none";
}
var paramsObj = {};

$(document).ready(function() {
	console.log("ready!");

	logQueryParams();
	firstCall()

});

function logQueryParams() {


	// Create a new URLSearchParams object from the current URL
	const urlParams = new URLSearchParams(window.location.search);
	if (urlParams.size !== 0) {
		// Iterate over the parameters and add them to the paramsObj
		urlParams.forEach((value, key) => {
			paramsObj[key] = value;
		});
		console.log(paramsObj.id)

		reEngageSeller(paramsObj,"url")

	}



} 
window.onload = function() {
	// Remove all query parameters from the URL
	logQueryParams()
	const url = window.location.protocol + "//" + window.location.host + window.location.pathname;
	window.history.replaceState({ path: url }, '', url);
};

function reEngageSeller(args,source) {
	
	
	if (args !== undefined) {
		if(!source){
			if (Object.keys(args).length !== 0) {
			paramsObj['id'] = args.sellerCompanyId; // Use a static key 'id' to store args
			paramsObj['name'] = args.companyName;
			console.log(paramsObj);
		}
		}
		

		$("p[id='editreEngagedSellerCid']").text(paramsObj.id);
		$("p[name='reEngagedSellerName']").text("You have selected " + paramsObj.name + " to Re-Engaged for your new requirement");
		$("input[name='reEngagedSellerCid']").val(paramsObj.id);
		$("select[name='sellerPreference']").html('<option value="Previously engaged sellers" selected>Previously engaged sellers</option>');
		$("select[name='sellerPreference']").val("Previously engaged sellers");

	}
	window.scrollTo({
		top: 0,
		behavior: 'smooth'
	});

}


function firstCall() {

	var requestOptions = {
		method: "GET",
		headers: myHeaders,
		redirect: "follow"
	};

	fetch(contextPath + "/getBuyerAllRequirementList", requestOptions)
		.then(response => response.json())  // Parse the response as JSON
		.then(result => {
			console.log(result);
			var PostRequirement = document.getElementById("PostRequirement");
			var CreateRequirement = document.getElementById("CreateRequirement");
			var editRequirment = document.getElementById("editRequirment");
			var backButton = document.getElementById("backButton");
			RequirementList = result.data
			if (result.data.length == 0) {
				backButton.style.display = "none";
				editRequirment.style.display = "none";
				CreateRequirement.style.display = "block";
				PostRequirement.style.display = "none";

			} else {
				backButton.style.display = "block";
				CreateRequirement.style.display = "none";
				editRequirment.style.display = "none";
				PostRequirement.style.display = "block";
				addOptionsToDropdown(result.data, "dropdown1")
				addOptionsToDropdown(result.data, "dropdown2")
			}
		})
		.catch(error => console.error("Error:", error));



	fetch(contextPath + "/getPreviousEngagedSellerList", requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			userListJson = JSON.parse(result)
			console.log(userListJson);
			sellerDivFunction(userListJson.data)
			if (userListJson.data.length === 0) {

				$("#editButtonForSellerPreferencer").prop("disabled", true); // Disable the button

				// Find the option with the value "previously engaged" in the select with id "sellerPreference" and disable it
				$("#sellerPreference option[value='previously engaged']").prop("disabled", true);
			}


		})
		.catch(error => console.error("Error:", error));


}


function addOptionsToDropdown(options, name) {
	const selectElement = document.getElementsByName(name)[0];

	// Clear existing options except the first one
	while (selectElement.options.length > 1) {
		selectElement.remove(1);
	}

	// Add new options from the provided array
	options.forEach(optionText => {
		const newOption = document.createElement('option');
		newOption.value = optionText.id;
		newOption.text = optionText.reqNo;
		selectElement.add(newOption);
	});
}

document.addEventListener("DOMContentLoaded", function() {
	const radioCols = document.querySelectorAll('.radio-style-1')
	for (let radioCol of radioCols) {
		// var input = radioCol.querySelector('input')
		// radioCol.addEventListener('click', function () {
		//     let currentSelect = radioCol.querySelector('select')
		//     let reqSelectInputs = document.querySelectorAll('.existing-req-select')
		//     for (let select of reqSelectInputs) {
		//         if (select != currentSelect) {
		//             select.value = ''
		//         }
		//     }
		//     for (let radioCol of radioCols) {
		//         radioCol.classList.remove('selected')
		//     }
		//     input.click()
		//     radioCol.classList.add('selected')
		// })
		radioCol.addEventListener('click', function() {
			var currentSelect = radioCol.querySelector('select')
			let reqSelectInputs = document.querySelectorAll('.existing-req-select')
			for (let select of reqSelectInputs) {
				if (select != currentSelect) {
					select.value = ''
					select.classList.remove('dark-blue')
				}
			}
			for (let radioCol of radioCols) {
				radioCol.classList.remove('selected')
			}
			radioCol.classList.add('selected')
			currentSelect.classList.add('dark-blue')

			let existingReqclassList = document.querySelector('#edit-existing-req').classList
			let choosenActionHeading = document.querySelector('#actionHeading')
			if (existingReqclassList.contains('selected')) {
				choosenActionHeading.innerHTML = 'Edit an Existing Requirement';
			} else {
				choosenActionHeading.innerHTML = 'Repost an Existing Requirement';
			}

		})


	}
});
document.addEventListener("DOMContentLoaded", function() {
	let form = document.querySelector('#post-requirement-1-form')
	form.addEventListener('submit', function(event) {
		event.preventDefault();
		let formData = new FormData(form);
		let formDataObj = {};

		formData.forEach((value, key) => {
			formDataObj[key] = value;
		});

		let json = formDataObj;
		if (formDataObj.dropdown1 === "" && formDataObj.dropdown2 === "") {
			toastr.error("Please select a requirement from at least one of the dropdowns.");
		} else {
			var id = formDataObj.dropdown1 !== "" ? formDataObj.dropdown1 : formDataObj.dropdown2;
			// Proceed with the operation using 'id'
			// For example:


			console.log('form-data', json);
			var requestOptions = {
				method: "GET",
				headers: myHeaders,

				redirect: "follow",
			};

			fetch(contextPath + "/viewRequirementById?id=" + id, requestOptions)
				.then(response => response.json())  // Parse the response as JSON
				.then(result => {
					console.log(result);
					addToId(result)
					replaceDiv("editRequirment", "PostRequirement")
				})
				.catch(error => console.error("Error:", error));
		}
	});
});



var postReqForm = document.querySelector('#post-requirement-form')
var inputs = postReqForm.querySelectorAll('input, select,textarea');
// console.log('Total Fields', inputs.length)
var getAllInput = function() {
	inputs = postReqForm.querySelectorAll('input, select,textarea');
	// console.log('Total Fields', inputs.length)
	for (let input of inputs) {
		input.addEventListener('blur', function() {
			validateForm(input);
		});
	}
}
var arrowIconUrl = contextPath + '/assets/icons/close.png'

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
	selectDropdown.addEventListener('change', function() {
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
				iconSpan.addEventListener('click', function(event) {
					event.preventDefault();
					if (inputField.name == 'industry') {
						showError('industry_err', '')
					} else if (inputField.name == 'service') {
						showError('service_err', '')
					}
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

					getAllInput()

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
				getAllInput()
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

				inputField.addEventListener('blur', function() {

					// if (inputField.name == 'industry_classification' || inputField.name == 'industry_expertise') {
					//     validateStep1()
					// }

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
				getAllInput()
			}
		}

	});

	// selectDropdown.addEventListener('blur', function () {
	//     if (this.value == '') {
	//         let inputDiv = selectDropdownBox.parentElement.querySelector('.input-created-box');
	//         if (inputCreated == true) {
	//             selectDropdownBox.appendChild(selectLabel);
	//             selectDropdown.required = true;
	//             selectDropdownBox.style.display = 'block';
	//             inputDiv.style.display = 'none';
	//         }
	//     }
	// })

}

// Get all select dropdowns
var selectDropdownsBoxes = document.querySelectorAll('.select-field-group-toggle');

// Convert each select dropdown to text input when "Other" is selected
selectDropdownsBoxes.forEach(function(selectDropdownBox) {
	convertDropdownToText(selectDropdownBox);
});

//----------------------------------------- js script for converting dropdown into textfield ends here --------------------------------------

//-------------------------------- validations starts here ---------------------
function showError(id, errorMsg) {
	let errSpan = document.getElementById(id)
	if (errSpan) {
		errSpan.innerHTML = errorMsg
	}
}
function checkRequiredFieldsWhileCreating(divId) {
	console.log("checkRequiredFields called")
	let allFilled = true;
	let firstRequiredField = null;
	// const div = document.getElementById(divId);
	// const inputs = div.querySelectorAll('input, select, textarea');


	for (let input of inputs) {
		if (input.name == 'industry' && input.value.trim() == '' && input.required) {
			// const value = input.value.trim();
			// console.log("Checking input: ", input.name, " with value: ", value); // Debug log
			allFilled = false;
			showError('industry_err', 'Industry is required')
		}
		else if (input.name == 'service' && input.value.trim() == '' && input.required) {
			allFilled = false;
			showError('service_err', 'Service is required')
		}
		else if (input.name == 'jobPostTitle' && input.value.trim() == '') {
			allFilled = false;
			showError('jobPostTitle_err', 'Title for Job Post is required')
		}
		else if (input.name == 'projectDescription' && input.value.trim() == '') {
			allFilled = false;
			showError('projectDescription_err', 'Brief Description of Project is required')
		}
		else if (input.name == 'quantityRequired' && input.value.trim() == '') {
			allFilled = false;
			showError('quantityRequired_err', 'Quantity is required')
		} else if (input.name == 'materialSpecifications' && input.value.trim() == '') {
			allFilled = false;
			showError('materialSpecifications_err', 'Material Specifications is required')
		} else if (input.name == 'qualitySpecifications' && input.value.trim() == '') {
			allFilled = false;
			showError('qualitySpecifications_err', 'Quality Specifications is required')
		} else if (input.name == 'packagingSpecifications' && input.value.trim() == '') {
			allFilled = false;
			showError('packagingSpecifications_err', 'Packaging Specifications is required')
		} else if (input.name == 'logisticsSpecifications' && input.value.trim() == '') {
			allFilled = false;
			showError('logisticsSpecifications_err', 'Logistics Specifications is required')
		} else if (input.name == 'deliveryTimelines' && input.value.trim() == '') {
			allFilled = false;
			showError('deliveryTimelines_err', 'Delivery Timelines are required')
		} else if (input.name == 'sellerLocation' && input.value.trim() == '') {
			allFilled = false;
			showError('sellerLocation_err', 'Seller Location is required')
		} else if (input.name == 'sellerPreference' && input.value.trim() == '') {
			allFilled = false;
			showError('sellerPreferences_err', 'Seller Preference is required')
		}


		if (allFilled == false && firstRequiredField == null) {
			firstRequiredField = input;
		}
	}

	console.log(firstRequiredField)
	// firstRequiredField.focus()
	if (firstRequiredField != null) {
		firstRequiredField.scrollIntoView({ behavior: 'smooth', block: 'center' });
	}
	return allFilled;
}

let errorsArray = [];
function validateForm(input) {
	// for (let input of inputs) {
	let errorMessage = '';
	if (input.name == 'industry') {
		if (input.value != '') {
			const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
			if (!regex.test(input.value.trim().trim())) {
				if (!errorsArray.includes(input.name)) {
					errorsArray.push(input.name);
				}
				errorMessage = 'Invalid Industry Name';
				showError('industry_err', errorMessage)
			} else {
				errorsArray = errorsArray.filter(function(e) { return e !== input.name })
				showError('industry_err', '')
			}
		} else {
			errorsArray = errorsArray.filter(function(e) { return e !== input.name })
			showError('industry_err', '')
		}
	}
	else if (input.name == 'service') {
		if (input.value != '') {
			const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
			if (!regex.test(input.value.trim().trim())) {
				if (!errorsArray.includes(input.name)) {
					errorsArray.push(input.name);
				}
				errorMessage = 'Invalid Service Name';
				showError('service_err', errorMessage)
			} else {
				errorsArray = errorsArray.filter(function(e) { return e !== input.name })
				showError('service_err', '')
			}
		} else {
			errorsArray = errorsArray.filter(function(e) { return e !== input.name })
			showError('service_err', '')
		}
	}
	else if (input.name == 'jobPostTitle') {
		// if (input.value != '') {
		//     const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
		//     if (!regex.test(input.value.trim())) {
		//         if (!errorsArray.includes(input.name)) {
		//             errorsArray.push(input.name);
		//         }
		//         errorMessage = 'Invalid City Name';
		//         showError('jobPostTitle_err', errorMessage)
		//     } else {
		//         errorsArray = errorsArray.filter(function (e) { return e !== input.name })
		//         showError('jobPostTitle_err', '')
		//     }
		// } else {
		errorsArray = errorsArray.filter(function(e) { return e !== input.name })
		showError('jobPostTitle_err', '')
		// }
	}
	else if (input.name == 'projectDescription') {
		showError('projectDescription_err', '')
	} else if (input.name == 'quantityRequired') {
		showError('quantityRequired_err', '')
	} else if (input.name == 'materialSpecifications') {
		showError('materialSpecifications_err', '')
	} else if (input.name == 'qualitySpecifications') {
		showError('qualitySpecifications_err', '')
	} else if (input.name == 'packagingSpecifications') {
		showError('packagingSpecifications_err', '')
	} else if (input.name == 'logisticsSpecifications') {
		showError('logisticsSpecifications_err', '')
	} else if (input.name == 'deliveryTimelines') {
		showError('deliveryTimelines_err', '')
	} else if (input.name == 'sellerLocation') {
		showError('sellerLocation_err', '')
	} else if (input.name == 'sellerPreference') {
		showError('sellerPreferences_err', '')
	}


	console.log(errorsArray)

}

for (let input of inputs) {
	input.addEventListener('blur', function() {
		validateForm(input);
	});
}






function handleCreateSubmit() {
	$("#post-requirement-form").submit(function(e) {
		e.preventDefault();
	})
	if (checkRequiredFieldsWhileCreating("post-requirement-form") && errorsArray.length == 0) {


		// Get form data
		const form = document.getElementById('post-requirement-form'); // Assuming 'post-requirement-form' is the ID of your form
		const formData = new FormData(form);

		let formDataObj = {};

		formData.forEach((value, key) => {
			formDataObj[key] = value;
		});

		let json = JSON.stringify(formDataObj);
		console.log('form-data', json);


		// Make API call with form data
		var myHeaders = new Headers();
		myHeaders.append("Content-Type", "application/json");


		var requestOptions = {
			method: "POST",
			headers: myHeaders,
			body: json,
			redirect: "follow",
		};

		fetch(contextPath + "/createNewRequirement", requestOptions)
			.then(response => response.json())  // Parse the response as JSON
			.then(result => {
				console.log(result);

				if (result.status === 'true') {
					var modalText = $("#requirement-posted #requirmentText");
					modalText.html("You've successfully posted your requirement " + result.RequirementName.requirementNo + ". Cnerzy will be reviewing your requirement in 1-2 days.");

					$("#requirement-posted").modal('show');
					setTimeout(function() {
						window.location.href = contextPath + '/BuyersRequirementList';  // Redirect to BuyersRequirementList
					}, 3000); // Redirect to BuyersRequirementList
				} else {
					toastr.error('Something went wrong');
				}
				/* BuyersRequirementList */
				/* data-bs-toggle="modal" data-bs-target="#requirement-posted" */// Log the result to the console
				// Add any further processing of result here if needed
			})
			.catch(error => console.error("Error:", error));

	}
}
function handleEditSubmit() {
	// Select all <p> elements with the class 'text'
	var inputs = document.querySelectorAll("p.text");

	// Iterate over each element and log its id and trimmed innerHTML
	// Select all <p> elements with the class 'text'

	var data = {};

	// Iterate over each element
	inputs.forEach(function(input) {
		// Log the original id and trimmed innerHTML
		console.log(input.id, input.innerHTML.trim());

		// Remove the prefix 'edit' from the id
		var key = input.id.replace('edit', '');

		// Get the trimmed innerHTML
		var value = input.innerHTML.trim();

		// Add the key-value pair to the data object
		data[key] = value;
	});




	let json = JSON.stringify(data);

	// Make API call with form data
	var myHeaders = new Headers();
	myHeaders.append("Content-Type", "application/json");


	var requestOptions = {
		method: "POST",
		headers: myHeaders,
		body: json,
		redirect: "follow",
	};

	fetch(contextPath + "/createNewRequirement", requestOptions)
		.then(response => response.json())  // Parse the response as JSON
		.then(result => {
			console.log(result); if (result.status === 'true') {
				var modalText = $("#requirement-posted #requirmentText");
				modalText.html("You've successfully posted your requirement " + result.RequirementName.requirementNo + ". Cnerzy will be reviewing your requirement in 1-2 days.");

				$("#requirement-posted").modal('show');
				setTimeout(function() {
					window.location.href = contextPath + '/BuyersRequirementList';  // Redirect to BuyersRequirementList
				}, 3000); // Redirect to BuyersRequirementList
			} else {
				toastr.error('Something went wrong');
			}
		})
		.catch(error => console.error("Error:", error));


}


function addToId(rowData) {
	Object.keys(rowData).forEach(function(key) {
		var div = $("#editRequirment #edit" + key);
		var modalDiv = $(".modal #" + key)
		// Check if the specific div with id 'edit{key}' exists
		if (!div.length) {
			return;
		}
		// Get the value from rowData, default to "" if not present
		var value = rowData[key] ? rowData[key] : "";

		// Update the HTML content of the div
		if (key === "sellerPreference" || key === "sellerLocation" || key === "industry" || key === "service" || key === "reEngagedSellerCid") {
			div.html(value);
			if (paramsObj.id && key === "sellerPreference") {
				$(".sellerPreference").each(function() {
					$(this).html("Previously Engaged sellers");
				});
				$("#editsellerPreference").html("Previously Engaged sellers")
				$("#editButtonForSellerPreference").prop("disabled", true);
				if (key === "reEngagedSellerCid") {
					div.html(paramsObj.id)
				}
			}
		} else {
			div.html(value);
			modalDiv.html(value)
		}


		var inputs = document.querySelectorAll('.custom-edit-modal input[name="' + key + '"]');
		var selects = document.querySelectorAll('.custom-edit-modal select[name="' + key + '"]');


		// Update the value of the matching input elements
		inputs.forEach(input => {

			input.value = value;
		});

		selects.forEach(select => {
			let optionFound = false;

			// Convert options to an array and check if the value exists
			Array.from(select.options).forEach(option => {
				if (paramsObj.id && key === "sellerPreference") {
					value = "Previously Engaged sellers"
					$(".sellerPreference").each(function() {
						$(this).html("Previously Engaged sellers");
					});
					$("#editsellerPreference").html("Previously Engaged sellers")
					$("#editButtonForSellerPreference").prop("disabled", true);

				}
				if (option.value.toLowerCase() === value.toLowerCase()) {
					option.selected = true;
					optionFound = true;
				}

			});

			// If the option is not found, add a new one with the value and select it
			if (!optionFound) {
				const newOption = new Option(value, value, true, true);
				select.add(newOption);
			}
		});

	})
}

//--------------Edit Requirement Validations starts here-------------



// for checking required fields modal's ID-wise
function checkRequiredFields(inputs, modalId) {
	// console.log("checkRequiredFields called")
	let allFilled = true;
	let firstRequiredField = null;
	for (let input of inputs) {
		if (modalId == '#industry-and-service') {
			if (input.name == 'industry' && input.value.trim() == '' && input.required) {
				// const value = input.value.trim();
				// console.log("Checking input: ", input.name, " with value: ", value); // Debug log
				allFilled = false;
				showError('e_industry_err', 'Industry is required')
			}
			else if (input.name == 'service' && input.value.trim() == '' && input.required) {
				allFilled = false;
				showError('e_service_err', 'Service is required')
			}
			else if (input.name == 'jobPostTitle' && input.value.trim() == '') {
				allFilled = false;
				showError('e_jobPostTitle_err', 'Title for Job Post is required')
			}
		}
		else if (modalId == '#edit-description') {
			if (input.name == 'projectDescription' && input.value.trim() == '') {
				allFilled = false;
				showError('e_projectDescription_err', 'Brief Description of Project is required')
			}
		}
		else if (modalId == '#edit-specifications') {
			if (input.name == 'quantityRequired' && input.value.trim() == '') {
				allFilled = false;
				showError('e_quantityRequired_err', 'Quantity is required')
			} else if (input.name == 'materialSpecifications' && input.value.trim() == '') {
				allFilled = false;
				showError('e_materialSpecifications_err', 'Material Specifications is required')
			} else if (input.name == 'qualitySpecifications' && input.value.trim() == '') {
				allFilled = false;
				showError('e_qualitySpecifications_err', 'Quality Specifications is required')
			} else if (input.name == 'packagingSpecifications' && input.value.trim() == '') {
				allFilled = false;
				showError('e_packagingSpecifications_err', 'Packaging Specifications is required')
			} else if (input.name == 'logisticsSpecifications' && input.value.trim() == '') {
				allFilled = false;
				showError('e_logisticsSpecifications_err', 'Logistics Specifications is required')
			} else if (input.name == 'deliveryTimelines' && input.value.trim() == '') {
				allFilled = false;
				showError('e_deliveryTimelines_err', 'Delivery Timelines are required')
			} else if (input.name == 'sellerLocation' && input.value.trim() == '') {
				allFilled = false;
				showError('e_sellerLocation_err', 'Seller Location is required')
			}
		}
		else if (modalId == '#edit-seller-preferences') {
			if (input.name == 'sellerPreference' && input.value.trim() == '') {
				allFilled = false;
				showError('e_sellerPreference_err', 'Seller Preference is required')
			}
		}


		if (allFilled == false && firstRequiredField == null) {
			firstRequiredField = input;
		}
	}

	console.log(firstRequiredField)
	// firstRequiredField.focus()
	if (firstRequiredField != null) {
		firstRequiredField.scrollIntoView({ behavior: 'smooth', block: 'center' });
	}
	return allFilled;
}

//---------for Industry and Service popup validations----------
var industryAndServiceModal = document.querySelector('#industry-and-service');
var industryAndServiceInputs = industryAndServiceModal.querySelectorAll('input,select,textarea');
var industryAndServiceErrorsArray = []
for (let input of industryAndServiceInputs) {
	input.addEventListener('change', function() {
		validateIndustryAndService(input)
	})
}
function validateIndustryAndService(input) {
	let errorMessage = '';
	if (input.name == 'industry') {
		if (input.value != '') {
			const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
			if (!regex.test(input.value.trim().trim())) {
				if (!industryAndServiceErrorsArray.includes(input.name)) {
					industryAndServiceErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Industry Name';
				showError('e_industry_err', errorMessage)
			} else {
				industryAndServiceErrorsArray = industryAndServiceErrorsArray.filter(function(e) { return e !== input.name })
				showError('e_industry_err', '')
			}
		} else {
			industryAndServiceErrorsArray = industryAndServiceErrorsArray.filter(function(e) { return e !== input.name })
			showError('e_industry_err', '')
		}
	}
	else if (input.name == 'service') {
		if (input.value != '') {
			const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
			if (!regex.test(input.value.trim().trim())) {
				if (!industryAndServiceErrorsArray.includes(input.name)) {
					industryAndServiceErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid Service Name';
				showError('e_service_err', errorMessage)
			} else {
				industryAndServiceErrorsArray = industryAndServiceErrorsArray.filter(function(e) { return e !== input.name })
				showError('e_service_err', '')
			}
		} else {
			industryAndServiceErrorsArray = industryAndServiceErrorsArray.filter(function(e) { return e !== input.name })
			showError('e_service_err', '')
		}
	}
	else if (input.name == 'jobPostTitle') {
		// if (input.value != '') {
		//     const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
		//     if (!regex.test(input.value.trim())) {
		//         if (!industryAndServiceErrorsArray.includes(input.name)) {
		//             industryAndServiceErrorsArray.push(input.name);
		//         }
		//         errorMessage = 'Invalid City Name';
		//         showError('e_jobPostTitle_err', errorMessage)
		//     } else {
		//         industryAndServiceErrorsArray = industryAndServiceErrorsArray.filter(function (e) { return e !== input.name })
		//         showError('e_jobPostTitle_err', '')
		//     }
		// } else {
		industryAndServiceErrorsArray = industryAndServiceErrorsArray.filter(function(e) { return e !== input.name })
		showError('e_jobPostTitle_err', '')
		// }
	}

	console.log('errors-', industryAndServiceErrorsArray)
}

//---------for Brief Description popup validations----------
var descriptionModal = document.querySelector('#edit-description');
var descriptionInputs = descriptionModal.querySelectorAll('input,select,textarea');
var descriptionErrorsArray = []
for (let input of descriptionInputs) {
	input.addEventListener('change', function() {
		validateDescriptionInputs(input)
	})
}
function validateDescriptionInputs(input) {
	let errorMessage = '';
	if (input.name == 'projectDescription') {
		showError('e_projectDescription_err', '')
	}
	console.log('errors-', descriptionErrorsArray)
}

//---------for Edit Specifications popup validations----------
var specificationsModal = document.querySelector('#edit-specifications');
var specificationsInputs = specificationsModal.querySelectorAll('input,select,textarea');
var specificationsErrorsArray = []
for (let input of specificationsInputs) {
	input.addEventListener('change', function() {
		validateSpecifications(input)
	})
}
function validateSpecifications(input) {
	let errorMessage = '';
	if (input.name == 'quantityRequired') {
		showError('e_quantityRequired_err', errorMessage)
	} else if (input.name == 'materialSpecifications') {
		showError('e_materialSpecifications_err', errorMessage)
	} else if (input.name == 'qualitySpecifications') {
		showError('e_qualitySpecifications_err', errorMessage)
	} else if (input.name == 'packagingSpecifications') {
		showError('e_packagingSpecifications_err', errorMessage)
	} else if (input.name == 'logisticsSpecifications') {
		showError('e_logisticsSpecifications_err', errorMessage)
	} else if (input.name == 'deliveryTimelines') {
		showError('e_deliveryTimelines_err', errorMessage)
	} else if (input.name == 'sellerLocation') {
		showError('e_sellerLocation_err', errorMessage)
	}
	console.log('errors-', specificationsErrorsArray)
}

//------for Edit Seller Preferences popup---------------
var sellerPreferenceModal = document.querySelector('#edit-seller-preferences');
var sellerPreferenceInputs = sellerPreferenceModal.querySelectorAll('input,select,textarea');
var sellerPreferenceErrorsArray = []
for (let input of sellerPreferenceInputs) {
	input.addEventListener('change', function() {
		validateSellerPreferenceInputs(input)
	})
}
function validateSellerPreferenceInputs(input) {
	let errorMessage = '';
	if (input.name == 'sellerPreference') {
		showError('e_sellerPreference_err', errorMessage)
	}
	console.log('errors-', descriptionErrorsArray)
}


//--------------Edit Requirement Validations ends here---------------

function save(parentDivId) {
	// Get all input and select elements from the parent div
	var inputs = $(parentDivId).find('input, select, textarea');


	let error;
	if (parentDivId == '#industry-and-service') {
		let isRequiredErr = checkRequiredFields(inputs, parentDivId)
		if (!isRequiredErr || industryAndServiceErrorsArray.length != 0) {
			error = true
		}
	} else if (parentDivId == '#edit-description') {
		let isRequiredErr = checkRequiredFields(inputs, parentDivId)
		if (!isRequiredErr || descriptionErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-specifications') {
		let isRequiredErr = checkRequiredFields(inputs, parentDivId)
		if (!isRequiredErr || specificationsErrorsArray.length != 0) {
			error = true
		}
	}
	else if (parentDivId == '#edit-seller-preferences') {
		let isRequiredErr = checkRequiredFields(inputs, parentDivId)
		if (!isRequiredErr || sellerPreferenceErrorsArray.length != 0) {
			error = true
		}
	}
	if (error) {
		return; //no API call if found true(i.e Some Required fields are empty)
	}


	// Debugging: Log the inputs object to verify elements are selected
	console.log(inputs);

	// Check if any inputs were found
	if (inputs.length === 0) {
		console.error("No input or select elements found within the parent div.");
		return;
	}

	// Iterate over each input element
	inputs.each(function() {
		// Get the input element
		var input = $(this);
		var key = input.attr('name') || input.attr('id'); // Get the name or id of the input element
		var value = input.val(); // Get the value of the input element

		// Construct the div id based on the key
		var divId = key;

		// Get the corresponding div element
		var div = $("#editRequirment #edit" + divId);

		// Check if the div exists
		if (div.length) {
			// Update the HTML content of the div
			div.html(value);
		} else {
			console.error("Element with id '" + divId + "' not found.");
		}
	});
	$(parentDivId).modal('hide');
}
var sellerCurrentPage = 1;
var sellerRowsPerPage = 3;

function sellerDivFunction(args) {
	var table = document.getElementById("mainDivSection3");
	var rowsContainer = table.querySelector(".rows-container");

	if (!Array.isArray(args)) {
		args = [args];
	}
	if (!rowsContainer) {
		rowsContainer = document.createElement("div");
		rowsContainer.className = "rows-container";
		table.appendChild(rowsContainer);
	} else {
		rowsContainer.innerHTML = ""; // Clear existing rows
	}
	if (args.length == 0) {
		rowsContainer.innerHTML = ""; // Clear existing rows
		$("#mainDivSection3  #pagination").css("display", "none");

		$("#mainDivSection3 #NoData").css("display", "flex");

	} else {



		for (let i = 0; i < args.length; i++) {
			makeSellerRows(args[i], i, rowsContainer)
		}
	}
}
function makeSellerRows(args, i, rowsContainer) {
	var sellerDiv = document.createElement("div");
	sellerDiv.className = "sellerDiv custom-view-seller-modal card-style-2";
	var saveIconDiv = document.createElement("div");
	var details = document.createElement("div");
	details.className = "details";

	var div = document.createElement("div");
	div.className = "info"
	var companyImage = document.createElement("div")
	companyImage.className = "companyImage";
	if (args.comapnyLogoUrl) {
		companyImage.style.borderRadius = "100%";
		companyImage.style.backgroundImage = "url(" + args.comapnyLogoUrl + ")";
	}else{
		companyImage.style.borderRadius = "100%";
		companyImage.style.backgroundImage = "url(assets/icons/person-blue.svg)";
	}
	var companyName = document.createElement("h6");
	companyName.className = "companyName title";
	companyName.innerHTML = args.companyName;
	var industry = document.createElement("span");
	industry.className = "industry subtitle";
	industry.innerHTML = "Industry: " + args.companyIndustry;
	var location = document.createElement("div");
	location.className = "location location-info";

	var cityState = document.createElement("p");
	cityState.className = 'cityState location-text';
	cityState.innerHTML = '<img src="assets/icons/location.svg" alt=""	class="location-icon"> ' + args.location
	var noOfProjects = document.createElement("p");
	noOfProjects.className = "noOfProjects text";
	noOfProjects.innerHTML = args.numberOfProjectsCompleted + " Projects Completed";

	location.append(cityState, noOfProjects)

	var ratingDiv = document.createElement("div");
	ratingDiv.className = "ratingDiv ratings";
	var rating = document.createElement("p");
	rating.className = "rating text";
	rating.innerHTML = args.numberOfRatings + " Ratings";
	ratingDiv.appendChild(rating);
	var starDiv = document.createElement("div");
	starDiv.className = "stars text-nowrap"
	//			for (var j = 0; j < args.numberOfRatings; j++) {
	//
	//				var star = document.createElement("i");
	//				star.className = "material-icons";
	//				star.innerHTML = "star";
	//				ratingDiv.appendChild(star);
	//			}

	starsCount = Math.floor(parseInt(args.ratings));

	for (var j = 0; j < starsCount; j++) {
		var filledStar = document.createElement("i");
		filledStar.className = "material-icons";
		filledStar.textContent = "star";
		starDiv.append(filledStar);
	}

	// Add empty stars to make a total of 5
	for (var j = starsCount; j < 5; j++) {
		var emptyStar = document.createElement("i");
		emptyStar.className = "material-icons";
		emptyStar.textContent = "star_border";
		starDiv.append(emptyStar);
	}
	ratingDiv.append(starDiv)
	var linkedIn;
	if (args.linkedInProfile) {
		linkedIn = document.createElement("a");
		linkedIn.className = "linkedIn link";
		linkedIn.target = "_blank";
		linkedIn.href = args.linkedInProfile ? args.linkedInProfile : ""
		linkedIn.innerHTML = args.linkedInProfile
	} else {
		linkedIn = document.createElement("span");
		linkedIn.innerHTML = ""
	}




	var buttonDiv = document.createElement("div");
	buttonDiv.className = "buttonDiv   nav-btns ";
	var view = document.createElement("button");
	view.className = "btn-outlined";
	view.innerHTML = "View";
	view.setAttribute('data-bs-toggle', 'modal')
	view.setAttribute('data-bs-target', '#seller-profile')
	view.onclick = function() {
		addToIdSeller(args.sellerCompanyId, "seller-profile", args);
	};
	var contact = document.createElement("button");
	// var reEngage = document.createElement("button");
	// reEngage.className = "reEngage";
	// reEngage.innerHTML = "Re-Engage"
	contact.className = "reEngage";
	contact.innerHTML = "Re-Engage"
	contact.onclick = function() {
		reEngageSeller(args)

	};
	buttonDiv.append(view, contact)



	div.append(companyImage, companyName, industry, location, ratingDiv, linkedIn)
	details.append(saveIconDiv, div, buttonDiv)
	sellerDiv.append(details, saveIconDiv);


	rowsContainer.appendChild(sellerDiv);

}

function addToIdSeller(index, divId, args) {
	console.log()
	var rowData = {}
	if (divId === "seller-profile") {
		rowData = args;
		$("#seller-profile .stars.text-nowrap").empty()

	} else {
		rowData = index
	}

	Object.keys(rowData).forEach(function(key) {

		var div = $("#" + divId + " #" + key);

		if (!div.length) {
			return;
		}

		var value = rowData[key] ? rowData[key] : "";
		if (divId === "seller-profile") {

			if (key === "comapnyLogoUrl") {
				var img = div.find("img");
				if (value !== "") {
					img.attr("src", value);
				} else {
					
				}


				return
			} else if (key === "ratings") {
				div.html(value == "" ? "0 " : value + " ");

				starsCount = value == "" ? "0 " : Math.round(parseFloat(value));
				if (divId === "seller-profile")
					var starsContainer = $("#seller-profile .rating-info .stars.text-nowrap")

				starsContainer.empty()
				for (var i = 0; i < starsCount; i++) {
					var filledStar = document.createElement("i");
					filledStar.className = "material-icons active";
					filledStar.textContent = "star";
					starsContainer.append(filledStar);
				}

				// Add empty stars to make a total of 5
				for (var i = starsCount; i < 5; i++) {
					var emptyStar = document.createElement("i");
					emptyStar.className = "material-icons";
					emptyStar.textContent = "star_border";
					starsContainer.append(emptyStar);
				}
			} else if (key === "numberOfRatings") {
				div.html(value == "" ? "0 " : value + " ");
			} else if (key === "projectCaseStudies") {
				makeCaseStudy(value, divId)
			} else {
				div.html(value);
			}


		} else {
			div.html(value);
		}



	});

}

