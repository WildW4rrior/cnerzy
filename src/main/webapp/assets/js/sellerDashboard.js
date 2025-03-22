
function openTimeLine(row, result) {


	var allTimelineItems;
	var timelineContainer;
	if (row) {
		projectId = row.id;
		$("#timeline").modal("show");
		$("#timeline #projectId").html(row.reqUniqueCode);
		timelineContainer = document.querySelector('.modal #timelineContent');
		allTimelineItems = timelineContainer.querySelectorAll('.timeline .timeline-item');

	} else {
		timelineContainer = document.querySelector('#insideTabs #timelineContent');
		allTimelineItems = timelineContainer.querySelectorAll('#insideTabs .timeline-item');
	}

	const timelineData = result;

	const now = new Date();
	allTimelineItems.forEach(item => {
		item.classList.remove('completed');

		const dateElement = item.querySelector('.date');
		dateElement.innerHTML = ''; // Clear the content inside the date element
	});

	Object.keys(timelineData).forEach(key => {
		const itemDate = timelineData[key] ? new Date(timelineData[key]) : null;
		if (itemDate) {
			const diffTime = now - itemDate;
			const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24)); // Use floor to count complete days
			console.log(key);
			const timelineItem = timelineContainer.querySelector(`[data-key="${key}"]`);
			if (timelineItem) {
				const dateElement = timelineItem.querySelector('.date');
				dateElement.innerHTML = `${itemDate.toDateString()}<br>(${diffDays} days ago)`;

				if (itemDate <= now) {
					timelineItem.classList.add('completed');
				}
			}
		}
	});

}


const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");


var requestOptions = {
	method: "GET",
	headers: myHeaders,

	redirect: "follow"
};

// Fetch the data from the server
fetch(contextPath + "/getSellerRequirementList", requestOptions)
	.then(response => response.text())
	.then(result => {
		const userListJson = JSON.parse(result);

		const statusCounts = countStatuses(userListJson);

		// Update the HTML with the counts
		updateCounts(statusCounts);
	})
	.catch(error => console.error("Error:", error));






function countStatuses(data) {
	const statusCounts = {
		WON: 0,
		LOST: 0,
		INTERESTED: 0,
		IN_REVIEW: 0,
		TOTAL: data.length
	};

	data.forEach(item => {
		switch (item.status) {
			case 'Won':
				statusCounts.WON++;
				break;
			case 'Lost':
				statusCounts.LOST++;
				break;
			case 'Interested':
				statusCounts.INTERESTED++;
				break;
			default:
				statusCounts.IN_REVIEW++;
				break;
		}
	});

	return statusCounts;
}

// Function to update the HTML with the counts
function updateCounts(statusCounts) {
	document.getElementById('total-requirements').textContent = statusCounts.TOTAL;
	document.getElementById('interested').textContent = statusCounts.INTERESTED;
	document.getElementById('in-review').textContent = statusCounts.IN_REVIEW;
	document.getElementById('won').textContent = statusCounts.WON;
	document.getElementById('lost').textContent = statusCounts.LOST;
}



var projectCurrentPage = 1;
var projectRowsPerPage = 5;

var timelineStatusCache = {};
function fetchTimelineStatus(data, callback) {

	if (timelineStatusCache[data.reqUniqueCode]) {
		callback(timelineStatusCache[data.reqUniqueCode]);
	} else {
		// Simulate API call
		const requestOptions = {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json'
			}
		};
		fetch(contextPath + "/getTimelineForDashboard?projectId=" + data.id + "&reqId=" + data.reqId, requestOptions)
			.then((response) => response.text())
			.then(result => {

				result = JSON.parse(result);
				timelineStatusCache[data.reqUniqueCode] = result;
				callback(result);

			})
			.catch(error => console.error("Error:", error));
	}

}
function makingRows(data) {
	var table = document.getElementById("table");
	var rowsContainer = table.querySelector(".rows-container");
	if (!rowsContainer) {
		rowsContainer = document.createElement("div");
		rowsContainer.className = "rows-container";
		table.appendChild(rowsContainer);
	} else {
		rowsContainer.innerHTML = ""; // Clear existing rows
	}


	var startIndex = (projectCurrentPage - 1) * projectRowsPerPage;
	var endIndex = startIndex + projectRowsPerPage;

	if (data.length === 0) {
		$(".projects #table").css("display", "none");
		$(".projects #pagination").css("display", "none");

		$(".projects #NoData").css("display", "flex");
	} else {



		for (var i = startIndex; i < endIndex && i < data.length; i++) {
			makeTableRow(data[i], i, rowsContainer)
		}
	}
	renderPagination(data, ".projects #pagination", ".projects #pagination #paginationBotton", projectRowsPerPage, projectCurrentPage);
}
function makeTableRow(args, i, rowsContainer) {
	var div = document.createElement("div");
	div.className = "ROW";

	var sno = document.createElement("p");
	sno.className = "sno";
	sno.innerHTML = i + 1;

	var projectId = document.createElement("p");
	projectId.className = "projectId";
	projectId.innerHTML = args.reqUniqueCode;
	projectId.onclick = function () {
		params = {
			ProjectName: args.reqUniqueCode,

		};
		redirectToWithParams(contextPath + "/project", params)
	};

	var timeline = document.createElement("p");
	timeline.className = "timeline";
	timeline.innerHTML = "View";


	var statusDiv = document.createElement("div");
	statusDiv.className = "statusDiv";
	var status = document.createElement("p");


	status.innerHTML = args.status;

	statusDiv.appendChild(status);
	div.append(sno, projectId, timeline, statusDiv);

	rowsContainer.appendChild(div);
	fetchTimelineStatus(args, function (timelineData) {
		timeline.innerHTML = "View";
		timeline.onclick = function () {
			openTimeLine(args, timelineData);
			console.log(timelineData);
		};
		var recentStatus = determineMostRecentStatus(timelineData);

		updateStatusElement(status, recentStatus);

	});

}
function determineMostRecentStatus(timelineData) {
	var mostRecentEvent = null;
	var mostRecentTimestamp = -Infinity;

	for (var event in timelineData) {
		var timestamp = timelineData[event];
		if (timestamp !== null && timestamp > mostRecentTimestamp) {
			mostRecentTimestamp = timestamp;
			mostRecentEvent = event;
		}
	}

	return mostRecentEvent;
}

function updateStatusElement(statusElement, statusText) {

	// statusElement.className = "status";
	// statusElement.innerHTML = statusText;

	console.log(statusElement, statusText)
	switch (statusText.toLowerCase()) {
		case 'project kick-off':
			statusElement.className = "status kick-off";
			statusElement.innerHTML = 'Kick-off';
			break;
		case "purchase_order_release":
			statusElement.className = "status contract";
			statusElement.innerHTML = 'Contract/PO';
			break;
		case 'negotiations':
			statusElement.className = "status negotiation";
			statusElement.innerHTML = 'Negotiation';
			break;
		case 'discussion phase':
			statusElement.className = "status discussion";
			statusElement.innerHTML = 'Discussion';
			break;
		case 'project execution':
			statusElement.className = "status execution";
			statusElement.innerHTML = 'In Execution';
			break;
		case 'project completion':
			statusElement.className = "status delivered";
			statusElement.innerHTML = 'Delivered';
			break;
		case 'review & feedback':
			statusElement.className = "status feedback";
			statusElement.innerHTML = 'Feedback';
			break;
		default:
			statusElement.className = "status";
			statusElement.innerHTML = statusText;
	}
}
function renderPagination(data, paginationSelector, paginationButtonSelector, rowsPerPage, currentPage) {
	const totalPages = Math.ceil(data.length / rowsPerPage);
	const pagination = document.querySelector(paginationSelector);
	const paginationButton = document.querySelector(paginationButtonSelector);
	paginationButton.innerHTML = ""; // Clear existing pagination buttons

	// Create pagination container
	const container = document.createElement("div");
	container.className = "pagination";

	// Create left arrow
	const prevBtn = document.createElement("button");
	prevBtn.id = "prevBtn";
	prevBtn.innerHTML = "&lt;";
	prevBtn.disabled = currentPage === 1;
	prevBtn.onclick = function () {
		if (currentPage > 1) {
			currentPage--;
			if (rowsPerPage == 5) {
				projectCurrentPage--
				makingRows(data);
			} else if (rowsPerPage == 3) {
				sellerCurrentPage--
				sellerDivFunction(sellerData);
			}
			renderPagination(data, paginationSelector, paginationButtonSelector, rowsPerPage, currentPage);
		}
	};
	container.appendChild(prevBtn);

	// Create current page button
	const currentBtn = document.createElement("button");
	currentBtn.className = "current";
	currentBtn.textContent = currentPage;
	container.appendChild(currentBtn);

	// Create right arrow
	const nextBtn = document.createElement("button");
	nextBtn.id = "nextBtn";
	nextBtn.innerHTML = "&gt;";
	nextBtn.disabled = currentPage === totalPages;
	nextBtn.onclick = function () {
		if (currentPage < totalPages) {
			currentPage++;
			if (rowsPerPage == 5) {
				projectCurrentPage++
				makingRows(data);
			} else if (rowsPerPage == 3) {
				sellerCurrentPage++
				sellerDivFunction(sellerData);
			}
			renderPagination(data, paginationSelector, paginationButtonSelector, rowsPerPage, currentPage);
		}
	};
	container.appendChild(nextBtn);

	// Create page info
	const pageInfo = document.createElement("span");
	pageInfo.className = "pagination-info";
	pageInfo.textContent = `of ${totalPages}`;
	container.appendChild(pageInfo);

	paginationButton.appendChild(container);

	// Update page info in the pagination div
	const pageInfoDiv = pagination.querySelector("#page-info") || document.createElement("div");
	pageInfoDiv.id = "page-info";
	//    pageInfoDiv.textContent = `Page ${currentPage} out of ${totalPages}`;
	//    if (!pagination.contains(pageInfoDiv)) {
	//        pagination.appendChild(pageInfoDiv);
	//    }
}


function addToId(index, divId, args) {
	console.log()
	var rowData = {}
	if (divId === "seller-profile") {
		rowData = args.find(seller => seller.sellerCompanyId === index);
		$("#seller-profile .stars.text-nowrap").empty()

	} else {
		rowData = index
	}

	Object.keys(rowData).forEach(function (key) {

		var div = $("#" + divId + " #" + key);

		if (!div.length) {
			return;
		}

		var value = rowData[key] ? rowData[key] : "";
		if (divId === "seller-profile") {

			if (key === "comapnyLogoUrl") {
				var img = div.find("img");
				if (value !== "") {
					img.attr("src", value);
				} else {
					img.css("display", "none");
				}


				return
			} else if (key === "ratings") {
				div.html(value == "" ? "0 " : value + " ");

				starsCount = value == "" ? "0 " : Math.round(parseFloat(value));
				if (divId === "seller-profile")
					var starsContainer = $("#seller-profile .rating-info .stars.text-nowrap")

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
var params;
function fillterRequirement(args) {
	params = {
		fillter: args,
	};
	redirectToWithParams(contextPath + "/RFQs", params)
}
function redirectToWithParams(baseUrl, params) {
	try {
		// Create a new URL object
		const url = new URL(baseUrl, window.location.origin); // Ensure it's a valid URL

		// Append each parameter to the URL
		Object.keys(params).forEach(key => url.searchParams.append(key, params[key]));

		// Redirect to the constructed URL
		window.location.href = url.toString();
	} catch (error) {
		console.error("Invalid URL:", error);
	}
}


function makeCaseStudy(args, parentId) {
	var parent = $("#" + parentId + " #projectCaseStudies");
	parent.empty();
	for (var i = 0; i < args.length; i++) {
		var content = '<div class="mr-16">  <div class="file case-study" style="    cursor: pointer;" data-url="' + args[i].pdfUrl + '">CaseStudy ' + i + 1 + '</div></div>'
		parent.append(content);
	}

	// Attach click event to each case study
	$(".case-study").on('click', function () {
		var url = $(this).data('url');
		window.open(url, '_blank');
	});
}