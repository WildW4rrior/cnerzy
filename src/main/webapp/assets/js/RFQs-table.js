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
		const raw = JSON.stringify({ status: "" });

		var requestOptions = {
			method: "POST",
			headers: myHeaders,
			body: raw,
			redirect: "follow"
		};

		fetch(contextPath + "/getAllRequirementsList", requestOptions)
			.then((response) => response.text())
			.then(result => {

				userListJson = JSON.parse(result)
				separatedData = processDataAndHeader(userListJson, true);
				checkForData(separatedData["all"]);
				logQueryParams()

			})
			.catch(error => console.error("Error:", error));





		$("#postedHeader").click(function() {
			checkForData(separatedData["posted"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
			$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
		});
		$("#sellerIntimationHeader").click(function() {
			checkForData(separatedData["approved"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
			$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
		});
		$("#rejectedHeader").click(function() {
			checkForData(separatedData["rejected"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
			$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
		});
		$("#allHeader").click(function() {
			checkForData(separatedData["all"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
			$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
		});


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
	console.log(paramsObj.fillter)

	triggerButtonClick(paramsObj.fillter)
}
function triggerButtonClick(buttonId) {
	// Select the button element by its ID
	var header = document.getElementById("tableDiv");

	var button = header.querySelector(`#${buttonId}`);

	// Check if the button exists
	if (button) {
		// Trigger the button click
		button.click();
		paramsObj = {};
	} else {
		console.error(`Button with ID ${buttonId} not found.`);
	}
}
function processDataAndHeader(data, list) {
	if (role == "ADMIN" && list) {
		var separatedData = {
			"posted": [],
			"approved": [],
			"rejected": [],
			"all": []
		};
	} else if (role == "ADMIN" && !list) {
		var separatedData = {
			"pending": [],
			"interested": [],
			"notinterested": [],
			"all": []
		};
	}
	if (role == "ADMIN" && list) {
		data.forEach(function(item) {
			if (item.status !== "-") {
				if (item.status === "Approve" || item.status === "Rejected" || item.status === "Seller Intimation" || item.status === "In Review") {
					if (item.status === "Won")
						separatedData["approved"].push(item);

					if (item.status === "Rejected")
						separatedData["rejected"].push(item);

					if (item.status === "Seller Intimation") {
						separatedData["approved"].push(item);
					}
					if (item.status === "In Review") {
						separatedData["posted"].push(item);
					}
				} else {

					if (item.status === "inreview") {
						separatedData["posted"].push(item);

					} else {
						separatedData[item.status.toLowerCase().replace(/\s/g, '').replace(" ", '')].push(item);

					}

				}
				separatedData["all"].push(item);
			}

		});

		$('#postedHeader').text('In Review (' + separatedData["posted"].length + ')');
		$('#sellerIntimationHeader').text('Seller Intimation (' + separatedData["approved"].length + ')');
		$('#rejectedHeader').text('Rejected (' + separatedData["rejected"].length + ')');
		$('#allHeader').text('All (' + separatedData["all"].length + ')');
		console.log(separatedData)
	}
	if (role == "ADMIN" && !list) {
		data.forEach(function(item) {
			if (item.status !== "-") {
				if (item.status === "Pending" || item.status === "Interested" || item.status === "Not Interested") {

					if (item.status === "Pending")
						separatedData["pending"].push(item);

					if (item.status === "Interested") {
						separatedData["interested"].push(item);
					}
					if (item.status === "Not Interested") {
						separatedData["notinterested"].push(item);
					}

				}
				separatedData["all"].push(item);
			}

		});
		$('#IntimatedSellerList #pendingHeader').text('Pending (' + separatedData["pending"].length + ')');
		$('#IntimatedSellerList #interestedHeader').text('Interested (' + separatedData["interested"].length + ')');
		$('#IntimatedSellerList #notinterestedHeader').text('Not Interested (' + separatedData["notinterested"].length + ')');
		$('#IntimatedSellerList #allHeader').text('All (' + separatedData["all"].length + ')');

	}
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
				selectable: true,
				responsive: false,
				dom: 'Btr',
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
									</div>`,
				},
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
						var dateTime = moment(data);
						return dateTime.isValid() ? dateTime
							.format('MMM Do YYYY, h:mm:ss a')
							: '';
					}
				}, {
					data: "location",
					title: "Location",
					orderable: false,
				},
				//				{
				//					data: null,
				//					title: "Timeline",
				//					orderable: false,
				//					render: function(data, type, row) {
				//
				//						return "<p class='text-blue' onclick='openTimeLine(" + JSON.stringify(row) + ")'>View</p>"
				//
				//
				//					}
				//				}, 
				{
					data: "status",
					orderable: false,
					title: "Status",
					class: "text-capitalize round-right",
					render: function(data, type, row) {

						switch (data.toLowerCase()) {
							case "posted":
								return '<span class="status inreview">' + "In Review" + '</span>';
							case "approved":
								return '<span class="status inreview">' + "Seller Intimation" + '</span>';
							case "in review":
								return '<span class="status inreview">' + "In Review" + '</span>';
							case "interested":
								return '<span class="status interested">' + "Interested" + '</span>';
							case "won":
								return '<span class="status approved">' + data + '</span>';
							case "lost":
								return '<span class="status rejected">' + data + '</span>';
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
$('#exportCsvBtn').on('click', function() {
	DataTable.button('.buttons-csv').trigger(); // Trigger CSV export programmatically
});

// External Dropdown Button for Excel Export
$('#exportExcelBtn').on('click', function() {
	DataTable.button('.buttons-excel').trigger(); // Trigger Excel export programmatically
});

// Select the input element
const inputField = document.getElementById('tableSearch');
if(inputField){
	
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

function addToId(rowData, row) {
	var name = $("#requirement-details #dateAgo");
	var date = row.createdOn
	console.log(`The date ${date} was ${daysAgo(date)} days ago.`);

	const parsedDate = moment(date, 'YYYY-MM-DD HH:mm:ss.S');
	const formattedDate = parsedDate.format('MMM Do YYYY, h:mm:ss a');

	name.html(formattedDate + " (" + daysAgo(date) + " days ago )")

	$("#approveButton").off("click").on("click", function() {
		changeAccountStatus(rowData.id, "APPROVED");
	});
	$("#rejectButton").off("click").on("click", function() {
		changeAccountStatus(rowData.id, "REJECTED");
	});
	$("#IntimatedSellers").off("click").on("click", function() {
		SellerList(rowData, row);
	});



	var status = $("#requirement-details #status");

	if (row.status) {
		status.removeClass("inreview approved rejected interested ");
		console.log(row.status.toLowerCase().replace(/\s+/g, ''), "status")
		switch (row.status.toLowerCase().replace(/\s+/g, '')) {

			case "approved":

				$("#approveButton").hide();
				$("#rejectButton").hide();
				$("#IntimatedSellers").show();


				status.addClass(row.status.toLowerCase()).html(row.status);

				break;
			case "sellerintimation":
				$("#approveButton").hide();
				$("#rejectButton").hide();
				$("#IntimatedSellers").show();


				status.addClass(row.status.toLowerCase()).html(row.status);

				break;
			case "rejected":

				$("#approveButton").hide();
				$("#rejectButton").hide();
				$("#IntimatedSellers").hide();

				status.addClass(row.status.toLowerCase()).html(row.status);

				break;
			case "interested":

				$("#interestedButtons").hide()

				status.addClass(row.status.toLowerCase()).html(row.status);

				break;
			case "won":

				$("#Interest").hide()
				$("#notInterested").hide()
				status.addClass('approved').html(row.status);

				break;
			case "inreview":


				$("#approveButton").show();
				$("#rejectButton").show();
				$("#IntimatedSellers").hide();

				status.addClass('inreview').html(row.status);
				break;
			case "lost":

				$("#Interest").hide()
				$("#notInterested").hide()
				status.addClass('rejected').html(row.status);

				break;

			case "recommended_seller":


				$("#approveButton").hide();
				$("#rejectButton").hide();
				$("#IntimatedSellers").show();

				status.addClass('approved').html("APPROVED");


				break;
			default:

				$("#approveButton").show();
				$("#rejectButton").show();
				$("#IntimatedSellers").hide();

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

	var id = row.id

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
			separatedData = processDataAndHeader(data, false);

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

	if (args.length == 0) {
		rowsContainer.innerHTML = ""; // Clear existing rows
		$("#mainDivSection3  #pagination").css("display", "none");

		$("#mainDivSection3 #NoData").css("display", "flex");

	} else {

		$("#mainDivSection3  #pagination").css("display", "flex");

		$("#mainDivSection3 #NoData").css("display", "none");

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
			if (args[i].comapnyLogoUrl)
				companyImage.style.backgroundImage = `url(${args[i].comapnyLogoUrl})`;
			companyImage.style.backgroundSize = 'contain';
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
				case "not interested":
					status.className = "status rejected";
					status.innerHTML = "Not Interested"

					break;
				case "rejected":
					status.className = "status rejected";
					status.innerHTML = "Rejected"

					break;
				case "finalised":
					status.className = "status approved";
					status.innerHTML = "Finalised"

					break;
				case "shortlisted":
					status.className = "status inreview";
					status.innerHTML = "Shortlisted"

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

			var starDiv = document.createElement("div");
			starDiv.className = "stars text-nowrap"
			//			for (var j = 0; j < args[i].numberOfRatings; j++) {
			//
			//				var star = document.createElement("i");
			//				star.className = "material-icons";
			//				star.innerHTML = "star";
			//				ratingDiv.appendChild(star);
			//			}

			starsCount = Math.floor(parseInt(args[i].numberOfRatings));

			for (var j = 0; j < starsCount; j++) {
				var filledStar = document.createElement("i");
				filledStar.className = "material-icons star active";
				filledStar.textContent = "star";
				starDiv.append(filledStar);
			}

			// Add empty stars to make a total of 5
			for (var j = starsCount; j < 5; j++) {
				var emptyStar = document.createElement("i");
				emptyStar.className = "material-icons star";
				emptyStar.textContent = "star_border";
				starDiv.append(emptyStar);
			}
			ratingDiv.append(starDiv)


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
}






var params;

function replaceDiv(replace, show) {

	$("#" + show).show();

	$("#" + replace).hide();

	if (show === "tableDiv") {
		params = {
			ProjectName: "",
			fillter: "",
		};
		redirectToWithParams(contextPath + "/RFQs", params)
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
			$("#projectManager-appoint").hide()
			$("#timeline").modal("show");
			$("#timeline #projectId").html(row.requirementNo)
			timelineData = result
			const timelineContainer = document.getElementById('timeline');

			const now = new Date();
			const allTimelineItems = timelineContainer.querySelectorAll('.timeline-item');
			allTimelineItems.forEach(item => {
				item.classList.remove('completed');
			});
			Object.keys(timelineData).forEach(key => {
				const itemDate = new Date(timelineData[key]);
				const diffTime = Math.abs(now - itemDate);
				const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

				const timelineItem = timelineContainer.querySelector(`[data-key="${key}"]`);
				if (timelineItem) {
					const dateElement = timelineItem.querySelector('.date');
					dateElement.innerHTML = `${itemDate.toDateString()}<br>(${diffDays} days ago)`;

					if (itemDate <= now) {
						timelineItem.classList.add('completed');
					}
				} else {
					console.log("data key not in the result")
				}
			});
		})
		.catch(error => console.error("Error:", error));

}

