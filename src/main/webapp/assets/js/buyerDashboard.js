$('#seller-profile').on('show.bs.modal', function (e) {
	console.log('Modal is about to be shown');
}).on('hidden.bs.modal', function (e) {
	console.log('Modal is now hidden');
});

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

fetch(contextPath + "/getBuyerAllRequirementList", requestOptions)
	.then(response => response.text())
	.then(result => {
		const userListJson = JSON.parse(result);
		console.log(userListJson, "count");

		const statusCounts = countStatuses(userListJson.data);
		console.log(statusCounts);

		updateCounts(statusCounts);
	})
	.catch(error => console.error("Error:", error));



fetch(contextPath + "/getPreviousEngagedSellerList", requestOptions)
	.then((response) => response.text())
	.then(result => {
		console.log(result);
		userListJson = JSON.parse(result)
		console.log(userListJson);
		sellerDivFunction(userListJson.data)

	})
	.catch(error => console.error("Error:", error));





//Function to count the occurrences of each status
function countStatuses(data) {
	const statusCounts = {
		APPROVED: 0,
		REJECTED: 0,
		IN_REVIEW: 0,
		TOTAL: data.length
	};

	data.forEach(item => {
		switch (item.status) {
			case 'REJECTED':
				statusCounts.REJECTED++;
				break;
			case 'POSTED':
				statusCounts.IN_REVIEW++;
				break;

			default:
				statusCounts.APPROVED++;
				break;
		}
	});

	return statusCounts;
}

// Function to update the HTML with the counts
function updateCounts(statusCounts) {
	document.getElementById('total-requirements').textContent = statusCounts.TOTAL;
	document.getElementById('in-review').textContent = statusCounts.IN_REVIEW;
	document.getElementById('posted').textContent = statusCounts.APPROVED;
	document.getElementById('rejected').textContent = statusCounts.REJECTED;
}



var projectCurrentPage = 1;
var projectRowsPerPage = 5;


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
				console.log(timelineStatusCache, "sdfsdfsd")
				callback(result);

			})
			.catch(error => console.error("Error:", error));
	}

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
		console.log(event, timestamp)
		if (timestamp !== null && timestamp > mostRecentTimestamp) {
			mostRecentTimestamp = timestamp;
			mostRecentEvent = event;
		}
	}

	return mostRecentEvent;
}

function updateStatusElement(statusElement, statusText) {
	console.log('---->', statusElement, statusText)
	switch (statusText) {
		case 'Requirement Posted':
			statusElement.className = "status posted";
			statusElement.innerHTML = 'Posted';
			break;
		case 'Requirement Approved':
			statusElement.className = "status approved";
			statusElement.innerHTML = 'Approved';
			break;
		case 'Sellers Intimated':
			statusElement.className = "status sellers-intimated";
			statusElement.innerHTML = 'Sellers Intimated';
			break;
		case 'Contract/ Purchase Order Issued':
			statusElement.className = "status contract";
			statusElement.innerHTML = 'Contract/PO';
			break;
		case 'Discussion Phase':
			statusElement.className = "status discussion";
			statusElement.innerHTML = 'Discussion';
			break;
		case 'Project Kick-off':
			statusElement.className = "status kick-off";
			statusElement.innerHTML = 'Kick-off';
			break;
		case 'Project Execution':
			statusElement.className = "status execution";
			statusElement.innerHTML = 'In Execution';
			break;
		case 'Project Completion':
			statusElement.className = "status delivered";
			statusElement.innerHTML = 'Delivered';
			break;
		case 'Review & Feedback':
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

var sellerCurrentPage = 1;
var sellerRowsPerPage = 3;

//for recommended sellers
function sellerDivFunction(args) {
	var table = document.getElementById("mainDivSection3");
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
		table.style.height = "100%"
		rowsContainer.innerHTML = ""; // Clear existing rows
		$("#mainDivSection3  #pagination").css("display", "none");

		$("#mainDivSection3 #NoData").css("display", "flex");

	} else {


		for (let i = 0; i < args.length; i++) {
			makeSellerRows(args[i], i, rowsContainer)
		}



	}
}
function makeSellerRows(args, i, rowsContainer) {
	var sellerDiv = document.createElement("div");
	sellerDiv.className = "sellerDiv custom-view-seller-modal card-style-2";
	var saveIconDiv = document.createElement("div");



	var details = document.createElement("div");
	details.className = "details";

	var div = document.createElement("div");
	div.className = "info"
	var companyImage = document.createElement("div")
	companyImage.className = "companyImage";

	if (args.comapnyLogoUrl) {
		companyImage.style.borderRadius = "100%";
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
	rating.className = "rating text m-0";
	if (args.ratings % 1 !== 0) {
		// Extract the decimal part
		var decimalPart = args.ratings % 1;

		// If the decimal part is less than 0.5, round down, otherwise round up
		args.ratings = decimalPart < 0.5 ? Math.floor(args.ratings) : Math.ceil(numOfRatings);
	}
	rating.innerHTML = args.ratings + " Ratings";
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

	starsCount = Math.floor(parseInt(args.ratings));

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




	var buttonDiv = document.createElement("div");
	buttonDiv.className = "buttonDiv   nav-btns ";
	var view = document.createElement("button");
	view.className = "btn-outlined";
	view.innerHTML = "View";

	view.onclick = function () {
		console.log("Button clicked, attempting to open modal");
		var modalElement = document.getElementById("seller-profile");

		if (modalElement) {
			console.log("Modal element found:", modalElement);
			addToId(args.sellerCompanyId, "seller-profile", args);
			console.log("Modal should open now");
			$("#seller-profile").modal("show")
		} else {
			console.error("Modal element not found, cannot open modal.");
		}
	};

	var contact = document.createElement("button");
	// var reEngage = document.createElement("button");
	// reEngage.className = "reEngage";
	// reEngage.innerHTML = "Re-Engage"
	contact.className = "reEngage";
	contact.innerHTML = "Re-Engage"
	contact.onclick = function () {
		params = {
			id: args.sellerCompanyId,
			name: args.companyName,

		};

		redirectToWithParams(contextPath + "/postRequirement", params)
	};



	buttonDiv.append(view, contact)

	div.append(companyImage, companyName, industry, location, ratingDiv, linkedIn)
	details.append(saveIconDiv, div, buttonDiv)
	sellerDiv.append(details, saveIconDiv);


	rowsContainer.appendChild(sellerDiv);
}

function addToId(index, divId, args) {

	var rowData = {}
	if (divId === "seller-profile") {
		rowData = args
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
	redirectToWithParams(contextPath + "/BuyersRequirementList", params)
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