// js for custom file input
const handleClick = (inputId, textId) => {
	let file = document.getElementById(inputId);
	file.click();
	let text = document.getElementById(textId);
	file.addEventListener("change", function() {
		if (file.value) {
			let pathArr = file.value.split("\\");
			let nameStr = pathArr[pathArr.length - 1];
			let subStr = nameStr.split(".");
			if (nameStr.length > 8) {
				text.innerHTML =
					nameStr.substr(0, 5) + "..." + subStr[subStr.length - 1];
			} else {
				text.innerHTML = nameStr;
			}
		} else {
			text.innerHTML = "No file choosen";
		}
	});
};


// js for dropdowns
document.addEventListener("DOMContentLoaded", function() {
	var fieldGroups = document.querySelectorAll('.select-field-group');

	// for (let fieldGroup of fieldGroups) {
	//     let input = fieldGroup.querySelector('.input-field');
	//     let labelTag = fieldGroup.querySelector('.input-label');

	//     if (input?.type == "select-one") {
	//         if (input.type == "select-one") {
	//             labelTag.style.top = '20px';
	//             labelTag.style.fontSize = '16px';
	//             labelTag.style.color = '#7a7a7a';
	//             input.style.color = '#7a7a7a'
	//         }

	//         input.addEventListener('click', function () {
	//             if (input.type == "select-one") {
	//                 labelTag.style.display = 'block';
	//                 labelTag.style.fontSize = '12px';
	//                 labelTag.style.color = '#1A1C43';
	//                 labelTag.style.transform = 'translate(0px,-30px)';
	//                 labelTag.style.transition = '0.2s ease';
	//                 input.style.color = '#1A1C43';

	//             }
	//         })

	//         input.addEventListener('blur', function () {
	//             if (input.type == "select-one") {
	//                 if (input.value == "") {
	//                     input.style.color = '#7a7a7a';
	//                     labelTag.style.top = '20px';
	//                     labelTag.style.fontSize = '16px';
	//                     labelTag.style.color = '#7a7a7a';
	//                     input.style.color = '#7a7a7a';
	//                     labelTag.style.transform = 'translate(0px,0px)';
	//                     labelTag.style.transition = '0.2s ease';
	//                 }
	//                 else {
	//                     labelTag.style.display = 'block';
	//                     input.style.color = '#1A1C43';
	//                 }
	//             }
	//         })
	//     }
	// }
})


// function customSelectInitialization() {
//     var fieldGroups = document.querySelectorAll('.select-field-group');

//     for (let fieldGroup of fieldGroups) {
//         let input = fieldGroup.querySelector('.input-field');
//         let labelTag = fieldGroup.querySelector('.input-label');

//         if (input?.type == "select-one") {
//             let labelArray = [];
//             let label = '';
//             if (labelTag?.innerHTML?.includes('<span')) {
//                 labelArray = labelTag?.innerHTML?.split('<span');
//                 label = labelArray[0];
//                 if (label?.length > 20) {
//                     labelTag.innerHTML = label.slice(0, 20) + "...";
//                 }
//             }
//             else {
//                 label = labelTag.innerHTML;
//                 labelArray.push(labelTag.innerHTML);
//             }

//             if (input.type == "select-one") {
//                 labelTag.style.top = '20px';
//                 labelTag.style.fontSize = '16px';
//                 labelTag.style.color = '#7a7a7a';
//                 input.style.color = '#7a7a7a'
//                 if (labelArray.length == 1) {
//                     labelTag.innerHTML = labelArray[0];
//                 }
//                 else {
//                     labelTag.innerHTML = labelArray[0] + "<span" + labelArray[1];
//                 }

//                 if (input.value != '') {
//                     labelTag.style.display = 'block'
//                     labelTag.style.fontSize = '12px'
//                     labelTag.style.color = '#1A1C43'
//                     labelTag.style.transform = 'translate(0px,-30px)'
//                     input.style.color = '#1A1C43'
//                 }
//             }


//             input.addEventListener('click', function () {
//                 if (labelArray.length == 1) {
//                     labelTag.innerHTML = labelArray[0];
//                 }
//                 else {
//                     labelTag.innerHTML = labelArray[0] + "<span" + labelArray[1];
//                 }
//                 if (input.value == '') {
//                     if (labelArray.length == 1) {
//                         labelTag.innerHTML = labelArray[0];
//                     }
//                     else {
//                         labelTag.innerHTML = labelArray[0] + "<span" + labelArray[1];
//                     }
//                 }


//                 if (input.type == "select-one") {
//                     labelTag.style.display = 'block';
//                     labelTag.style.fontSize = '12px';
//                     labelTag.style.color = '#1A1C43';
//                     labelTag.style.transform = 'translate(0px,-30px)';
//                     labelTag.style.transition = '0.2s ease';
//                     input.style.color = '#1A1C43';
//                 }


//             })
//             input.addEventListener('blur', function () {
//                 if (labelArray.length == 1) {
//                     labelTag.innerHTML = labelArray[0];
//                 }
//                 else {
//                     labelTag.innerHTML = labelArray[0] + "<span" + labelArray[1];
//                 }
//                 if (input.value == '' && label?.length > 20) {
//                     labelTag.innerHTML = label.slice(0, 20) + "...";
//                 }


//                 if (input.type == "select-one") {
//                     if (labelArray.length == 1) {
//                         labelTag.innerHTML = labelArray[0];
//                     }
//                     else {
//                         labelTag.innerHTML = labelArray[0] + "<span" + labelArray[1];
//                     }

//                     if (input.value == "") {
//                         input.style.color = '#7a7a7a';
//                         labelTag.style.top = '20px';
//                         labelTag.style.fontSize = '16px';
//                         labelTag.style.color = '#7a7a7a';
//                         input.style.color = '#7a7a7a';
//                         labelTag.style.transform = 'translate(0px,0px)';
//                         labelTag.style.transition = '0.2s ease';
//                     }
//                     else {
//                         labelTag.style.display = 'block';
//                         input.style.color = '#1A1C43';
//                     }
//                 }
//             })
//         }
//     }
// }




//----------------------------------------- js script for tick all checkboxes in one click starts here --------------------------------------

function tickAllCheckboxes(parentCheckboxClass, childCheckboxClass) {
	const parentCheckbox = document.querySelector('.' + parentCheckboxClass);
	const childCheckboxes = document.querySelectorAll('.' + childCheckboxClass);

	function checkAllChildCheckboxes() {
		let allChecked = true;
		for (let checkbox of childCheckboxes) {
			if (!checkbox.checked) {
				allChecked = false;
				break;
			}
		}
		parentCheckbox.checked = allChecked;

	}

	parentCheckbox.addEventListener('change', function() {
		for (let checkbox of childCheckboxes) {
			checkbox.checked = this.checked;
			// checkIfAnyCheckboxChecked()
		}
	});

	for (let checkbox of childCheckboxes) {
		checkbox.addEventListener('change', function() {
			checkAllChildCheckboxes();
		});
	}
}
document.addEventListener('DOMContentLoaded', function() {
	// tickAllCheckboxes('parent-checkbox', 'child-checkboxes');
});

//----------------------------------------- js script for tick all checkboxes in one click ends here --------------------------------------




//----------------------------------------- js script for automatic date selection starts here --------------------------------------
document.addEventListener("DOMContentLoaded", function() {
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
document.addEventListener("DOMContentLoaded", function() {
	let dateFields = document.querySelectorAll('.date-field');
	for (let dateField of dateFields) {
		dateField.addEventListener('click', function() {
			dateField.style.color = '#1A1C43';
		});
		dateField.addEventListener('blur', function() {
			let value = dateField.value;
			let isValidDate = (new Date(value) !== "Invalid Date") && !isNaN(new Date(value));
			dateField.style.color = isValidDate ? '#1A1C43' : '#7a7a7a';
		});
	}
});

//----------------------------------------- js script for custom date selection ends here --------------------------------------



//----------- js for dropdown color when value="" starts-------------------------
document.addEventListener("DOMContentLoaded", function() {
	var selectDropdowns = document.querySelectorAll('select');
	function updateSelectColor(select) {
		if (select.value === "") {
			select.classList.add('gray-4');
			select.classList.remove('dark-blue');
		} else {
			select.classList.remove('gray-4');
			select.classList.add('dark-blue');
		}
	}
	for (let select of selectDropdowns) {
		updateSelectColor(select);
		select.addEventListener('blur', function() {
			updateSelectColor(select);
		});
		select.addEventListener('change', function() {
			updateSelectColor(select);
		});
	}
});

function customSelectInitialization() {
	var selectDropdowns = document.querySelectorAll('select');
	function updateSelectColor(select) {
		if (select.value === "") {
			select.classList.add('gray-4');
			select.classList.remove('dark-blue');
		} else {
			select.classList.remove('gray-4');
			select.classList.add('dark-blue');
		}
	}
	for (let select of selectDropdowns) {
		updateSelectColor(select);
		select.addEventListener('blur', function() {
			updateSelectColor(select);
		});
		select.addEventListener('change', function() {
			updateSelectColor(select);
		});
	}
}

//----------- js for dropdown color when value="" ends-------------------------
//Forcing UpperCase
var forceInputUppercase = function(e) {
	let el = e.target;
	let start = el.selectionStart;
	let end = el.selectionEnd;
	el.value = el.value.toUpperCase();
	el.setSelectionRange(start, end);
};

document.querySelectorAll(".uc-text").forEach(function(current) {
	current.addEventListener("keyup", forceInputUppercase);
});


//for showing and hiding password
$(document).ready(function() {
    $(".toggle-password").click(function() {
        $(this).toggleClass("fa-eye fa-eye-slash");
        let input = $(this).parent().find("input");
        if (input.attr("type") === "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });
});
