// let arrowIconUrl = 'https://cnerzy.brainydxinnovate.in/public/assets/images/icons/arrow.png'
let arrowIconUrl  = 'http://localhost:5501/src/main/webapp/assets/images/icons/arrow.png'


// js for custom file input
const handleClick = (inputId, textId) => {
    let file = document.getElementById(inputId);
    file.click();
    let text = document.getElementById(textId);
    file.addEventListener("change", function () {
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
    // console.log(file, text)
};


// js for dropdowns
document.addEventListener("DOMContentLoaded", function () {
    var fieldGroups = document.querySelectorAll('.select-field-group')

    for (let fieldGroup of fieldGroups) {
        let input = fieldGroup.querySelector('.input-field')
        let labelTag = fieldGroup.querySelector('.input-label')

        if (input?.type == "select-one") {
            let labelArray = []
            let label = ''
            if (labelTag?.innerHTML?.includes('<span')) {
                labelArray = labelTag?.innerHTML?.split('<span')
                label = labelArray[0]
                if (label?.length > 20) {
                    labelTag.innerHTML = `${label.slice(0, 20)}` + `...`
                }
            }
            else {
                label = labelTag.innerHTML
                labelArray.push(labelTag.innerHTML)
            }

            if (input.type == "select-one") {
                // console.log(input)
                // labelTag.style.display = 'none'
                labelTag.style.top = '20px';
                labelTag.style.fontSize = '16px';
                labelTag.style.color = '#7a7a7a';
                input.style.color = '#7a7a7a'
                // labelTag.style.backgroundColor = 'transparent'
                // console.log(labelArray)
                if (labelArray.length == 1) {
                    labelTag.innerHTML = labelArray[0]
                }
                else {
                    labelTag.innerHTML = labelArray[0] + `<span` + labelArray[1]
                }

                if(input.value != ''){
                    labelTag.style.display = 'block'
                    labelTag.style.fontSize = '12px'
                    labelTag.style.color = '#1A1C43'
                    labelTag.style.transform = 'translate(0px,-30px)'
                    input.style.color = '#1A1C43'
                } 
            }

            input.addEventListener('click', function () {
                if (labelArray.length == 1) {
                    labelTag.innerHTML = labelArray[0]
                }
                else {
                    labelTag.innerHTML = labelArray[0] + `<span` + labelArray[1]
                }
                if (input.value == '') {
                    if (labelArray.length == 1) {
                        labelTag.innerHTML = labelArray[0]
                    }
                    else {
                        labelTag.innerHTML = labelArray[0] + `<span` + labelArray[1]
                    }
                    // labelTag.innerHTML = labelArray[0]
                }


                if (input.type == "select-one") {
                    labelTag.style.display = 'block'
                    labelTag.style.fontSize = '12px'
                    labelTag.style.color = '#1A1C43'
                    labelTag.style.transform = 'translate(0px,-30px)'
                    // labelTag.style.backgroundColor = '#fff'
                    labelTag.style.transition = '0.2s ease'
                    input.style.color = '#1A1C43'

                }


            })
            input.addEventListener('blur', function () {
                if (labelArray.length == 1) {
                    labelTag.innerHTML = labelArray[0]
                }
                else {
                    labelTag.innerHTML = labelArray[0] + `<span` + labelArray[1]
                }
                if (input.value == '' && label?.length > 20) {
                    labelTag.innerHTML = `${label.slice(0, 20)}` + `...`
                }


                if (input.type == "select-one") {
                    // console.log(labelArray)
                    if (labelArray.length == 1) {
                        labelTag.innerHTML = labelArray[0]
                    }
                    else {
                        labelTag.innerHTML = labelArray[0] + `<span` + labelArray[1]
                    }

                    if (input.value == "") {
                        // labelTag.style.display = 'none'
                        input.style.color = '#7a7a7a'
                        labelTag.style.top = '20px';
                        labelTag.style.fontSize = '16px';
                        labelTag.style.color = '#7a7a7a';
                        input.style.color = '#7a7a7a'
                        labelTag.style.transform = 'translate(0px,0px)'
                        // labelTag.style.backgroundColor = 'transparent'
                        labelTag.style.transition = '0.2s ease'
                    }
                    else {
                        labelTag.style.display = 'block'
                        input.style.color = '#1A1C43'
                    }
                }
            })
        }
    }
})



//----------------------------------------- js script for tick all checkboxes in one click starts here --------------------------------------
function tickAllCheckboxes(parentCheckboxClass, childCheckboxClass) {
    const parentCheckbox = document.querySelector(`.${parentCheckboxClass}`);
    const childCheckboxes = document.querySelectorAll(`.${childCheckboxClass}`);

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

    parentCheckbox.addEventListener('change', function () {
        for (let checkbox of childCheckboxes) {
            checkbox.checked = this.checked;
        }
    });

    for (let checkbox of childCheckboxes) {
        checkbox.addEventListener('change', function () {
            checkAllChildCheckboxes();
        });
    }
}
document.addEventListener('DOMContentLoaded', function () {
    // tickAllCheckboxes('parent-checkbox', 'child-checkboxes');
});

//----------------------------------------- js script for tick all checkboxes in one click ends here --------------------------------------



//----------------------------------------- js script for converting dropdown into textfield starts here --------------------------------------
function convertDropdownToText(selectDropdownBox) {
    //get select dropdown
    let selectDropdown = selectDropdownBox.querySelector('select');
    // console.log(selectDropdown)

    // Get the label for the select dropdown
    let selectLabel = selectDropdownBox.querySelector('label');
    // console.log(selectLabel)


    let inputCreated = false;

    // Listen for changes in the select dropdown
    selectDropdown.addEventListener('change', function () {
        if (this.value == 'Others') {
            if (inputCreated == false) {
                // Create a new div for the input field
                const inputDiv = document.createElement('div');
                inputDiv.classList.add('new-field-group', 'input-created-box');
                inputDiv.style.position = 'relative'

                // Create a new input element
                const inputField = document.createElement('input');
                inputField.type = 'text';
                inputField.name = selectDropdown.name;
                inputField.id = selectDropdown.id;
                inputField.classList.add('new-input-field');
                inputField.placeholder = 'Enter ' + selectDropdown.name.toLowerCase();
                inputField.required = true;
                inputField.autocomplete = 'off';
                // inputField.value = 'Others';

                // Create a new label for the input field
                const label = selectLabel
                label.style.backgroundColor = 'white'
                label.style.zIndex = '1'


                // Create a new icon element
                const iconSpan = document.createElement('span')
                iconSpan.innerHTML = `<img class='created-input-icon'  src="../../assets/icons/arrow.png" alt=''>`
                iconSpan.style.position = 'absolute'
                iconSpan.style.right = '10px'
                iconSpan.style.transform = 'translateY(18px)'
                iconSpan.style.cursor = 'pointer !important'
                iconSpan.addEventListener('click', function (event) {
                    event.preventDefault()
                    selectDropdownBox.style.display = 'block';
                    inputField.value = ''
                    // selectDropdown.value = selectOptions[1]?.value
                    selectDropdown.value = ''
                    selectDropdown.required = false
                    inputDiv.style.display = 'none';
                    selectLabel.style.top = '20px'
                    selectLabel.style.left = '18px'
                    selectLabel.style.transform = 'translate(0px,0px)'

                    selectLabel.style.color = '#7a7a7a'
                    selectLabel.style.fontSize = '16px'
                    selectDropdownBox.appendChild(selectLabel)
                })


                // Append the input field and label to the new div
                inputDiv.appendChild(inputField);
                inputDiv.appendChild(label);
                inputDiv.appendChild(iconSpan);

                selectDropdownBox.parentElement.appendChild(inputDiv);
                // Show the input field div
                inputField.focus()
                inputDiv.style.display = 'block';
                selectDropdownBox.style.display = 'none'; // Hide the select field group

                inputCreated = true;

                inputField.addEventListener('blur', function () {
                    if (inputField.value == '') {
                        selectDropdown.required = true
                        selectDropdownBox.style.display = 'block';
                        // selectDropdown.value = selectOptions[1]?.value
                        inputDiv.style.display = 'none';

                        inputField.value = ''
                        // selectDropdown.value = selectOptions[1]?.value
                        selectDropdown.value = ''
                        inputDiv.style.display = 'none';
                        selectLabel.style.top = '20px'
                        selectLabel.style.left = '18px'
                        selectLabel.style.transform = 'translate(0px,0px)'

                        selectLabel.style.color = '#7a7a7a'
                        selectLabel.style.fontSize = '16px'
                        selectDropdownBox.appendChild(selectLabel)
                        setTimeout(() => {
                            inputField.focus();
                        }, 0);
                    }
                    else {
                        selectDropdownBox.style.display = 'none';
                        selectDropdown.value = ''
                        selectDropdown.required = false
                        inputDiv.style.display = 'block';
                    }
                })

            }
            else {
                let inputDiv = selectDropdownBox.parentElement.querySelector('.input-created-box')
                let inputField = inputDiv.querySelector('.input-field')
                inputDiv.appendChild(selectLabel)
                setTimeout(() => {
                    inputField.focus();
                }, 0);
                inputDiv.style.display = 'block';
                selectDropdown.required = false
                selectDropdownBox.style.display = 'none'; // Hide the select field group
            }
        }

    });

    selectDropdown.addEventListener('blur', function () {
        if (this.value == '') {
            let inputDiv = selectDropdownBox.parentElement.querySelector('.input-created-box')
            if (inputCreated == true) {
                selectDropdownBox.appendChild(selectLabel)
                selectDropdown.required = true
                selectDropdownBox.style.display = 'block';
                inputDiv.style.display = 'none';
            }
        }
    })

}

// Get all select dropdowns
const selectDropdownsBoxes = document.querySelectorAll('.select-field-group-toggle');

// Convert each select dropdown to text input when "Other" is selected
selectDropdownsBoxes.forEach(function (selectDropdownBox) {
    convertDropdownToText(selectDropdownBox);
});

//----------------------------------------- js script for converting dropdown into textfield ends here --------------------------------------



//----------------------------------------- js script for automatic date selection starts here --------------------------------------
document.addEventListener("DOMContentLoaded", function () {
    let dateFields = document.querySelectorAll('.auto-fill-date');
    for (let dateField of dateFields) {
        let currentDate = new Date();
        let year = currentDate.getFullYear();
        let month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
        let day = ('0' + currentDate.getDate()).slice(-2);
        let formattedDate = `${year}-${month}-${day}`
        dateField.value = formattedDate
        dateField.style.color = '#1A1C43'

    }
});
//----------------------------------------- js script for automatic date selection ends here --------------------------------------


//----------------------------------------- js script for custom date selection starts here --------------------------------------
document.addEventListener("DOMContentLoaded", function () {
    let dateFields = document.querySelectorAll('.date-field');
    for (let dateField of dateFields) {
        dateField.addEventListener('click', function () {
            dateField.style.color = '#1A1C43'
        });
        dateField.addEventListener('blur', function () {
            let value = dateField.value;
            let isValidDate = (new Date(value) !== "Invalid Date") && !isNaN(new Date(value));
            dateField.style.color = isValidDate ? '#1A1C43' : '#7a7a7a';
        });
    }
});

//----------------------------------------- js script for custom date selection ends here --------------------------------------



