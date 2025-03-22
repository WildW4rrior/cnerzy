// -----------------------------------------js script for stepper starts here--------------------------------------

let currentStep = 0;
const steps = document.querySelectorAll('.step');
const stepCircles = document.querySelectorAll('.step-info');
// const prevBtn = document.getElementById('prevBtn');
// const nextBtn = document.getElementById('nextBtn');
const submitBtn = document.getElementById('submit-btn');
let navigateToBox = document.getElementById('navigate-to-box')
// console.log(steps)

function showError(id, errorMsg) {
    let errSpan = document.getElementById(id)
    if(errSpan){
        errSpan.innerHTML = errorMsg
    }
}
function showErrorForField(input, errorMsg) {
    let errSpan = input.closest('.field-group').querySelector('.err-text')
    if(errSpan){
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

let AllInputs = document.querySelectorAll('input, select');
console.log("all inputs", AllInputs.length)
const getAllInput = function () {
    AllInputs = document.querySelectorAll('input, select');
    console.log(AllInputs.length, 'called')
    for (let input of AllInputs) {
        input.addEventListener('blur', function () {
            validateStep1()
        });
    }
}

// ---------------------------------------step-1 functions-------------------------------------

function validateStep1() {
    let error = false;

    let errorMessage = '';
    for (let input of AllInputs) {
        if (input.name == 'industryClassificaiton' && input.value != '' && input.required) {
            // const regex = /^[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
            const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Industry Classification';
                showError('industryClassificaiton_err', errorMessage)
                // return error;
            } else {
                showError('industryClassificaiton_err', '')
            }

        } else if (input.name == 'industryExpertise' && input.value != '' && input.required) {
            // const regex = /^[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
            const regex = /^(?!\s*$)[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{2,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Industry Expertise';
                showError('industryExpertise_err', errorMessage)
                // return error;
            } else {
                showError('industryExpertise_err', '')
            }

        }
        else if (input.name == 'companyName' && input.value != '') {
            const regex = /^[A-Za-z0-9 ]{3,}$/;
            // console.log(regex.test(input.value))
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Company Name';
                showError('companyName_err', errorMessage)
                // return error;
            } else {
                showError('companyName_err', '')
            }

        }
        else if (input.name == 'companyWebsite' && input.value != '') {

            // const regex = /^(https?:\/\/)?(www\.)?[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})(\/\S*)?$/;
            const regex = /^(https?:\/\/)?([a-zA-Z0-9-]+\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\/\S*)?$/;

            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Website Url';
                showError('companyWebsite_err', errorMessage)
                // return error;
            } else {
                showError('companyWebsite_err', '')
            }

        }
        else if (input.name == 'companyEmail' && input.value != '') {
            // const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
            const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|yahoo\.com|outlook\.com|icloud\.com|hotmail\.com)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;

            if (!regex.test(input.value.trim())) {
                errorMessage = 'Enter Company Email';
                showError('companyEmail_err', errorMessage)
                // return error;
            } else {
                showError('companyEmail_err', '')
            }

        }
        else if (input.name == 'companyPhone' && input.value != '') {
            const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Phone Number';
                showError('companyPhone_err', errorMessage)
                // return error;
            } else {
                showError('companyPhone_err', '')
            }

        }
        else if (input.name == 'companyLinkedInUrl' && input.value != '') {

            // const regex = /^(https?:\/\/)?(www\.)?linkedin\.com\/(?:in|pub)\/[a-zA-Z0-9_-]+\/?$/;
            const regex = /^https:\/\/(www\.)?linkedin\.com\/(in|company)\/[a-zA-Z0-9-]+\/?$/
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid LinkedIn Url';
                showError('companyLinkedInUrl_err', errorMessage)
                // return error;
            } else {
                showError('companyLinkedInUrl_err', '')
            }


        }
        else if (input.name == 'companyLogo') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('logo_err', errorMessage)
                } else {
                    showError('logo_err', '')
                }
            } else {
                showError('logo_err', '')
            }
        }

        else if (input.name == 'streetAddress' && input.value != '') {
            // const regex = /^[\w\s\d#,-]+$/;
            const regex = /^[\w\s\d#,\-.]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Address';
                showError('streetAddress_err', errorMessage)
                // return error;
            } else {
                showError('streetAddress_err', '')
            }
        } else if (input.name == 'city' && input.value != '') {
            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid City Name';
                showError('city_err', errorMessage)
                // return error;
            } else {
                showError('city_err', '')
            }
        } else if (input.name == 'state' && input.value != '') {
            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid State Name';
                showError('state_err', errorMessage)
                // return error;
            } else {
                showError('state_err', '')
            }
        } else if (input.name == 'pincode' && input.value != '') {
            let regex
            if (document.getElementById('country').value == 'india') {
                regex = /^\d{6}$/
            } else {
                regex = /^\d{5}$/
            }
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Pincode';
                showError('pincode_err', errorMessage)
                // return error;
            } else {
                showError('pincode_err', '')
            }
        }
        else if (input.id.includes("contact_person_name") && input.value != '') {

            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Name';
                showError(`contact_person_name_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`contact_person_name_${num}_err`, '')
            }



        }
        else if (input.id.includes("contact_person_designation") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]

            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Designation';
                showError(`contact_person_designation_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`contact_person_designation_${num}_err`, '')
            }

        }
        else if (input.id.includes("contact_person_email") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]

            // const regex = /^[a-zA-Z0-9._%+-]+@(?!gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
            const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|yahoo\.com|outlook\.com|icloud\.com|hotmail\.com)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;

            if (!regex.test(input.value.trim())) {
                errorMessage = 'Enter Company Email';
                showError(`contact_person_email_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`contact_person_email_${num}_err`, '')
            }

        }
        else if (input.id.includes("contact_person_phone") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Phone Number';
                showError(`contact_person_phone_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`contact_person_phone_${num}_err`, '')
            }

        }
    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            if (input.name == 'industryClassificaiton' && input.value == '') {
                // errorMessage = '';
                showError('industryClassificaiton_err', '')
            } else if (input.name == 'industryExpertise' && input.value == '') {
                showError('industryExpertise_err', '')
            }
            else if (input.name == 'companyName' && input.value == '') {
                showError('companyName_err', '')
            }
            else if (input.name == 'companyWebsite' && input.value == '') {
                showError('companyWebsite_err', '')
            }
            else if (input.name == 'companyEmail' && input.value == '') {
                showError('companyEmail_err', '')
            }
            else if (input.name == 'companyPhone' && input.value == '') {
                showError('companyPhone_err', '')
            }
            else if (input.name == 'companyLinkedInUrl' && input.value == '') {
                showError('companyLinkedInUrl_err', '')
            }
            // else if (input.name == 'logo' && input.value == '') {
            //     //     showError('logo_err', '')
            // }
            else if (input.name == 'streetAddress' && input.value == '') {
                showError('streetAddress_err', '')
            } else if (input.name == 'city' && input.value == '') {
                showError('city_err', '')
            } else if (input.name == 'state' && input.value == '') {
                showError('state_err', '')
            } else if (input.name == 'pincode' && input.value == '') {
                showError('pincode_err', '')
            }
            else if (input.id.includes("contact_person_name") && input.value == '') {

                let nameArray = input.id.split("_")
                console.log(nameArray, nameArray.length, nameArray[nameArray.length - 1]
                )
                let num = nameArray[nameArray.length - 1]
                showError(`contact_person_name_${num}_err`, '')

            }
            else if (input.id.includes("contact_person_designation") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`contact_person_designation_${num}_err`, '')
            }
            else if (input.id.includes("contact_person_email") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`contact_person_email_${num}_err`, '')
            }
            else if (input.id.includes("contact_person_phone") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`contact_person_phone_${num}_err`, '')
            }
        })

    }


    if (errorMessage == '') {
        console.log('field - error', error, errorMessage)
        error = false;
    }
    else {
        error = true;
        console.log('field - error', error, errorMessage)
    }
    return error;
}

function checkStep1RequiredInputs() {
    let allRequiredFilled = false;
    let errorMessage = '';
    for (let input of AllInputs) {
        if (input.name == 'industryClassificaiton' && input.required && input.value == '') {
            errorMessage = 'Industry Classification Required';
            showError('industryClassificaiton_err', errorMessage)
        } else if (input.name == 'industryExpertise' && input.required && input.value == '') {
            if (input.value == '') {
                errorMessage = 'Industry Expertise Required';
                showError('industryExpertise_err', errorMessage)
            }
        }
        else if (input.name == 'companyName' && input.required && input.value == '') {
            errorMessage = 'Company Name is Required';
            showError('companyName_err', errorMessage)
        }
        else if (input.name == 'companyWebsite' && input.required && input.value == '') {
            errorMessage = 'Website Url is Required';
            showError('companyWebsite_err', errorMessage)
        }
        else if (input.name == 'companyEmail' && input.required && input.value == '') {
            errorMessage = 'Company Email is Required';
            showError('companyEmail_err', errorMessage)
        }
        else if (input.name == 'companyPhone' && input.required && input.value == '') {
            errorMessage = 'Phone Number is Required';
            showError('companyPhone_err', errorMessage)
        }
        else if (input.name == 'logo' && input.required && input.value == '') {
            // let res = validateFileSize(input)
            // if (!res) {
            //     errorMessage = 'File size is too large';
            //     showError('logo_err', errorMessage)
            // } else {
            //     showError('logo_err', '')
            // }
        }
        else if (input.name == 'streetAddress' && input.required && input.value == '') {
            errorMessage = 'Street Address is Required';
            showError('streetAddress_err', errorMessage)
        }
        else if (input.name == 'city' && input.required && input.value == '') {
            errorMessage = 'City Name is Required';
            showError('city_err', errorMessage)
        }
        else if (input.name == 'state' && input.required && input.value == '') {
            errorMessage = 'State Name is Required';
            showError('state_err', errorMessage)
        }
        else if (input.name == 'pincode' && input.required && input.value == '') {
            errorMessage = 'Pincode is Required';
            showError('pincode_err', errorMessage)
        }
        else if (input.id.includes("contact_person_name_0") && input.required && input.value == '') {

            errorMessage = 'Name is Required';
            showError(`contact_person_name_0_err`, errorMessage)

        }
        else if (input.id.includes("contact_person_designation_0") && input.required && input.value == '') {
            errorMessage = 'Designation is Required';
            showError(`contact_person_designation_0_err`, errorMessage)
        }
        else if (input.id.includes("contact_person_email_0") && input.required && input.value == '') {

            errorMessage = 'Company Email is Required';
            showError(`contact_person_email_0_err`, errorMessage)
        }
        else if (input.id.includes("contact_person_phone_0") && input.required && input.value == '') {

            errorMessage = 'Phone is Required';
            showError(`contact_person_phone_0_err`, errorMessage)
        }
    }

    if (errorMessage == '') {
        console.log('required - error', allRequiredFilled, errorMessage)
        allRequiredFilled = false;
    }
    else {
        allRequiredFilled = true;
        console.log('required - error', allRequiredFilled, errorMessage)
    }
    return allRequiredFilled;
}



// ---------------------------------------step-2 functions-------------------------------------
function validateStep2() {
    let error = false;
    let errorMessage = '';

    for (let input of AllInputs) {
        if (input.name == 'buisnessRegNumber' && input.value != '') {
            // const regex = /^(?=.*[A-Z])[A-Z0-9]{21}$/;
            const regex = /^(?=.*[A-Z])(?=.*\d)[A-Z0-9]{21}$/;
            if (!regex.test(input.value.toUpperCase().trim())) {
                errorMessage = 'Invalid Registration Number';
                showError('buisnessRegNumber_err', errorMessage)
                // return error;
            } else {
                showError('buisnessRegNumber_err', '')
            }

        }
        else if (input.name == 'panNo' && input.value != '') {
            const regex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
            if (!regex.test(input.value.toUpperCase().trim())) {
                errorMessage = 'Invalid PAN Number';
                showError('panNo_err', errorMessage)
                // return error;
            } else {
                showError('panNo_err', '')
            }
        }
        else if (input.name == 'gstNo' && input.value != '') {
            const regex = /^([0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}Z[0-9a-zA-Z]{1})$/;
            // console.log(input.value.toUpperCase())
            if (!regex.test(input.value.toUpperCase().trim())) {
                errorMessage = 'Invalid GSTIN Number';
                showError('gstNo_err', errorMessage)
                // return error;
            } else {
                showError('gstNo_err', '')
            }

        }
        else if (input.name == 'type_of_compnay' && input.value != '') {
            const regex = /^[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Type';
                showError('type_of_compnay_err', errorMessage)
                // return error;
            } else {
                showError('type_of_compnay_err', '')
            }
        }
        else if (input.name == 'registrationDate' && input.value != '') {

            function isPastDate(dateString) {
                // Parse the date components
                const [year, month, day] = dateString.split('-').map(Number);

                // Create a date object from the provided date
                const inputDate = new Date(year, month - 1, day);

                // Get the current date
                const currentDate = new Date();

                // Set the current date to the start of the day (midnight)
                currentDate.setHours(0, 0, 0, 0);

                // Compare the input date with the current date
                return inputDate < currentDate;
            }


            if (!isPastDate(input.value)) {
                errorMessage = 'Invalid Date';
                showError('registrationDate_err', errorMessage)
            } else {
                showError('registrationDate_err', '')
            }

        }
        else if (input.name == 'dunsNumber' && input.value != '') {
            const regex = /^\d(?:-?\d){8}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid D-U-N-S Number';
                showError('dunsNumber_err', errorMessage)
                // return error;
            } else {
                showError('dunsNumber_err', '')
            }

        }
        // else if (input.name == 'taxIdNumber' && input.value != '') {
        //     const regex = /^\d{0,30}$/;
        //     if (!regex.test(input.value)) {
        //         errorMessage = 'Invalid State Tax Id Number';
        //         showError('taxIdNumber_err', errorMessage)
        //         // return error;
        //     } else {
        //         showError('taxIdNumber_err', '')
        //     }
        // }
        else if (input.name == 'taxIdNumber' && input.value != '') {
            // const regex = /^\d(?:-?\d){8}$/;//for EIN(US)
            const regex = /^\d{2}-\d{7}$/;//for EIN(US) in XX-XXXXXXX
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Tax Id Number (EIN)';
                showError('taxIdNumber_err', errorMessage)
                // return error;
            } else {
                showError('taxIdNumber_err', '')
            }
        }
        else if (input.name == 'w9SubmissionForm') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('w9SubmissionForm_err', errorMessage)
                } else {
                    showError('w9SubmissionForm_err', '')
                }
            }
        }
        else if (input.id.includes("name_of_product") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]

            // const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            const regex = /^[A-Za-z0-9 & ()_/-]+$/;

            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Product Name';
                showError(`name_of_product_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`name_of_product_${num}_err`, '')
            }
        }
        else if (input.id.includes("oem_supplying_to") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]

            const regex = /^[A-Za-z0-9 ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid OEM Name';
                showError(`oem_supplying_to_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`oem_supplying_to_${num}_err`, '')
            }
        }
        else if (input.id.includes("oem_value") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]

            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Value';
                showError(`oem_value_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`oem_value_${num}_err`, '')
            }
        }
        else if (input.id.includes("customer_name") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^[A-Za-z0-9 & ()_/-]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Name';
                showError(`customer_name_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`customer_name_${num}_err`, '')
            }
        }
        else if (input.id.includes("customer_address") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^[\w\s\d#,\-.]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Address';
                showError(`customer_address_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`customer_address_${num}_err`, '')
            }
        }
        else if (input.id.includes("product_or_services") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            // const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            const regex = /^[A-Za-z0-9 & ()_/-]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Product/Service';
                showError(`product_or_services_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`product_or_services_${num}_err`, '')
            }
        }
        else if (input.id.includes("export_country") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^[A-Za-z ]{2,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Country Name';
                showError(`export_country_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`export_country_${num}_err`, '')
            }
        }
        else if (input.id.includes("export_value") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Value';
                showError(`export_value_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`export_value_${num}_err`, '')
            }
        }

        else if (input.id.includes("product_supplied") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Product Name';
                showError(`product_supplied_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`product_supplied_${num}_err`, '')
            }
        }
        else if (input.id.includes("provider_name") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            // const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            const regex = /^[A-Za-z0-9 & ()_/-]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Name';
                showError(`provider_name_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`provider_name_${num}_err`, '')
            }
        }
        else if (input.id.includes("provider_address") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^[\w\s\d#,\-.]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Address';
                showError(`provider_address_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`provider_address_${num}_err`, '')
            }
        }

    }


    for (let input of AllInputs) {
        input.addEventListener('change', function () {

            if (input.name == 'buisnessRegNumber' && input.value == '') {
                showError('buisnessRegNumber_err', '')
            }
            else if (input.name == 'panNo' && input.value == '') {
                showError('panNo_err', '')
            }
            else if (input.name == 'gstNo' && input.value == '') {
                showError('gstNo_err', '')
            }
            else if (input.name == 'type_of_compnay' && input.value == '') {
                showError('type_of_compnay_err', '')
            }
            else if (input.name == 'registrationDate' && input.value == '') {
                //     showError('registrationDate_err', '')
            }
            else if (input.name == 'dunsNumber' && input.value == '') {
                showError('dunsNumber_err', '')
            }
            // else if (input.name == 'taxIdNumber' && input.value == '') {
            //     showError('taxIdNumber_err', '')
            // }
            else if (input.name == 'taxIdNumber' && input.value == '') {
                showError('taxIdNumber_err', '')
            }
            else if (input.name == 'w9SubmissionForm' && !input.files[0]) {
                showError('w9SubmissionForm_err', '')
            }
            else if (input.id.includes("name_of_product") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`name_of_product_${num}_err`, '')
            }
            else if (input.id.includes("oem_supplying_to") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`oem_supplying_to_${num}_err`, '')
            }
            else if (input.id.includes("oem_value") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`oem_value_${num}_err`, '')
            }
            else if (input.id.includes("customer_name") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`customer_name_${num}_err`, '')
            }
            else if (input.id.includes("customer_address") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`customer_address_${num}_err`, '')
            }
            else if (input.id.includes("product_or_services") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`product_or_services_${num}_err`, '')
            }
            else if (input.id.includes("export_country") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`export_country_${num}_err`, '')
            }
            else if (input.id.includes("export_value") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`export_value_${num}_err`, '')
            }

            else if (input.id.includes("product_supplied") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`product_supplied_${num}_err`, '')
            }
            else if (input.id.includes("provider_name") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`provider_name_${num}_err`, '')
            }
            else if (input.id.includes("provider_address") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`provider_address_${num}_err`, '')
            }
            else if (input.name == 'logo' && input.value == '') {
                //     showError('logo_err', '')
            }
        })


    }

    if (errorMessage == '') {
        console.log('field - error', error, errorMessage)
        error = false;
    }
    else {
        error = true;
        console.log('field - error', error, errorMessage)
    }
    return error;
}

function checkStep2RequiredInputs() {
    let allRequiredFilled = false;

    let errorMessage = '';
    for (let input of AllInputs) {
        if (input.name == 'dunsNumber' && input.required && input.value == '') {
            errorMessage = 'D-U-N-S Number Required';
            showError('dunsNumber_err', errorMessage)
        }
        // else if (input.name == 'taxIdNumber' && input.required && input.value == '') {
        //     errorMessage = 'State Tax Id Required';
        //     showError('taxIdNumber_err', errorMessage)
        // }
        else if (input.name == 'taxIdNumber' && input.required && input.value == '') {
            errorMessage = 'Tax Id Number (EIN) is Required';
            showError('taxIdNumber_err', errorMessage)
        }
        else if (input.name == 'panNo' && input.required && input.value == '') {
            errorMessage = 'PAN Number is Required';
            showError('panNo_err', errorMessage)
        }
        else if (input.name == 'gstNo' && input.required && input.value == '') {
            errorMessage = 'GSTIN Number is Required';
            showError('gstNo_err', errorMessage)
        }
        else if (input.name == 'w9SubmissionForm' && input.required && !input.files[0]) {
            errorMessage = 'W-9 Submission Form Required';
            showError('w9SubmissionForm_err', errorMessage)
            // let res = validateFileSize(input)
            // if (!res) {
            //     errorMessage = 'File size is too large';
            //     showError('w9SubmissionForm_err', errorMessage)
            // } else {
            //     showError('w9SubmissionForm_err', '')
            // }
        }

    }
    if (errorMessage == '') {
        console.log('required - error', allRequiredFilled, errorMessage)
        allRequiredFilled = false;
    }
    else {
        allRequiredFilled = true;
        console.log('required - error', allRequiredFilled, errorMessage)
    }
    return allRequiredFilled;
}
// ---------------------------------------step-3 functions-------------------------------------
function validateStep3() {
    let error = false;
    let errorMessage = '';

    for (let input of AllInputs) {
        if (input.name == 'bankName' && input.value != '') {
            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Bank Name';
                showError('bankName_err', errorMessage)
                // return error;
            } else {
                showError('bankName_err', '')
            }
        } else if (input.name == 'accountNo' && input.value != '') {
            const regex = /^\d{1,20}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Account Number';
                showError('accountNo_err', errorMessage)
                // return error;
            } else {
                showError('accountNo_err', '')
            }
        }
        else if (input.name == 'routingNo' && input.value != '') {
            const regex = /^\d{9}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Routing Number';
                showError('routingNo_err', errorMessage)
                // return error;
            } else {
                showError('routingNo_err', '')
            }
        }
        else if (input.name == 'ifscCode' && input.value != '') {
            const regex = /^[A-Z]{4}0[A-Z0-9]{6}$/;
            if (!regex.test(input.value.toUpperCase().trim())) {
                errorMessage = 'Invalid IFSC Code';
                showError('ifscCode_err', errorMessage)
                // return error;
            } else {
                showError('ifscCode_err', '')
            }
        }
        else if (input.name == 'accountType' && input.value != '') {
            const regex = /^[A-Za-z\s\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Account Type';
                showError('accountType_err', errorMessage)
                // return error;
            } else {
                showError('accountType_err', '')
            }

        }
        else if (input.id.includes("turnover_value") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Value';
                showError(`turnover_value_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`turnover_value_${num}_err`, '')
            }
        }
    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            if (input.name == 'bankName' && input.value == '') {
                showError('bankName_err', '')
            } else if (input.name == 'accountNo' && input.value == '') {
                showError('accountNo_err', '')
            }
            else if (input.name == 'routingNo' && input.value == '') {
                showError('routingNo_err', '')
            }
            else if (input.name == 'ifscCode' && input.value == '') {
                showError('ifscCode_err', '')
            }
            else if (input.name == 'accountType' && input.value == '') {
                showError('accountType_err', '')
            }
            else if (input.id.includes("turnover_value") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`turnover_value_${num}_err`, '')
            }
        })
    }


    if (errorMessage == '') {
        console.log('field - error', error, errorMessage)
        error = false;
    }
    else {
        error = true;
        console.log('field - error', error, errorMessage)
    }
    return error;
}

function checkStep3RequiredInputs() {
    let allRequiredFilled = false;

    let errorMessage = '';
    for (let input of AllInputs) {
        if (input.name == 'bankName' && input.required && input.value == '') {
            errorMessage = 'Bank Name is Required';
            showError('bankName_err', errorMessage)
        }
        else if (input.name == 'accountNo' && input.required && input.value == '') {
            errorMessage = 'Account Number is Required';
            showError('accountNo_err', errorMessage)
        }
        else if (input.name == 'routingNo' && input.required && input.value == '') {
            errorMessage = 'Routing Number is Required';
            showError('routingNo_err', errorMessage)
        }
        else if (input.name == 'ifscCode' && input.required && input.value == '') {
            errorMessage = 'IFSC Code is Required';
            showError('ifscCode_err', errorMessage)
        }
        else if (input.name == 'accountType' && input.required && input.value == '') {
            errorMessage = 'Account Type is Required';
            showError('accountType_err', errorMessage)
        }
    }
    if (errorMessage == '') {
        console.log('required - error', allRequiredFilled, errorMessage)
        allRequiredFilled = false;
    }
    else {
        allRequiredFilled = true;
        console.log('required - error', allRequiredFilled, errorMessage)
    }
    return allRequiredFilled;
}



// ---------------------------------------step-4 functions-------------------------------------
function validateStep4() {
    let error = false;
    let errorMessage = '';

    for (let input of AllInputs) {
        if (input.id.includes("factory_name") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^[A-Za-z0-9 ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Factory Name';
                // showError(`factory_name_${num}_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                showErrorForField(input, '')
                // showError(`factory_name_${num}_err`, '')
            }
        }
        else if (input.id.includes("area_in_square_mtr") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Area Value';
                // showError(`area_in_square_mtr_${num}_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                showErrorForField(input, '')
                // showError(`area_in_square_mtr_${num}_err`, '')
            }
        } else if (input.id.includes("factory_address") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            // const regex = /^[\w\s\d#,-]+$/;
            const regex = /^[\w\s\d#,\-.]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Factory Address';
                // showError(`factory_address_${num}_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`factory_address_${num}_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("total_employees") && input.value != '') {

            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid';
                // showError(`total_employees_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`total_employees_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("supervisors") && input.value != '') {

            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid';
                // showError(`supervisors_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`supervisors_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("engg_degree_or_diploma") && input.value != '') {

            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid';
                // showError(`engg_degree_or_diploma_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`engg_degree_or_diploma_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("skilled_workers") && input.value != '') {

            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid';
                // showError(`skilled_workers_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`skilled_workers_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("design_department") && input.value != '') {

            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid';
                // showError(`design_department_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`design_department_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("quality_control_and_inspection") && input.value != '') {

            const regex = /^\d+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid';
                // showError(`quality_control_and_inspection_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`quality_control_and_inspection_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("machining_facility_remark") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^(?=.*[^\d\s])[A-Za-z0-9\s!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Description';
                // showError(`machining_facility_remark_${num}_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`machining_facility_remark_${num}_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("machining_facility") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^(?=.*[^\d\s])[A-Za-z0-9\s!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid';
                // showError(`machining_facility_${num}_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`machining_facility_${num}_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("inspection_facility_remark") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^(?=.*[^\d\s])[A-Za-z0-9\s!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Description';
                // showError(`inspection_facility_remark_${num}_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`inspection_facility_remark_${num}_err`, '')
                showErrorForField(input, '')
            }
        }
        else if (input.id.includes("inspection_facility") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^(?=.*[^\d\s])[A-Za-z0-9\s!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]+$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid';
                // showError(`inspection_facility_${num}_err`, errorMessage)
                showErrorForField(input, errorMessage)
                // return error;
            } else {
                // showError(`inspection_facility_${num}_err`, '')
                showErrorForField(input, '')
            }
        }


    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {

            if (input.id.includes("factory_name") && input.value == '') {
                // let nameArray = input.id.split("_")
                // let num = nameArray[nameArray.length - 1]
                // showError(`factory_name_${num}_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("area_in_square_mtr") && input.value == '') {
                // let nameArray = input.id.split("_")
                // let num = nameArray[nameArray.length - 1]
                // showError(`area_in_square_mtr_${num}_err`, '')
                showErrorForField(input, '')
            } else if (input.id.includes("factory_address") && input.value == '') {
                // let nameArray = input.id.split("_")
                // let num = nameArray[nameArray.length - 1]
                // showError(`factory_address_${num}_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("total_employees") && input.value == '') {
                // showError(`total_employees_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("supervisors") && input.value == '') {
                // showError(`supervisors_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("engg_degree_or_diploma") && input.value == '') {
                // showError(`engg_degree_or_diploma_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("skilled_workers") && input.value == '') {
                // showError(`skilled_workers_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("design_department") && input.value == '') {
                // showError(`design_department_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("quality_control_and_inspection") && input.value == '') {
                // showError(`quality_control_and_inspection_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("machining_facility_remark") && input.value == '') {
                // let nameArray = input.id.split("_")
                // let num = nameArray[nameArray.length - 1]
                // showError(`machining_facility_remark_${num}_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("machining_facility") && input.value == '') {
                // let nameArray = input.id.split("_")
                // let num = nameArray[nameArray.length - 1]
                // showError(`machining_facility_${num}_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("inspection_facility_remark") && input.value == '') {
                // let nameArray = input.id.split("_")
                // let num = nameArray[nameArray.length - 1]
                // showError(`inspection_facility_remark_${num}_err`, '')
                showErrorForField(input, '')
            }
            else if (input.id.includes("inspection_facility") && input.value == '') {
                // let nameArray = input.id.split("_")
                // let num = nameArray[nameArray.length - 1]
                // showError(`inspection_facility_${num}_err`, '')
                showErrorForField(input, '')
            }
        })


    }

    if (errorMessage == '') {
        console.log('field - error', error, errorMessage)
        error = false;
    }
    else {
        error = true;
        console.log('field - error', error, errorMessage)
    }
    return error;
}

function checkStep4RequiredInputs() {
    let allRequiredFilled = false;

    let errorMessage = '';
    // for (let input of AllInputs) {
    //     if (input.name == 'bankName' && input.required && input.value == '') {
    //         errorMessage = 'Bank Name Required';
    //         showError('bankName_err', errorMessage)
    //     }

    // }
    if (errorMessage == '') {
        console.log('required - error', allRequiredFilled, errorMessage)
        allRequiredFilled = false;
    }
    else {
        allRequiredFilled = true;
        console.log('required - error', allRequiredFilled, errorMessage)
    }
    return allRequiredFilled;
}



// ---------------------------------------step-5 functions-------------------------------------
function validateStep5() {
    let error = false;
    let errorMessage = '';

    for (let input of AllInputs) {
        if (input.name == 'isoCertificationFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('isoCertificationFile_err', errorMessage)
                } else {
                    showError('isoCertificationFile_err', '')
                }
                showError('one_certificate_req_err', '')
            } else {
                showError('isoCertificationFile_err', '')
            }

        } else if (input.name == 'asCertificationFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('asCertificationFile_err', errorMessage)
                } else {
                    showError('asCertificationFile_err', '')
                }
                showError('one_certificate_req_err', '')
            } else {
                showError('asCertificationFile_err', '')
            }
        }
        else if (input.name == 'oshaCertificationFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('osha_compliance_err', errorMessage)
                } else {
                    showError('osha_compliance_err', '')
                }
                showError('one_certificate_req_err', '')
            } else {
                showError('osha_compliance_err', '')
            }
        }
        else if (input.name == 'fdaRegisterationFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('fda_registration_err', errorMessage)
                } else {
                    showError('fda_registration_err', '')
                }
                showError('one_certificate_req_err', '')

            } else {
                showError('fda_registration_err', '')
            }
        }
        else if (input.name == "other_certificate_name" && input.value != '') {
            // const regex = /^[A-Za-z0-9 ]{3,}$/;
            // if (!regex.test(input.value.trim())) {
            //     errorMessage = 'Invalid Certificate Name';
            //     showError(`other_certificate_name_err`, errorMessage)
            //     // return error;
            // } else {
            //     showError(`other_certificate_name_err`, '')
            // }
            // if(document.getElementById('other_certificate_input').files[0]){
            // }
        }
        else if (input.name == 'other_certificate') {
            // let res = validateFileSize(input)
            // if (!res) {
            //     errorMessage = 'File size is too large';
            //     showError('other_certificate_err', errorMessage)
            // } else {
            //     showError('other_certificate_err', '')
            // }
            showError('one_certificate_req_err', '')

        }
        else if (input.name == 'laborLawComplianceFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('laborLawComplianceFile_err', errorMessage)
                } else {
                    showError('laborLawComplianceFile_err', '')
                }
                showError('one_certificate_req_err', '')

            } else {
                showError('laborLawComplianceFile_err', '')
            }
        }
        else if (input.name == 'indianStandardsComplianceFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('indianStandardsComplianceFile_err', errorMessage)
                } else {
                    showError('indianStandardsComplianceFile_err', '')
                }
                showError('one_certificate_req_err', '')

            } else {
                showError('indianStandardsComplianceFile_err', '')
            }
        }
        else if (input.name == 'environmentalRegulationsComplianceFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('environmentalRegulationsComplianceFile_err', errorMessage)
                } else {
                    showError('environmentalRegulationsComplianceFile_err', '')
                }
                showError('one_certificate_req_err', '')

            } else {
                showError('environmentalRegulationsComplianceFile_err', '')
            }
        }
        else if (input.name == 'otherCertificationsIndiaFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('otherCertificationsIndiaFile_err', errorMessage)
                } else {
                    showError('otherCertificationsIndiaFile_err', '')
                }
                showError('one_certificate_req_err', '')

            } else {
                showError('otherCertificationsIndiaFile_err', '')
            }
        }
    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            if (input.name == "other_certificate_name" && input.value == '') {
                showError(`other_certificate_name_err`, '')
            }
        })

    }

    if (errorMessage == '') {
        console.log('field - error', error, errorMessage)
        error = false;
    }
    else {
        error = true;
        console.log('field - error', error, errorMessage)
    }
    return error;
}

function checkStep5RequiredInputs() {
    let allRequiredFilled = false;

    let errorMessage = '';
    let anyCertificate = false;

    for (let input of AllInputs) {
        if (input.files && input.files[0]) {
            anyCertificate = true;
            break;
        } 

        //         if (input.name == 'isoCertificationFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('isoCertificationFile_err', errorMessage)
        //         } else if (input.name == 'asCertificationFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('asCertificationFile_err', errorMessage)
        //         } else if (input.name == 'oshaCertificationFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('osha_compliance_err', errorMessage)
        //         } else if (input.name == 'fdaRegisterationFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('fda_registration_err', errorMessage)
        //         }
        //         else
        //         if (input.name == "other_certificate_name") {
        //             if (document.getElementById('other_certificate_input').files[0] && input.value == '') {
        //                 errorMessage = 'Certificate Name is Required';
        //                 showError(`other_certificate_name_err`, errorMessage)
        //             }
        //             else {
        //                 showError(`other_certificate_name_err`, '')
        //             }
        //         }
        //         else if (input.name == "other_certificate") {
        //             if (document.getElementById('other_certificate_name').value != '' && !input.files[0]) {
        //                 errorMessage = 'Certificate is Required';
        //                 showError(`other_certificate_err`, errorMessage)
        //             }
        //             else {
        //                 // errorMessage = 'Certificate is Required';
        //                 showError(`other_certificate_err`, '')
        //             }
        //         }
        //         else if (input.name == 'isoCertificationFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('isoCertificationFile_err', errorMessage)
        //         }
        //         else if (input.name == 'asCertificationFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('asCertificationFile_err', errorMessage)
        //         }
        //         else if (input.name == 'laborLawComplianceFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('laborLawComplianceFile_err', errorMessage)
        //         }
        //         else if (input.name == 'indianStandardsComplianceFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('indianStandardsComplianceFile_err', errorMessage)
        //         }
        //         else if (input.name == 'environmentalRegulationsComplianceFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('environmentalRegulationsComplianceFile_err', errorMessage)
        //         }
        //         else if (input.name == 'otherCertificationsIndiaFile' && input.required && input.value == '') {
        //             errorMessage = 'Certificate is Required';
        //             showError('otherCertificationsIndiaFile_err', errorMessage)
        //         }

    }
    
    //errorMessage == ''
    // if (errorMessage == '') {
    //     console.log('required - error', allRequiredFilled, errorMessage)
    //     allRequiredFilled = false;
    // }
    // else {
    //     allRequiredFilled = true;
    //     console.log('required - error', allRequiredFilled, errorMessage)
    // }

    if(anyCertificate === true){
        allRequiredFilled = false;
        console.log('required - error', allRequiredFilled, errorMessage)
    }else{
        errorMessage = "Please upload alteast one certificate"
        showError('one_certificate_req_err',errorMessage)
        console.log('required - error', allRequiredFilled, errorMessage)
        allRequiredFilled = true;
    }


    return allRequiredFilled;
}

// ---------------------------------------step-6 functions-------------------------------------
function validateStep6() {
    let error = false;
    let errorMessage = '';

    for (let input of AllInputs) {
        if (input.name == 'projectCaseStudiesFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('projectCaseStudiesFile_err', errorMessage)
                } else {
                    showError('projectCaseStudiesFile_err', '')
                }
            } else {
                showError('projectCaseStudiesFile_err', '')
            }

        }

        else if (input.id.includes("testimonials_or_awards") && input.value != '') {
            let nameArray = input.id.split("_")
            let num = nameArray[nameArray.length - 1]
            const regex = /^[A-Za-z0-9 ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Testimonials or Awards Input';
                showError(`testimonials_or_awards_${num}_err`, errorMessage)
                // return error;
            } else {
                showError(`testimonials_or_awards_${num}_err`, '')
            }
        }
        else if (input.name == 'signatureFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('signatureFile_err', errorMessage)
                } else {
                    showError('signatureFile_err', '')
                }
            } else {
                showError('signatureFile_err', 'Signature is Required')
            }

        } else if (input.name == 'terms_and_conditions' && input.checked) {
            showError('terms_and_conditions_err', '')
        }
        // else if (input.name == 'create_escrow_account' && input.checked) {
        //     showError('create_escrow_account_err', '')
        // }


    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            if (input.id.includes("testimonials_or_awards") && input.value == '') {
                let nameArray = input.id.split("_")
                let num = nameArray[nameArray.length - 1]
                showError(`testimonials_or_awards_${num}_err`, '')
            }
            else if (input.name == 'signatureFile' && !input.files[0]) {
                showError('signatureFile_err', '')
            }
            else if (input.name == 'terms_and_conditions' && input.checked) {
                showError('terms_and_conditions_err', '')
            }
            // else if (input.name == 'create_escrow_account' && input.checked) {
            //     showError('create_escrow_account_err', '')
            // }
        })

    }


    if (errorMessage == '') {
        console.log('field - error', error, errorMessage)
        error = false;
    }
    else {
        error = true;
        console.log('field - error', error, errorMessage)
    }
    return error;
}

function checkStep6RequiredInputs() {
    let allRequiredFilled = false;

    let errorMessage = '';
    for (let input of AllInputs) {
        if (input.name == 'signatureFile' && !input.files[0]) {
            errorMessage = 'Signature is Required';
            showError('signatureFile_err', errorMessage)
        }
        else if (input.name == 'terms_and_conditions' && input.checked == false) {
            errorMessage = 'Please check terms and conditions';
            showError('terms_and_conditions_err', errorMessage)
        }
        // else if (input.name == 'create_escrow_account' && input.checked == false) {
        //     errorMessage = 'Permission is Required';
        //     showError('create_escrow_account_err', errorMessage)
        // }

    }
    if (errorMessage == '') {
        console.log('required - error', allRequiredFilled, errorMessage)
        allRequiredFilled = false;
    }
    else {
        allRequiredFilled = true;
        console.log('required - error', allRequiredFilled, errorMessage)
    }
    return allRequiredFilled;
}


// ---------------------------------------step-6 functions-------------------------------------
// function validateStep7() {
//     let error = false;
//     let errorMessage = '';

//     for (let input of AllInputs) {
//         if (input.name == 'customerReferencePersonName' && input.value != '') {
//             const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
//             if (!regex.test(input.value.trim())) {
//                 errorMessage = 'Invalid Name';
//                 showError('customerReferencePersonName_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('customerReferencePersonName_err', '')
//             }
//         } else if (input.name == 'customerReferencePersonJobTitle' && input.value != '') {
//             const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
//             if (!regex.test(input.value.trim())) {
//                 errorMessage = 'Invalid Job Title';
//                 showError('customerReferencePersonJobTitle_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('customerReferencePersonJobTitle_err', '')
//             }
//         } else if (input.name == 'customerReferencePersonCompanyName' && input.value != '') {
//             const regex = /^[A-Za-z0-9 ]{3,}$/;
//             if (!regex.test(input.value.trim())) {
//                 errorMessage = 'Invalid Company Name';
//                 showError('customerReferencePersonCompanyName_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('customerReferencePersonCompanyName_err', '')
//             }
//         }
//         else if (input.name == 'customerReferencePersonCompanyWebsite' && input.value != '') {
//             // const regex = /^(https?:\/\/)?(www\.)?[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})(\/\S*)?$/;
//             const regex = /^(https?:\/\/)?([a-zA-Z0-9-]+\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\/\S*)?$/;
//             if (!regex.test(input.value.trim())) {
//                 errorMessage = 'Invalid Website Url';
//                 showError('customerReferencePersonCompanyWebsite_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('customerReferencePersonCompanyWebsite_err', '')
//             }
//         } else if (input.name == 'customerReferencePersonEmail' && input.value != '') {
//             // const regex = /^[a-zA-Z0-9._%+-]+@(?!gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
//             const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
//             if (!regex.test(input.value.trim().trim())) {
//                 errorMessage = 'Enter Company Email';
//                 showError('customerReferencePersonEmail_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('customerReferencePersonEmail_err', '')
//             }

//         }
//         else if (input.name == 'customerReferencePersonPhoneNo' && input.value != '') {
//             const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
//             if (!regex.test(input.value.trim())) {
//                 errorMessage = 'Invalid Phone Number';
//                 showError('customerReferencePersonPhoneNo_err', errorMessage)
//                 // return error;
//             } else {
//                 showError('customerReferencePersonPhoneNo_err', '')
//             }
//         }

//         else if (input.name == 'ref_signature' && input.files[0]) {
//             showError('ref_signature_err', '')
//             // let res = validateFileSize(input)
//             // if (!res) {
//             //     errorMessage = 'File size is too large';
//             //     showError('ref_signature_err', errorMessage)
//             // } else {
//             //     showError('ref_signature_err', '')
//             // }
//         }
//         else if (
//             (input.name == 'checkbox1') ||
//             (input.name == 'checkbox2') ||
//             (input.name == 'checkbox3') ||
//             (input.name == 'checkbox4') ||
//             (input.name == 'checkbox5') ||
//             (input.name == 'checkbox6') ||
//             (input.name == 'checkbox7') ||
//             (input.name == 'checkbox8') ||
//             (input.name == 'checkbox8') ||
//             (input.name == 'checkbox9') ||
//             (input.name == 'checkbox10') ||
//             (input.name == 'checkbox11') ||
//             (input.name == 'checkbox12') ||
//             (input.name == 'checkbox13') ||
//             (input.name == 'checkbox14') ||
//             (input.name == 'declaration')
//         ) {
//             if (
//                 (input.name == 'checkbox1' && input.checked) ||
//                 (input.name == 'checkbox2' && input.checked) ||
//                 (input.name == 'checkbox3' && input.checked) ||
//                 (input.name == 'checkbox4' && input.checked) ||
//                 (input.name == 'checkbox5' && input.checked) ||
//                 (input.name == 'checkbox6' && input.checked) ||
//                 (input.name == 'checkbox7' && input.checked) ||
//                 (input.name == 'checkbox8' && input.checked) ||
//                 (input.name == 'checkbox9' && input.checked) ||
//                 (input.name == 'checkbox10' && input.checked) ||
//                 (input.name == 'checkbox11' && input.checked) ||
//                 (input.name == 'checkbox12' && input.checked) ||
//                 (input.name == 'checkbox13' && input.checked) ||
//                 (input.name == 'checkbox14' && input.checked) ||
//                 (input.name == 'declaration' && input.checked)
//             ) {
//                 errorMessage = 'Signature is Required';
//                 showError('ref_signature_err', errorMessage)
//                 console.log(input.name, input.checked, 'input-if')
//             } else {
//                 showError('ref_signature_err', errorMessage)
//                 console.log(input.name, input.checked, 'input-else-ele')
//             }


//         }

//         // else if (input.name == 'declaration') {
//         //     // console.log('declaration',input,input.checked)
//         //     if (input.checked == false) {
//         //         showError('declaration_err', 'Please check declarations')
//         //     } else {
//         //         showError('declaration_err', '')
//         //     }
//         // }
//         // else if (input.name == 'terms_and_conditions') {
//         //     // console.log('terms_and_conditions',input,input.checked)
//         //     if (input.checked == false) {
//         //         showError('terms_and_conditions_err', 'Please check terms and conditions')
//         //     } else {
//         //         showError('terms_and_conditions_err', '')
//         //     }
//         // }


//     }

//     for (let input of AllInputs) {
//         input.addEventListener('change', function () {

//             if (input.name == 'customerReferencePersonName' && input.value == '') {
//                 showError('customerReferencePersonName_err', '')
//             } else if (input.name == 'customerReferencePersonJobTitle' && input.value == '') {
//                 showError('customerReferencePersonJobTitle_err', '')
//             } else if (input.name == 'customerReferencePersonCompanyName' && input.value == '') {
//                 showError('customerReferencePersonCompanyName_err', '')
//             }
//             else if (input.name == 'customerReferencePersonCompanyWebsite' && input.value == '') {
//                 showError('customerReferencePersonCompanyWebsite_err', '')
//             } else if (input.name == 'customerReferencePersonEmail' && input.value == '') {
//                 showError('customerReferencePersonEmail_err', '')
//             }
//             else if (input.name == 'customerReferencePersonPhoneNo' && input.value == '') {
//                 showError('customerReferencePersonPhoneNo_err', '')
//             }
//             // else if (input.name == 'ref_signature' && !input.files[0]) {
//             //     showError('ref_signature_err', '')
//             // }


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

// function checkStep7RequiredInputs() {
//     let allRequiredFilled = false;

//     let errorMessage = '';
//     for (let input of AllInputs) {


//         // if (input.name == 'customerReferencePersonName' && input.required && input.value == '') {
//         //     errorMessage = 'Name is Required';
//         //     showError('customerReferencePersonName_err', errorMessage)
//         // } else if (input.name == 'customerReferencePersonJobTitle' && input.required && input.value == '') {
//         //     errorMessage = 'Job Title is Required';
//         //     showError('customerReferencePersonJobTitle_err', errorMessage)
//         // }
//         // else if (input.name == 'customerReferencePersonCompanyName' && input.required && input.value == '') {
//         //     errorMessage = 'Company Name is Required';
//         //     showError('customerReferencePersonCompanyName_err', errorMessage)
//         // }
//         // else if (input.name == 'customerReferencePersonCompanyWebsite' && input.required && input.value == '') {
//         //     errorMessage = 'Company Website Name is Required';
//         //     showError('customerReferencePersonCompanyWebsite_err', errorMessage)
//         // }
//         // else if (input.name == 'customerReferencePersonPhoneNo' && input.required && input.value == '') {
//         //     errorMessage = 'Phone Number is Required';
//         //     showError('customerReferencePersonPhoneNo_err', errorMessage)
//         // } else if (input.name == 'customerReferencePersonEmail' && input.required && input.value == '') {
//         //     errorMessage = 'Company Email is Required';
//         //     showError('customerReferencePersonEmail_err', errorMessage)
//         // }
//         // else if (input.name == 'ref_signature' && input.required && input.value == '') {
//         //     errorMessage = 'Signature is Required';
//         //     showError('ref_signature_err', errorMessage)
//         // }
//         // else if (input.name == 'declaration' && input.required && input.checked == false) {
//         //     errorMessage = '(Please check Declarations)';
//         //     showError('declaration_err', errorMessage)
//         // }
//         // else if (input.name == 'terms_and_conditions' && input.required && input.checked == false) {
//         //     errorMessage = '(Please check Terms and Conditions)';
//         //     showError('terms_and_conditions_err', errorMessage)
//         // }

//         // else 
//         if (
//             (input.name == 'checkbox1' && input.checked) ||
//             (input.name == 'checkbox2' && input.checked) ||
//             (input.name == 'checkbox3' && input.checked) ||
//             (input.name == 'checkbox4' && input.checked) ||
//             (input.name == 'checkbox5' && input.checked) ||
//             (input.name == 'checkbox6' && input.checked) ||
//             (input.name == 'checkbox7' && input.checked) ||
//             (input.name == 'checkbox8' && input.checked) ||
//             (input.name == 'checkbox8' && input.checked) ||
//             (input.name == 'checkbox9' && input.checked) ||
//             (input.name == 'checkbox10' && input.checked) ||
//             (input.name == 'checkbox11' && input.checked) ||
//             (input.name == 'checkbox12' && input.checked) ||
//             (input.name == 'checkbox13' && input.checked) ||
//             (input.name == 'checkbox14' && input.checked) ||
//             (input.name == 'declaration' && input.checked)
//         ) {
//             // console.log('one of checkbox checked')
//             if (!document.querySelector('#ref_signature_input').files[0]) {
//                 errorMessage = 'Signature is Required';
//                 showError('ref_signature_err', errorMessage)
//                 // console.log('ref singnature not found')
//             }
//             // else {
//             //     errorMessage = '';
//             //     showError('ref_signature_err', errorMessage)
//             //     // console.log('ref singnature found')
//             // }

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

// function validateLastStep() {
//     let valid = false;
//     const isFieldError = validateStep7();
//     const isEmptyRequiredField = checkStep7RequiredInputs();

//     console.log('is last step valid:', isFieldError);
//     console.log('is last step all req filled:', isEmptyRequiredField);

//     // const valid = !(isFieldError || isEmptyRequiredField);

//     if (isEmptyRequiredField == true || isFieldError == true) {
//         valid = true;
//         console.log('in if condition')
//     } else {
//         valid = false;
//         console.log('in else condition')

//     }
//     return valid;
// }






function showStep(stepIndex) {
    steps.forEach((step, index) => {
        if (index === stepIndex) {
            step.classList.remove('d-none');
            stepCircles[index].classList.add('active');
            setTimeout(() => {
                navigateToBox.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }, 0);
        } else {
            step.classList.add('d-none');
            stepCircles[index].classList.remove('active');
        }
    });

    // if (stepIndex === 0) {
    //     prevBtn.disabled = true;
    // } else {
    //     prevBtn.disabled = false;
    // }

    // if (stepIndex === steps.length - 1) {
    //     nextBtn.classList.add('d-none');
    //     submitBtn.classList.remove('d-none');
    // } else {
    //     nextBtn.classList.remove('d-none');
    //     submitBtn.classList.add('d-none');
    // }

    for (let i = 0; i < stepCircles.length; i++) {
        if (currentStep <= 2) {
            stepCircles[i].classList.toggle('d-none', i >= 3);
            stepCircles[i].classList.toggle('d-block', i < 3);
            stepCircles[i].classList.toggle('d-sm-none', i >= 3);
            stepCircles[i].classList.toggle('d-sm-block', i < 3);
        } else if (currentStep <= 4) {
            stepCircles[i].classList.toggle('d-none', i < 2 || i > 4);
            stepCircles[i].classList.toggle('d-block', i >= 2 && i <= 4);
            stepCircles[i].classList.toggle('d-sm-none', i < 2 || i > 4);
            stepCircles[i].classList.toggle('d-sm-block', i >= 2 && i <= 4);
        } else {
            stepCircles[i].classList.toggle('d-none', i < 4 || i > 6);
            stepCircles[i].classList.toggle('d-block', i >= 4 && i <= 6);
            stepCircles[i].classList.toggle('d-sm-none', i < 4 || i > 6);
            stepCircles[i].classList.toggle('d-sm-block', i >= 4 && i <= 6);
        }
    }


    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep1();
            validateStep2();
            validateStep3();
            validateStep4();
            validateStep5();
            validateStep6();
            // validateStep7();
        });
    }

}

function prevStep() {
    currentStep--;
    showStep(currentStep);

    for (let i = 0; i < stepCircles.length; i++) {
        if (currentStep <= 2) {
            stepCircles[i].classList.toggle('d-none', i >= 3);
            stepCircles[i].classList.toggle('d-block', i < 3);
            stepCircles[i].classList.toggle('d-sm-none', i >= 3);
            stepCircles[i].classList.toggle('d-sm-block', i < 3);
        } else if (currentStep <= 4) {
            stepCircles[i].classList.toggle('d-none', i < 2 || i > 4);
            stepCircles[i].classList.toggle('d-block', i >= 2 && i <= 4);
            stepCircles[i].classList.toggle('d-sm-none', i < 2 || i > 4);
            stepCircles[i].classList.toggle('d-sm-block', i >= 2 && i <= 4);
        } else {
            stepCircles[i].classList.toggle('d-none', i < 4 || i > 6);
            stepCircles[i].classList.toggle('d-block', i >= 4 && i <= 6);
            stepCircles[i].classList.toggle('d-sm-none', i < 4 || i > 6);
            stepCircles[i].classList.toggle('d-sm-block', i >= 4 && i <= 6);
        }
    }
}

function nextStep() {




    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep1();
        });
    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep2();
        });
    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep3();
        });
    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep4();
        });
    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep5();
        });
    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep6();
        });
    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            let isFieldError = validateStep7();
            // let isEmptyRequiredField = checkStep7RequiredInputs()

            // if (isFieldError == false && isEmptyRequiredField == false) {
            //     document.getElementById('submit-btn').setAttribute("data-bs-toggle", "modal")

            // } else if (isFieldError == true && isEmptyRequiredField == false) {
            //     document.getElementById('submit-btn').removeAttribute("data-bs-toggle")

            // }
            // else if (isFieldError == false && isEmptyRequiredField == true) {
            //     document.getElementById('submit-btn').removeAttribute("data-bs-toggle")

            // }
            // else {
            //     document.getElementById('submit-btn').removeAttribute("data-bs-toggle")

            // }
        });
    }


    let isFieldError = false
    let isEmptyRequiredField = false


    if (currentStep == 0) {
        isFieldError = validateStep1()
        isEmptyRequiredField = checkStep1RequiredInputs()
        console.log("step-1", "invalid-", isFieldError, "any empty filled-", isEmptyRequiredField)
    }
    else if (currentStep == 1) {
        isFieldError = validateStep2()
        isEmptyRequiredField = checkStep2RequiredInputs()
        console.log("step-2", "invalid-", isFieldError, "any empty field-", isEmptyRequiredField)
    }
    else if (currentStep == 2) {
        isFieldError = validateStep3()
        isEmptyRequiredField = checkStep3RequiredInputs()
        console.log("step-3", "invalid-", isFieldError, "any empty field-", isEmptyRequiredField)
    }

    else if (currentStep == 3) {
        isFieldError = validateStep4()
        isEmptyRequiredField = checkStep4RequiredInputs()
        console.log("step-4", "invalid-", isFieldError, "any empty field-", isEmptyRequiredField)
    }

    else if (currentStep == 4) {
        isFieldError = validateStep5()
        isEmptyRequiredField = checkStep5RequiredInputs()
        console.log("step-5", "invalid-", isFieldError, "any empty field-", isEmptyRequiredField)
    }

    else if (currentStep == 5) {
        isFieldError = validateStep6()
        isEmptyRequiredField = checkStep6RequiredInputs()
        console.log("step-6", "invalid-", isFieldError, "any empty field-", isEmptyRequiredField)
    }

    //  else if (currentStep == 6) {
    //      isFieldError = validateStep7()
    //      isEmptyRequiredField = checkStep7RequiredInputs()
    //      console.log("step-7", "invalid-", isFieldError, "any empty field-", isEmptyRequiredField)

    //  }




    if (isEmptyRequiredField == true || isFieldError == true) {
        return;
    }


    let stepLines = document.querySelectorAll('.step-line')
    if (currentStep != 6) {
        stepLines[currentStep].classList.add('completed');
    }
    // console.log(stepLines)
    stepCircles[currentStep].classList.add('completed');
    currentStep++;
    showStep(currentStep);


    for (let i = 0; i < stepCircles.length; i++) {
        if (currentStep <= 2) {
            stepCircles[i].classList.toggle('d-none', i >= 3);
            stepCircles[i].classList.toggle('d-block', i < 3);
            stepCircles[i].classList.toggle('d-sm-none', i >= 3);
            stepCircles[i].classList.toggle('d-sm-block', i < 3);
        } else if (currentStep <= 4) {
            stepCircles[i].classList.toggle('d-none', i < 2 || i > 4);
            stepCircles[i].classList.toggle('d-block', i >= 2 && i <= 4);
            stepCircles[i].classList.toggle('d-sm-none', i < 2 || i > 4);
            stepCircles[i].classList.toggle('d-sm-block', i >= 2 && i <= 4);
        } else {
            stepCircles[i].classList.toggle('d-none', i < 4 || i > 6);
            stepCircles[i].classList.toggle('d-block', i >= 4 && i <= 6);
            stepCircles[i].classList.toggle('d-sm-none', i < 4 || i > 6);
            stepCircles[i].classList.toggle('d-sm-block', i >= 4 && i <= 6);
        }
    }



}


showStep(currentStep);



//----------------------------------------- js script for stepper ends here --------------------------------------



//document.addEventListener('DOMContentLoaded', function () {
//    const form = document.getElementById('myForm');
//    form.onsubmit = function (event) {
//        return handleSubmit(event);
//    };
//});

function handleSubmit(event) {
    console.log('handleSubmit called');
    const isValid = validateLastStep();

    if (isValid) {
        // Prevent form submission
        // console.log()
        event.preventDefault();
        console.log('Form submission prevented due to validation errors.');
        return false;
    } else {
        // Allow form submission
        console.log('Form is valid. Submitting form.');
        return true;
    }
}

function validateStep7() {
    let error = false;
    let errorMessage = '';

    for (let input of AllInputs) {
        console.log(input.name)
        if (input.name == 'customerReferencePersonName' && input.value != '') {
            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Name';
                showError('customerReferencePersonName_err', errorMessage);
                error = true;
            } else {
                showError('customerReferencePersonName_err', '');
            }
        } else if (input.name == 'customerReferencePersonJobTitle' && input.value != '') {
            const regex = /^(?=.*[A-Za-z])[A-Za-z ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Job Title';
                showError('customerReferencePersonJobTitle_err', errorMessage);
                error = true;
            } else {
                showError('customerReferencePersonJobTitle_err', '');
            }
        } else if (input.name == 'customerReferencePersonCompanyName' && input.value != '') {
            const regex = /^[A-Za-z0-9 ]{3,}$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Company Name';
                showError('customerReferencePersonCompanyName_err', errorMessage);
                error = true;
            } else {
                showError('customerReferencePersonCompanyName_err', '');
            }
        } else if (input.name == 'customerReferencePersonCompanyWebsite' && input.value != '') {
            const regex = /^(https?:\/\/)?([a-zA-Z0-9-]+\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\/\S*)?$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Website Url';
                showError('customerReferencePersonCompanyWebsite_err', errorMessage);
                error = true;
            } else {
                showError('customerReferencePersonCompanyWebsite_err', '');
            }
        } else if (input.name == 'customerReferencePersonEmail' && input.value != '') {
            // const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|gmail\.co|gmail\.c)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
            const regex = /^(?=.*\S)[a-zA-Z0-9._%+-]+@(?!\.|gmail\.com|yahoo\.com|outlook\.com|icloud\.com|hotmail\.com)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;

            if (!regex.test(input.value.trim())) {
                errorMessage = 'Enter Company Email';
                showError('customerReferencePersonEmail_err', errorMessage);
                error = true;
            } else {
                showError('customerReferencePersonEmail_err', '');
            }
        } else if (input.name == 'customerReferencePersonPhoneNo' && input.value != '') {
            const regex = /^(?:\+?1[-.\s]?)?\(?(\d{3})\)?[-.\s]?(\d{3})[-.\s]?(\d{4})$/;
            if (!regex.test(input.value.trim())) {
                errorMessage = 'Invalid Phone Number';
                showError('customerReferencePersonPhoneNo_err', errorMessage);
                error = true;
            } else {
                showError('customerReferencePersonPhoneNo_err', '');
            }
        } else if (input.name == 'permissionModel.signatureFile') {
            if (input.files[0]) {
                let res = validateFileSize(input)
                if (!res) {
                    errorMessage = 'File size is too large';
                    showError('ref_signature_err', errorMessage)
                } else {
                    showError('ref_signature_err', '')
                }
            }
        } else if (input.name == 'declaration' && input.checked) {
            //onchange event will not work so using click event separately for hiding error
            showError('declaration_err', '');
        }
        else if (
            //onchange event will not work so using click event separately for hiding error
            (input.name == 'permissionModel.presentations' && input.checked) ||
            (input.name == 'permissionModel.newsletters' && input.checked) ||
            (input.name == 'permissionModel.customerProfileOnWeb' && input.checked) ||
            (input.name == 'permissionModel.rfp' && input.checked) ||
            (input.name == 'permissionModel.onlineDirectMarketingCampaigns' && input.checked) ||
            (input.name == 'permissionModel.sponsoredEvents' && input.checked) ||
            (input.name == 'permissionModel.caseStudy' && input.checked) ||
            (input.name == 'permissionModel.whitePaper' && input.checked) ||
            (input.name == 'permissionModel.broadcastMedia' && input.checked) ||
            (input.name == 'permissionModel.pressAnalysts' && input.checked) ||
            (input.name == 'permissionModel.customerTestimonialLetter' && input.checked) ||
            (input.name == 'permissionModel.customerTestimonialVideo' && input.checked) ||
            (input.name == 'permissionModel.speakingEngagement' && input.checked) ||
            (input.name == 'parentCheckbox' && input.checked)
        ) {
            showError('check_one_checkbox_err','')
            console.log('One checkbox checked')
        }



    }

    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            if (input.name == 'customerReferencePersonName' && input.value == '') {
                showError('customerReferencePersonName_err', '');
            } else if (input.name == 'customerReferencePersonJobTitle' && input.value == '') {
                showError('customerReferencePersonJobTitle_err', '');
            } else if (input.name == 'customerReferencePersonCompanyName' && input.value == '') {
                showError('customerReferencePersonCompanyName_err', '');
            } else if (input.name == 'customerReferencePersonCompanyWebsite' && input.value == '') {
                showError('customerReferencePersonCompanyWebsite_err', '');
            } else if (input.name == 'customerReferencePersonEmail' && input.value == '') {
                showError('customerReferencePersonEmail_err', '');
            } else if (input.name == 'customerReferencePersonPhoneNo' && input.value == '') {
                showError('customerReferencePersonPhoneNo_err', '');
            }
        });
    }

    return error;
}

function checkStep7RequiredInputs() {
    let allRequiredFilled = false;
    let errorMessage = '';
    let anyChecked = false;

    const allCheckboxes = document.querySelectorAll('.child-checkboxes,.parent-checkbox');
    // console.log('allCheckboxes',allCheckboxes)
    for(let checkbox of allCheckboxes){
        if(checkbox.checked){
            anyChecked=true;
            break;
        }
    }

    for (let input of AllInputs) {
        if(input.name == 'declaration' && !input.checked){
            errorMessage = 'Please check declaration';
            showError('declaration_err',errorMessage)
        }else if(input.name == 'permissionModel.signatureFile' && !input.files[0]){
            errorMessage = 'Signature is Required';
            showError('ref_signature_err',errorMessage)
        }
    }

    if (errorMessage == '' && anyChecked== true) {
        console.log('required - error', allRequiredFilled, errorMessage)
        allRequiredFilled = false;
    }
    else if(errorMessage == '' && anyChecked== false){
        showError('check_one_checkbox_err','Please check atleast one checkbox')
        allRequiredFilled = true;
        console.log('required - error', allRequiredFilled, errorMessage)
    }
    else if(errorMessage != '' && anyChecked== false){
        showError('check_one_checkbox_err','Please check atleast one checkbox')
        allRequiredFilled = true;
        console.log('required - error', allRequiredFilled, errorMessage)
    }
    else {
        allRequiredFilled = true;
        console.log('required - error', allRequiredFilled, errorMessage)
    }
    
    return allRequiredFilled;
}

function validateLastStep() {
    // checkIfAnyCheckboxChecked(); // Ensure the latest state is checked
    const errorMessage = document.getElementById('ref_signature_err').textContent;
    const errorMessageDeclaration = document.getElementById('declaration_err').textContent;
    const isFieldError = validateStep7();
    const isEmptyRequiredField = checkStep7RequiredInputs();

    if (isFieldError || isEmptyRequiredField || errorMessage || errorMessageDeclaration) {
        return true; // indicates errors
    } else {
        return false; // indicates no errors
    }
}

// function checkIfAnyCheckboxChecked() {
//     const allCheckboxes = document.querySelectorAll('.supplier-ref-checkbox');
//     const signatureInput = document.querySelector('#ref_signature_input');
//     // console.log(signatureInput)



//     allCheckboxes.forEach(checkbox => {
//         checkbox.addEventListener('click', updateErrorMessage);
//     });

//     signatureInput.addEventListener('change', function () {
//         if (signatureInput.files[0]) {
//             let res = validateFileSize(signatureInput)
//             if (!res) {
//                 errorMessage = 'File size is too large';
//                 showError('ref_signature_err', errorMessage)
//             } else {
//                 showError('ref_signature_err', '')
//             }

//         } else {
//             showError('ref_signature_err', 'Signature is Required');
//         }
//         updateErrorMessage()

//     }
//     );

//     // Initial check in case any checkbox is already checked on page load
//     updateErrorMessage();
// }
// function updateErrorMessage() {
//     const declarationCheckInput = document.querySelector('#declaration');
//     const signatureInput = document.querySelector('#ref_signature_input');
//     const permissionDetailsDiv = document.querySelectorAll('#PermissionDetails .required-asterisk');
//     let anyChecked = false;
//     for (let checkbox of allCheckboxes) {
//         if (checkbox.checked) {
//             anyChecked = true;
//             break;
//         }
//     }

//     if (anyChecked) {
//         signatureInput.addEventListener('change', updateErrorMessage);
//         //			 permissionDetailsDiv.forEach(element => {
//         //    			element.style.display = "inline-block";
//         //			});


//         if (declarationCheckInput.checked) {
//             showError('declaration_err', '');
//         } else {
//             showError('declaration_err', 'Please check declaration');
//         }
//         if (signatureInput.files[0]) {
//             let res = validateFileSize(signatureInput)
//             if (!res) {
//                 errorMessage = 'File size is too large';
//                 showError('ref_signature_err', errorMessage)
//             } else {
//                 showError('ref_signature_err', '')
//             }

//         } else {
//             showError('ref_signature_err', 'Signature is Required');
//         }
//     }
//     else {
//         showError('declaration_err', '');
//         showError('ref_signature_err', '');
//         if (signatureInput.files[0]) {
//             let res = validateFileSize(signatureInput)
//             if (!res) {
//                 errorMessage = 'File size is too large';
//                 showError('ref_signature_err', errorMessage)
//             } else {
//                 showError('ref_signature_err', '')
//             }

//         }
//     }
// }

const signatureInput = document.querySelector('#ref_signature_input');
signatureInput.addEventListener('change', function () {
    if (signatureInput.files[0]) {
        let res = validateFileSize(signatureInput)
        if (!res) {
            errorMessage = 'File size is too large';
            showError('ref_signature_err', errorMessage)
        } else {
            showError('ref_signature_err', '')
        }

    } else {
        showError('ref_signature_err', 'Signature is Required');
    }
})

//checkIfAnyCheckboxChecked()