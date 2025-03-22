var sellerId;
var requirementId;
var separatedData;
var separatedSellerData;
var recommendedSeller;
$("#sellerList").hide();
var userListJson;
var paramsObj = {};

$("#tableDiv .dropdown-item").on("click", function() {
	var sortBy = $(this).text();
	switch (sortBy) {
		case "Newest":
			DataTable.order([4, 'desc', 'custom-date-time-pre']).draw();
			$('#tableDiv #dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
			break;
		case "Oldest":
			DataTable.order([4, 'asc', 'custom-date-time-pre']).draw();
			$('#tableDiv #dropdownMenuClickableInside').html("Oldest"); // Update inner HTML of the element with ID 'sortingLabel'
			break;
		default:
		// Handle other sorting options if needed
	}

});
$("#sellerSorting .dropdown-menu .dropdown-item").on("click", function() {
	const sortBy = $(this).text();
	switch (sortBy) {
		case "Newest":
			$('#dropdownMenuClickableInside').html("Newest");
			$('#sellerSorting #dropdownMenuClickableInside').html("Newest");

			break;
		case "Oldest":
			$('#dropdownMenuClickableInside').html("Oldest");
			$('#sellerSorting #dropdownMenuClickableInside').html("Oldest");

			break;
		default:
			// Handle other sorting options if needed
			break;
	}
	applyFilter(sortBy, separatedSellerData.all, "mainDivSection3", requirementId);
});

function logQueryParams() {


	// Create a new URLSearchParams object from the current URL
	const urlParams = new URLSearchParams(window.location.search);

	// Iterate over the parameters and add them to the paramsObj
	urlParams.forEach((value, key) => {
		paramsObj[key] = value;
	});
	console.log(paramsObj.filter)

	triggerButtonClick(paramsObj.filter)
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
function applyFilter(sortBy, data, divId, reqId) {
	if (data.length === 0) return;

	const sortedData = data.sort((a, b) => {
		const dateA = new Date(a.interestedOn);
		const dateB = new Date(b.interestedOn);

		if (sortBy === 'Newest') {
			return dateB - dateA;
		} else if (sortBy === 'Oldest') {
			return dateA - dateB;
		}
		return 0;
	});

	sellerDivFunction(sortedData, divId, reqId);

}
const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");


var requestOptions = {
	method: "GET",
	headers: myHeaders,

	redirect: "follow"
};

fetch(contextPath + "/getBuyerAllRequirementList", requestOptions)
	.then((response) => response.text())
	.then(result => {
		userListJson = JSON.parse(result)
		console.log('userListJson.data-->', userListJson.data)

		separatedData = processDataAndHeader(userListJson.data, "table");


		checkForData(userListJson.data);



		logQueryParams()

	})
	.catch(error => console.error("Error:", error));


function checkForData(rows) {

	buyerTable(rows);


}

$("#postedHeader").click(function() {
	checkForData(separatedData["inreview"])

	$(".headingStatus h1").removeClass("active");
	$(this).addClass("active");
	$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'

});
$("#approvedHeader").click(function() {
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
$("#tab-2-content  #savedHeader").click(function() {

	sellerDivFunction(separatedSellerData["savedByBuyer"], "mainDivSection3", requirementId)
	$(".headingStatus h1").removeClass("active");
	$(this).addClass("active");
});
$("#tab-2-content  #allHeader").click(function() {

	sellerDivFunction(separatedSellerData["all"], "mainDivSection3", requirementId)

	$(".headingStatus h1").removeClass("active");
	$(this).addClass("active");
});
$("#tab-3-content  #allHeader").click(function() {

	sellerDivFunction(separatedSellerData["all"], "mainDivSection4", requirementId)

	$(".headingStatus h1").removeClass("active");
	$(this).addClass("active");
});
$("#tab-3-content  #rejectedHeader").click(function() {

	sellerDivFunction(separatedSellerData["rejected"], "mainDivSection4", requirementId)

	$(".headingStatus h1").removeClass("active");
	$(this).addClass("active");
});
$("#tab-3-content  #inReviewHeader").click(function() {

	sellerDivFunction(separatedSellerData["inreview"], "mainDivSection4", requirementId)

	$(".headingStatus h1").removeClass("active");
	$(this).addClass("active");
});





function processDataAndHeader(data, table, tab) {
	if (table === "table") {
		var separatedData = {
			"approved": [],
			"rejected": [],
			"inreview": [],
			"all": []
		};

		data.forEach(function(item) {
			if (item.status === 'REJECTED') {
				separatedData["rejected"].push(item);
			} else if (item.status === 'POSTED') {
				separatedData["inreview"].push(item);
			} else {
				separatedData["approved"].push(item);
			}

			separatedData["all"].push(item);
		});

		$('#postedHeader').text('In Review (' + separatedData["inreview"].length + ')');
		$('#approvedHeader').text('Approved (' + separatedData["approved"].length + ')');
		$('#rejectedHeader').text('Rejected (' + separatedData["rejected"].length + ')');
		$('#allHeader').text('All (' + separatedData["all"].length + ')');

		return separatedData;
	} else {
		if (tab === "tab2") {


			var separatedSellerData = {
				"savedByBuyer": [],
				"all": []
			};

			data.forEach(function(item) {
				if (item.savedByBuyer === true) {
					separatedSellerData["savedByBuyer"].push(item);
				}
				separatedSellerData["all"].push(item);
			});

			$('#tab-2-content  #savedHeader').text('Saved (' + (separatedSellerData["savedByBuyer"].length) + ')');
			$('#tab-2-content  #allHeader').text('All (' + separatedSellerData["all"].length + ')');
		} if (tab == "tab3") {


			var separatedSellerData = {
				"savedByBuyer": [],
				"inreview": [],
				"rejected": [],
				"all": []
			};

			data.forEach(function(item) {
				if (item.savedByBuyer === true) {
					separatedSellerData["savedByBuyer"].push(item);
				} if (item.sellerWithdrawn === true || item.rejected === true) {
					separatedSellerData["rejected"].push(item);
				}
				separatedSellerData["all"].push(item);
			});

			$('#tab-3-content  #rejectedHeader').text('Rejected (' + (separatedSellerData["rejected"].length) + ')');
			$('#tab-3-content  #inReviewHeader').text('In Review (' + (separatedSellerData["inreview"].length) + ')');
			$('#tab-3-content  #allHeader').text('All (' + separatedSellerData["all"].length + ')');
		}
		return separatedSellerData;
	}

}

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
				order: [[4, 'desc']],
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
					data: "reqNo",
					title: "ID",
					orderable: false,
					render: function(data, type, row, meta) {
						if (row.status == "REJECTED") {
								return "<p class='requirementNo text-blue'>" + data + "</p>"
						} else if (row.status == "POSTED") {
							return "<p class='requirementNo text-blue' onclick='openPopUp()'>" + data + "</p>"
						} else {
							return "<p class='requirementNo text-blue' onclick='openModal(" + JSON.stringify(row) + ")'>" + data + "</p>"

						}
					}
				},
				{
					data: "title",
					title: "Title",
					orderable: false,
				},
				{
					data: "service",
					title: "Service",
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
						// console.log('current status-->', data)
						switch (data.toLowerCase()) {
							case "posted":
								return '<span class="status posted">' + "Posted" + '</span>';
							case "approved":
								return '<span class="status approved">' + "Approved" + '</span>';
							case "rejected":
								return '<span class="status rejected">' + "Rejected" + '</span>';
							case "recommended_seller":
								return '<span class="status inreview">' + "Recommended" + '</span>';
							case "seller_shortlisted":
								return '<span class="status sellers-intimated">' + "Sellers Intimated" + '</span>';
							case "in_discussion":
								return '<span class="status discussion">' + "Discussion" + '</span>';
							case "negotiations":
								return '<span class="status negotiation">' + "Negotiation" + '</span>';
							case "purchase_order_release":
								return '<span class="status inreview">' + "Contract/PO" + '</span>';
							case "project_kickoff":
								return '<span class="status project_kickoff">' + "Kick-off" + '</span>';
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
function openPopUp() {

	$("#requirement-under-review").modal("show")


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

			addToId(result, "detailedPost")
			var sellerProjectName = $("#sellerList #reqNo");
			var projectName = $("#DiscussModal #reqNo");
			var ModalprojectNameUniqueCode = $(".modal#upload-loi-and-po-modal #reqUniqueCode");


			var valueSetting = row.reqNo;
			ModalprojectNameUniqueCode.val(valueSetting)
			// Set the HTML content
			sellerProjectName.html(valueSetting);
			projectName.html(valueSetting);

			// Log the variables
			console.log("SellerProjectName:", sellerProjectName);
			console.log("ProjectName:", projectName);
			console.log("ValueSetting:", row);
			tabsApi(result.id, "tab-1")
			// Usage: call getCounts with the request ID
			getCounts(result.id);


		})
		.catch(error => console.error("Error:", error));

	// For example, you could show a modal and set its content based on the id
	// 			$('#requirement-details').modal('show');
	$("#tableDiv").hide();
	$("#sellerList").show();

	// $('#modalContent').text("Details for ID: " + id);
}
var ShortlistedSellerCount;
function getCounts(reqId) {
	const apiEndpoints = {
		"tab-2": contextPath + "/getRecommendedSellerListByReqId?reqId=" + reqId,
		"tab-3": contextPath + "/getShortlistedSellerListByReqId?reqId=" + reqId,
		"tab-4": contextPath + "/getFinalizedSellerListByReqId?reqId=" + reqId
	};

	// Object to store the counts
	const counts = {};

	// Mapping of tab IDs to class names and additional text
	const elementConfigs = {
		"tab-2": { className: "tab-2-count" },
		"tab-3": { className: "tab-3-count" },
		"tab-4": { className: "tab-4-count" }
	};

	// Function to fetch data from an endpoint and get the count
	function fetchDataAndCount(endpoint, tabId) {
		return fetch(endpoint)
			.then(response => response.json())
			.then(data => {
				counts[tabId] = data.length;
				updateHTMLElements(tabId, data.length); // Update HTML elements with the count
			})
			.catch(error => {
				console.error('Error fetching data:', error);
				counts[tabId] = 0; // In case of error, set count to 0
				updateHTMLElements(tabId, 0); // Update HTML elements with the count
			});

	}

	// Function to update the HTML elements with the count and additional text
	function updateHTMLElements(tabId, count) {
		const elementConfig = elementConfigs[tabId];
		const elements = document.getElementsByClassName(elementConfig.className);
		if (tabId === "tab-4" && count === 1) {
			// Set the background color using the correct CSS property
			$("#poLoi").css("background-color", "rgba(26, 28, 67, .2)");
			// Update the HTML content of the element
			$("#rejectButton").hide()
			$("#poLoi").prop("disabled", true);
			$("#poLoi").html("PO Released");
		}
		if (tabId === "tab-3") {
			ShortlistedSellerCount = count
		}


		for (const element of elements) {
			element.innerHTML = `(${count})`;
		}
	}
	// Create an array of promises for fetching data from all endpoints
	const fetchPromises = Object.keys(apiEndpoints).map(tabId => {
		const endpoint = apiEndpoints[tabId];
		return fetchDataAndCount(endpoint, tabId);
	});

	// Execute all fetch promises and then log the counts
	Promise.all(fetchPromises).then(() => {
		console.log('Data counts:', counts);
		// Further processing can be done here if needed
	});
}
function tabsApi(reqId, tabId) {
	const apiEndpoints = {
		"tab-1": contextPath + "/viewRequirementById?id=" + reqId,
		"tab-2": contextPath + "/getRecommendedSellerListByReqId?reqId=" + reqId,
		"tab-3": contextPath + "/getShortlistedSellerListByReqId?reqId=" + reqId,
		"tab-4": contextPath + "/getFinalizedSellerListByReqId?reqId=" + reqId
	};

	// Select all buttons with the class 'nav-link'
	const tabs = document.querySelectorAll('#nav-tab .nav-link');
	let dataReceived = false;

	// Iterate over each button and add an event listener
	tabs.forEach(tab => {
		tab.addEventListener('click', function() {
			const tabId = this.id; // Get the id of the clicked tab
			const apiUrl = apiEndpoints[tabId]; // Get the corresponding API endpoint

			// Log the tab name and API URL
			console.log("Tab clicked: " + this.innerText.trim());
			console.log("Fetching data from: " + apiUrl);

			if (tabId === "tab-2")
				divId = "mainDivSection3";

			if (tabId === "tab-3")
				divId = "mainDivSection4";

			// Fetch data from the corresponding API endpoint
			fetch(apiUrl)
				.then(response => response.json())
				.then(data => {
					// Process the fetched data
					console.log("Data fetched from " + apiUrl, data);

					if (tabId === "tab-4") {
						if (data.length > 0) {
							addToId(data[0], "finalSeller");
							$("#finalSeller #workSpace").on('click', function() {
								openDiscussModal(data[0], reqId, data);
							});
							dataReceived = true;
						} else {
							$("#tab-4-content #finalSeller").empty();
							toastr.error("Not finalized any seller yet ");
						}
					} else {
						if (tabId === "tab-2") {
							$("#tab-2-content #mainDivSection3").empty();
							separatedSellerData = processDataAndHeader(data, "", "tab2");


							applyFilter("Newest", data, divId, reqId)
						}
						if (tabId === "tab-3") {
							$("#tab-3-content #mainDivSection4").empty();
							separatedSellerData = processDataAndHeader(data, "", "tab3");


							applyFilter("Newest", data, divId, reqId)
						}

						dataReceived = true;
					}
					// Add your code here to update the UI with the fetched data
				})
				.catch(error => {
					console.error('Error fetching data:', error);
				});
		});
	});

	// Trigger click on the specified tabId to fetch data immediately
	document.getElementById(tabId).click();
}

//-----------------------for fetching & showing cnerzy recommended sellers js starts-----------------


var sellerCurrentPage = 1;
var sellerRowsPerPage = 3;

//for recommended sellers
function sellerDivFunction(args, divId, reqId) {
	var table = document.getElementById(divId);
	var rowsContainer = table.querySelector(".rows-container");

	if (!Array.isArray(args)) {
		args = [args];
	}
	if (!rowsContainer) {
		rowsContainer = document.createElement("div");
		rowsContainer.className = "rows-container";
		table.appendChild(rowsContainer);
	} else {
		rowsContainer.innerHTML = ""; // Clear existing rows
	}
	if (args.length == 0) {
		rowsContainer.innerHTML = ""; // Clear existing rows
		if (divId === "mainDivSection3") {

			$("#NoData3").css("display", "flex");
		}
		if (divId === "mainDivSection4") {

			$("#NoData2").css("display", "flex");
		}
	} else {
		if (divId === "mainDivSection3") {

			$("#NoData3").css("display", "none");
		}
		if (divId === "mainDivSection4") {

			$("#NoData2").css("display", "none");
		}

		for (let i = 0; i < args.length; i++) {
			makeSellerRows(args[i], i, rowsContainer, reqId, divId)



		}
	}

}

function makeSellerRows(args, i, rowsContainer, reqId, divId) {
	var sellerDiv = document.createElement("div");
	sellerDiv.className = "sellerDiv custom-view-seller-modal card-style-2";
	var saveIconDiv = document.createElement("div");
	if (divId === "documnetsDicuessUser") {
		saveIconDiv.className = "card-type"
		var spanText = document.createElement("span");
		spanText.innerHTML = "Seller"
		saveIconDiv.append(spanText)
	} else if (divId === "mainDivSection4") {
		if (args.finalised) {
			saveIconDiv.className = "card-type"
			var spanText = document.createElement("span");
			spanText.innerHTML = "Finalised"

		} else {
			if (args.rejected === true) {
				saveIconDiv.className = "card-type"
				var spanText = document.createElement("span");
				spanText.innerHTML = "Rejected"

			} else if (args.sellerWithdrawn === true) {
				saveIconDiv.className = "card-type"
				var spanText = document.createElement("span");
				spanText.innerHTML = "Withdrawn"
			} else if (args.status === "NDA Recieved") {
				saveIconDiv.className = "card-type"
				var spanText = document.createElement("span");
				spanText.innerHTML = "NDA Recieved"

			} else {
				saveIconDiv.className = "card-type"
				var spanText = document.createElement("span");
				spanText.innerHTML = "Awaiting"

			}
		}


	} else {
		var spanText = document.createElement("span");
		if (args.savedByBuyer === true) {
			saveIconDiv.className = "saveIconFill"
		} else {
			saveIconDiv.className = "saveIcon"
		}

		saveIconDiv.addEventListener('click', function() {
			saveSeller(args.sellerCompanyId, reqId);
		});
		spanText.innerHTML = ""

	} saveIconDiv.append(spanText)

	var details = document.createElement("div");
	details.className = "details";

	var div = document.createElement("div");
	div.className = "info"
	var companyImage = document.createElement("div")
	companyImage.className = "companyImage";
	args.comapnyLogoUrl = 'https://upload.cnerzy.pieinfosystems.com/upload/1729074410827logo_sample.jpg'
	if (args.comapnyLogoUrl) {
		companyImage.style.borderRadius = "100%";
		companyImage.style.background = "round";
		companyImage.style.backgroundImage = "url(" + args.comapnyLogoUrl + ")";
	} else {
		companyImage.style.borderRadius = "100%";
		companyImage.style.backgroundImage = "url(assets/icons/person-blue.svg)";
	}
	var companyName = document.createElement("h6");
	companyName.className = "companyName title";
	companyName.innerHTML = args.companyName;
	var industry = document.createElement("span");
	industry.className = "industry subtitle";
	industry.innerHTML = "Industry: " + args.companyIndustry;
	var location = document.createElement("div");
	location.className = "location location-info";

	var cityState = document.createElement("p");
	cityState.className = 'cityState location-text';
	cityState.innerHTML = '<img src="assets/icons/location.svg" alt=""	class="location-icon"> ' + args.location
	var noOfProjects = document.createElement("p");
	noOfProjects.className = "noOfProjects text";
	noOfProjects.innerHTML = args.numberOfProjectsCompleted + " Projects Completed";

	location.append(cityState, noOfProjects)

	var ratingDiv = document.createElement("div");
	ratingDiv.className = "ratingDiv ratings";
	var rating = document.createElement("p");
	rating.className = "rating text";
	rating.innerHTML = args.numberOfRatings + " Ratings";
	ratingDiv.appendChild(rating);
	var starDiv = document.createElement("div");
	starDiv.className = "stars text-nowrap"
	//			for (var j = 0; j < args.numberOfRatings; j++) {
	//
	//				var star = document.createElement("i");
	//				star.className = "material-icons";
	//				star.innerHTML = "star";
	//				ratingDiv.appendChild(star);
	//			}

	starsCount = Math.floor(parseInt(args.ratings == null ? "0" : args.ratings));

	for (var j = 0; j < starsCount; j++) {
		var filledStar = document.createElement("i");
		filledStar.className = "material-icons";
		filledStar.textContent = "star";
		starDiv.append(filledStar);
	}

	// Add empty stars to make a total of 5
	for (var j = starsCount; j < 5; j++) {
		var emptyStar = document.createElement("i");
		emptyStar.className = "material-icons";
		emptyStar.textContent = "star_border";
		emptyStar.style.color = 'gray'
		starDiv.append(emptyStar);
	}
	ratingDiv.append(starDiv)
	var linkedIn;
	if (args.linkedInProfile) {
		linkedIn = document.createElement("a");
		linkedIn.className = "linkedIn link";
		linkedIn.target = "_blank";
		linkedIn.href = args.linkedInProfile ? args.linkedInProfile : ""
		linkedIn.innerHTML = args.linkedInProfile
	} else {
		linkedIn = document.createElement("span");
		linkedIn.innerHTML = ""
	}

	if (divId === "mainDivSection4") {
		if (args.rejected === true || args.sellerWithdrawn === true) {
			var buttonDiv = document.createElement("div");
			buttonDiv.className = "buttonDiv nav-btns justify-content-end w-100";
			var contact = document.createElement("button");
			contact.className = "d-none	";
			contact.innerHTML = "Let's Discuss"
			contact.addEventListener('click', function() {
				openDiscussModal(args, reqId);
			});

		}
		else if (args.status) {
			if (args.status === "Awaiting") {
				var buttonDiv = document.createElement("div");
				buttonDiv.className = "buttonDiv nav-btns justify-content-end w-100";
				var contact = document.createElement("button");
				contact.className = "d-none	";
				contact.innerHTML = "Let's Discuss"
				contact.addEventListener('click', function() {
					openDiscussModal(args, reqId, args);
				});

			} else {
				var buttonDiv = document.createElement("div");
				buttonDiv.className = "buttonDiv nav-btns justify-content-end w-100";
				// var view = document.createElement("button");
				// view.className = "view";
				// view.innerHTML = "View";
				// view.setAttribute('data-bs-toggle','modal')
				// view.setAttribute('data-bs-target','#seller-profile')

				// 					if (args.status == "NDA Received") {
				var contact = document.createElement("button");
				contact.className = "reEngage";
				contact.innerHTML = "Let's Discuss"
				indexOfId = args.sellerCompanyId
				contact.addEventListener('click', function() {
					openDiscussModal(args, reqId);
				});


			}
			if (args.ndaSendForSign) {
				contact.setAttribute("disabled", true);
			} else {

				buttonDiv.append(contact)
			}
		}

	} else if (divId === "documnetsDicuessUser") {
		var buttonDiv = document.createElement("div");
		buttonDiv.className = "buttonDiv nav-btns";
		var view = document.createElement("button");
		view.className = " btn-outlined";
		view.innerHTML = "View Profile";
		view.setAttribute('data-bs-toggle', 'modal')
		view.setAttribute('data-bs-target', '#seller-profile')
		view.onclick = function() {
			addToId(args.sellerCompanyId, "seller-profile", args);
		};
		buttonDiv.append(view)
	} else {


		var buttonDiv = document.createElement("div");
		buttonDiv.className = "buttonDiv   nav-btns ";
		var view = document.createElement("button");
		view.className = "btn-outlined";
		view.innerHTML = "View";
		view.setAttribute('data-bs-toggle', 'modal')
		view.setAttribute('data-bs-target', '#seller-profile')
		view.onclick = function() {
			addToId(args.sellerCompanyId, "seller-profile", args);
		};
		var contact = document.createElement("button");
		// var reEngage = document.createElement("button");
		// reEngage.className = "reEngage";
		// reEngage.innerHTML = "Re-Engage"
		contact.className = "reEngage";
		contact.innerHTML = "Contact"
		if (divId === "mainDivSection3" && (args.sellerWithdrawn || args.finalised || args.rejected || args.ndaSendForSign)) {
			contact.setAttribute('disabled', true)

		} else {
			contact.setAttribute('data-bs-toggle', 'modal')
			contact.setAttribute('data-bs-target', '#NDAdocument')

			contact.removeAttribute('disabled');

			contact.onclick = function() {
				sendMail(args, reqId);

			};

		}


		buttonDiv.append(view, contact)
	}


	div.append(companyImage, companyName, industry, location, ratingDiv, linkedIn)
	details.append(saveIconDiv, div, buttonDiv)
	sellerDiv.append(details, saveIconDiv);
	rowsContainer.appendChild(sellerDiv);
}
//-----------------------for fetching & showing cnerzy recommended sellers js ends-----------------

// For example, you could show a modal and set its content based on the id
// 		$('#requirement-details').modal('show');
// $('#modalContent').text("Details for ID: " + id);

function addToId(index, divId, args) {
	console.log()
	var rowData = {}
	if (divId === "seller-profile") {
		rowData = args
		$("#seller-profile .stars.text-nowrap").empty()

	} else {
		rowData = index
	}

	Object.keys(rowData).forEach(function(key) {

		var div = $("#" + divId + " #" + key);

		if (!div.length) {
			return;
		}

		var value = rowData[key] ? rowData[key] : "";
		if (divId === "seller-profile" || divId === "finalSeller") {

			if (key === "comapnyLogoUrl") {
				var img = div.find("img");
				if (value !== "") {
					img.attr("src", value);
				} else {

				}


				return
			} else if (key === "ratings") {
				div.html(value == "" ? "0 " : Math.round(parseFloat(value)) + " ");

				starsCount = value == "" ? "0 " : Math.round(parseFloat(value));
				if (divId === "seller-profile")
					var starsContainer = $("#seller-profile .rating-info .stars.text-nowrap")

				if (divId === "finalSeller")
					var starsContainer = $("#finalSeller .rating-info .stars.text-nowrap")

				starsContainer.empty()
				for (var i = 0; i < starsCount; i++) {
					var filledStar = document.createElement("i");
					filledStar.className = "material-icons active";
					filledStar.textContent = "star";
					starsContainer.append(filledStar);
				}

				// Add empty stars to make a total of 5
				for (var i = starsCount; i < 5; i++) {
					var emptyStar = document.createElement("i");
					emptyStar.className = "material-icons";
					emptyStar.textContent = "star_border";
					starsContainer.append(emptyStar);
				}
			} else if (key === "numberOfRatings") {
				div.html(value == "" ? "0 " : value + " ");
			} else if (key === "projectCaseStudies") {
				makeCaseStudy(value, divId)
			} else {
				div.html(value);
			}


		} else {
			div.html(value);
		}



	});

}

function openDiscussModal(args, reqId) {

	const user = args

	sellerId = user.sellerCompanyId
	requirementId = reqId
	replaceDiv("sellerList", "DiscussModal")
	getDocumnets(sellerId, requirementId)


	//add reqId
	console.log(requirementId, sellerId)
	var discussModalInputCid = $("#DiscussModal #addedForCid");
	var uploadLoiAndPoFormCid = $("#upload-loi-and-po-form #addedForCid ")
	var discussModalInputReqId = $("#DiscussModal #reqId");
	var uploadLoiAndPoFormReqId = $("#upload-loi-and-po-form #reqId")
	var rejectModalCid = $("#reject-modal #addedForCid ")
	var rejectModalReqId = $("#reject-modal #reqId")

	var reviewCid = $("#submitted-and-review #reqId ")



	reviewCid.val(requirementId);
	uploadLoiAndPoFormReqId.val(requirementId);
	discussModalInputReqId.val(requirementId);
	rejectModalReqId.val(requirementId)
	uploadLoiAndPoFormCid.val(sellerId);
	discussModalInputCid.val(sellerId);
	rejectModalCid.val(sellerId);
	console.log(user)
	sellerDivFunction(user, "documnetsDicuessUser")


}

function replaceDiv(replace, show) {

	$("#" + show).show();

	$("#" + replace).hide();
	if (replace === "sellerList" && show === "tableDiv") {
		sellerId = ""
		requirementId = ""
		location.reload();
	}

}


function getDocumnets(sellerId, requirementId) {



	var requestOptions = {
		method: "GET",
		headers: {
			"Content-Type": "application/json",
		}
	};

	fetch(contextPath + "/getAllChat?reqId=" + requirementId + "&addedForCid=" + sellerId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result, "alldoc");
			result = JSON.parse(result)

			makeDocumentDiv(result.messages)

		})
		.catch(error => console.error("Error:", error));

}

document.addEventListener("DOMContentLoaded", function() {
	const withdrawModal = document.querySelector('#withdraw-modal')
	const otherCheckboxField = withdrawModal.querySelector('#other');
	const otherTextCheckboxField = withdrawModal.querySelector('#otherTextBox');
	const otherText = withdrawModal.querySelector('#otherText');
	const checkboxInputs = withdrawModal.querySelectorAll('input');

	otherCheckboxField.addEventListener('click', function() {
		otherTextCheckboxField.classList.toggle('d-none');
		if (!otherTextCheckboxField.classList.contains('d-none')) {
			otherText.removeAttribute('required');
		} else {
			otherText.value = ''; // Clear the "Other" text input if the "Other" checkbox is unchecked
			showError('otherText_err', ''); // Clear the error message for "Other" text input
		}
	});

	function showError(id, errorMsg) {
		const errSpan = document.getElementById(id);
		errSpan.innerHTML = errorMsg;
	}

	function checkAtLeastOneCheckboxIsSelected() {
		let checked = false;
		for (const checkbox of checkboxInputs) {
			if (checkbox.checked) {
				checked = true;
				break;
			}
		}
		if (!checked) {
			showError('checkboxes_err', 'Please select any reason');
		} else {
			showError('checkboxes_err', '');
		}
		console.log('Any Checkbox checked-', checked);
		return checked;
	}

	function validateOtherText() {
		if (otherCheckboxField.checked && otherText.value.trim() === '') {
			showError('otherText_err', 'Brief Description is required');
			return false;
		} else {
			showError('otherText_err', '');
			return true;
		}
	}

	otherText.addEventListener('blur', function() {
		if (otherText.value.trim() === '') {
			showError('otherText_err', 'Brief Description is required');
		} else {
			showError('otherText_err', '');
		}
	})

	checkboxInputs.forEach(input => {
		input.addEventListener('change', function() {
			checkAtLeastOneCheckboxIsSelected();
		});
	});

	document.getElementById('withdraw-form').addEventListener('submit', function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		const atLeastOneCheckboxSelected = checkAtLeastOneCheckboxIsSelected();
		const otherTextValid = validateOtherText();
		if (atLeastOneCheckboxSelected && otherTextValid) {
			// Get form data
			const form = document.getElementById('withdraw-form');
			const formData = new FormData(form);

			let formDataObj = {};
			formData.forEach((value, key) => {
				formDataObj[key] = value;
			});

			let json = JSON.stringify(formDataObj);
			console.log('form-data', json);


			// Make API call with form data
		}
	});
});

document.addEventListener("DOMContentLoaded", function() {
	const rejectModal = document.querySelector('#reject-modal')
	const otherCheckboxField = rejectModal.querySelector('#other');
	const otherTextCheckboxField = rejectModal.querySelector('#otherTextBox');
	const otherText = rejectModal.querySelector('#otherText');
	const checkboxInputs = rejectModal.querySelectorAll('input');

	otherCheckboxField.addEventListener('click', function() {
		otherTextCheckboxField.classList.toggle('d-none');
		if (!otherTextCheckboxField.classList.contains('d-none')) {
			otherText.removeAttribute('required');
		} else {
			otherText.value = ''; // Clear the "Other" text input if the "Other" checkbox is unchecked
			showError('reject_modal_otherText_err', ''); // Clear the error message for "Other" text input
		}
	});

	function showError(id, errorMsg) {
		const errSpan = document.getElementById(id);
		errSpan.innerHTML = errorMsg;
	}

	function checkAtLeastOneCheckboxIsSelected() {
		let checked = false;
		for (const checkbox of checkboxInputs) {
			if (checkbox.checked) {
				checked = true;
				break;
			}
		}
		if (!checked) {
			showError('checkboxes_err', 'Please select any reason');
		} else {
			showError('checkboxes_err', '');
		}
		console.log('Any Checkbox checked-', checked);
		return checked;
	}

	function validateOtherText() {
		if (otherCheckboxField.checked && otherText.value.trim() === '') {
			showError('reject_modal_otherText_err', 'Brief Description is required');
			return false;
		} else {
			showError('reject_modal_otherText_err', '');
			return true;
		}
	}

	otherText.addEventListener('blur', function() {
		if (otherText.value.trim() === '') {
			showError('reject_modal_otherText_err', 'Brief Description is required');
		} else {
			showError('reject_modal_otherText_err', '');
		}
	})

	checkboxInputs.forEach(input => {
		input.addEventListener('change', function() {
			checkAtLeastOneCheckboxIsSelected();
		});
	});

	document.getElementById('reject-form').addEventListener('submit', function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		const atLeastOneCheckboxSelected = checkAtLeastOneCheckboxIsSelected();
		const otherTextValid = validateOtherText();
		if (atLeastOneCheckboxSelected && otherTextValid) {
			// Get form data
			const form = document.getElementById('reject-form');
			const formData = new FormData(form);

			let formDataObj = {};
			formData.forEach((value, key) => {
				formDataObj[key] = value;
			});
			let json = JSON.stringify(updateRejectionReasons(formDataObj))
			console.log('form-data', json);
			var requestOptions = {
				method: 'POST',
				headers: {
					"Content-Type": "application/json", // Assuming you need to set this header
					// Add any other headers as needed
				},
				body: json
			};
			fetch(contextPath + "/rejectSellerForReqId", requestOptions)
				.then(response => response.json())  // Parse the response as JSON
				.then(result => {


					if (result.status === 'true') {


						$("#reject-modal").modal('hide'); // Redirect to BuyersRequirementList
						$("#reject-feedback-submitted").modal('show')
						setTimeout(() => {
							window.location.href = 'BuyersRequirementList';
						}, 5000);


					} else {
						toastr.error('Something went wrong');
					}
				})
			// Make API call with form data
		}
	});
});
function updateRejectionReasons(data) {
	const rejectionReasons = [];

	// Map the JSON keys to the corresponding human-readable rejection reasons
	const reasonsMap = {
		Negotiationstage: "Negotiationstage",
		proposalLacksClarity: "Proposal Lacks Clarity",
		lackOfTechnicalCompetency: "Lack of Technical Competency",
		proposalLacsClarity: "Proposal Lacks Clarity",
		unacceptableTermsConditions: "Unacceptable Terms Conditions",
		unmetCommercialExpectations: "Unmet Commercial Expectations"
	};

	// Iterate over the keys in the reasonsMap
	for (const key in reasonsMap) {
		if (data[key] === "on") {
			if (data[key] === "other")
				return;

			rejectionReasons.push(reasonsMap[key]);
			delete data[key];  // Remove the key from the data object
		}
	}

	// Add the otherText value if the 'other' reason is 'on'
	if (data.other === "on" || data.otherText) {
		rejectionReasons.push(`${data.otherText}`);
		delete data.otherText;  // Remove the otherText key from the data object
	}

	// Remove the 'other' key from the data object
	delete data.other;

	// Join the array elements with a pipe separator and add it to the data object
	data.rejectionReason = rejectionReasons.join('|');

	return data;
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
const uploadDocumentForm = document.querySelector('#upload-document-form')
var uploadDocumentFormInputs = uploadDocumentForm.querySelectorAll('input,select');
var uploadDocumentFormErrorsArray = []
for (let input of uploadDocumentFormInputs) {
	input.addEventListener('change', function() {
		validateUploadDocumentForm(input)
	})
}

uploadDocumentForm.querySelector('.custom-file-upload-section-1').addEventListener('fileDropped', function(e) {
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
		uploadDocumentForm.querySelector('input[name="fileViaLink"]').value = null

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
		uploadDocumentForm.querySelector('input[name="file"]').value = null
	}

	console.log('errors-', uploadDocumentFormErrorsArray)
}

// validationns for upload document or link
const uploadLoiAndPoForm = document.querySelector('#upload-document-form')
var uploadLoiAndPoFormInputs = uploadLoiAndPoForm.querySelectorAll('input,select');
var uploadLoiAndPoFormErrorsArray = []
for (let input of uploadLoiAndPoFormInputs) {
	input.addEventListener('change', function() {
		validateUploadLoiAndPoForm(input)
	})
}

let uploadLoiAndPoModal = document.querySelector('#upload-loi-and-po-modal')
let sections = uploadLoiAndPoModal.querySelectorAll('.custom-file-upload-section-1')
sections.forEach((section) => {
	section.addEventListener('fileDropped', function(e) {
		// Perform validation
		for (let input of uploadDocumentFormInputs) {
			if (input.name === 'loiFile') {
				validateUploadLoiAndPoForm(input);
			} else if (input.name === 'poFile') {
				validateUploadLoiAndPoForm(input);
			}
		}
	});
})


function validateUploadLoiAndPoForm(input) {
	let errorMessage = '';

	if (input.name == 'loiFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!uploadLoiAndPoFormErrorsArray.includes(input.name)) {
					uploadLoiAndPoFormErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('loiFile_err', errorMessage)
			} else {
				uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== input.name })
				showError('loiFile_err', '')
			}
		} else {
			uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== input.name })
			showError('loiFile_err', '')
		}

		showError('loiLink_err', '')
		uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== 'loiLink' })
		uploadLoiAndPoForm.querySelector('input[name="loiLink"]').value = ''

	} else if (input.name == 'loiLink') {
		if (input.value != '') {
			const regex = /^(https?:\/\/)[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}(\/\S*)?$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!uploadLoiAndPoFormErrorsArray.includes(input.name)) {
					uploadLoiAndPoFormErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid file url';
				showError('loiLink_err', errorMessage)
			} else {
				showError('loiLink_err', '')
				uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== input.name })
			}
		} else {
			showError('loiLink_err', '')
			uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== input.name })
		}

		showError('loiFile_err', '')
		uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== 'file' })
		uploadLoiAndPoForm.querySelector('input[name="loiFile"]').value = null;
	} else if (input.name == 'poFile') {
		if (input.files[0]) {
			let res = validateFileSize(input)
			if (!res) {
				if (!uploadLoiAndPoFormErrorsArray.includes(input.name)) {
					uploadLoiAndPoFormErrorsArray.push(input.name);
				}
				errorMessage = 'File size is too large';
				showError('poFile_err', errorMessage)
			} else {
				uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== input.name })
				showError('poFile_err', '')
			}
		} else {
			uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== input.name })
			showError('poFile_err', '')
		}

		showError('poLink_err', '')
		uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== 'poLink' })
		uploadLoiAndPoForm.querySelector('input[name="poLink"]').value = ''

	} else if (input.name == 'poLink') {
		if (input.value != '') {
			const regex = /^(https?:\/\/)[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}(\/\S*)?$/;
			if (input.value.trim() == '' || !regex.test(input.value.trim())) {
				if (!uploadLoiAndPoFormErrorsArray.includes(input.name)) {
					uploadLoiAndPoFormErrorsArray.push(input.name);
				}
				errorMessage = 'Invalid file url';
				showError('poLink_err', errorMessage)
			} else {
				showError('poLink_err', '')
				uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== input.name })
			}
		} else {
			showError('poLink_err', '')
			uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== input.name })
		}

		showError('poFile_err', '')
		uploadLoiAndPoFormErrorsArray = uploadLoiAndPoFormErrorsArray.filter(function(e) { return e !== 'file' })
		uploadLoiAndPoForm.querySelector('input[name="poFile"]').value = null;
	}

	console.log('errors-', uploadLoiAndPoFormErrorsArray)
}



document.addEventListener("DOMContentLoaded", function() {
	document.getElementById('upload-document-form').addEventListener('submit', function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		if (uploadDocumentFormErrorsArray.length == 0) {
			// Get form data
			const form = document.getElementById('upload-document-form');
			const formData = new FormData(form);

			let formDataObj = {};
			formData.forEach((value, key) => {
				formDataObj[key] = value;
			});

			let json = JSON.stringify(formDataObj);
			console.log('upload-document-form-data', json);

			var requestOptions = {
				method: 'POST',

				body: formData
			};
			fetch(contextPath + "/sendDocument", requestOptions)
				.then(response => response.json())  // Parse the response as JSON
				.then(result => {


					if (result.status === 'true') {
						chooseAgain('document-upload-section')
						var discussModalInputCid = $("#DiscussModal #addedForCid");
						var uploadLoiAndPoFormCid = $("#upload-loi-and-po-form #addedForCid ")
						var discussModalInputReqId = $("#DiscussModal #reqId");
						var uploadLoiAndPoFormReqId = $("#upload-loi-and-po-form #reqId")
						var reviewInputCid = $("#submitted-and-review #addedForCid");
						var reviewCid = $("#submitted-and-review #addedForCid ")


						reviewInputCid.val(reqId)
						reviewCid.val(sellerId);

						uploadLoiAndPoFormReqId.val(requirementId);
						discussModalInputReqId.val(requirementId);

						uploadLoiAndPoFormCid.val(sellerId);
						discussModalInputCid.val(sellerId);

						getDocumnets(sellerId, requirementId)
						toastr.success('Sucessfully Updated The Documents');


					} else {
						toastr.error('Something went wrong');
					}
				})
		} else {
			console.log('Please check errors', uploadDocumentFormErrorsArray)
		}
	});

	document.getElementById('upload-loi-and-po-modal').addEventListener('submit', function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		if (uploadLoiAndPoFormErrorsArray.length == 0) {
			// Get form data
			const form = document.getElementById('upload-loi-and-po-form');
			const button = document.querySelector('#upload-loi-and-po-form .btn-save');

			// Disable the button
			button.disabled = true;

			// Add the disabled-button class to apply additional styles
			button.classList.add('disabled-button');
			const formData = new FormData(form);

			let formDataObj = {};
			formData.forEach((value, key) => {
				formDataObj[key] = value;
			});

			let json = JSON.stringify(formDataObj);
			console.log('upload-loi-and-po-form', json);

			var requestOptions = {
				method: 'POST',

				body: formData
			};
			fetch(contextPath + "/finalizeSellerForReqId", requestOptions)
				.then(response => response.json())  // Parse the response as JSON
				.then(result => {

					button.disabled = false;

					// Remove the disabled-button class
					button.classList.remove('disabled-button');
					if (result.isSellerFinalized === 'true') {

						chooseAgain('loi-upload-section')
						chooseAgain('po-upload-section')
						var discussModalInputCid = $("#DiscussModal #addedForCid");
						var uploadLoiAndPoFormCid = $("#upload-loi-and-po-form #addedForCid ")
						var discussModalInputReqId = $("#DiscussModal #reqId");
						var uploadLoiAndPoFormReqId = $("#upload-loi-and-po-form #reqId")
						var reviewInputCid = $("#submitted-and-review #addedForCid");
						var reviewCid = $("#submitted-and-review #addedForCid ")

						reviewInputCid.val(requirementId)
						reviewCid.val(sellerId);

						uploadLoiAndPoFormReqId.val(requirementId);
						discussModalInputReqId.val(requirementId);

						uploadLoiAndPoFormCid.val(sellerId);
						discussModalInputCid.val(sellerId);
						getDocumnets(sellerId, requirementId)
						toastr.success('Sucessfully Updated The Details');
						$("#upload-loi-and-po-modal").modal('hide')

						if (ShortlistedSellerCount > 1) {
							makeRow(requirementId, sellerId)
							$("#submitted-and-review").modal('show');
						} else {
							$("#project-initiated").modal("show")
							setTimeout(() => {
								window.location.href = 'project';
							}, 5000);
						}


						//						makeRow(reqId)

					} else {
						toastr.error('Something went wrong');
					}
				})


		} else {
			console.log('Please check errors', uploadLoiAndPoFormErrorsArray)
		}
	});
})
function makeRow(args, sellerId) {

	var parentRow = $("#sellers-row");

	fetch(contextPath + "/getShortlistedSellerListByReqId?reqId=" + args)
		.then(response => response.json())
		.then(data => {
			// Process the fetched data
			console.log("Data fetched:", data);

			// Clear existing content in parentRow, if needed
			parentRow.empty();
			id = 0;
			// Loop through the data array to create cards dynamically
			data.forEach(item => {
				if (item.finalised)
					return;
				// Construct the HTML content for each card dynamically
				var content = `
                    <div class="col-12 col-sm-12 col-md-12 col-lg-6">
                        <div class="card-style-4">
                         <form id="formFor${item.id}" class="smaller-form">
                            <div class="card-header">
                           			<input name="addedForCid" id="addedForCid" value="${item.sellerCompanyId}" hidden>
									<input name="reqId" id="reqId" value="${args}" hidden>
					
                                <div class="icon-box" style="flex:1">
                                    <img class="icon" style="width:100%" src="${item.comapnyLogoUrl}" alt="">
                                </div>
                                <div class="info" style="flex:1">
                                    <h6 class="title">${item.companyName}</h6>
                                    <span class="subtitle">Industry: ${item.companyIndustry}</span>
                                </div>
                            </div>
                            <div class="card-body mt-16">
                                <div class="checkbox-field-group mb-8 d-flex">
                                    <input type="checkbox" name="Negotiationstage" id="Negotiationstage_${id}" class="mr-8" autocomplete="off">
                                    <label for="Negotiationstage_${id}">Negotiation stage</label>
                                </div>
                                <div class="checkbox-field-group mb-8 d-flex">
                                    <input type="checkbox" name="lackOfTechnicalCompetency" id="lackOfTechnicalCompetency_${id}" class="mr-8" autocomplete="off">
                                    <label for="lackOfTechnicalCompetency_${id}">Lack of technical competency</label>
                                </div>
                                <div class="checkbox-field-group mb-8 d-flex">
                                    <input type="checkbox" name="proposalLacksClarity" id="proposalLacksClarity_${id}" class="mr-8" autocomplete="off">
                                    <label for="proposalLacksClarity_${id}">Proposal lacks clarity</label>
                                </div>
                                <div class="checkbox-field-group mb-8 d-flex">
                                    <input type="checkbox" name="unacceptableTermsConditions" id="unacceptableTermsConditions_${id}" class="mr-8" autocomplete="off">
                                    <label for="unacceptableTermsConditions_${id}">Unacceptable terms and conditions</label>
                                </div>
                                <div class="checkbox-field-group mb-8 d-flex">
                                    <input type="checkbox" name="unmetCommercialExpectations" id="unmetCommercialExpectations_${id}" class="mr-8" autocomplete="off">
                                    <label for="unmetCommercialExpectations_${id}">Unmet commercial expectations</label>
                                </div>
                                <div class="checkbox-field-group d-flex">
                                    <input type="checkbox" name="other" id="other" class="mr-8" autocomplete="off">
                                    <label for="other">Other</label>
                                </div>
                                <span class="err-text" id="checkboxes_err"></span>
                                <div class="field-group textarea-field-group-1 mt-16 d-none" id="otherTextBox">
                                    <textarea name="otherText" id="otherText" class="input-field" placeholder="Brief Description here..." cols="100"></textarea>
                                    <span id="reject_modal_otherText_err" class="err-text"></span>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>`;

				// Append the constructed content to parentRow
				parentRow.append(content);
				id++
			});
			let sellersRow = document.querySelector('#sellers-row')
			let sellers = sellersRow.querySelectorAll('.card-style-4')
			sellers.forEach(seller => {
				const otherCheckboxField = seller.querySelector('#other');
				const otherTextCheckboxField = seller.querySelector('#otherTextBox');
				const otherText = seller.querySelector('#otherText');
				const checkboxInputs = seller.querySelectorAll('input');

				otherCheckboxField.addEventListener('click', function() {
					otherTextCheckboxField.classList.toggle('d-none');
					if (!otherTextCheckboxField.classList.contains('d-none')) {
						// otherText.removeAttribute('required');
					} else {
						otherText.value = ''; // Clear the "Other" text input if the "Other" checkbox is unchecked
						showError('otherText_err', ''); // Clear the error message for "Other" text input
					}
				});
			})
		})
		.catch(error => {
			console.error('Error fetching data:', error);
		});
}
// Function to convert FormData to plain JavaScript object
function getFormDataObject(formData) {
	let formDataObj = {};
	formData.forEach((value, key) => {
		formDataObj[key] = value;
	});
	return formDataObj;
}

document.getElementById('submitted-and-review').addEventListener('submit', function(e) {
	e.preventDefault(); // Prevent default form submission behavior

	// Get form data from the larger form (submitted-and-review-form)
	const form = document.getElementById('submitted-and-review-form');
	const formData = new FormData(form);

	// Get all smaller forms within the larger form
	const smallerForms = form.querySelectorAll('.smaller-form');

	// Initialize an array to store processed smaller form data
	const processedData = [];
	const apiCallPromises = [];

	// Iterate over each smaller form
	smallerForms.forEach((smallerForm, index) => {
		const smallerFormData = new FormData(smallerForm);

		// Transform FormData to JSON object and update rejection reasons
		const updatedFormData = updateRejectionReasons(getFormDataObject(smallerFormData));

		// Log the updated form data
		console.log(`Data for smaller form ${index + 1}:`, updatedFormData);

		// Push the updated form data to the array
		processedData.push(updatedFormData);

		// Prepare request options for fetch API
		var requestOptions = {
			method: 'POST',
			body: JSON.stringify(updatedFormData), // Convert JavaScript object to JSON string
			headers: {
				'Content-Type': 'application/json'
			}
		};

		// Push the promise for the API call into the array
		apiCallPromises.push(
			fetch(contextPath + "/rejectSellerForReqId", requestOptions)
				.then(response => response.json())
				.then(result => {
					console.log(`API Response for smaller form ${index + 1}:`, result);
					// Handle success response as needed
				})
				.catch(error => {
					console.error(`API Error for smaller form ${index + 1}:`, error);
					// Handle error response as needed
				})
		);
	});

	// Execute all API call promises
	Promise.all(apiCallPromises)
		.then(() => {
			console.log('All API calls completed.');


			$("#submitted-and-review").modal('hide');
			$("#project-initiated").modal("show")

		})
		.catch(err => {
			console.error('Error in one or more API calls:', err);
			// Handle errors in API calls
		});
});

// Function to convert FormData to plain JavaScript object
function getFormDataObject(formData) {
	let formDataObj = {};
	formData.forEach((value, key) => {
		formDataObj[key] = value;
	});
	return formDataObj;
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
function saveSeller(sellerId, reqId) {
	document.getElementById('mainDivSection3').style.display = 'none';
	document.getElementById('skeletonContainer').style.display = 'grid';
	// Initialize with 2 skeleton cards
	renderSkeletons(5);
	var requestOptions = {
		method: "POST",
		headers: {
			"Content-Type": "application/json", // Assuming you need to set this header
			// Add any other headers as needed
		},
		body: JSON.stringify({
			reqId: reqId,
			sellerCompanyId: sellerId,

		})
	};

	fetch(contextPath + "/saveSellerForReqId", requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result, "alldoc");
			result = JSON.parse(result)
			tabsApi(reqId, 'tab-2')
			setTimeout(() => {
				document.getElementById('mainDivSection3').style.display = 'block';
				document.getElementById('skeletonContainer').style.display = 'none';
			}, 2000);



		})
		.catch(error => console.error("Error:", error));

}
function createSkeletonCard() {
	return `
                <div class="card-skeleton">
                    <div class="card-header">
                        <div class="logo-skeleton skeleton"></div>
                        <div class="bookmark-skeleton skeleton"></div>
                    </div>
                    <div class="title-skeleton skeleton"></div>
                    <div class="industry-skeleton skeleton"></div>
                    <div class="location-skeleton skeleton"></div>
                    <div class="stars-container">
                        ${Array(5).fill('<div class="star-skeleton skeleton"></div>').join('')}
                    </div>
                    <div class="buttons-container">
                        <div class="button-skeleton skeleton"></div>
                        <div class="button-skeleton skeleton"></div>
                    </div>
                </div>
            `;
}

function renderSkeletons(count = 2) {
	const container = document.getElementById('skeletonContainer');
	const skeletons = Array(count).fill(createSkeletonCard()).join('');
	container.innerHTML = skeletons;
}



function sendMail(sellerId, reqId) {
	var requestOptions = {
		method: "POST",


	};

	fetch(contextPath + "/buyerContactSeller?reqId=" + reqId + "&sellerId=" + sellerId.sellerCompanyId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			console.log(result, "alldoc");
			result = JSON.parse(result)
			tabsApi(reqId, 'tab-2')


		})
		.catch(error => console.error("Error:", error));

}
function makeCaseStudy(args, parentId) {
	var parent = $("#" + parentId + " #projectCaseStudies");
	parent.empty();
	for (var i = 0; i < args.length; i++) {
		var content = `
           <div class="mr-16">
               <div class="file case-study" style="    cursor: pointer;" data-url="${args[i].pdfUrl}">CaseStudy ${i + 1}</div>
           </div>`;
		parent.append(content);
	}

	// Attach click event to each case study
	$(".case-study").on('click', function() {
		var url = $(this).data('url');
		window.open(url, '_blank');
	});
}
function openTimeLine(row) {
	requirementId = row.id;

	const requestOptions = {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json'
		}
	};

	fetch(contextPath + "/getTimelineByReqId?reqId=" + requirementId, requestOptions)
		.then(response => response.text())
		.then(result => {
			result = JSON.parse(result);
			console.log(result)

			$("#PMDiv").show();
			$("#InitiateProject").show();
			$("#projectManager-appoint-button").hide();
			$("#projectManager-appoint").hide();
			$("#timeline").modal("show");
			$("#timeline #projectId").html(row.requirementNo);

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

// Ensure the DOM is fully loaded before running the script
document.addEventListener('DOMContentLoaded', function() {
	// Your code to trigger openTimeLine function, e.g., attaching event listeners to buttons
});
