// let arrowIconUrl = 'https://cnerzy.brainydxinnovate.in/public/assets/images/icons/close.png'
let arrowIconUrl = ctx+'/assets/icons/close.png'
          
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

                inputField.addEventListener('blur', function () {
                    // if (inputField.value == '') {
                    //     selectDropdown.required = true;
                    //     selectDropdownBox.style.display = 'block';
                    //     // selectDropdown.value = selectOptions[1]?.value
                    //     inputDiv.style.display = 'none';
                    //     inputField.value = '';
                    //     // selectDropdown.value = selectOptions[1]?.value
                    //     selectDropdown.value = '';
                    //     inputDiv.style.display = 'none';
                    //     // selectLabel.style.top = '20px';
                    //     // selectLabel.style.left = '18px';
                    //     // selectLabel.style.transform = 'translate(0px,0px)';

                    //     // selectLabel.style.color = '#7a7a7a';
                    //     // selectLabel.style.fontSize = '16px';
                    //     selectDropdownBox.appendChild(selectLabel);
                    //     setTimeout(() => {
                    //         inputField.focus();
                    //         customSelectInitialization()
                    //     }, 0);
                    // }
                    // else {
                    //     selectDropdownBox.style.display = 'none';
                    //     selectDropdown.value = '';
                    //     selectDropdown.required = false;
                    //     inputDiv.style.display = 'block';
                    // }
                    if (inputField.name == 'industry_classification' || inputField.name == 'industry_expertise') {
                        validateStep1()
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
const selectDropdownsBoxes = document.querySelectorAll('.select-field-group-toggle');

// Convert each select dropdown to text input when "Other" is selected
selectDropdownsBoxes.forEach(function (selectDropdownBox) {
    convertDropdownToText(selectDropdownBox);
});

//----------------------------------------- js script for converting dropdown into textfield ends here --------------------------------------

