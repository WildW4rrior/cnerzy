//Define the DataTable instance variable outside the function
var DataTable;
var separatedData;
$(document).ready(
	function() {
		console.log("${role}", "js")
		console.log("${pageContext.request.contextPath}", "js")




		fetch(contextPath + "/getContractsForAdmin", requestOptions)
			.then((response) => response.text())
			.then(result => {
			    alert(result)
			    if(result===null){
			        alert("Zero")
			    }

				userListJson = JSON.parse(result)
				console.log(userListJson)


				buyerTable(userListJson.data);
				separatedData = processDataAndHeader(userListJson.data);
				console.log(userListJson);
			})
			.catch(error => console.error("Error:", error));




		$("#inReviewHeader").click(function() {
			buyerTable(separatedData["inreview"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#projectExecutionHeader").click(function() {
			buyerTable(separatedData["projectexecution"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});

		$("#allHeader").click(function() {
			buyerTable(separatedData["all"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#DocumentsHeader").click(function() {
			getDocumnets(sellerId, requirementId, BuyerId)

			replaceDiv("leftSide", "rightSide")
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#viewRequirementsHeader").click(function() {
			//			buyerTable(separatedData["all"]);
			replaceDiv("rightSide", "leftSide")
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});

		$(".dropdown-item").on("click", function() {
			var sortBy = $(this).text();
			switch (sortBy) {
				case "Newest":
					DataTable.order([3, 'desc', 'custom-date-time-pre']).draw();
					$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
					break;
				case "Oldest":
					DataTable.order([3, 'asc', 'custom-date-time-pre']).draw();
					$('#dropdownMenuClickableInside').html("Oldest"); // Update inner HTML of the element with ID 'sortingLabel'
					break;
				default:
				// Handle other sorting options if needed
			}
		});
	})


function processDataAndHeader(data) {
	var separatedData = {
		"projectexecution": [],
		"inreview": [],
		"all": []
	};

	data.forEach(function(item) {
		if (item.status !== "-") {

			separatedData[item.status.toLowerCase().replace(/\s/g, '')].push(item);
		}
		separatedData["all"].push(item);
	});

	$('#inReviewHeader').text('In Review (' + separatedData["inreview"].length + ')');
	$('#projectExecutionHeader').text('In Execution (' + separatedData["projectexecution"].length + ')');
	$('#allHeader').text('All (' + separatedData["all"].length + ')');

	return separatedData;
}

function buyerTable(data) {
    console.log(data)
	DataTable = $("#sellerProjects-table")
		.DataTable(
			{
				destroy: true,
				borderless: false,
				hover: false,
				selectable: false,
				responsive: false,
				dom: 'Btr',
				autoWidth: false,
				paging: false,
				sm: false,
				scrollX: true,
				data: data,
				stripeClasses: [],
				oLanguage: {
					sEmptyTable: `<div id="NoData2"
										style="display: flex;    min-height: 350px; flex: 1; justify-content: center; align-items: center; flex-direction: column;">
										<img class="icon" src="assets/icons/Group.svg"> No Data
										Available
									</div>`,
				},
				lengthMenu: [[15, 25, 50, 100, -1],
				[15, 25, 50, 100, "All"],],
				order: [[3, 'desc']], // Default order by column index 4 (createdOn) in descending order
				ordering: true,
				columns: [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},
				{
					data: "requirementNo",
					title: "ID",
					orderable: false,
					render: function(data, type, row, meta) {
						return "<p class='requirementNo text-blue' onclick='openModal(" + JSON.stringify(row) + ")'>" + data + "</p>"
					}
				},
				{
					data: "buyerName",
					title: "Buyer Name",
					orderable: false,
				},
				//				{
				//					data: "budget",
				//					title: "Budget",
				//					orderable: false,
				//				},
				{
					data: "createdOn",
					title: "Created On",
					type: "custom-date-time",
					render: function(data, type, row) {
						var dateTime = moment(data);
						return dateTime.isValid() ? dateTime
							.format('MMM Do YYYY, h:mm:ss a')
							: '';
					}
				},
				//				{
				//					data: "projectManager",
				//					title: "Project Manager",
				//					orderable: false,
				//				},
				{
					data: "location",
					title: "Buyer Location",
					orderable: false,
				}, {
					data: null,
					title: "Timeline",
					orderable: false,
					render: function(data, type, row) {

						return "<p class='text-blue' onclick='openTimeLine(" + JSON.stringify(row) + ")'>View</p>"
					}
				}, {
					data: "status",
					orderable: false,
					title: "Status",
					class: "text-capitalize round-right",
					render: function(data, type, row) {

						// console.log('data-->',data)
						switch (data.toLowerCase()) {
							case "posted":
								return '<span class="status inreview">' + "RFQ Posted" + '</span>';
							case "project execution":
								return '<span class="status execution">' + "In Execution" + '</span>';
							case "onhold":
								return '<span class="status ' + data.toLowerCase() + '">' + "On Hold" + '</span>';
							default:
								return '<span class="status ' + data.toLowerCase() + '">' + data + '</span>';
						}
					}
				}],
				columnDefs: [{
					"defaultContent": "-",
					"targets": "_all"
				}], buttons: [],
				rowCallback: function(row, data, index) {
					$('td:eq(0)', row).html(index + 1);
				}
			});
			new $.fn.dataTable.Buttons(DataTable, {
		buttons: [
			{ extend: 'csv', className: 'buttons-csv' },   // CSV export button
			{ extend: 'excel', className: 'buttons-excel' } // Excel export button
		]
	});
}

// Select the input element
const inputField = document.getElementById('tableSearch');
if (inputField) {

	// Add an event listener for changes in input
	inputField.addEventListener('input', () => {
		var searchValue = inputField.value;


		if (inputField.value === '') {
			DataTable.search(searchValue).draw(); // Link search input to DataTable
			console.log('Input is empty');
		} else {
			DataTable.search(searchValue).draw(); // Link search input to DataTable
			console.log('Input has text');
		}
	});

}
$('#exportCsvBtn').on('click', function() {
	console.log("adsdcsdcefcijehbfcurwcfkldnasoublfdisczx")
	DataTable.button('.buttons-csv').trigger(); // Trigger CSV export programmatically
});

// External Dropdown Button for Excel Export
$('#exportExcelBtn').on('click', function() {
	DataTable.button('.buttons-excel').trigger(); // Trigger Excel export programmatically
});

$.fn.dataTable.ext.type.order['custom-date-time-pre'] = function(data) {
	var dateTime = moment(data, 'MMM Do YYYY, hh:mm:ss a');
	return dateTime.isValid() ? dateTime.unix() : -1;
};

$.fn.dataTable.ext.order['custom-date-time-asc'] = function(settings, col) {
	return this.api().column(col, {
		order: 'index'
	}).nodes().map(function(td, i) {
		return $(td).attr('data-order') || '';
	});
};

$.fn.dataTable.ext.order['custom-date-time-desc'] = function(settings, col) {
	return this.api().column(col, {
		order: 'index'
	}).nodes().map(function(td, i) {
		return $(td).attr('data-order') || '';
	});
};
function productManagerTable(data) {
 $("#productManagerTable")
		.DataTable(
			{
				destroy: true,
				borderless: false,
				hover: false,
				selectable: false,
				
				responsive: false,
				dom: 't',
				autoWidth: false,
				paging: false,
				sm: false,
				scrollX: true,
				scrollCollapse: true,
				scrollY: '400px',
				data: data,
				select: true,
				stripeClasses: [],
				oLanguage: {
					sEmptyTable: `<div id="NoData2"
										style="display: flex;    min-height: 350px; flex: 1; justify-content: center; align-items: center; flex-direction: column;">
										<img class="icon" src="assets/icons/Group.svg"> No Data
										Available
									</div>`,
				},
				lengthMenu: [[15, 25, 50, 100, -1],
				[15, 25, 50, 100, "All"],],
				ordering: true,
				columns: [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},
				{
					data: "id",
					title: "ID",
					orderable: false,
					render: function(data, type, row, meta) {
						return "<p class='requirementNo text-blue' onclick='selectPm(" + JSON.stringify(row) + ")'>" + data + "</p>"
					}
				},
				{
					data: "name",
					title: "PM Name",
					orderable: false,

				},
				{
					data: "email",
					title: "Email ID",
					orderable: false,

				},
				{
					data: "phoneNo",
					title: "Phone Number",
					orderable: false,
				},
				//				{
				//					data: "budget",
				//					title: "Budget",
				//					orderable: false,
				//				},

				//				{
				//					data: "projectManager",
				//					title: "Project Manager",
				//					orderable: false,
				//				},
				{
					data: "activeProjects",
					title: "Active Projects",
					orderable: false,


				}],
				columnDefs: [{
					"defaultContent": "-",
					"targets": "_all"
				}],
				
				rowCallback: function(row, data, index) {
					$('productManagerTable td:eq(0)', row).html(index + 1);
					$(row).on('click', function() {
						selectedRowId = data.id;
						setActiveRow(this, selectedRowId);
					});
				}
			})
	


}

function setActiveRow(row) {
	$('#productManagerTable tbody tr').removeClass('active');
	$(row).addClass('active');
	$("#selectPMButtom").off("click").on("click", function() {
		if (selectedRowId !== null) {
			appointPm(selectedRowId, '');
		} else {
			alert("Please select a row first!");
		}
	});
}


//
//function handleRowClick(rowData) {
//	var displayDiv = $("#BuyerDiv");
//	var tableDiv = $("#tableDiv");
//
//	addToId(rowData)
//	if(rowData.userRole==="PM")
//	References(rowData.conpanyName)
//	
//	tableDiv.hide()
//	displayDiv.show();
//
//}
function handleRowClick(rowData, url) {
	var displayDiv = $("#BuyerDiv");
	var tableDiv = $("#tableDiv");
	if (rowData.companyId != "undefined") {

		// Make fetch request
		fetch(contextPath + url + "?companyId=" + rowData.companyId, {
			method: 'GET', // or 'GET', 'PUT', etc.
			headers: {
				'Content-Type': 'application/json'
				// Add any other headers if needed
			},
			// Convert rowData to JSON and send it as body
		})
			.then(response => response.json()) // Parse response as JSON
			.then(data => {
				// Handle response data
				console.log(data);

				addToId(data, rowData)
				if (rowData.userRole == "SELLER")
					contactPerson(data)
				tableDiv.hide();
				displayDiv.show();
			})
			.catch(error => {
				// Handle errors
				console.error('Error:', error);
			});

	} else {
		toastr.error("companyId not Found")
	}


}

function addToId(rowData, data) {




	Object.keys(rowData).forEach(function(key) {
		var div = $("#" + data + " #" + key);

		if (!div.length) {
			return;
		}

		var value = rowData[key] ? rowData[key] : "";


		div.html(value);
	})
}




function handleBackClick() {

	var displayDiv = $("#BuyerDiv");
	var tableDiv = $("#tableDiv");
	tableDiv.show()
	displayDiv.hide();

}

function openModal(row) {
	requirementId = row.id
	sellerId = row.sellerCid
	BuyerId = row.buyerCid
	// Your code to open the modal and handle the id

	console.log("Opening modal for ID:", requirementId);
	if (row.managerId != undefined) {
		$("#PMDiv").show()
		if (row.status != "Project Execution") {
			$("#InitiateProject").show()
		} else {
			$("#ProjectDetail #InitiateProject").hide()
		}

		$("#projectManager-appoint-button").hide()
		$("#projectManager-appoint").modal("hide")
		getPM(row.managerId, row.status)
	} else {
		$("#PMDiv").hide()
		$("#InitiateProject").hide()
		$("#projectManager-appoint-button").show()
		$("#projectManager-appoint").modal("hide")
	}
	var requestOptions = {
		method: "GET",
		headers: myHeaders,

		redirect: "follow"
	};

	fetch(contextPath + "/viewRequirementById?id=" + requirementId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			result = JSON.parse(result)

			addToId(result, "detailedPost")
			var sellerProjectName = $("#ProjectDetail #requirementNo");
			var projectName = $("#DiscussModal #requirementNo");
			var ModalprojectName = $(".modal#project-initiated #reqNo");


			ModalprojectName.text(`Thank you! Your project ${row.requirementNo} has been initiated successfully. You can now check the status in the Projects section.`);


			var valueSetting = row.requirementNo;

			// Set the HTML content
			sellerProjectName.html(valueSetting);
			projectName.html(valueSetting);

			// Log the variables
			console.log("SellerProjectName:", sellerProjectName);
			console.log("ProjectName:", projectName);
			console.log("ValueSetting:", row);
			;


		})
		.catch(error => console.error("Error:", error));

	fetch(contextPath + "/getBuyerProfileData?id=" + BuyerId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			result = JSON.parse(result)

			addToName(result, "buyerProfile")


		})
		.catch(error => console.error("Error:", error));
	fetch(contextPath + "/getSellerProfileData?id=" + sellerId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			result = JSON.parse(result)

			addToName(result, "sellerProfile")


		})
		.catch(error => console.error("Error:", error));


	// For example, you could show a modal and set its content based on the id
	replaceDiv('tableDiv', 'ProjectDetail')

	getDocumnets(sellerId, requirementId, BuyerId)
	// $('#modalContent').text("Details for ID: " + id);
}
var requirementId;
var sellerId;
var BuyerId;
function replaceDiv(replace, show) {

	$("#" + show).show();

	$("#" + replace).hide();

	if (replace === "ProjectDetail" && show === "tableDiv") {
		sellerId = ""
		requirementId = ""
		location.reload();
	}

}

function getDocumnets(sellerIdint, requirementIdint, buyerIdint) {



	var requestOptions = {
		method: "GET",
		headers: {
			"Content-Type": "application/json", // Assuming you need to set this header
			// Add any other headers as needed
		}
	};

	fetch(contextPath + "/getAllChat?reqId=" + requirementIdint + "&addedForCid=" + sellerIdint + "&addedByCid=" + buyerIdint, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result, "alldoc");
			result = JSON.parse(result)

			makeDocumentDiv(result.messages)

		})
		.catch(error => console.error("Error:", error));

}


function makeApiCall(queryParams) {
	const requestOptions = {
		method: 'GET', // Change to GET since you're sending query parameters
		headers: {
			'Content-Type': 'application/json'
		},
	};

	fetch(contextPath + "/getPmListToAppoint?industry=" + queryParams.industryClassificaiton + "&expertise=" + queryParams.industryExpertise, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			result = JSON.parse(result);
			productManagerTable(result);
		})
		.catch(error => console.error("Error:", error));
}

function convertToTitleCase(str) {
	if (!str) {
		return ""
	}
	return str.toLowerCase().replace(/\b\w/g, s => s.toUpperCase());
}

function makeDocumentDiv(args) {
	var parent = $("#addDocumnetDiv");
	parent.empty();
	for (var i = 0; i < args.length; i++) {

		var content = `
              <div class="col-12" style="cursor: pointer;" onclick="openTheLink('${args[i].documentPath}')">
                <div class="document-card-style-1 unread-doc">
                    <div class="left">
                        <div class="icon-box">
                              <img src="${args[i].LinkOrFile === 'Link' ? 'assets/icons/link.svg' : 'assets/icons/file.svg'}" alt="icon">
                        </div>
                        <div style="">
                            <a style=" text-decoration: none;" href="${args[i].documentPath}" target="_blank" class="primary-text">${args[i].documentName}</a>
                            <p class="secondary-text">${args[i].description}</p>
                        </div>
                    </div>
                    <div class="right">
                        <div class="from">
                            <span class="new">${convertToTitleCase(args[i].addedBy)}</span>
                        </div>
                        <p class="tertiary-text" style="margin:0">Size: ${args[i].fileSize}</p>
                        <p class="tertiary-text">Uploaded: ${args[i].addedDate}</p>
                    </div>
                </div>
            </div>`;

		parent.append(content);
	}
}
function openTheLink(link) {

	var url = link;
	window.open(url, '_blank');

}

//get all inputs
var appointPmModal = document.querySelector('#projectManager-appoint')
var Inputs;
var queryParams = {
	'industryClassificaiton': '',
	'industryExpertise': ''
}
function getAllInput() {
	Inputs = appointPmModal.querySelectorAll('input,select')
	// console.log('Total Inputs---', Inputs)
	Inputs.forEach(input => {
		input.addEventListener('input', function() {
			getParams(input)
			// console.log('queryParams',queryParams)
			makeApiCall(queryParams)
		})
		input.addEventListener('blur', function() {
			getParams(input)
			// console.log('queryParams',queryParams)
			makeApiCall(queryParams)
		})
	})
}
function getParams(input) {
	if (input.name == 'industryClassificaiton' && input.value.trim() != '' && input.required) {
		queryParams.industryClassificaiton = input.value;
	} else if (input.name == 'industryExpertise' && input.value.trim() != '' && input.required) {
		queryParams.industryExpertise = input.value;
	}
}

document.addEventListener("DOMContentLoaded", function() {
	getAllInput()

	Inputs.forEach(input => {
		input.addEventListener('input', function() {
			getParams(input)
			console.log('queryParams', queryParams)
			makeApiCall(queryParams)
		})
		input.addEventListener('blur', function() {
			getParams(input)
			console.log('queryParams', queryParams)
			makeApiCall(queryParams)
		})
	})


	// const industryClassificationSelect = document.getElementById("industryClassificaiton");
	// const industryExpertiseSelect = document.getElementById("industryExpertise");


	// industryClassificationSelect.addEventListener("change", function () {
	// 	const queryParams = {
	// 		"industryClassificaiton": industryClassificationSelect.value,
	// 		"industryExpertise": industryExpertiseSelect.value
	// 	};
	// 	makeApiCall(queryParams);
	// });

	// industryExpertiseSelect.addEventListener("change", function () {
	// 	const queryParams = {
	// 		"industryClassificaiton": industryClassificationSelect.value,
	// 		"industryExpertise": industryExpertiseSelect.value
	// 	};
	// 	makeApiCall(queryParams);
	// });
});


function appointPm(row) {
	reqId = requirementId;
	pmId = row;
	const queryParams = {
		"reqId": reqId,
		"pmId": pmId
	};

	const requestOptions = {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(queryParams)
	};

	fetch(contextPath + "/adminAssignPM", requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			getPM(row)

		})
		.catch(error => console.error("Error:", error));
}

function getPM(managerId, status) {
	fetch(contextPath + "/getPMProfileById?id=" + managerId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			result = JSON.parse(result)

			$("#PMDiv").show()
			if (status != "Project Execution") {
				$("#InitiateProject").show()
			} else {
				$("#ProjectDetail #InitiateProject").hide()
			}

			$("#projectManager-appoint-button").hide()
			$("#projectManager-appoint").modal("hide")

			$("#PMDiv #name").html(result.name ? result.name : "")
			$("#PMDiv #email").html(result.email ? result.email : "")
			$("#PMDiv #phone").html(result.phoneNo ? result.phoneNo : "")

		})
		.catch(error => console.error("Error:", error));


}


function openTimeLine(row) {
	requirementId = row.id


	const requestOptions = {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json'
		},

	};
	fetch(contextPath + "/getTimelineByReqId?reqId=" + requirementId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			result = JSON.parse(result)

			$("#PMDiv").show()
			$("#InitiateProject").show()
			$("#projectManager-appoint-button").hide()
			$("#projectManager-appoint").modal("hide")
			$("#timeline").modal("show");
			$("#timeline #projectId").html(row.requirementNo)

			const timelineData = result;
			const timelineContainer = document.getElementById('timeline');

			if (!timelineContainer) {
				console.error("Timeline container element not found.");
				return;
			}

			const now = new Date();

			// Get all data-key attributes from the timeline container
			const timelineItems = timelineContainer.querySelectorAll('[data-key]');
			const allTimelineItems = timelineContainer.querySelectorAll('.timeline-item');
			allTimelineItems.forEach(item => {
				item.classList.remove('completed');
				const dateDiv = item.querySelector('.date');
				if (dateDiv) {
					dateDiv.innerHTML = ''; // Clear the date div
				}
			});

			timelineItems.forEach(item => {
				const key = item.getAttribute('data-key');

				if (timelineData[key]) {
					const itemDate = new Date(timelineData[key]);
					const diffTime = Math.abs(now - itemDate);
					const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));
					const diffHours = Math.floor((diffTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
					const diffMinutes = Math.floor((diffTime % (1000 * 60 * 60)) / (1000 * 60));

					let timeAgo = '';
					if (diffDays > 0) {
						timeAgo = `${diffDays} days ago`;
					} else if (diffHours > 0) {
						timeAgo = `${diffHours} hours ago`;
					} else {
						timeAgo = `${diffMinutes} minutes ago`;
					}


					const dateElement = item.querySelector('.date');
					if (dateElement) {
						dateElement.innerHTML = `${itemDate.toDateString()}<br>(${timeAgo})`;
					}

					if (itemDate <= now) {
						item.classList.add('completed');
					}
				} else {
					console.log("Data key not in the result:", key);
				}
			});
		})
		.catch(error => console.error("Error:", error));

}



//----------------------------validation starts here---------------------------------
// for validating file size
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
// for showing error message
function showError(id, errorMsg) {
	let errSpan = document.getElementById(id)
	if (errSpan) {
		errSpan.innerHTML = errorMsg
	}
}

// validationns for upload document or link
const uploadDocumentForm = document.querySelector('#upload-loi-and-po-form')
var uploadDocumentFormInputs = uploadDocumentForm.querySelectorAll('input,select');
var uploadDocumentFormErrorsArray = []
for (let input of uploadDocumentFormInputs) {
	input.addEventListener('change', function() {
		validateUploadDocumentForm(input)
	})
}
document.querySelector('.custom-file-upload-section-1').addEventListener('fileDropped', function(e) {
	// Perform validation
	for (let input of uploadDocumentFormInputs) {
		if (input.name === 'file') {
			validateUploadDocumentForm(input);
		}
	}
});
function validateUploadDocumentForm(input) {
	let errorMessage = '';
	if (input.name == 'file') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!uploadDocumentFormErrorsArray.includes(input.name)) {
					uploadDocumentFormErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('file_err', errorMessage)
			} else {
				uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function(e) { return e !== input.name })
				showError('file_err', '')
			}
		} else {
			uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function(e) { return e !== input.name })
			showError('file_err', '')
		}

		showError('fileViaLink_err', '')
		uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function(e) { return e !== 'fileViaLink' })
		uploadDocumentForm.querySelector('input[name="fileViaLink"]').value = ''

	} else if (input.name == 'fileViaLink') {
		if (input.value != '') {
			const regex = /^(https?:\/\/)[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}(\/\S*)?$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!uploadDocumentFormErrorsArray.includes(input.name)) {
					uploadDocumentFormErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid file url';
				showError('fileViaLink_err', errorMessage)
			} else {
				showError('fileViaLink_err', '')
				uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function(e) { return e !== input.name })
			}
		} else {
			showError('fileViaLink_err', '')
			uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function(e) { return e !== input.name })
		}

		showError('file_err', '')
		uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function(e) { return e !== 'file' })
		document.getElementById('document-file').value = null;
	}

	console.log('errors-', uploadDocumentFormErrorsArray)
}

function QueryDone() {

	//if any error return
	if (uploadDocumentFormErrorsArray != 0) {
		console.log('Please check errors', uploadDocumentFormErrorsArray)
		return;
	}

	const form = document.getElementById('upload-loi-and-po-form');
	const formData = new FormData(form);

	let formDataObj = {};
	formData.forEach((value, key) => {
		formDataObj[key] = value;
	});
	// Append additional data to FormData
	formData.append("reqId", requirementId);

	// Convert FormData to an object for logging

	let json = JSON.stringify(formDataObj);
	console.log('upload-loi-and-po-form', json);

	var requestOptions = {
		method: 'POST',

		body: formData
	};
	fetch(contextPath + "/sendDocument", requestOptions)
		.then(response => response.json())  // Parse the response as JSON
		.then(result => {
			console.log(result);

			if (result.status === 'true') {
				getDocumnets(sellerId, requirementId, BuyerId)
				$("#send-queries-modal").modal("hide")
				chooseAgain('loi-upload-section')
			} else {
				toastr.error('Something went wrong');
			}
		})
}


function addToName(rowData, data) {
	Object.keys(rowData).forEach(function(key) {
		var element = $("#" + data + " [name='" + key + "']");

		if (!element.length) {
			return;
		}

		var value = rowData[key] ? rowData[key] : "";

		if (key === 'comapnyLogoUrl') {
			var img = element.find('img');
			debugger
			if (img.length) {
				img.attr('src', value == "" ? "assets/icons/card-style-2-icon.svg" : value);
			}
			return
		}
		//  else if (key === 'linkedInProfile' && element.is('a')) {
		// 	element.attr('href', value);
		// 	element.html(value);
		// } 
		else if (key === 'linkedInProfile') {
			if (value !== "") {
				let newElement = $('<a></a>').attr('href', value).html(value);
				element.replaceWith(newElement);
			} else {
				let newElement = $('<span></span>').html(value);
				element.replaceWith(newElement);
			}
		}
		else if (key === 'numberOfProjectsCompleted') {
			element.html(value === "" ? 0 + " Projects Completed" : value + " Projects Completed");
		} else if (key === 'ratings') {
			$("#" + data + " [name='ratings']").html("");
			var numOfRatings = value === "" ? 0 : value;

			if (numOfRatings % 1 !== 0) {
				// Extract the decimal part
				var decimalPart = numOfRatings % 1;

				// If the decimal part is less than 0.5, round down, otherwise round up
				numOfRatings = decimalPart < 0.5 ? Math.floor(numOfRatings) : Math.ceil(numOfRatings);
			}


			var content = `
                <span class="text">${Math.round(numOfRatings)} Ratings</span>
                <div class="">`;

			for (let i = 0; i < 5; i++) {
				if (i < Math.round(numOfRatings)) {
					content += `<i class="material-icons">star</i>`;
				} else {
					content += `<i class="material-icons";">star_border</i>`;
				}
			}

			content += `</div>`;

			$("#" + data + " [name='ratings']").html(content);
		} else {
			if (key === "numberOfRatings") {
				return
			} else {
				element.html(value);
			}

		}
	});
}
//
//function calculateEscrowFees(totalFees){
//if(0>totalFees<5000){
//	totalFees*3.25%
//}else if(5000>totalFees<25000){
//	totalFees = totalFees-5000
//	(totalFees + 0.26)/100
//}else{
//	(totalFees + 0.89)/100
//}
//
//}
