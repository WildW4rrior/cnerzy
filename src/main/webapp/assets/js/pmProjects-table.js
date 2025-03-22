//Define the DataTable instance variable outside the function
var DataTable;
var separatedData
var paymentType;
var paramsObj = {};
$(document).ready(
	function () {

		$("input[type='radio'][name='buyerPaymentOption']").change(function () {
			checkRadioButton();
		});

		buyerTable(userListJson);
		var separatedData = processDataAndHeader(userListJson);


		$("#activeHeader").click(function () {
			buyerTable(separatedData["inreview"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#completedHeader").click(function () {
			buyerTable(separatedData["completed"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#allHeader").click(function () {
			buyerTable(separatedData["all"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		logQueryParams()
		$(".dropdown-item").on("click", function () {
			var sortBy = $(this).text();
			switch (sortBy) {
				case "Newest":
					DataTable.order([4, 'desc', 'custom-date-time-pre']).draw();
					$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
					break;
				case "Oldest":
					DataTable.order([4, 'asc', 'custom-date-time-pre']).draw();
					$('#dropdownMenuClickableInside').html("Oldest"); // Update inner HTML of the element with ID 'sortingLabel'
					break;
				default:
				// Handle other sorting options if needed
			}
		});
	})

function logQueryParams() {


	// Create a new URLSearchParams object from the current URL
	const urlParams = new URLSearchParams(window.location.search);

	// Iterate over the parameters and add them to the paramsObj
	urlParams.forEach((value, key) => {
		paramsObj[key] = value;
	});
	console.log(paramsObj.fillter)
	if (paramsObj.fillter) {
		var button = document.getElementById(paramsObj.fillter);

		// Check if the button exists
		if (button) {
			// Trigger the button click
			button.click();
		} else {
			console.error(`Button with ID ${paramsObj.fillter} not found.`);
		}
	}


	if (paramsObj.ProjectName) {
		// Get all the <p> elements with class "requirementNo text-blue"
		var pElements = document.querySelectorAll(".requirementNo");


		pElements.forEach(p => {
			console.log(typeof (p.innerHTML), typeof (paramsObj.ProjectName))
			if (p.innerHTML.trim() === paramsObj.ProjectName) {
				p.click();
				return
			}
		});

	}
}


function processDataAndHeader(data) {
	var separatedData = {
		"inreview": [],
		"completed": [],

		"all": []
	};

	data.forEach(function (item) {
		if (item.status !== "-") {

			separatedData[item.status.toLowerCase().replace(/\s/g, '')].push(item);
		}
		separatedData["all"].push(item);
	});

	$('#activeHeader').text('In Execution (' + separatedData["inreview"].length + ')');
	$('#completedHeader').text('Delivered (' + separatedData["completed"].length + ')');
	$('#allHeader').text('All Projects (' + separatedData["all"].length + ')');

	return separatedData;
}

function buyerTable(data) {

	DataTable = $("#pmProjects-table")
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
				ordering: true,
				columns: [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function (data, type, row, meta) {
						return meta.row + 1;
					}
				},
				{
					data: "reqUniqueCode",
					title: "ID",
					orderable: false,
					render: function (data, type, row, meta) {
						if (row.status !== "Completed") {
							if (row.isProjectIntiated === "false") {

								return "<p class='requirementNo text-blue' onclick='openModalWindow()'>" + data + "</p>"

							}
							if (!row.isSellerSignedTripartite || !row.isBuyerSignedTripartite) {
								return "<p class='requirementNo text-blue' onclick='popUp(" + JSON.stringify(row) + ")'>" + data + "</p>"


							}
						}

						return "<p class='requirementNo text-blue' onclick='openModal(" + JSON.stringify(row) + ")'>" + data + "</p>"
					}
				},
				{
					data: "buyerName",
					title: "Buyer",
					orderable: false,
				},
				{
					data: "sellerName",
					title: "Seller",
					orderable: false,
				},
				{
					data: "createdOn",
					title: "Created On",
					type: "custom-date-time",
					render: function (data, type, row) {
						var dateTime = moment(data);
						return dateTime.isValid() ? dateTime
							.format('MMM Do YYYY, h:mm:ss a')
							: '';
					}
				},
				{
					data: null,
					title: "Timeline",
					orderable: false,
					render: function (data, type, row) {

						return "<p class='text-blue' onclick='openTimeLine(" + JSON.stringify(row) + ")'>View</p>"

					}
				}, {
					data: "status",
					orderable: false,
					title: "Status",
					class: "text-capitalize round-right",
					render: function (data, type, row) {

						switch (data.toLowerCase()) {
							case "in review":
								return '<span class="status inreview">In Execution </span>';
							case "completed":
								return '<span class="status delivered">Delivered</span>';
							default:
								return '<span class="status approved">' + data + '</span>';
						}
					}
				}],
				columnDefs: [{
					"defaultContent": "-",
					"targets": "_all"
				}],
				rowCallback: function (row, data, index) {
					$('td:eq(0)', row).html(index + 1);
				}
			});
}
$.fn.dataTable.ext.type.order['custom-date-time-pre'] = function (data) {
	var dateTime = moment(data, 'MMMM Do YYYY, h:mm:ss a');
	return dateTime.isValid() ? dateTime.unix() : -1;
};

$.fn.dataTable.ext.order['custom-date-time-asc'] = function (settings, col) {
	return this.api().column(col, {
		order: 'index'
	}).nodes().map(function (td, i) {
		return $(td).attr('data-order') || '';
	});
};

$.fn.dataTable.ext.order['custom-date-time-desc'] = function (settings, col) {
	return this.api().column(col, {
		order: 'index'
	}).nodes().map(function (td, i) {
		return $(td).attr('data-order') || '';
	});
};

//
function popUp(args) {
	id = args.reqUniqueCode
	$('#project-awaiting-triPart #heading').html(`Congratulations! You've Been Assigned to ${id}`)
	$('#project-awaiting-triPart #context').html(`You've been appointed as the project manager for ${id}. Once the buyer and seller sign the tripartite agreement, you'll be able to create project milestones.`)
	$("#project-awaiting-triPart").modal("show")

}
function openModalWindow() {
	$("#project-awaiting").modal("show")

}
function addToId(rowData, data) {




	Object.keys(rowData).forEach(function (key) {
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
                            <span>${args[i].addedBy}</span>
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

			result = JSON.parse(result)

			makeDocumentDiv(result.messages)

		})
		.catch(error => console.error("Error:", error));

}


var requirementId;
var sellerId;
var BuyerId;
var projectId;
var paymentOption;
function openModal(row) {
	requirementId = row.reqId
	sellerId = row.sellerCompanyId
	BuyerId = row.buyerCompanyId
	projectId = row.id
	paymentOption = row.isSingleEscrowTransaction;

	// Your code to open the modal and handle the id

	if (row.pmId != undefined) {
		$("#PMDiv").show()
		if (row.status != "Project Execution") {
			$("#InitiateProject").show()
		} else {
			$("#ProjectDetail #InitiateProject").hide()
		}

		$("#projectManager-appoint-button").hide()
		$("#projectManager-appoint").modal("hide")
		getPM(row.pmId)
	} else {
		$("#PMDiv").hide()
		$("#InitiateProject").hide()
		$("#projectManager-appoint-button").show()
		$("#projectManager-appoint").modal("hide")
	}
	$("#insideTabs #projectId").html(row.reqUniqueCode);
	$("#add-milestone-modal input[name='projectId']").val(projectId);
	$("#add-milestone-modal input[name='reqId']").val(requirementId);
	$("#raise-a-flag-modal input[name='projectId']").val(projectId);
	$("#raise-a-flag-modal input[name='reqId']").val(requirementId);
	$("#price #projectPrice").html("$ " + row.totalPrice.toLocaleString('en-US'))
	$("#price #inEscrow").html("$ " + row.inEscrow.toLocaleString('en-US'))
	$("#price #milestonesPaidText").html("Milestones paid (" + row.noOfMilestonePaid + ")")
	$("#price #milestonesPaid").html("$ " + row.milestonePaid.toLocaleString('en-US'))
	$("#price #milestonesDueText").html("Milestones Due (" + row.noOfMilestoneDue + ")")
	$("#price #milestonesDue").html("$ " + row.milestoneDue.toLocaleString('en-US'))



	if (paymentOption !== undefined) {
		if (paymentOption === true) {
			paymentType = 'oneTime'
			$("input[type='radio'][name='buyerPaymentOption'][value='oneTime']").prop('checked', true);
		} else {
			$("input[type='radio'][name='buyerPaymentOption'][value='milestoneBased']").prop('checked', true);
			paymentType = 'milestoneBased'
		}
	}
	var requestOptions = {
		method: "GET",


		redirect: "follow"
	};

	fetch(contextPath + "/viewRequirementById?id=" + requirementId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			result = JSON.parse(result)

			addToId(result, "detailedPost")
			var sellerProjectName = $("#ProjectDetail #requirementNo");
			var projectName = $("#DiscussModal #requirementNo");
			var ModalprojectName = $("#SingleProjectDetail #requirementNo");

			var valueSetting = row.reqUniqueCode;
			ModalprojectName.html(valueSetting);
			// Set the HTML content
			sellerProjectName.html(valueSetting);
			projectName.html(valueSetting);



		})
		.catch(error => console.error("Error:", error));

	fetch(contextPath + "/getBuyerProfileData?id=" + BuyerId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			result = JSON.parse(result)

			addToName(result, "buyerProfile")


		})
		.catch(error => console.error("Error:", error));

	fetch(contextPath + "/getSellerProfileData?id=" + sellerId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			result = JSON.parse(result)

			addToName(result, "sellerProfile")


		})
		.catch(error => console.error("Error:", error));

	fetch(contextPath + "/getMilestoneByProject?id=" + projectId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			result = JSON.parse(result)
			updatePymentDiv(result)
			getMilestone(result)


		})
		.catch(error => console.error("Error:", error));

	// For example, you could show a modal and set its content based on the id
	replaceDiv('tableDiv', 'SingleProjectDetail')

	getDocumnets(sellerId, requirementId, BuyerId)
	getPM(row.pmId)
	// $('#modalContent').text("Details for ID: " + id);
}



function replaceDiv(replace, show) {

	$("#" + show).show();

	$("#" + replace).hide();

	if (show === "tableDiv") {
		params = {
			ProjectName: "",
		};
		redirectToWithParams(contextPath + "/project", params)
		sellerId = ""
		requirementId = ""

	}

}

function redirectToWithParams(baseUrl, params) {
	try {
		// Create a new URL object
		const url = new URL(baseUrl, window.location.origin); // Ensure it's a valid URL

		// Append each parameter to the URL
		Object.keys(params).forEach(key => url.searchParams);

		// Redirect to the constructed URL
		window.location.href = url.toString();
	} catch (error) {
		console.error("Invalid URL:", error);
	}
}

function getPM(managerId) {
	fetch(contextPath + "/getPMProfileById?id=" + managerId)
		.then((response) => response.text())
		.then(result => {
			result = JSON.parse(result)

			$("#PMDiv").show()
			$("#InitiateProject").show()
			$("#projectManager-appoint-button").hide()
			$("#projectManager-appoint").modal("hide")

			$("#PMDiv #name").html(result.name ? result.name : "")
			$("#PMDiv #email").html(result.email ? result.email : "")
			$("#PMDiv #phone").html(result.phoneNo ? result.phoneNo : "")

		})
		.catch(error => console.error("Error:", error));


}


function addToName(rowData, data) {
	Object.keys(rowData).forEach(function (key) {
		var element = $("#" + data + " [name='" + key + "']");

		if (!element.length) {
			return;
		}

		var value = rowData[key] ? rowData[key] : "";

		if (key === 'comapnyLogoUrl') {
			var img = element.find('img');

			if (img.length) {
				img.attr('src', value == "" ? "assets/icons/card-style-2-icon.svg" : value);
			}
			return
		} else if (key === 'linkedInProfile' && element.is('a')) {
			element.attr('href', value);
			element.html(value);
		} else if (key === 'numberOfProjectsCompleted') {
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
                <span class="text">${numOfRatings} Ratings</span>
                <div class="stars">`;

			for (let i = 0; i < 5; i++) {
				if (i < numOfRatings) {
					content += `<i class="material-icons">star</i>`;
				} else {
					content += `<i class="material-icons">star_border</i>`;
				}
			}

			content += `</div>`;

			$("#" + data + " [name='ratings']").html(content);
		} else {
			if (key === "numberOfRatings" || key === 'comapnyLogoUrl') {
				return
			} else {
				element.html(value);
			}

		}
	});
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
	input.addEventListener('change', function () {
		validateUploadDocumentForm(input)
	})
}
document.querySelector('.custom-file-upload-section-1').addEventListener('fileDropped', function (e) {
	// Perform validation
	for (let input of uploadDocumentFormInputs) {
		if (input.name === 'file') {
			validateUploadDocumentForm(input);
		}
	}
});
function validateUploadDocumentForm(input) {
	if (input.name === 'file') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!uploadDocumentFormErrorsArray.includes(input.name)) {
					uploadDocumentFormErrorsArray.push(input.name);
				}
				showError('file_err', 'File size is too large')
			} else {
				uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== input.name })
				showError('file_err', '')
			}
		} else {
			uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== input.name })
			showError('file_err', '')
		}

		// showError('fileViaLink_err', '')
		uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== 'fileViaLink' })
		uploadDocumentForm.querySelector('input[name="fileViaLink"]').value = ''

	} else if (input.name === 'fileViaLink') {
		if (input.value != '') {
			const regex = /^(https?:\/\/)[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}(\/\S*)?$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!uploadDocumentFormErrorsArray.includes(input.name)) {
					uploadDocumentFormErrorsArray.push(input.name);
				}
				showError('fileViaLink_err', 'Invalid file url')
			} else {
				showError('fileViaLink_err', '')
				uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== input.name })
			}
		} else {
			showError('fileViaLink_err', '')
			uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== input.name })
		}

		showError('file_err', '')
		uploadDocumentFormErrorsArray = uploadDocumentFormErrorsArray.filter(function (e) { return e !== 'file' })
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


			if (result.status === 'true') {
				getDocumnets(sellerId, requirementId, BuyerId)
				$("#send-queries-modal").modal("hide")
				chooseAgain('loi-upload-section')

			} else {
				toastr.error('Something went wrong');
			}
		})
}
function openTimeLine(row) {
	if (row) {
		projectId = row.id;
	}

	const requestOptions = {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json'
		}
	};

	fetch(contextPath + "/getTimelineByProjectId?projectId=" + projectId, requestOptions)
		.then((response) => response.json())
		.then(result => {

			const timelineData = result
			const now = new Date();
			let timelineHtml = '';

			Object.keys(timelineData).forEach(key => {
				const itemDate = timelineData[key] ? new Date(timelineData[key]) : null;
				const isCompleted = itemDate && itemDate <= now;
				const diffDays = itemDate ? Math.floor((now - itemDate) / (1000 * 60 * 60 * 24)) : '';

				function getText(key) {
					switch (key) {
						case "Project Assigned":
							return 'Project Assigned';
						case "Project Completion":
							return 'Delivered';
						case "Review & Feedback":
							return 'Feedback';
						default:
							return `${key}`;
					}
				}

				timelineHtml += `
                    <div class="timeline-item ${isCompleted ? 'completed' : ''}" data-key="${key}">
                        <div class="icon"></div>
                        <div class="text">${getText(key)}</div>
                        <div class="date">
                            ${itemDate ? `${itemDate.toDateString()}<br>(${diffDays} days ago)` : ''}
                        </div>
                    </div>
                `;
			});

			const timelineContainer = document.getElementById('timelineModal');
			const timeLineTabContainer = document.getElementById('timelineTab');

			timelineContainer.innerHTML = timelineHtml;
			timeLineTabContainer.innerHTML = timelineHtml;

			if (row) {
				projectId = row.id;
				$("#timeline").modal("show");
				$("#timeline #projectId").html(row.reqUniqueCode);
			}
		})
		.catch(error => console.error("Error:", error));
}

function getMilestone(args) {
	console.log(args);
	var parent = document.getElementById("milestoneJurney");
	parent.innerHTML = "";
	var totalMilestone = args.length;
	let totalPrice = 0;
	for (let i = 0; i < totalMilestone; i++) {

		const milestone = args[i];
		let statusClass;
		let status;
		let className;
		totalPrice += milestone.amount;

		if (milestone.actualCompletionDate === undefined) {
			statusClass = milestone.isActive ? 'active' : 'inactive';
			status = milestone.isActive ? 'Active' : 'In Active'
			className = "block"
		} else {
			statusClass = 'completed';
			status = "Completed"
			className = "none"
		}
		const actualCompletionDate = new Date(milestone.estimateCompletiondate);
		const options = { year: 'numeric', month: 'short', day: 'numeric' };
		let formattedDate = actualCompletionDate.toLocaleDateString('en-US', options);
		let content = `
			<div class="section-style-5">
				<div class="row row-gap-16">
					<div class="col-lg-8 col-md-8 col-sm-12 col-12 order-2 order-md-1">
						<div class="info">
							<h6 class="mb-16"> ${milestone.name}</h6>
							<div class="d-flex " style="gap: 1rem;padding: 1rem 0; font-family: Chivo;font-size: 16px;font-weight: 400;line-height: 28px;text-align: left;color: rgba(26, 28, 67, 1);">
								<div>Quantity: ${milestone.quantity}</div>
								<div>Category: ${milestone.category}</div>
							</div>
						
							    <p class="" style="    overflow-wrap: anywhere;">Note: ${milestone.description}</p>
                           
                              
							<div class="navigation-btns mt-32">
							
								<button class="btn-style-6 d-${className}" onclick="raiseFlagModal('${escape(JSON.stringify(milestone))}')">
									Raise a Flag <img src="assets/icons/Flag.svg" alt="">
								</button>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-12 d-flex justify-content-end align-items-start order-1 order-md-2">
						<div class="d-flex align-items-center">
							<h6 class="mr-8 mb-0">$ ${milestone.amount}</h6>
							   <span class="status ${statusClass}">${status}</span>
						</div>
					</div>
				</div>
				<div class="time-created" style="    display: flex; flex-direction: column;gap: 10px; align-items: center;">
					<span style="padding:10px; border-radius: 4px; font-size:16px; background-color:#fff;">Milestone Due Date: ${formattedDate}</span>
					<span>Created: ${milestone.createdOn}</span>
				</div>
			</div>`;
		let milestoneElement = document.createElement('div');
		milestoneElement.style.marginTop = "1rem"
		milestoneElement.innerHTML = content;
		parent.appendChild(milestoneElement);
	}
	let price = $("#projectPrice").html()
	let projectPrice = parseInt(price.replace("$", "").replace(/,/g, ""));
	console.log(price, projectPrice)
	if (totalPrice >= projectPrice) {
		$(".btn-style-1.add-milestone-btn").css("display", "none");
	} else {
		$(".btn-style-1.add-milestone-btn").css("display", "block");
	}

}
function raiseFlagModal(milestoneJSON) {
	const milestone = JSON.parse(unescape(milestoneJSON));
	$("#raise-a-flag-modal").modal('show')
	$("#raise-a-flag-modal input[name='name']").val(milestone.name)

}




// validationns for Raise a flag form
const raiseAFlag = document.querySelector('#raise-a-flag-modal-form')
var raiseAFlagInputs = raiseAFlag.querySelectorAll('input,select');
var raiseAFlagErrorsArray = []
for (let input of raiseAFlagInputs) {
	input.addEventListener('change', function () {
		validateRaiseAFlagForm(input)
	})
}

function validateRaiseAFlagForm(input) {
	if (input.name == 'file') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!raiseAFlagErrorsArray.includes(input.name)) {
					raiseAFlagErrorsArray.push(input.name);
				}
				showError('raise_flag_file_err', 'File size is too large')
			} else {
				raiseAFlagErrorsArray = raiseAFlagErrorsArray.filter(function (e) { return e !== input.name })
				showError('raise_flag_file_err', '')
			}
		} else {
			raiseAFlagErrorsArray = raiseAFlagErrorsArray.filter(function (e) { return e !== input.name })
			showError('raise_flag_file_err', '')
		}
	} else if (input.name === 'description') {

	}

	console.log('errors-', raiseAFlagErrorsArray)
}




function raiseFlag() {

	//if any error return
	if (raiseAFlagErrorsArray != 0) {
		console.log('Please check errors', raiseAFlagErrorsArray)
		return;
	}

	const form = document.getElementById('raise-a-flag-modal-form');
	const formData = new FormData(form);

	// Append additional data to FormData
	formData.append("reqId", requirementId); // Assuming requirementId is defined elsewhere

	var discription = formData.get('description')
	formData.delete('description');
	// Append updated 'description' field
	formData.append("description", `PM Raised Flag For ${formData.get('name')} - ${discription}`);

	// Convert FormData to an object for logging (if needed)

	let formDataObj = {};
	formData.forEach((value, key) => {
		if (key !== "description") {
			formDataObj[key] = value;
		}
	});

	let json = JSON.stringify(formDataObj);


	// Prepare the request options
	var requestOptions = {
		method: 'POST',
		body: formData // FormData automatically sets the correct Content-Type header
	};

	// Replace the URL with your actual API endpoint
	fetch(contextPath + "/sendDocument", requestOptions)
		.then(response => response.json())  // Parse the response as JSON
		.then(result => {

			// Example handling of API response
			if (result.status === 'true') {
				// Perform actions upon successful response
				getDocumnets(sellerId, requirementId, BuyerId);
				// Prepare the request options
				var requestOptions2 = {
					method: 'GET',
				};

				fetch(contextPath + "/getMilestoneByProject?id=" + projectId, requestOptions2)
					.then((response) => response.text())
					.then(result => {
						result = JSON.parse(result)
						updatePymentDiv(result)
						getMilestone(result)
						$("#raise-a-flag-modal").modal("hide");
						//						chooseAgain('loi-upload-section');


					})
					.catch(error => console.error("Error:", error));


			} else {
				// Handle errors or display feedback
				toastr.error('Something went wrong');
			}
		})
		.catch(error => {
			console.error('Error:', error);
			toastr.error('Failed to send data to the server');
		});
}


function resetMilestoneForm() {
	// Get the form element
	var form = document.getElementById('add-milestone-form');

	// Reset the form
	form.reset();

	// Set the default option for the select element
	var selectElement = document.getElementById('itemCategory');
	selectElement.value = "";

	// Clear any error messages if present
	var errorElements = form.querySelectorAll('.err-text');
	errorElements.forEach(function (element) {
		element.textContent = '';
	});
}

// Call this function when the modal is hidden to reset the form
$('#add-milestone-modal').on('hidden.bs.modal', function () {
	resetMilestoneForm();
	$("#add-milestone-form input[name='projectId']").val(projectId);
	$("#add-milestone-form input[name='reqId']").val(requirementId);


});
var selectedPaymentOption = null;

function checkRadioButton() {
	paymentType = $("input[type='radio'][name='buyerPaymentOption']:checked").val();
	//updateBuyerPaymentOption
	fetch(contextPath + "/updateBuyerPaymentOption?option=" + paymentType + "&projectId=" + projectId)
		.then((response) => response.text())
		.then(result => {
			result = JSON.parse(result)


		}).catch(error => console.error("Error:", error));


}

function checkpaymantoption() {
	if (!hasMilestone && paymentType === "oneTime") {
		toastr.warning("One-Time Payment Option Is Selected");
		setTimeout(function () {
			$("#add-milestone-modal").modal("show");
		}, 2000); // 120000 milliseconds = 2 minutes

	} else {
		$("#add-milestone-modal").modal("show");
	}



}
var hasMilestone = false;
function updatePymentDiv(result) {
	if (result.length > 0) {
		hasMilestone = true
		paymentType = paymentOption == true ? "oneTime" : "milestoneBased"
		$("#paymentDiv").hide()
		$("#paymentOption").text(`Payment Option Selected: ${paymentOption == true ? "One-Time" : "Milestone-Based"}`);
		$("#paymentOption").show()

	}
}
//same for when pm raise a flag for milestone, it will differentiate, Work Submitted For {Milestone Name} or PM Raised Flag For {Milestone Name}, Buyer if rework need - "Buyer Requested Rework on {Milestone Name}"
