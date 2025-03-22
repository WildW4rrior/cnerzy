
function openTimeLine(row, timelineData) {



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


function callData() {

	var myHeaders = new Headers();
	myHeaders.append("Content-Type", "application/json");


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

			const userListJson = JSON.parse(result);
			console.log(userListJson, "count");

			const statusCounts = countStatusesForRfq(userListJson);
			const projectCounts = countStatusesForProject(data)
			console.log(statusCounts);

			// Update the HTML with the counts
			updateCounts(statusCounts, projectCounts);

		})
		.catch(error => console.error("Error:", error));



}

//Function to count the occurrences of each status
function countStatusesForRfq(data) {
	const statusCounts = {
		APPROVED: 0,
		REJECTED: 0,
		IN_REVIEW: 0,
		TOTAL: data.length
	};

	data.forEach(item => {
		switch (item.status) {

			case 'Won':
				statusCounts.APPROVED++;
				break;

			case 'Rejected':
				statusCounts.REJECTED++;
				break;

			case 'Seller Intimation':
				statusCounts.APPROVED++;
				break;
			case 'In Review':
				statusCounts.IN_REVIEW++;
				break;
			default:

				break;
		}
	});

	return statusCounts;
}
function countStatusesForProject(data) {
	const statusCounts = {
		ACTIVE: 0,
		COMPLETED: 0,
		TOTAL: data.length
	};

	data.forEach(item => {
		switch (item.status) {
			case "Completed":
				statusCounts.COMPLETED++;
				break;
			case "In Review":
				statusCounts.ACTIVE++;
				break;
			default:
				statusCounts.IN_REVIEW++;
				break;
		}
	});

	return statusCounts;
}
function countStatusesForRegistration(data) {
	const statusCounts = {
		SELLER: { total: 0, In_Review: 0, Approved: 0, Rejected: 0, On_Hold: 0 },
		BUYER: { total: 0, In_Review: 0, Approved: 0, Rejected: 0, On_Hold: 0 },
		PM: { total: 0, In_Review: 0, Approved: 0, Rejected: 0, On_Hold: 0 },
		TOTAL: data.length
	};

	data.forEach(item => {
		const { userRole, status } = item;

		if (statusCounts[userRole]) {
			statusCounts[userRole].total++;

			switch (status) {
				case "inReview":
					statusCounts[userRole].In_Review++;
					break;
				case "approved":
					statusCounts[userRole].Approved++;
					break;
				case "rejected":
					statusCounts[userRole].Rejected++;
					break;
				case "onHold":
					statusCounts[userRole].On_Hold++;
					break;
				default:
					break;
			}
		}
	});

	return statusCounts;
}
// Function to update the HTML with the counts
function updateCounts(statusCounts, data) {
	document.getElementById('total-requirements').textContent = statusCounts.TOTAL;
	document.getElementById('in-review').textContent = statusCounts.IN_REVIEW;
	document.getElementById('Approved').textContent = statusCounts.APPROVED;
	document.getElementById('rejected').textContent = statusCounts.REJECTED;
	document.getElementById('allProjects').textContent = data.TOTAL;
	document.getElementById('activeProjects').textContent = data.ACTIVE;
	document.getElementById('completedProjects').textContent = data.COMPLETED;

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

	for (var i = startIndex; i < endIndex && i < data.length; i++) {

		makeProjectRows(data[i], i, rowsContainer)
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
function makeProjectRows(data, i, rowsContainer) {
	var div = document.createElement("div");
	div.className = "ROW";

	var sno = document.createElement("p");
	sno.className = "sno";
	sno.innerHTML = i + 1;

	var projectId = document.createElement("p");
	projectId.className = "projectId";
	projectId.innerHTML = data.reqUniqueCode;
	projectId.onclick = function () {
		var params = {
			ProjectName: data.reqUniqueCode,
		};
		redirectToWithParams(contextPath + "/project", params);
	};

	var timeline = document.createElement("p");
	timeline.className = "timeline";
	timeline.innerHTML = "Loading...";

	var statusDiv = document.createElement("div");
	statusDiv.className = "statusDiv";
	var status = document.createElement("p");

	status.innerHTML = data.status;

	statusDiv.appendChild(status);
	div.append(sno, projectId, timeline, statusDiv);

	rowsContainer.appendChild(div);

	fetchTimelineStatus(data, function (timelineData) {
		timeline.innerHTML = "View";
		timeline.onclick = function () {
			openTimeLine(data, timelineData);
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
	console.log(statusText, statusElement)
	// statusElement.className = "status";
	// statusElement.innerHTML = statusText;
	switch (statusText) {
		case 'Discussion Phase':
			statusElement.className = "status discussion";
			statusElement.innerHTML = 'Discussion';
			break;
		case 'Project Execution':
			statusElement.className = "status execution";
			statusElement.innerHTML = 'In Execution';
			break;
		case 'Project Kick-off':
			statusElement.className = "status kick-off";
			statusElement.innerHTML = 'Kick-off';
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

document.addEventListener('DOMContentLoaded', () => {
	const dropdownItems = document.querySelectorAll('.dropdown-menu .dropdown-item');
	const summarySection = document.querySelector('#summary');

	const data = countStatusesForRegistration(registrationData)
	console.log(data)

	dropdownItems.forEach(item => {
		item.addEventListener('click', () => {
			let role = item.textContent.trim();
			if (role === 'Select') return;

			// Ensure role is uppercase for matching the data keys
			const roleKey = role.toUpperCase();

			const counts = data[roleKey] || { total: 0, In_Review: 0, Approved: 0, Rejected: 0, On_Hold: 0 };

			// Modify the role for display if needed
			switch (roleKey) {
				case "SELLER":
					role = "Seller's";
					url = "seller"
					break;
				case "BUYER":
					role = "Buyer's";
					url = "buyer"
					break;
				case "PM":
					role = "PM's";
					url = "pm"
					break;
				default:
					break;
			}
			summarySection.innerHTML = `
                <div>
                    <img class="icon" src="assets/icons/All Registration.svg">
                    <div>
                    <a href="${url}Registration">
                        <p>All ${role}</p>
                        <h2>${counts.total}</h2>
                    </a>
                    </div>
                </div>
                <small class="vl"></small>
                <div>
                    <img class="icon" src="assets/icons/Registration In Review.svg">
                   <div onclick="fillterRequirement('/${url}Registration','inReviewHeader')">
                        <p>In Review</p>
                        <h2>${counts.In_Review}</h2>
                    </div>
                </div>
                <small class="vl"></small>
                <div>
                    <img class="icon" src="assets/icons/Approved.svg">
                  <div onclick="fillterRequirement('/${url}Registration','approvedHeader')">
                        <p>Approved</p>
                        <h2>${counts.Approved}</h2>
                    </div>
                </div>
                <small class="vl"></small>
                <div>
                    <img class="icon" src="assets/icons/Registration Rejected.svg">
                    <div onclick="fillterRequirement('/${url}Registration','rejectedHeader')">
                        <p>Rejected</p>
                        <h2>${counts.Rejected}</h2>
                    </div>
                </div>
                <small class="vl"></small>
                <div>
                    <img class="icon" src="assets/icons/On Hold.svg">
                   <div onclick="fillterRequirement('/${url}Registration','onHoldHeader')">
                        <p>On Hold</p>
                        <h2>${counts.On_Hold}</h2>
                    </div>
                </div>
            `;

			// Update the dropdown button text to the selected role
			document.getElementById('dropdownMenuClickableInside').textContent = role;
		});
	});
	// Trigger click on the "Buyer" dropdown item on page load
	const buyerItem = Array.from(dropdownItems).find(item => item.textContent.trim() === 'Buyer');
	if (buyerItem) {
		buyerItem.click();
	}
});
var params;
function fillterRequirement(url, args) {
	params = {
		fillter: args,
	};
	redirectToWithParams(contextPath + url, params)
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
var projectCurrentPage = 1;
var projectRowsPerPage = 5;


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


function openModal(args) {
	var modalToggle = document.getElementById('timeline')
	var projectId = document.querySelector('#timeline #projectId')
	projectId.innerHTML = args.ProjectID;

	//$('#myModal').modal('toggle');
	// Start the progress update with a maximum step of 6 and an interval of 500ms (0.5 seconds)
	updateProgress(args.statusNumber, 0);
	$('#timeline').modal('show');
	//$('#myModal').modal('hide');
}

