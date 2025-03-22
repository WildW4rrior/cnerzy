//Define the DataTable instance variable outside the function
var DataTable;
var separatedData;
$(document).ready(
	function() {
		console.log("${role}", "js")
		console.log("${pageContext.request.contextPath}", "js")

		//		var separatedData = processDataAndHeader(userListJson);




		$("#inReviewHeader").click(function() {
			buyerTable(separatedData["interested"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
			$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel' on tab change
		});
		$("#wonHeader").click(function() {
			buyerTable(separatedData["won"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
			$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel' on tab change
		});
		$("#lostHeader").click(function() {
			buyerTable(separatedData["lost"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
			$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel' on tab change
		});

		$("#allHeader").click(function() {
			buyerTable(separatedData["all"]);
			$(".headingStatus h1").removeClass("active");
			$(this).addClass("active");
			$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel' on tab change
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

function processDataAndHeader(data) {
	var separatedData = {
		"interested": [],
		"won": [],
		"lost": [],
		"all": []
	};

	// Process the data based on its status
	data.forEach(function(item) {
		if (item.status !== "-") {
			separatedData[item.status.toLowerCase().replace(/\s/g, '')].push(item);
		}
		separatedData["all"].push(item);
	});

	// Update the headers based on the URL context

	$('#inReviewHeader').text('In Review (' + separatedData["interested"].length + ')');
	$('#wonHeader').text('Won (' + separatedData["won"].length + ')');
	$('#lostHeader').text('Lost (' + separatedData["lost"].length + ')');
	$('#allHeader').text('All (' + separatedData["all"].length + ')');

	return separatedData;
}

function buyerTable(data) {
	DataTable = $("#sellerRequirement-table").DataTable({
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
		lengthMenu: [[15, 25, 50, 100, -1], [15, 25, 50, 100, "All"]],
		ordering: true,
		order: [[4, 'desc']], // Default order by column index 4 (createdOn) in descending order
		columns: [
			{
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
					if (row.status === "Lost") {
						return "<p class='requirementNo mb-0 text-blue' >" + data + "</p>";
					} else if (row.status === "Interested" && !row.isShotlisted) {
						return "<p class='requirementNo mb-0 text-blue'  data-bs-toggle='modal' data-bs-target='#awaiting-shortlisting'>" + data + "</p>";
					} else {
						return "<p class='requirementNo mb-0 text-blue' onclick='openDiscussModal(" + JSON.stringify(row) + ")'>" + data + "</p>";
					}
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
					return dateTime.isValid() ? dateTime.format('MMM Do YYYY, h:mm:ss a') : '';
				}
			},
			{
				data: "location",
				title: "Buyer Location",
				orderable: false,
			},
			{
				data: null,
				title: "Timeline",
				orderable: false,
				render: function(data, type, row) {
					return "<p class='text-blue mb-0' onclick='openTimeLine(" + JSON.stringify(row) + ")'>View</p>";
				}
			},
			{
				data: "status",
				orderable: false,
				title: "Status",
				class: "text-capitalize round-right",
				render: function(data, type, row) {
					switch (data.toLowerCase()) {
						case "interested":
							return '<span class="status inreview"> In Review </span>';
						case "onhold":
							return '<span class="status ' + data.toLowerCase() + '">' + "On Hold" + '</span>';
						case "won":
							return '<span class="status approved">' + data + '</span>';
						case "lost":
							return '<span class="status rejected">' + data + '</span>';
						default:
							return '<span class="status ' + data.toLowerCase() + '">' + data + '</span>';
					}
				}
			}
		],
		columnDefs: [
			{
				"defaultContent": "-",
				"targets": "_all"
			}
		],
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
//function handleRowClick(rowData, url) {
//	var displayDiv = $("#BuyerDiv");
//	var tableDiv = $("#tableDiv");
//	if (rowData.companyId != "undefined") {
//
//		// Make fetch request
//		fetch(contextPath + url + "?companyId=" + rowData.companyId, {
//			method: 'GET', // or 'GET', 'PUT', etc.
//			headers: {
//				'Content-Type': 'application/json'
//				// Add any other headers if needed
//			},
//			// Convert rowData to JSON and send it as body
//		})
//			.then(response => response.json()) // Parse response as JSON
//			.then(data => {
//				// Handle response data
//				
//
//				addToId(data, rowData)
//				if (rowData.userRole == "SELLER")
//					contactPerson(data)
//				tableDiv.hide();
//				displayDiv.show();
//			})
//			.catch(error => {
//				// Handle errors
//				console.error('Error:', error);
//			});
//
//	} else {
//		toastr.error("companyId not Found")
//	}
//
//
//}

//function addToId(rowData, data) {
//	var name = $("#BuyerDiv #name");
//	name.html(data.name);
//
//
//	$("#approveButton").off("click").on("click", function() {
//		changeAccountStatus(data.id, "approved");
//	});
//	$("#rejectButton").off("click").on("click", function() {
//		changeAccountStatus(data.id, "rejected");
//	});
//	$("#query #concernButton").off("click").on("click", function() {
//		var messageText = document.getElementById("message-text").value;
//		changeAccountStatus(data.id, "onHold", messageText);
//	});
//	var status = $("#BuyerDiv #status");
//
//	if (data.status) {
//		status.removeClass("inreview approved rejected onhold");
//
//		switch (data.status.toLowerCase()) {
//			case "inreview":
//				status.addClass("inreview").html("In Review");
//				break;
//			case "onhold":
//				status.addClass("onhold").html("On Hold");
//				break;
//			default:
//				status.addClass(data.status.toLowerCase()).html(data.status);
//				break;
//		}
//	}
//	Object.keys(rowData.data).forEach(function(key) {
//		var div = $("#BuyerDiv #" + key);
//
//		if (!div.length) {
//			return;
//		}
//
//		var value = rowData.data[key] ? rowData.data[key] : "";
//
//		if (key.includes("url") && value !== "") {
//			var url = value.toLowerCase();
//			var isImage = url.endsWith(".jpg") || url.endsWith(".jpeg") || url.endsWith(".png") || url.endsWith(".gif");
//			var isPdf = url.endsWith(".pdf");
//
//			if (isImage || isPdf) {
//				// Create a downloadable link
//				div.html('<a href="' + value + '" download>' + value + '</a>');
//			} else if (url.startsWith("http")) {
//				// Create a clickable link for external URLs
//				div.html('<a href="' + value + '" target="_blank">' + value + '</a>');
//			} else {
//				div.html(value);
//			}
//		} else {
//			div.html(value);
//		}
//	});
//
//}


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

function getDocumnets(sellerId, requirementId) {



	var requestOptions = {
		method: "GET",
		headers: {
			"Content-Type": "application/json", // Assuming you need to set this header
			// Add any other headers as needed
		}
	};

	fetch(contextPath + "/getAllChat?reqId=" + requirementId + "&addedForCid=" + sellerId, requestOptions)
		.then((response) => response.text())
		.then(result => {
			result = JSON.parse(result)

			makeDocumentDiv(result.messages)

		})
		.catch(error => console.error("Error:", error));

}

function openTimeLine(row) {
	requirementId = row.requirementId


	const requestOptions = {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json'
		},

	};
	fetch(contextPath + "/getTimelineByReqId?reqId=" + requirementId, requestOptions)
		.then((response) => response.text())
		.then(result => {

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
				const itemDate = new Date(timelineData[key] ?? '');
				if (!timelineData[key]) {
					
						const timelineItem = timelineContainer.querySelector(`[data-key="${key}"]`);	
						const dateElement = timelineItem.querySelector('.date');
						dateElement.innerHTML="";
						
				} else {
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


					const timelineItem = timelineContainer.querySelector(`[data-key="${key}"]`);
					if (timelineItem) {
						const dateElement = timelineItem.querySelector('.date');
						dateElement.innerHTML = `${itemDate.toDateString()}<br>(${timeAgo})`;

						if (itemDate <= now) {
							timelineItem.classList.add('completed');
						}
					} else {
						console.log("data key not in the result")
					}
				}
			});
		})
		.catch(error => console.error("Error:", error));

}


function sellerDivFunction(args, divId, reqId) {
	var table = document.getElementById(divId);
	var rowsContainer = table.querySelector(".rows-container");
	if (!rowsContainer) {
		rowsContainer = document.createElement("div");
		rowsContainer.className = "rows-container";
		table.appendChild(rowsContainer);
	} else {
		rowsContainer.innerHTML = ""; // Clear existing rows
	}


	var sellerDiv = document.createElement("div");
	sellerDiv.className = "sellerDiv custom-view-seller-modal card-style-2";

	var saveIconDiv = document.createElement("div");
	if (divId === "documnetsDicuessUser") {
		saveIconDiv.className = "card-type"
		var spanText = document.createElement("span");
		spanText.innerHTML = "Buyer"
		saveIconDiv.append(spanText)
	} else {

		saveIconDiv.className = "saveIcon"

	}

	var details = document.createElement("div");
	details.className = "details";

	var div = document.createElement("div");
	div.className = "info"
	var companyImage = document.createElement("div")
	companyImage.className = "companyImage";
	companyImage.style.height = "48px";
	companyImage.style.width = "48px";
	//			if (args.comapnyLogoUrl) {
	//				companyImage.style.borderRadius = "100%";
	//				companyImage.style.backgroundImage = "url(" + args.comapnyLogoUrl + ")";
	//			}else{
	companyImage.style.borderRadius = "100%";
	//			}

	var img = document.createElement('img');
	img.style.height = "48px";
	img.style.width = "48px";
	let value = args.comapnyLogoUrl; 
	img.setAttribute('src', value === "" ? "assets/icons/person-blue.svg" : value);
	companyImage.append(img);

	var companyName = document.createElement("h6");
	companyName.className = "companyName title";
	companyName.innerHTML = args.companyName;
	var industry = document.createElement("span");
	industry.className = "industry subtitle";
	industry.innerHTML = "Industry: " + args.companyIndustry;
	var location = document.createElement("div");
	location.className = "location location-info";
	location.style.gap = "10px"

	var cityState = document.createElement("p");
	cityState.className = 'cityState location-text';
	cityState.innerHTML = '<img src="assets/icons/location.svg" alt=""	class="location-icon"> ' + args.location
	var noOfProjects = document.createElement("p");
	noOfProjects.className = "noOfProjects text";
	noOfProjects.innerHTML = args.numberOfProjectsCompleted + " Projects Completed";

	location.append(cityState, noOfProjects)

	var ratingDiv = document.createElement("div");
	ratingDiv.className = "ratingDiv ratings";
	ratingDiv.style.margin = "0px"
	var rating = document.createElement("p");
	rating.className = "rating text";
	rating.innerHTML = args.numberOfRatings + " Ratings";
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
	var linkedIn = document.createElement("a");
	linkedIn.className = "linkedIn link";
	linkedIn.target = "_blank";
	linkedIn.href = args.linkedInProfile ? args.linkedInProfile : ""
	linkedIn.innerHTML = args.linkedInProfile ? args.linkedInProfile : ""

	if (divId === "mainDivSection4") {

		var buttonDiv = document.createElement("div");
		buttonDiv.className = "buttonDiv nav-btns justify-content-end w-100";
		// var view = document.createElement("button");
		// view.className = "view";
		// view.innerHTML = "View";
		// view.setAttribute('data-bs-toggle','modal')
		// view.setAttribute('data-bs-target','#seller-profile')

		// 					if (args[i].status == "NDA Received") {
		var contact = document.createElement("button");
		contact.className = "reEngage";
		contact.innerHTML = "Let's Discuss"
		contact.addEventListener('click', function() {
			openDiscussModal(args, reqId);
		});
		buttonDiv.append(contact)
		// 					}
		buttonDiv.append(contact)
	} else if (divId === "documnetsDicuessUser") {
		var buttonDiv = document.createElement("div");
		buttonDiv.className = "buttonDiv nav-btns";
		var view = document.createElement("button");
		view.className = " btn-outlined";
		view.innerHTML = "View Profile";
		view.setAttribute('data-bs-toggle', 'modal')
		view.setAttribute('data-bs-target', '#seller-profile')
		view.onclick = function() {
			addToId(args, "seller-profile");
		};

	} else {


		var buttonDiv = document.createElement("div");
		buttonDiv.className = "buttonDiv   nav-btns ";
		var view = document.createElement("button");
		view.className = "btn-outlined";
		view.innerHTML = "View";
		view.setAttribute('data-bs-toggle', 'modal')
		view.setAttribute('data-bs-target', '#seller-profile')
		view.onclick = function() {
			addToId(args, "seller-profile");
		};

		var contact = document.createElement("button");
		// var reEngage = document.createElement("button");
		// reEngage.className = "reEngage";
		// reEngage.innerHTML = "Re-Engage"
		contact.className = "reEngage";
		contact.innerHTML = "Contact"
		buttonDiv.append(view, contact)
	}


	div.append(companyImage, companyName, industry, location, ratingDiv, linkedIn)
	details.append(saveIconDiv, div, buttonDiv)
	sellerDiv.append(details, saveIconDiv);


	rowsContainer.appendChild(sellerDiv);

}