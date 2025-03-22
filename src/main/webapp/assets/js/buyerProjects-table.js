//Define the DataTable instance variable outside the function
var DataTable;
var separatedData
var paramsObj = {};
$(document).ready(
	function() {
		console.log("${role}", "js")
		console.log("${pageContext.request.contextPath}", "js")
		console.log(userListJson)



		var separatedData = processDataAndHeader(userListJson);
		checkForData(userListJson);

		$("#inReviewHeader").click(function() {
			checkForData(separatedData["inreview"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#completedHeader").click(function() {
			checkForData(separatedData["completed"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#allHeader").click(function() {
			checkForData(separatedData["all"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		logQueryParams()
		$(".dropdown-item").on("click", function() {
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

function checkForData(rows) {


	buyerTable(rows);



}
function logQueryParams() {


	// Create a new URLSearchParams object from the current URL
	const urlParams = new URLSearchParams(window.location.search);

	// Iterate over the parameters and add them to the paramsObj
	urlParams.forEach((value, key) => {
		paramsObj[key] = value;
	});
	console.log(paramsObj.ProjectName)

	triggerButtonClick(paramsObj.ProjectName)
}
function triggerButtonClick(buttonId) {
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

function processDataAndHeader(data) {
	var separatedData = {
		"inreview": [],
		"completed": [],

		"all": []
	};

	data.forEach(function(item) {
		if (item.status !== "-") {

			separatedData[item.status.toLowerCase().replace(/\s/g, '')].push(item);
		}
		separatedData["all"].push(item);
	});

	$('#inReviewHeader').text('In Execution (' + separatedData["inreview"].length + ')');
	$('#completedHeader').text('Delivered (' + separatedData["completed"].length + ')');
	$('#allHeader').text('All (' + separatedData["all"].length + ')');

	return separatedData;
}

function buyerTable(data) {

	DataTable = $("#buyerProjects-table")
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
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},
				{
					data: "reqUniqueCode",
					title: "ID",
					orderable: false,
					render: function(data, type, row, meta) {
						if (row.pmName !== "Not Assigned") {
							if (row.status === "Completed") {
								return "<p class='requirementNo text-blue' onclick='openModal(" + JSON.stringify(row) + ",true)'>" + data + "</p>"
							} else if (!row.isBuyerSignedTripartite) {
								return `<p class='requirementNo text-blue' onclick='awaitingMileStone("sign-tripartite-agreement")'>${data}</p>`;
							} else if (row.noOfMilestoneDue == 0) {
								return `<p class='requirementNo text-blue' onclick='awaitingMileStone("awaiting-mileStone")'>${data}</p>`;

							} else {
								return "<p class='requirementNo text-blue' onclick='openModal(" + JSON.stringify(row) + ")'>"+data+"</p>"


							}
						} else {
							return `<p class='requirementNo text-blue' onclick='awaitingMileStone("project-under-review")'>${data}</p>`

						}
					}
				},

				{
					data: "sellerName",
					title: "Seller Name",
					orderable: false,
				},
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
				{
					data: "pmName",
					title: "Project Manager",
					orderable: false,
				},
				{
					data: "sellerLocation",
					title: "Seller Location",
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

						switch (data.toLowerCase()) {
							case "in review":
								return '<span class="status inreview"> In Execution </span>';
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
				rowCallback: function(row, data, index) {
					$('td:eq(0)', row).html(index + 1);
				}
			});
}
$.fn.dataTable.ext.type.order['custom-date-time-pre'] = function(data) {
	var dateTime = moment(data, 'MMMM Do YYYY, h:mm:ss a');
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
function awaitingMileStone(args) {
	if (args === "awaiting-mileStone") {
		$("#awaiting-mileStone").modal("show")
	}
	if (args === "sign-tripartite-agreement") {
		$("#sign-tripartite-agreement").modal("show")
	}
	if (args === "project-under-review") {
		$("#project-under-review").modal("show")
	}
}
//
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
                            <a style="" href="${args[i].documentPath}" target="_blank" class="primary-text">${args[i].documentName}</a>
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

function openTheLink(link){

    var url = link;
    window.open(url, '_blank');

}
function getDocumnets(sellerIdint, requirementIdint, buyerIdint, divId) {

	var requestOptions = {
		method: "GET",
		headers: {
			"Content-Type": "application/json",
		}
	};

	fetch(contextPath + "/getAllChat?reqId=" + requirementIdint + "&addedForCid=" + sellerIdint + "&addedByCid=" + buyerIdint, requestOptions)
		.then((response) => response.text())
		.then(result => {

			result = JSON.parse(result)

			makeDocumentDiv(result.messages, divId)

		})
		.catch(error => console.error("Error:", error));

}


var requirementId;
var sellerId;
var BuyerId;
var projectId;
var rowDataForTemp;
var managerId;
var uniqueCode;
function openModal(row, temp) {
	requirementId = row.reqId
	sellerId = row.sellerCompanyId
	BuyerId = row.buyerCompanyId
	projectId = row.id
	rowDataForTemp = row
	managerId = row.pmId
	uniqueCode = row.reqUniqueCode
	// Your code to open the modal and handle the id

	if (row.status == "Completed") {
		$(".feedBackTab").css("display", "block")
	}
	console.log("Opening modal for ID:", requirementId);
	if (row.pmId != undefined) {
		$("#nav-documents #PMDiv").show()
		$("#details #PMDiv").show()
		$("#SingleProjectDetailBefore #PMDiv").show()

		if (row.status != "Project Execution") {
			$("#InitiateProject").show()
		} else {
			$("#ProjectDetail #InitiateProject").hide()
		}

		$("#projectManager-appoint-button").hide()
		$("#projectManager-appoint").modal("hide")
		getPM(row.pmId)
	} else {
		$("#SingleProjectDetailBefore #PMDiv").hide()
		$("#nav-documents #PMDiv").hide()
		$("#details #PMDiv").hide()
		$("#InitiateProject").hide()
		$("#projectManager-appoint-button").show()
		$("#projectManager-appoint").modal("hide")
	}
	$("#insideTabs #projectId").html(row.reqUniqueCode);
	$("#SingleProjectDetailAfter #requirementNo").html(row.reqUniqueCode);
	$("#SingleProjectDetailBefore #requirementNo").html(row.reqUniqueCode);
	$("#price #projectPrice").html("$ " + row.totalPrice.toLocaleString('en-US'))
	$("#price #inEscrow").html("$ " + row.inEscrow.toLocaleString('en-US'))
	$("#price #milestonesPaidText").html("Milestones paid (" + row.noOfMilestonePaid + ")")
	$("#price #milestonesPaid").html("$ " + row.milestonePaid.toLocaleString('en-US'))
	$("#price #milestonesDueText").html("Milestones Due (" + row.noOfMilestoneDue + ")")
	$("#price #milestonesDue").html("$ " + row.milestoneDue.toLocaleString('en-US'))
	//	milestonePaid
	//	noOfMilestoneDue
	//	noOfMilestonePaid

	var requestOptions = {
		method: "GET",


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
			var ModalprojectName = $("#SingleProjectDetail #requirementNo");

			var valueSetting = row.reqUniqueCode;
			ModalprojectName.html(valueSetting);
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

	fetch(contextPath + "/getSellerProfileData?id=" + sellerId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			result = JSON.parse(result)

			addToName(result, "sellerProfile")


		})
		.catch(error => console.error("Error:", error));
	fetch(contextPath + "/getMilestoneByProject?id=" + projectId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);
			result = JSON.parse(result)

			getMilestone(result)
			$("#milestoneJurney button").prop("disabled", true);

			var text = `${row.escrowTransactionId ? "Transaction Id: " + row.escrowTransactionId : ""}`
			if (text != "") {
				escrowPaymentContent = `To finalize your project and
					begin collaboration with the seller, please review and submit the
					agreed-upon payment. ${text}`
				approvalContent = `Your project payment is
					currently under review on the escrow platform. We'll notify you
					once the approval process is complete. ${text}`

			} else {
				escrowPaymentContent = `To finalize your project and
					begin collaboration with the seller, please review and submit the
					agreed-upon payment.`
				approvalContent = `Your project payment is
					currently under review on the escrow platform. We'll notify you
					once the approval process is complete.`

			}
			if (row.status !== "Completed") {
				if (!row.isBuyerSentPayment) {
					console.log("Awaiting buyer's payment.");
					$("#send-payment .modal-para").html(escrowPaymentContent);
					$("#send-payment").modal("show");
				} else if (!row.isPaymentApproved) {
					console.log("Awaiting payment approval.");
					$("#awaiting-escrow-payment-approval .modal-para").html(approvalContent);

					$("#awaiting-escrow-payment-approval").modal("show")
				} else {

					console.log("All conditions met. Enabling buttons.");
					$("#milestoneJurney button").prop("disabled", false);
				}

			}
		})
		.catch(error => console.error("Error:", error));

	// For example, you could show a modal and set its content based on the id
	replaceDiv('tableDiv', 'SingleProjectDetailAfter')
	//replaceDiv('SingleProjectDetailBefore', 'SingleProjectDetailAfter')
	getDocumnets(sellerId, requirementId, BuyerId, "#SingleProjectDetailAfter")



	//	if (temp) {
	//		replaceDiv('tableDiv', 'SingleProjectDetailBefore')
	//
	//		getDocumnets(sellerId, requirementId, BuyerId, "#SingleProjectDetailBefore")
	//
	//	} 


	// $('#modalContent').text("Details for ID: " + id);
}


var params;
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
			console.log(result);
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
	Object.keys(rowData).forEach(function(key) {
		var element = $("#" + data + " [name='" + key + "']");

		if (!element.length) {
			return;
		}

		var value = rowData[key] ? rowData[key] : "";

		if (key === 'comapnyLogoUrl') {
			var img = element.find('img');

			if (img.length) {
				img.attr('src', value == "" ? "assets/icons/Profile-1.svg" : value);
			}
			return
		}
		// else if (key === 'linkedInProfile' && element.is('a')) {
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
                <span class="text">${numOfRatings} Ratings</span>
                <div class="stars">`;

			for (let i = 0; i < 5; i++) {
				if (i < numOfRatings) {
					content += `<i class="material-icons active">star</i>`;
				} else {
					content += `<i class="material-icons" >star_border</i>`;
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
	formData.append("addedForCid", sellerId);

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
				getDocumnets(sellerId, requirementId, BuyerId, "#SingleProjectDetailAfter")
				chooseAgain('loi-upload-section')
				$("#send-queries-modal").modal("hide")

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
			console.log(result);

			const timelineData = result;
			const now = new Date();
			let timelineHtml = '';

			Object.keys(timelineData).forEach(key => {
				const itemDate = timelineData[key] ? new Date(timelineData[key]) : null;
				const isCompleted = itemDate && itemDate <= now;
				const diffDays = itemDate ? Math.floor((now - itemDate) / (1000 * 60 * 60 * 24)) : '';


				function getText(key) {
					switch (key) {
						case "Project Kick-off":
							return 'Kick-off';
						case "Project Manager Assigned":
							return 'PM Assigned';
						case "Escrow Account Created":
							return 'Escrow Created';
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

function tempStart() {
	setTimeout(() => {
		openModal(rowDataForTemp, false);
		$("#project-kickoff-modal").modal("hide")
	}, 3000);

}

function submitFeedback(divId) {
	const isFormValid = validateInputs(divId);

	if (isFormValid) {
		// Proceed to the next step
		console.log("All inputs are valid. Proceeding to the next step.");

		ratingAndReviewData = {
			projectId: projectId,
			ratedForCid: sellerId,
		};
		collectCategoryData('seller', ratingAndReviewData);

		// Collect data for 'platform' section
		collectCategoryData('platform', ratingAndReviewData);

		console.log('Rating and Review Data:', ratingAndReviewData);

		const requestOptions = {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(ratingAndReviewData),
		};
		fetch(contextPath + "/createFeedback", requestOptions)
			.then((response) => response.text())
			.then(result => {
				console.log(result)
				console.log('Rating and Review Data:', ratingAndReviewData);
				$("#final-review-modal").modal("hide");
				$("#feeback-submitted-modal").modal("show");
				setTimeout(() => {
					openModal(rowDataForTemp, false);
					$("#feeback-submitted-modal").modal("hide")
					location.reload();
				}, 3000);

			})
			.catch(error => console.error("Error:", error));


	} else {
		// Show an error message or handle the invalid form
		console.error("Form validation failed. Please fill in all required fields.");
	}


}


function collectCategoryData(section, ratingAndReviewData) {
	const parentContainer = document.getElementById(section);

	if (!parentContainer) {
		console.error(`Parent container '${section}' not found.`);
		return;
	}

	const formData = {};

	// Get all divs within the parent container
	const divs = parentContainer.querySelectorAll('div');

	divs.forEach(div => {
		const divId = div.id;

		// Check if the div ID contains 'category'
		if (divId.includes('category')) {
			// Extract category name from divId
			const categoryName = divId.replace('category', '');

			// Initialize category data object
			formData[categoryName] = {};

			// Find all input elements within this div
			const inputs = div.querySelectorAll('input[type="number"], input[type="hidden"]');


			inputs.forEach(input => {
				const inputId = input.id;
				const inputValue = input.value;

				// Find corresponding label element
				const labelElement = document.querySelector('label[for=' + inputId + ']');

				if (labelElement) {
					const labelName = labelElement.textContent.trim().replace(/[\n\t]/g, ' ').replace(/\s\s+/g, ' ');

					// Use labelName as key and inputValue as value in formData[categoryName]
					formData[categoryName][labelName] = inputValue;
				}
			});
		}
	});

	// Assign collected data to ratingAndReviewData
	ratingAndReviewData[section] = formData;
}

// Usage example
var ratingAndReviewData = {};

//function milestone() {
//	<div class="col-12">
//		<div class="section-style-5">
//			<div class="row row-gap-16">
//				<div
//					class="col-lg-8 col-md-8 col-sm-12 col-12 order-2 order-md-1">
//					<div class="info">
//						<h6 class="mb-16">Milestone 2 name</h6>
//						<p class="">Note: Lorem Ipsum is simply dummy text of
//							the printing and typesetting industry. Lorem Ipsum has
//							been the industry's standard dummy text ever since the
//							1500s</p>
//						<div class="navigation-btns mt-32">
//							<button class="btn-style-3 mr-16 mb-2 mb-sm-0"
//								data-bs-target="#milestone-rework-modal"
//								data-bs-toggle="modal">Rework</button>
//							<button class="btn-style-1"
//								data-bs-target="#milestone-confirmation-modal"
//								data-bs-toggle="modal">Achieved</button>
//							<button class="btn-style-1"
//								data-bs-target="#final-review-modal"
//								data-bs-toggle="modal">Project FeedBack</button>
//						</div>
//					</div>
//				</div>
//				<div
//					class="col-lg-4 col-md-4 col-sm-12 col-12 d-flex justify-content-end align-items-start order-1 order-md-2">
//					<div class="d-flex align-items-center">
//						<h6 class="mr-8 mb-0">&#8377; 1 Crore</h6>
//						<span class="status active">Active</span>
//						<!-- <span class="status completed">Completed</span> -->
//					</div>
//				</div>
//
//			</div>
//		</div>
//	</div>
//}
//

function getMilestone(args) {
	console.log(args);
	var parent = document.getElementById("milestoneJurney");
	parent.innerHTML = "";
	var totalMilestone = args.length;
	for (let i = 0; i < totalMilestone; i++) {
		const milestone = args[i];
		let statusClass;
		let status;

		if (milestone.actualCompletionDate === undefined) {
			statusClass = milestone.isActive ? 'active' : 'inactive';
			status = milestone.isActive ? 'Active' : 'In Active'
		} else {
			statusClass = 'completed';
			status = "Completed"
		}
		const actualCompletionDate = new Date(milestone.estimateCompletiondate);
		const options = { year: 'numeric', month: 'short', day: 'numeric' };
		let formattedDate = actualCompletionDate.toLocaleDateString('en-US', options);
		let buttonsHTML = '';

		// Conditionally render buttons based on status
		if (milestone.isActive) {
			buttonsHTML = `
							
                <button class="btn-style-3 mr-16 mb-2 mb-sm-0" onclick="openReworkModal('${escape(JSON.stringify(milestone))}')" >Rework</button>
                <button class="btn-style-1" onclick="openArchiveModal('${escape(JSON.stringify(milestone))}')">Achieved</button>
                  `;
		}

		let content = `
            <div class="col-12">
                <div class="section-style-5">
                    <div class="row row-gap-16">
                        <div class="col-lg-8 col-md-8 col-sm-12 col-12 order-2 order-md-1">
                            <div class="info">
                                <h6 class="mb-16">${milestone.name}</h6>
                                <div class="d-flex " style="gap: 1rem;padding: 1rem 0; font-family: Chivo;font-size: 16px;font-weight: 400;line-height: 28px;text-align: left;color: rgba(26, 28, 67, 1);">
								<div>Quantity: ${milestone.quantity}</div>
								<div>Category: ${milestone.category}</div>
							</div>
                                <p class="" style="    overflow-wrap: anywhere;">Note: ${milestone.description}</p>
                                <div class="navigation-btns mt-32">
                                    ${buttonsHTML}
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
					<span style="padding:10px; border-radius: 4px; font-size:16px; background-color:#fff;">Completion period: ${formattedDate}</span>
					<span>Created: ${milestone.createdOn}</span>
				</div>
                </div>
               
            </div>`;

		let milestoneElement = document.createElement('div');
		milestoneElement.style.marginTop = "1rem"
		milestoneElement.innerHTML = content;
		parent.appendChild(milestoneElement);
	}
}

function openArchiveModal(milestoneJSON) {
	const milestone = JSON.parse(unescape(milestoneJSON));

	$("#milestone-confirmation-modal input[name='projectId']").val(projectId);
	$("#milestone-confirmation-modal input[name='milestoneId']").val(milestone.id);

	$("#milestone-confirmation-modal").modal("show")

}
function openReworkModal(milestoneJSON) {


	const milestone = JSON.parse(unescape(milestoneJSON));

	$("#milestone-rework-modal input[name='projectId']").val(projectId);
	$("#milestone-rework-modal input[name='milestoneId']").val(milestone.id);
	$("#milestone-rework-modal input[name='milestoneName']").val(milestone.name)


	$("#milestone-rework-modal").modal("show")

}
function achievedMilestone() {
	// Get input values from the div
	const projectId = parseInt($('#milestone-confirmation-modal input[name="projectId"]').val(), 10);
	const milestoneId = parseInt($('#milestone-confirmation-modal input[name="milestoneId"]').val(), 10);
	// Create an object with the input values and additional data
	let formDataObj = {

		projectId: projectId,

		pmId: managerId,
		sellerCid: sellerId,
		projectNo: uniqueCode,
		milestoneId: milestoneId,



	};

	// Log the updated formData object
	console.log('Updated FormData Object:', formDataObj);

	// Convert the object to JSON
	let json = JSON.stringify(formDataObj);
	console.log('FormData JSON:', json);

	// Set up request options
	var requestOptions = {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: json
	};

	fetch(contextPath + "/markMilestoneAsAchieved", requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log('API Response:', result);
			$("#milestone-confirmation-modal").modal("hide")
			if (result.isProjectCompleted === "true") {


				$("#final-review-modal").modal("show")

			}
			// Handle success or error response

			var requestOptions2 = {
				method: 'GET',
				headers: {
					'Content-Type': 'application/json'
				},

			};

			fetch(contextPath + "/getMilestoneByProject?id=" + projectId, requestOptions2)
				.then((response) => response.text())
				.then(result => {
					console.log(result);
					result = JSON.parse(result)

					getMilestone(result)


				})
				.catch(error => console.error("Error:", error));
		})
		.catch(error => console.error('Error:', error));
}


function raiseFlag() {
	const form = document.getElementById('milestone-rework-modal-form');
	const formData = new FormData(form);

	// Append additional data to FormData
	formData.append("reqId", requirementId);
	formData.append("addedForCid", sellerId);
	formData.append("pmId", managerId);

	var discription = formData.get('description')
	formData.delete('description');
	// Append updated 'description' field
	formData.append("description", `Buyer Requested Rework on ${formData.get('milestoneName')} - ${discription}`);
	formData.append("isBuyerRejectMilestone", "True");
	// Convert FormData to an object for logging (if needed)

	let formDataObj = {};
	formData.forEach((value, key) => {
		if (key !== "description") {
			formDataObj[key] = value;
		}
	});

	let json = JSON.stringify(formDataObj);
	console.log('FormData Object:', formDataObj);


	// Prepare the request options
	var requestOptions = {
		method: 'POST',
		body: formData // FormData automatically sets the correct Content-Type header
	};

	// Replace the URL with your actual API endpoint
	fetch(contextPath + "/sendDocument", requestOptions)
		.then(response => response.json())  // Parse the response as JSON
		.then(result => {
			console.log(result);

			// Example handling of API response
			if (result.status === 'true') {
				// Perform actions upon successful response
				// Prepare the request options
				var requestOptions2 = {
					method: 'GET',
				};

				getDocumnets(sellerId, requirementId, BuyerId);
				fetch(contextPath + "/getMilestoneByProject?id=" + projectId, requestOptions2)
					.then((response) => response.text())
					.then(result => {
						console.log(result);
						result = JSON.parse(result)

						getMilestone(result)

						$("#milestone-rework-modal").modal("hide")


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

function getFeedBack() {


	const requestOptions = {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json'
		}
	};

	fetch(contextPath + "/getFeedbackForProject?projectId=" + projectId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result);


			feedbackData = JSON.parse(result);


			// Example usage
			if (feedbackData) {
				if (feedbackData.buyerFeedback)
					$(".final-review-stepper-container .step-info").addClass("completed");
				populateCategoryData(feedbackData, "nav-feedback");
			}

		})
		.catch(error => console.error("Error:", error));
}

function populateCategoryData(feedbackData, section) {
	const parentContainer = document.getElementById(section);

	if (!parentContainer) {
		console.error(`Parent container '${section}' not found.`);
		return;
	}

	let sectionData;
	let subSections;
	if (section === "nav-feedback") {
		sectionData = feedbackData.buyerFeedback;
		subSections = ['seller', 'platform'];
	} else {
		console.error(`Invalid section '${section}'.`);
		return;
	}



	subSections.forEach(subSection => {
		const subSectionData = sectionData[subSection];
		if (!subSectionData) {
			console.error(`No data found for sub-section '${subSection}' in section '${section}'.`);
			return;
		}

		for (const categoryName in subSectionData) {
			const categoryDiv = parentContainer.querySelector(`#category${subSection.charAt(0).toUpperCase() + subSection.slice(1)}`);

			if (!categoryDiv) {
				console.error(`Category div for '${subSection}' not found.`);
				continue;
			}

			const categoryData = subSectionData[categoryName];

			for (const labelName in categoryData) {
				const rating = categoryData[labelName];
				const labelElements = categoryDiv.querySelectorAll('label');

				let labelElement = null;
				labelElements.forEach(label => {
					const labelText = label.textContent.trim().replace(/[\n\t]/g, ' ').replace(/\s\s+/g, ' ');
					if (labelText === labelName) {
						labelElement = label;
					}
				});

				if (!labelElement) {
					console.error(`Label '${labelName}' not found in category '${categoryName}'.`);
					continue;
				}

				let starContainer;
				if (section === "sellerFeedback") {
					starContainer = labelElement.closest('.row').querySelector('.star-container');

				} else {
					starContainer = labelElement.closest('.row.w-100').querySelector('.star-container');

				}

				if (starContainer) {
					const stars = starContainer.querySelectorAll('.star');
					stars.forEach((star, index) => {
						if (index < rating) {
							star.classList.add('active');
							star.textContent = 'star';
						} else {
							star.classList.remove('active');
							star.textContent = 'star_border';
						}
					});
					const inputElement = starContainer.closest('.col-lg-3').querySelector('input[type="number"]');
					if (inputElement) {
						inputElement.value = rating;
					}
				}

			}
		}
	});
}
//same for when pm raise a flag for milestone, it will differentiate, Work Submitted For {Milestone Name} or PM Raised Flag For {Milestone Name}, Buyer if rework need - "Buyer Requested Rework on {Milestone Name}"
