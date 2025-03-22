//Define the DataTable instance variable outside the function
var buyerTable;
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
var separatedData;
var paramsObj = {};

$(document).ready(
	function() {
		console.log("${role}", "js")
		console.log("${pageContext.request.contextPath}", "js")



		$("#shownInterestHeader").click(function() {
			buyerTable(separatedData["interested"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#inReviewHeader").click(function() {
			buyerTable(separatedData["inreview"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#allHeader").click(function() {
			buyerTable(separatedData["all"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#wonHeader").click(function() {
			buyerTable(separatedData["won"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		$("#lostHeader").click(function() {
			buyerTable(separatedData["lost"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
		});
		//			pending

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

function logQueryParams() {


	// Create a new URLSearchParams object from the current URL
	const urlParams = new URLSearchParams(window.location.search);

	// Iterate over the parameters and add them to the paramsObj
	urlParams.forEach((value, key) => {
		paramsObj[key] = value;
	});
	console.log(paramsObj.fillter)

	triggerButtonClick(paramsObj.fillter)
}
function triggerButtonClick(buttonId) {
	// Select the button element by its ID
	var button = document.getElementById(buttonId);

	// Check if the button exists
	if (button) {
		// Trigger the button click
		button.click();
	} else {
		console.error(`Button with ID ${buttonId} not found.`);
	}
}
function processDataAndHeader(data, list) {

	var separatedData = {
		"inreview": [],
		"interested": [],
		"lost": [],
		"won": [],
		"all": []
	};


	data.forEach(function(item) {
		if (item.status !== "-") {

			separatedData[item.status.toLowerCase().replace(/\s/g, '').replace(" ", '')].push(item);
		}
		separatedData["all"].push(item);
	});


	$('#inReviewHeader').text('In Review (' + separatedData["inreview"].length + ')');
	$('#shownInterestHeader').text('Shown Interest (' + separatedData["interested"].length + ')');
	$('#allHeader').text('All (' + separatedData["all"].length + ')');
	$('#wonHeader').text('Selected (' + separatedData["won"].length + ')');
	$('#lostHeader').text('Rejected (' + separatedData["lost"].length + ')');
	//	pending 
	return separatedData;
}
//		if (item.status === "Won" || item.status === "Lost"||item.status ==="Rejected") {
//				if (item.status === "Won")
//					separatedData["approved"].push(item);
//
//				if (item.status === "Lost"|| item.status==="Rejected")
//					separatedData["rejected"].push(item);
//
//
//			} else {
//				if (item.status === "RECOMMENDED_SELLER"||item.status ==="PURCHASE_ORDER_RELEASE"||item.status==="PROJECT_KICKOFF"||item.status==="Seller Intimation") {
//					separatedData["approved"].push(item);
//
//				}else if(item.status === "inreview"){
//					separatedData["posted"].push(item);
//
//				} else {
//					separatedData[item.status.toLowerCase().replace(/\s/g, '').replace(" ",'')].push(item);
//
//				}
//
//			}

function buyerTable(data) {


	DataTable = $("#RFQsTable")
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
				data: data,
				scrollX: true,
				stripeClasses: [],
				oLanguage: {
					sEmptyTable: `<div id="NoData2"
										style="display: flex;    min-height: 350px; flex: 1; justify-content: center; align-items: center; flex-direction: column;">
										<img class="icon" src="assets/icons/Group.svg"> No Data
										Available
									</div>`,	},
				lengthMenu: [[15, 25, 50, 100, -1],
				[15, 25, 50, 100, "All"],],
				ordering: true,
				order: [[4, 'desc']],
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
					data: "title",
					title: "Title",
					orderable: false,
				},
				{
					data: "buyerName",
					title: "Buyer Name",
					orderable: false,
				},
				{
					data: "createdOn",
					title: "Created On",
					type: "custom-date-time",
					render: function(data, type, row) {
						var dateTime = moment(data,
							'YYYY-MM-DD HH:mm:ss.S');
						return dateTime.isValid() ? dateTime
							.format('MMM Do YYYY, h:mm:ss a')
							: '';
					}
				}, {
					data: "location",
					title: "Location",
					orderable: false,
				}, {
					data: "status",
					orderable: false,
					title: "Status",
					class: "text-capitalize round-right",
					render: function(data, type, row) {

						switch (data.toLowerCase()) {
							case "posted":
								return '<span class="status inreview"> In Review </span>';
							case "approved":
								return '<span class="status inreview"> Seller Intimation </span>';
							case "in review":
								return '<span class="status inreview"> In Review </span>';
							case "interested":
								return '<span class="status interested"> Interested </span>';
							case "won":
								return '<span class="status approved"> Selected </span>';
							case "lost":
								return '<span class="status rejected"> Rejected </span>';
							case "recommended_seller" || "project_kickoff" || "purchase_order_release":
								return '<span class="status inreview">Seller Intimation</span>';
							default:
								return '<span class="status ' + data.toLowerCase() + '">' + data + '</span>';
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
	var dateTime = moment(data, 'YYYY-MM-DD HH:mm:ss.S');
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

function addToId(rowData, row) {
	var name = $("#requirement-details #dateAgo");
	var date = row.createdOn
	console.log(`The date ${date} was ${daysAgo(date)} days ago.`);

	const parsedDate = moment(date, 'YYYY-MM-DD HH:mm:ss.S');
	const formattedDate = parsedDate.format('MMM Do YYYY, h:mm:ss a');

	name.html(formattedDate + " (" + daysAgo(date) + " days ago )")

	

		$("#Interest").off("click").on("click", function() {
			changeInterestInRequirement(row.id, row.requirementId, row.reqStatus, "true");
		});
		$("#notInterested").off("click").on("click", function() {
			changeInterestInRequirement(row.id, row.requirementId, row.reqStatus, "false");
		});

	var status = $("#requirement-details #status");

	if (row.status) {
		status.removeClass("inreview approved rejected interested ");

		switch (row.status.toLowerCase().replace(/\s+/g, '')) {

			case "posted":
				status.addClass("inreview").html("In Review");
				if (role === "ADMIN") {
					$("#approveButton").show();
					$("#rejectButton").show();
					$("#IntimatedSellers").hide();
				}
				break;
			case "approved":
				if (role === "ADMIN") {
					$("#approveButton").hide();
					$("#rejectButton").hide();
					$("#IntimatedSellers").show();
				}
				if (role === "SELLER") {
					$("#interestedButtons").hide()
				}
				status.addClass(row.status.toLowerCase()).html(row.status);

				break;
			case "rejected":
				if (role === "ADMIN") {
					$("#approveButton").hide();
					$("#rejectButton").hide();
					$("#IntimatedSellers").hide();
				}
				if (role === "SELLER") {
					$("#interestedButtons").hide()
				}
				status.addClass(row.status.toLowerCase()).html(row.status);

				break;
			case "interested":
				if (role === "SELLER") {
					$("#interestedButtons").hide()
				}
				status.addClass(row.status.toLowerCase()).html(row.status);

				break;
			case "won":

				$("#Interest").hide()
				$("#notInterested").hide()
				status.addClass('approved').html(row.status);

				break;
			case "inreview":
				if (role === "ADMIN") {
					$("#Interest").show()
					$("#notInterested").show()

				} else {
					$("#interestedButtons").show()
				}
				status.addClass('inreview').html(row.status);
				break;
			case "lost":

				$("#Interest").hide()
				$("#notInterested").hide()
				status.addClass('rejected').html(row.status);

				break;

			case "recommended_seller":
				if (role === "ADMIN") {

					$("#approveButton").hide();
					$("#rejectButton").hide();
					$("#IntimatedSellers").show();
				}
				status.addClass('approved').html("APPROVED");


				break;
			default:
				if (role === "ADMIN") {
					$("#approveButton").show();
					$("#rejectButton").show();
					$("#IntimatedSellers").hide();
				}
				status.addClass(row.status.toLowerCase()).html(row.status);
				break;

		}



	}
	Object.keys(rowData).forEach(function(key) {
		var div = $("#requirement-details #" + key);

		if (!div.length) {
			return;
		}

		var value = rowData[key] ? rowData[key] : "";


		div.html(value);

	});

}
function daysAgo(dateString) {
	// Parse the input date
	const inputDate = new Date(dateString);

	// Check if the date is valid
	if (isNaN(inputDate)) {
		throw new Error("Invalid date format. Please provide a date in the format 'DD-MMM-YYYY, HH:MM:SS AM/PM'.");
	}

	// Get the current date
	const currentDate = new Date();

	// Calculate the time difference in milliseconds
	const timeDifference = currentDate - inputDate;

	// Convert the time difference from milliseconds to days
	const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));

	return daysDifference;
}

function openModal(row) {
	// Your code to open the modal and handle the id
	if (role === "SELLER") {
		var id = row.requirementId
	} else {
		var id = row.id
	}

	console.log("Opening modal for ID:", id);


	var requestOptions = {
		method: "GET",
		headers: myHeaders,

		redirect: "follow"
	};

	fetch(contextPath + "/viewRequirementById?id=" + id, requestOptions)
		.then((response) => response.text())
		.then(result => {

			result = JSON.parse(result)

			addToId(result, row)


		})
		.catch(error => console.error("Error:", error));

	// For example, you could show a modal and set its content based on the id
	$('#requirement-details').modal('show');
	// $('#modalContent').text("Details for ID: " + id);
}


//changeRequirementStatus
function changeAccountStatus(id, status) {
	// Make fetch request
	fetch(contextPath + "/changeRequirementStatus", {
		method: 'POST', // or 'GET', 'PUT', etc.
		headers: {
			'Content-Type': 'application/json'
			// Add any other headers if needed
		},
		body: JSON.stringify({
			"id": id, // Account ID
			"status": status, // Status chosen by admin
		})
		// Convert rowData to JSON and send it as body
	})
		.then(response => response.json()) // Parse response as JSON
		.then(data => {
			// Handle response data

			if (data.status) {
				location.reload();
			} else {
				// Handle the case where the response indicates failure
				console.error('Error:', data.message);
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});
}

function changeInterestInRequirement(id, reqId, reqStatus, status) {
	// Make fetch request
	fetch(contextPath + "/changeInterestInRequirement", {
		method: 'POST', // or 'GET', 'PUT', etc.
		headers: {
			'Content-Type': 'application/json'
			// Add any other headers if needed
		},
		body: JSON.stringify({
			"reqStatus": reqStatus,
			"reqId": reqId,
			"id": id, // Account ID
			"interested": status, // Status chosen by admin
		})
		// Convert rowData to JSON and send it as body
	})
		.then(response => response.json()) // Parse response as JSON
		.then(data => {
			// Handle response data

			if (data.status) {
				location.reload();
			} else {
				// Handle the case where the response indicates failure
				console.error('Error:', data.message);
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});
}




function SellerList(id, row) {
	// Make fetch request
	fetch(contextPath + "/getIntimatedSellerList?requirementId=" + id.id, {
		method: 'GET', // or 'GET', 'PUT', etc.


		// Convert rowData to JSON and send it as body
	})
		.then(response => response.json()) // Parse response as JSON
		.then(data => {
			// Handle response data

			var IntimatedSellerList = document.getElementById("IntimatedSellerList");
			var tableDiv = document.getElementById("tableDiv");
			var breadcrumbText = document.getElementById("breadcrumb-text");
			$('#requirement-details').modal('hide');
			IntimatedSellerList.style.display = "block";
			tableDiv.style.display = "none"
			breadcrumbText.innerHTML = row.requirementNo
			console.log(data)
			separatedData = processDataAndHeader(data);

			$("#IntimatedSellerList #pendingHeader").click(function() {
				sellerDivFunction(separatedData["pending"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
			});
			$("#IntimatedSellerList #interestedHeader").click(function() {
				sellerDivFunction(separatedData["interested"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
			});
			$("#IntimatedSellerList #notinterestedHeader").click(function() {
				sellerDivFunction(separatedData["notinterested"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
			});
			$("#IntimatedSellerList #allHeader").click(function() {
				sellerDivFunction(separatedData["all"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
			});
			sellerDivFunction(data)


		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});
}



function sellerDivFunction(args) {
	var table = document.getElementById("mainDivSection3");
	var rowsContainer = table.querySelector(".rows-container");
	if (!rowsContainer) {
		rowsContainer = document.createElement("div");
		rowsContainer.className = "rows-container";
		table.appendChild(rowsContainer);
	} else {
		rowsContainer.innerHTML = ""; // Clear existing rows
	}



	for (var i = 0; i < args.length; i++) {
		var sellerDiv = document.createElement("div");
		sellerDiv.className = "sellerDiv";

		var details = document.createElement("div");
		details.className = "details";

		var div = document.createElement("div");
		var div1 = document.createElement("div");
		div1.className = "justify-content-between d-flex"
		var companyImage = document.createElement("div")
		companyImage.className = "companyImage";
		
			if (args[i].comapnyLogoUrl) {
		companyImage.style.borderRadius = "100%";
		companyImage.style.backgroundImage = "url(" + args[i].comapnyLogoUrl + ")";
	}else{
		companyImage.style.borderRadius = "100%";
		companyImage.style.backgroundImage = "url(assets/icons/person-blue.svg)";
	}
		var status = document.createElement("div");

		switch (args[i].status.toLowerCase()) {
			case "pending":
				status.className = "status inreview";
				status.innerHTML = "Pending"


				break;
			case "interested":
				status.className = "status approved";
				status.innerHTML = "Interested"

				break;
			case "notinterested":
				status.className = "status rejected";
				status.innerHTML = "Not Interested"

				break;
		}
		div1.append(companyImage, status)




		var companyName = document.createElement("h1");
		companyName.className = "companyName";
		companyName.innerHTML = args[i].companyName;
		var industry = document.createElement("h2");
		industry.className = "industry";
		industry.innerHTML = "Industry: " + args[i].companyIndustry;
		var location = document.createElement("div");
		location.className = "location";


		var cityState = document.createElement("p");
		cityState.className = 'cityState';
		cityState.innerHTML = '<img src="assets/icons/location.svg" alt=""	class="location-icon"> ' + args[i].location
		var noOfProjects = document.createElement("p");
		noOfProjects.className = "noOfProjects";
		noOfProjects.innerHTML = args[i].numberOfProjectsCompleted + " Projects Completed";

		location.append(cityState, noOfProjects)

		var ratingDiv = document.createElement("div");
		ratingDiv.className = "ratingDiv";
		var rating = document.createElement("p");
		rating.className = "rating";
		rating.innerHTML = args[i].numberOfRatings + " Ratings";
		ratingDiv.appendChild(rating);
		for (var j = 0; j < args[i].numberOfRatings; j++) {
			var star = document.createElement("i");
			star.className = "material-icons";
			star.innerHTML = "star";
			ratingDiv.appendChild(star);
		}
		//	


		var linkedIn = document.createElement("a");
		linkedIn.className = "linkedIn";
		linkedIn.target = "_blank";
		linkedIn.href = args[i].linkedInProfile ? args[i].linkedInProfile : ""
		linkedIn.innerHTML = args[i].linkedInProfile ? args[i].linkedInProfile : ""

		div.append(div1, companyName, industry, location, ratingDiv, linkedIn)
		details.append(div)
		sellerDiv.append(details);


		rowsContainer.appendChild(sellerDiv);
	}

}






function replaceDiv(show, hidden) {
	var replce = document.getElementById(show);
	var newDiv = document.getElementById(hidden);


	replce.style.display = "block";
	newDiv.style.display = "none";
}



