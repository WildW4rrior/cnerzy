//document.querySelector('#signature_input').addEventListener('change', function() {
//	if (!this.files[0]) {
//		showError('signature_err', 'Signature is Required')
//	} else {
//		showError('signature_err', '')
//	}
//})
var row = 2;


var parentElement = document.querySelector('#major-product-row');
var productCount = 1;

var parentRow = document.querySelector('#oem-details-parent');
var rowCount = 1;

var majorCustomerParent = document.querySelector('#list-of-major-customers-parent');
var listCount = 1;

var logisticServiceProviderParent = document.querySelector('#logistic-service-provider-parent');
var providerCount = 1;

var annualTurnoverParent = document.querySelector('#annual-turnover-parent');
var annualTurnoverListCount = 1;

var regAddressesOfFactoryParent = document.querySelector('#reg-addresses-of-factory-parent');
var factoryCount = 1;
var factoryArray = [{
    subListsCount:1,
    machineListCount: 0,
    inspectionListCount: 0
}]

// var machiningListParent = document.querySelector('#machine-list-parent');
// var machineListCount = 1;

// var inspectionListParent = document.querySelector('#inspection-list-parent');
// var inspectionListCount = 1;

var testmonialsListParent = document.querySelector('#testimonials-list-parent');
var testimonialsListCount = 1;

var exporterListsParent = document.querySelector('#exporter-lists-parent');
var exporterListCount = 1;


function addNewContactPersonRow() {
	var contactPersonInputBox = document.getElementById('contact-person-box');
	var modal = row - 1;

	var newInputRow = `
        <div class="row row-gap-16" style="margin-top:16px;">
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="field-group">
                    <input type="text" name="contactPersonModels[${modal}].name" id="contact_person_name_${row}" class="input-field contact_person_name" placeholder="Name" autocomplete="off">
                    <label for="contact_person_name_${row}" class="input-label">Name</label>
                    <span id="contact_person_name_${row}_err" class="err-text"></span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="field-group">
                    <input type="text" name="contactPersonModels[${modal}].designation" id="contact_person_designation_${row}" class="input-field contact_person_designation" placeholder="Designation"  autocomplete="off">
                    <label for="contact_person_designation_${row}" class="input-label">Designation</label>
                    <span id="contact_person_designation_${row}_err" class="err-text"></span>

                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="field-group">
                    <input type="text" name="contactPersonModels[${modal}].email" id="contact_person_email_${row}" class="input-field contact_person_email" placeholder="Email" autocomplete="off">
                    <label for="contact_person_email_${row}" class="input-label">Email</label>
                    <span id="contact_person_email_${row}_err" class="err-text"></span>

                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="field-group">
                    <input type="text" name="contactPersonModels[${modal}].phone"  maxlength="10" id="contact_person_phone_${row}" class="input-field contact_person_phone" placeholder="Phone" autocomplete="off">
                    <label for="contact_person_phone_${row}" class="input-label">Phone</label>
                    <span id="contact_person_phone_${row}_err" class="err-text"></span>
                </div>
            </div>
        </div>
    `;

    // Create a temporary container element
    var tempContainer = document.createElement('div');

    // Set its innerHTML to the newInputRow HTML string
    tempContainer.innerHTML = newInputRow;

    // Append the child nodes of the temporary container to the contactPersonInputBox
    while (tempContainer.firstChild) {
        contactPersonInputBox.appendChild(tempContainer.firstChild);
    }
    row = row + 1;
    modal++
    getAllInput()
    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep1();
        });
    }
}

function addAnotherMajorProduct() {
	// Increment the product count

	productCount = productCount + 1;
	var modal = productCount - 1
	// Create a new column div
	var newColumn = document.createElement('div');
	newColumn.className = 'col-lg-3 col-md-6 col-sm-12 col-12';
	newColumn.innerHTML = `<div class="field-group">
                                    <input type="text" name="productsList[${modal}].productName" id="name_of_product_${productCount}" class="input-field"
                                        placeholder="Name of Major Product ${productCount}" autocomplete="off">
                                    <label for="name_of_product_${productCount}" class="input-label">Name of Major Product
                                        ${productCount}</label>
                                        <span id="name_of_product_${productCount}_err" class="err-text"></span>

                                </div>`;

    // Append the new column to the parent element
    parentElement.insertBefore(newColumn, parentElement.lastElementChild);
    getAllInput()
    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep2();
        });
    }
}

function generateYearOptions() {
    var currentYear = new Date().getFullYear();
    var options = '<option value="" selected>Supplier Since</option>';
    for (let year = currentYear; year >= 1900; year--) {
        options += `<option value="${year}">${year}</option>`;
    }
    return options;
}



function addAnotherOEMDetails() {
	// Increment the row count
	rowCount = rowCount + 1
	var modal = rowCount - 1
	countrySelected = countrySelected
	// Create a new row div
	var newRow = document.createElement('div');

    // Set inner HTML for the new row
    newRow.innerHTML = `
            <div class="row">
                                <h6 class="input-section-heading mb-8">${rowCount}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group">
                                    <input type="text" name="oemModels[${modal}].supplyingTo" id="oem_supplying_to_${rowCount}" class="input-field"
                                        placeholder="OEM Supplying to"  autocomplete="off">
                                    <label for="oem_supplying_to_${rowCount}" class="input-label">OEM Supplying to</label>
                                    <span id="oem_supplying_to_${rowCount}_err" class="err-text"></span>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group">
                                    <select name="oemModels[${modal}].supplierSince" id="supplier_since_${rowCount}"
                                        class="input-field form-dropdown"  autocomplete="off">
                                        ${generateYearOptions()}
                                        
                                    </select>
                                    <label for="supplier_since_${rowCount}" class="input-label">Select
                                    </label>
                                    <span id="supplier_since_${rowCount}_err" class="err-text"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group d-flex position-relative align-items-center">
                                <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                ${countrySelected == "IN" ? `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 4px;">INR</span>
					                        ` : `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 3px;">USD</span>
					                        `} </div>
                                    <input type="number" name="oemModels[${modal}].value" id="oem_value_${rowCount}" style="padding-left:50px;"
                                        class="input-field" placeholder="Value"  autocomplete="off">
                                    <label for="oem_value_${rowCount}" style="left:50px;" class="input-label">Value</label>

                                    </div>
                                    <span id="oem_value_${rowCount}_err" class="err-text"></span>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="field-group select-field-group">
                                    <select name="oemModels[${modal}].vendorRating" id="vendor_rating_${rowCount}"
                                        class="input-field form-dropdown" autocomplete="off">
                                        <option value="" selected>Vendor Rating</option>
                                        <option value="5">5</option>
                                        <option value="4">4</option>
                                        <option value="3">3</option>
                                        <option value="2">2</option>
                                        <option value="1">1</option>
                                    </select>
                                    <label for="vendor_rating_${rowCount}" class="input-label">Select</label>
                                    <span id="vendor_rating_${rowCount}_err" class="err-text"></span>

                                </div>
                            </div></div>`;

    // Append the new row to the parent row
    parentRow.insertBefore(newRow, parentRow.lastElementChild);
    // parentRow.appendChild(newRow);
    customSelectInitialization()
    getAllInput()
    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep2();
        });
    }
}

function addAnotherListOfMajorCustomer() {
	// Increment the row count
	listCount = listCount + 1
	var modal = rowCount - 1

    // Create a new row div
    var newList = document.createElement('div');

    // Set inner HTML for the new row
    newList.innerHTML = `<div class="row">
                                    <h6 class="input-section-heading mb-8">${listCount}.</h6>
                                </div>
                                <div class="row row-gap-16 mb-32">
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="majorCustomers[${modal}].name" id="customer_name_${listCount}" class="input-field"
                                                placeholder="Customer’s Name"  autocomplete="off">
                                            <label for="customer_name_${listCount}" class="input-label">Customer’s Name</label>
                                            <span id="customer_name_${listCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="majorCustomers[${modal}].address" id="customer_address_${listCount}" class="input-field" placeholder="Address"
                                                 autocomplete="off">
                                            <label for="customer_address_${listCount}" class="input-label">Address</label>
                                            <span id="customer_address_${listCount}_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="majorCustomers[${modal}].productSupplied" id="product_supplied_${listCount}" class="input-field"
                                                placeholder="Product Supplied"  autocomplete="off">
                                            <label for="product_supplied_${listCount}" class="input-label">Product Supplied</label>
                                            <span id="product_supplied_${listCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                </div>`;

	// Append the new row to the parent row
	//	 majorCustomerParent.insertBefore(newList, majorCustomerParent.lastElementChild);
	majorCustomerParent.appendChild(newList);
	getAllInput()
	for (let input of AllInputs) {
		input.addEventListener('change', function() {
			validateStep2();
		});
	}
}

function addAnotherLogisticServiceProvider() {

	// Increment the row count
	providerCount = providerCount + 1
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
                                            <input type="text" name="logisticServiceProvider[${modal}].name" id="provider_name_${providerCount}" class="input-field"
                                                placeholder="Name"  autocomplete="off">
                                            <label for="provider_name_${providerCount}" class="input-label">Name</label>
                                            <span id="provider_name_${providerCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="logisticServiceProvider[${modal}].address" id="provider_address_${providerCount}" class="input-field"
                                                placeholder="Address"  autocomplete="off">
                                            <label for="provider_address_${providerCount}" class="input-label">Address</label>
                                            <span id="provider_address_${providerCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="add-provider-${providerCount}-btn-col">
                                        <button class="btn-style-2 w-100" type="button" onclick="addAnotherLogisticServiceProvider()">+ Add Other</button>
                                    </div>
                                </div>

            `;

    setTimeout(() => {
        document.querySelector(`#add-provider-${providerCount - 1}-btn-col`).style.display = "none"
    }, 0)
    // Append the new row to the parent row
    // logisticServiceProviderParent.insertBefore(providerRow, logisticServiceProviderParent.lastElementChild);
    logisticServiceProviderParent.appendChild(providerRow);
    getAllInput()
    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep2();
        });
    }
}

function generateFinancialYearOptions() {
    var options = '<option value="" selected>Financial year</option>';
    for (let year = new Date().getFullYear(); year >= 1900; year--) {
        options +=
            `<option value="${year - 1}-${String(year).slice(-2)}">${year - 1}-${String(year).slice(-2)}</option>`;
    }
    return options;
}


function addAnotherYearExportRow() {
	// Increment the row count
	exporterListCount = exporterListCount + 1
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
                                            <select name="exporterList[${modal}].financialYear" id="export_financial_year_${exporterListCount}"
                                                class="input-field form-dropdown" autocomplete="off">
                                                ${generateFinancialYearOptions()}
                                            </select>
                                            <label for="export_financial_year_${exporterListCount}" class="input-label">Select</label>
                                            <span id="export_financial_year_${exporterListCount}_err" class="err-text"></span>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group">
                                            <input type="text" name="exporterList[${modal}].product" id="product_or_services_${exporterListCount}" class="input-field"
                                                placeholder="Product/Services" autocomplete="off">
                                            <label for="product_or_services_${exporterListCount}" class="input-label">Product/Services</label>
                                            <span id="product_or_services_${exporterListCount}_err" class="err-text"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                      
                                        <div class="field-group select-field-group">
											<select name="exporterList[${modal}].country" id="export_country_${exporterListCount}"
												class="input-field form-dropdown" autocomplete="off">
												<option value="" selected>Country</option>
												<option value="india">India</option>
												<option value="us">US</option>
											</select> <label for="export_country_${exporterListCount}" class="input-label">Select</label>
											<span id="export_country_${exporterListCount}_err" class="err-text"></span>
										</div>
                                           
                                       
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="field-group d-flex position-relative align-items-center">
                                        <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                  ${countrySelected == "IN" ? `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 4px;">INR</span>
					                        ` : `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 3px;">USD</span>
					                        `} 
                                            </div>
                                            <input type="number" name="exporterList[${modal}].value"  id="export_value_${exporterListCount}" style="padding-left:50px;"
                                                class="input-field" placeholder="Value"  autocomplete="off">
                                            <label for="export_value_${exporterListCount}" style="left:50px;" class="input-label">Value</label>
                                            </div>
                                            <span id="export_value_${exporterListCount}_err" class="err-text"></span>
                                    </div>
                                </div>`;

	// Append the new row to the parent row
	exporterListsParent.insertBefore(newExporterList, exporterListsParent.lastElementChild);
	//	 exporterListsParent.appendChild(newExporterList);
	customSelectInitialization()
	getAllInput()
	for (let input of AllInputs) {
		input.addEventListener('change', function() {
			validateStep2();
		});
	}
}

function generateAnnualTurnoverOptions() {
    var options = '<option value="" selected>Financial year</option>';
    for (let year = new Date().getFullYear(); year >= 1900; year--) {
        options +=
            `<option value="${year - 1}-${String(year).slice(-2)}">${year - 1}-${String(year).slice(-2)}</option>`;
    }
    return options;
}


function addAnotherAnnualYearTurnover() {
	// Increment the row count
	annualTurnoverListCount = annualTurnoverListCount + 1
	var modal = annualTurnoverListCount - 1
	// Create a new div element to hold the new fields
	var newDiv = document.createElement("div");
	newDiv.className = "col-lg-6 col-md-12 row  gx-4";

    // Set the content for the new section
    newDiv.innerHTML = `
        <h6 class="input-section-heading mb-8">${annualTurnoverListCount}.</h6>
        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
            <div class="field-group select-field-group">
                <select name="annualTurnoverList[${modal}].financialYear" id="turnover_financial_year_${annualTurnoverListCount}" class="input-field form-dropdown"  autocomplete="off">
                    ${generateAnnualTurnoverOptions()}
                </select>
                <label for="turnover_financial_year_${annualTurnoverListCount}" class="input-label">Select</label>
                <span id="turnover_financial_year_${annualTurnoverListCount}_err" class="err-text"></span>

            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 mb-16">
            <div class="field-group d-flex position-relative align-items-center">

                <div class="input-group-prepend position-absolute"
                                                style="left: 10px; width: 32px; height: 32px;">
                                                    ${countrySelected == "IN" ? `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 4px;">INR</span>
					                        ` : `
					                        <span class="input-group-text" id="basic-addon1" style="font-size: 12px; padding: 3px;">USD</span>
					                        `} 
                                            </div>
                <input type="number" name="annualTurnoverList[${modal}].turnover" id="turnover_value_${annualTurnoverListCount}" style="padding-left:50px;" class="input-field" placeholder="Annual Turnover"  autocomplete="off">
                <label for="turnover_value_${annualTurnoverListCount}" style="left:50px;" class="input-label">Annual Turnover</label>

                </div>
                <span id="turnover_value_${annualTurnoverListCount}_err" class="err-text"></span>

        </div>
    `;

    // Append the new section to the parent element
    annualTurnoverParent.appendChild(newDiv);
    customSelectInitialization()
    getAllInput()
    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep3();
        });
    }

}
function addAnotherRegAddressOfFactory() {
    // Increment the row count
    factoryArray.push({
        subListsCount:1,
        machineListCount: 0,
        inspectionListCount: 0
    })
    var modal = factoryCount - 1;
    // Create a new div element to hold the new fields
    var newAddressList = document.createElement("div");

    // Set the content for the new section
    newAddressList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${(factoryCount+1)}.</h6>
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
														<h6 class="input-section-heading mb-8">${factoryCount+1}.1</h6>
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
														<h6 class="input-section-heading mb-8">${factoryCount+1}.1</h6>
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

    getAllInput()
    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep4();
        });
    }
}
var MachineCount = 2
var addres = factoryCount - 1
function addAnotherMachineList(facCount,machineListCount) {
    let machiningListParent = document.querySelector(`#machine-list-parent-${facCount}`)
    // Increment the row MachineCount
    factoryArray[facCount].subListsCount = factoryArray[facCount].subListsCount + 1
    factoryArray[facCount].machineListCount = factoryArray[facCount].machineListCount + 1

    machineListCount = machineListCount + 1
    // var modal = machineListCount
    var subListsCount = factoryArray[facCount].subListsCount

    // Create a new div element to hold the new fields
    var newMachineList = document.createElement("div");

    // Set the content for the new section
    newMachineList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${(facCount+1)}.${(factoryArray[facCount].machineListCount+1)}</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                            	<input hidden name="factoryList[${facCount}].facilityList[${subListsCount}].type"
													value="Machining">
											
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
    MachineCount++
    getAllInput()
    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep4();
        });
    }
}
var InspectionCount = 1
function addAnotherInspectionList(facCount,inspectionListCount) {
    let inspectionListParent = document.querySelector(`#inspection-list-parent-${facCount}`);

    // Increment the row count
    factoryArray[facCount].subListsCount =  factoryArray[facCount].subListsCount + 1
    factoryArray[facCount].inspectionListCount =  factoryArray[facCount].inspectionListCount + 1

    // inspectionListCount = inspectionListCount + 1
    // machineListCount = machineListCount + 1

    // var modal = machineListCount
    var subListsCount = factoryArray[facCount].subListsCount
    // Create a new div element to hold the new fields
    var newInspectionList = document.createElement("div");

    // Set the content for the new section
    newInspectionList.innerHTML = `<div class="row">
                                            <h6 class="input-section-heading mb-8">${(facCount+1)}.${(factoryArray[facCount].inspectionListCount+1)}</h6>
                                        </div>
                                        <div class="row row-gap-16 mb-16">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="field-group">
                                                <input hidden name="factoryList[${facCount}].facilityList[${subListsCount}].type"
												value="Inspection">
                                                    <input type="text" name="factoryList[${facCount}].facilityList[${subListsCount}].detail" id="inspection_facility_${facCount}_${factoryArray[facCount].subListsCount}" class="input-field"
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
    getAllInput()
    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep4();
        });
    }
}

function addAnotherTestimonialList() {
	// Increment the row count
	testimonialsListCount = testimonialsListCount + 1
	var modal = testimonialsListCount - 1
	// Create a new div element to hold the new fields
	var newTestimonialList = document.createElement("div");
	newTestimonialList.className = "row";

    // Set the content for the new section
    newTestimonialList.innerHTML = `
                                        <div class="col-12">
                                            <h6 class="input-section-heading mb-8">${testimonialsListCount}.</h6>
                                        </div>
                                        <div class="col-lg-9 col-md-6 col-sm-12 col-12 mb-16">
                                            <div class="field-group">
                                                <input type="text" name="testimonialsList[${modal}].description" id="testimonials_or_awards_${testimonialsListCount}" class="input-field"
                                                    placeholder="Customer Testimonials / Awards"
                                                    autocomplete="off">
                                                <label for="testimonials_or_awards_${testimonialsListCount}" class="input-label">Customer
                                                    Testimonials
                                                    /
                                                    Awards</label>
                                                <span id="testimonials_or_awards_${testimonialsListCount}_err" class="err-text"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12 col-12" id="testimonials-btn-${testimonialsListCount}">
                                            <button class="btn-style-2 w-100" type="button"
                                                onclick="addAnotherTestimonialList()">+ Add Other</button>
                                        </div>
                                    `;

    setTimeout(() => {
        document.querySelector(`#testimonials-btn-${testimonialsListCount - 1}`).style.display = 'none'
    }, 0)

    // Append the new section to the parent element
    testmonialsListParent.appendChild(newTestimonialList);
    getAllInput()
    for (let input of AllInputs) {
        input.addEventListener('change', function () {
            validateStep6();
        });
    }

}
function makeYearDropdown() {
	// Get the element by ID
	var yearDropdown = document.querySelector('#annual-turnover-parent #turnover_financial_year_1');
	var yearDropdown1 = document.querySelector('#exporter-lists-parent #export_financial_year_1');
	yearDropdown.innerHTML = ""
	// Generate the financial year options
	var options = generateFinancialYearOptions();
	yearDropdown1.innerHTML = ""
	yearDropdown1.innerHTML = options;
	// Set the generated options as the inner HTML of the dropdown
	yearDropdown.innerHTML = options;
}
function makeExporterYearDropdown() {
	// Get the element by ID

	var yearOmeDropdown = document.querySelector('#oem-details-parent #supplier_since_1');

	// Generate the financial year options
	var options = generateYearOptions();

	yearOmeDropdown.innerHTML = options
	// Set the generated options as the inner HTML of the dropdown

}
//			generateYearOptions()
//	generateFinancialYearOptions()
function initializeDropdowns() {
	makeYearDropdown();
	makeExporterYearDropdown();
}

// Call initializeDropdowns after the page is fully loaded
document.addEventListener('DOMContentLoaded', initializeDropdowns);
function facotryAddMore() {

}
