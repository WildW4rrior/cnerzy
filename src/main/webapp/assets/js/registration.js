//Define the DataTable instance variable outside the function
var buyerDataTable;
var SellerTables;
var companyIdForSeller;
var paramsObj = {};
var country;
$(document).ready(
	function() {
		console.log("${role}", "js")
		console.log("${pageContext.request.contextPath}", "js")
		console.log(userListJson)
		if (role === "ADMIN") {
			var separatedData = processDataAndHeader(userListJson);



			buyerTable(separatedData["all"]);


			$("#inReviewHeader").click(function() {
				buyerTable(separatedData["inreview"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
				$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
			});
			$("#approvedHeader").click(function() {
				buyerTable(separatedData["approved"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
				$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
			});
			$("#rejectedHeader").click(function() {
				buyerTable(separatedData["rejected"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
				$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
			});
			$("#onHoldHeader").click(function() {
				buyerTable(separatedData["onhold"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
				$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
			});
			$("#allHeader").click(function() {
				buyerTable(separatedData["all"]);
				$(".headingStatus h1").removeClass("active");
				$(this).addClass("active");
				$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
			});
			logQueryParams()
			$(".dropdown-item").on("click", function() {
				var sortBy = $(this).text();
				switch (sortBy) {
					case "Newest":
						buyerDataTable.order([4, 'desc', 'custom-date-time-pre']).draw();
						$('#dropdownMenuClickableInside').html("Newest"); // Update inner HTML of the element with ID 'sortingLabel'
						break;
					case "Oldest":
						buyerDataTable.order([4, 'asc', 'custom-date-time-pre']).draw();
						$('#dropdownMenuClickableInside').html("Oldest"); // Update inner HTML of the element with ID 'sortingLabel'
						break;
					default:
					// Handle other sorting options if needed
				}
			});
		}
		$("#CompanyInformationContent").css("display", "flex");
		$(".sellerProfiles h1").click(function() {
			// Remove active class from all h1 elements
			$("h1").removeClass("active");

			// Add active class to the clicked h1 element
			$(this).addClass("active");

			// Get the id of the clicked h1 element
			var id = $(this).attr("id");

			// Hide the tableDiv by default
			$("#tableDiv").css("display", "none");

			// Show the appropriate content based on the clicked h1 element
			switch (id) {
				case "CompanyInformation":


					showCompanyInformation();
					break;
				case "LegalInformation":
					// Show relevant content for Legal Information
					// Assuming you have a function to handle this, for example:
					showLegalInformation();
					break;
				case "FinancialDetails":
					// Show relevant content for Financial Details
					// Assuming you have a function to handle this, for example:
					showFinancialDetails();
					break;
				case "TechnicalCapabilities":
					// Show relevant content for Technical Capabilities
					// Assuming you have a function to handle this, for example:
					showTechnicalCapabilities();
					break;
				case "CertificatesCompliance":
					// Show relevant content for Certificates & Compliance
					// Assuming you have a function to handle this, for example:
					showCertificatesCompliance();
					break;
				case "References":
					// Show relevant content for References
					// Assuming you have a function to handle this, for example:
					showReferences();
					break;
				case "SupplierReferenceProgram":
					// Show relevant content for Supplier Reference Program
					// Assuming you have a function to handle this, for example:
					showSupplierReferenceProgram();
					break;
				default:
					// If no matching case, do nothing or handle as needed
					break;
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
var sellerId = ""
function showCompanyInformation() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}

	apiCall(sellerId, "/getSellerCompanyDetails")
		.then(data => {
			if (data) {
				console.log(data)
				addToId(data, companyIdForSeller)
				if (role === "SELLER")
					contactPerson(data)
				hideAllContent();
				$("#CompanyInformationContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});


}

function showLegalInformation() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerLegalDetails")
		.then(data => {
			if (data) {
				console.log(data)
				addToId(data, companyIdForSeller)
				const otherColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "productName",
					title: "Name of Major Product",
					orderable: false,
				},


				];
				const MajorCustomer = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "name",
					title: "Customer’s Name",
					orderable: false,
				},

				{
					data: "address",
					title: "Address",
					orderable: false,
				},

				{
					data: "productSupplied",
					title: "Product Supplied",
					orderable: false,
				},


				];
				const Logistics = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "name",
					title: "Customer’s Name",
					orderable: false,
				},

				{
					data: "address",
					title: "Address",
					orderable: false,
				},


				];
				const exporter = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "financialYear",
					title: "Financial Year",
					orderable: false,
				},

				{
					data: "product",
					title: "Products / Services",
					orderable: false,
				},
				{
					data: "country",
					title: "Country",
					orderable: false,
				}, {
					data: "value",
					title: "Value",
					orderable: false,
				},

				];
				const OME = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "supplyingTo",
					title: "Supplying To",
					orderable: false,
				},

				{
					data: "supplierSince",
					title: "Supplier Since",
					orderable: false,
				},
				{
					data: "Value",
					title: "Value",
					orderable: false,
				}, {
					data: "vendorRating",
					title: "Vendor Rating",
					orderable: false,
				},

				];

				sellerTables("OEMs", OME, data.data.oemModels);
				sellerTables("MajorProducts", otherColumns, data.data.productsList)
				sellerTables("MajorCustomers", MajorCustomer, data.data.majorCustomers)
				sellerTables("Logistics", Logistics, data.data.logisticServiceProvider)
				sellerTables("exporter", exporter, data.data.exporterList)
				if (country === "US") {
					$("#w9parent").show()
					var parent = document.getElementById("w9form");
					parent.innerHTML = ""
					if (parent) {
						const newDiv = document.createElement("div");
						newDiv.className = "";
						newDiv.innerHTML = `
                       <div class="col-lg-4 col-md-6 col-sm-12 col-12">
									
						<div class="file-input-field-group p-0" style="background: none">
							<input name="w9SubmissionId"
								value="${data.data.w9SubmissionId}" hidden> <input
								type="file" id="w9SubmissionForm_input"
								name="${data.data.w9SubmissionForm}" class="input-field"
								placeholder="File" required autocomplete="off" hidden>
							  <button class="input-btn" type="button" onclick="window.open('${data.data.w9SubmissionUrl}', '_blank')">Download</button>
      
						</div>
						<span id="w9SubmissionForm_err" class="err-text"></span>
					</div>
                    `;
						parent.appendChild(newDiv);
					}
				} else {
					$("#w9parent").hide()
				}

				hideAllContent();
				$("#LegalInformationContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});
}

function showFinancialDetails() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerFinancialDetails")
		.then(data => {
			if (data) {
				console.log(data)
				addToId(data, companyIdForSeller)
				const otherColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "financialYear",
					title: "Financial Year",
					orderable: false,
				},
				{
					data: "turnover",
					title: "Annual Turnover",
					orderable: false,
				},


				];
				sellerTables("turnover", otherColumns, data.data.annualTurnoverList)

				hideAllContent();
				$("#FinancialDetailsContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});


}

function showTechnicalCapabilities() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerTechnicalDetails")
		.then(data => {
			if (data) {
				console.log(data)
				addToId(data, companyIdForSeller)
				const otherColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "totalEmployees",
					title: "Total No. of Employees",
					orderable: false,
				},
				{
					data: "supervisiors",
					title: "Supervisors",
					orderable: false,
				},
				{
					data: "enggDegreeOrDiploma",
					title: "Engg. Degree/Diploma Holders",
					orderable: false,
				},
				{
					data: "skilledWorkers",
					title: "Skilled Workers",
					orderable: false,
				},
				{
					data: "address",
					title: "Design Department",
					orderable: false,
				}, {
					data: "qualityAndInspection",
					title: "Quality Control & Inspection",
					orderable: false,
				},
				];
				const MachiningColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "details",
					title: "Details of facility available",
					orderable: false,
				},
				{
					data: "remarks",
					title: "Remarks if any ",
					orderable: false,
				},

				];
				const FactoryColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "factoryName",
					title: "Factory Name",
					orderable: false,
				},
				{
					data: "area",
					title: "Area in Square Meter",
					orderable: false,
				}, {
					data: "address",
					title: "Address",
					orderable: false,
				},

				];
				// Assuming factoryList is your array
				const Machining = [];
				const Inspection = [];
				data.data.factoryList.forEach(factory => {
					factory.facilityList.forEach(item => {
						if (item.type === "Machining") {
							Machining.push(item);
						}
						if (item.type === "Inspection") {
							Inspection.push(item);
						}
					});
				});
				console.log(Inspection, Machining)

				// Now newData will contain only the items where at least one facility has type "machining"

				sellerTables("Factory", FactoryColumns, data.data.factoryList)
				sellerTables("manpower", otherColumns, data.data.factoryList)
				sellerTables("Machining", MachiningColumns, Machining)
				sellerTables("Inspection", MachiningColumns, Inspection)

				hideAllContent();
				$("#TechnicalCapabilitiesContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});


}

function showCertificatesCompliance() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerCertificatesDetails")
		.then(data => {
			if (data) {
				console.log(data)

				let keysToMatch = []
				if (country == "US") {
					keysToMatch = ['asCertificationUrl', 'fdaRegisterationUrl', 'isoCertificationUrl', 'oshaCertificationUrl', 'otherCertificationsUrl'];

				} else {
					keysToMatch = ['asCertificationUrl', 'environmentalRegulationsComplianceUrl', 'indianStandardsComplianceUrl', 'isoCertificationUrl', 'laborLawComplianceUrl', 'otherCertificationsUrl'];

				}

				const fieldNameMap = {
					asCertificationUrl: 'AS Certification',
					environmentalRegulationsComplianceUrl: 'Environmental Regulations Compliance',
					fdaRegisterationUrl: 'FDA Registration',
					indianStandardsComplianceUrl: 'Indian Standards Compliance',
					isoCertificationUrl: 'ISO Certification',
					laborLawComplianceUrl: 'Labor Law Compliance',
					oshaCertificationUrl: 'OSHA Certification',
					otherCertificationsUrl: 'Other Certifications'
				};

				// Accessing the name for a specific key
				console.log(fieldNameMap['asCertificationUrl']); // Output: AS Certification
				var CertificatesParent = document.getElementById("CertificatesParent");
				CertificatesParent.innerHTML = ""
				CertificatesParent.innerHTML = `<div class="col-12">
							<h6 class="section-heading">Certificates & Compliance</h6>
						</div>`
				for (const key of keysToMatch) {
					const url = data.data[key];
					if (url) {
						const fieldName = fieldNameMap[key]; // Get the corresponding field name from the map
						buildCertificatesCompliance( fieldName, "Download", `window.open('${url}', '_blank')`,'CertificatesParent');
					} else {
						const fieldName = fieldNameMap[key]; // Get the corresponding field name from the map
						buildCertificatesCompliance( fieldName, "", "",'CertificatesParent');

					}
				}

				hideAllContent();
				$("#CertificatesComplianceContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});



}
function buildCertificatesCompliance(fieldName, text, onclick,parentName) {
	var CertificatesParent = document.getElementById(parentName);
	var content = document.createElement('div');

	content.className = "col-lg-4 col-md-6 col-sm-12 col-12";
	content.innerHTML = `
        <div class="card-style-1">
            <h6 class="card-title">${fieldName}</h6>
            <div class="file-input-field-group p-0">
                <input type="file" id="indianStandardsComplianceFile_input"
                    name="indianStandardsComplianceFile" class="input-field"
                    placeholder="File" required autocomplete="off" hidden>
                 <button class="input-btn" type="button"
                   onclick="${onclick}">${text}</button>
        
            </div>
            <span id="indianStandardsComplianceFile_err" class="err-text"></span>
        </div>
    `;

	CertificatesParent.appendChild(content);
}


function showReferences() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerReferencesDetails")
		.then(data => {
			if (data) {
				console.log(data)

				const signatureImg = document.getElementById("signatureUrl");
				if (data.data.signatureUrl)
					forSignature(signatureImg, data.data.signatureUrl);


				const declarationDate = document.getElementById("declarationDate");
				declarationDate.innerHTML = data.data.declarationDate
				const otherColumns = [{
					data: null,
					title: "S.NO",
					class: "round-left",
					orderable: false,
					render: function(data, type, row, meta) {
						return meta.row + 1;
					}
				},

				{
					data: "description",
					title: "Customer Testimonials / Awards",
					orderable: false,
				},

				];
				sellerTables("Testimonials", otherColumns, data.data.testimonialsList)
				
				if (data.data.projectCaseStudiesUrl) {
					const fieldName = "Project Case Studies"; // Get the corresponding field name from the map
					buildCertificatesCompliance( fieldName, "Download", `window.open('${data.data.projectCaseStudiesUrl}', '_blank')`,'ProjectCaseStudies');
				} else {
					const fieldName =  "Project Case Studies"; // Get the corresponding field name from the map
					buildCertificatesCompliance( fieldName, "", "",'ProjectCaseStudies');

				}
				hideAllContent();
				$("#ReferencesContent").css("display", "flex");
			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});

}

function showSupplierReferenceProgram() {
	if (companyIdForSeller != undefined) {
		sellerId = companyIdForSeller.companyId
	} else {
		sellerId = ""
	}
	apiCall(sellerId, "/getSellerPermissionDetails")
		.then(data => {
			if (data) {
				console.log(data)
				addToId(data, companyIdForSeller)
				checkCheckbox(data.data.permissionModel, data.data)
				hideAllContent();
				$("#SupplierReferenceProgramContent").css("display", "flex");

			}
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});

}
function checkCheckbox(args) {

	Object.keys(args).forEach(function(key) {
		var checkbox = document.querySelector("#permission #" + key);
		var date = document.querySelector("#lastStepDiv #customerReferenceDeclerationDate");
		var sign = document.querySelector("#lastStepDiv #customerReferenceSignatureUrl");
		date.innerHTML = ""
		date.innerHTML = args.declerationDate
		if (args.signatureUrl)
			forSignature(sign, args.signatureUrl)

		if (checkbox && checkbox.type === "checkbox") {
			checkbox.checked = args[key];
			checkbox.disabled = true;

		}
	});
}




function hideAllContent() {
	// Hide all content sections
	$("#CompanyInformationContent").css("display", "none");
	$("#LegalInformationContent").css("display", "none");
	$("#FinancialDetailsContent").css("display", "none");
	$("#TechnicalCapabilitiesContent").css("display", "none");
	$("#CertificatesComplianceContent").css("display", "none");
	$("#ReferencesContent").css("display", "none");
	$("#SupplierReferenceProgramContent").css("display", "none");
}

function processDataAndHeader(data) {
	var separatedData = {
		"inreview": [],
		"approved": [],
		"rejected": [],
		"onhold": [],
		"all": []
	};

	data.forEach(function(item) {
		if (item.status !== "-") {

			separatedData[item.status.toLowerCase().replace(/\s/g, '')].push(item);
		}
		separatedData["all"].push(item);
	});

	$('#inReviewHeader').text('In Review (' + separatedData["inreview"].length + ')');
	$('#approvedHeader').text('Approved (' + separatedData["approved"].length + ')');
	$('#rejectedHeader').text('Rejected (' + separatedData["rejected"].length + ')');
	$('#onHoldHeader').text('On Hold (' + separatedData["onhold"].length + ')');
	$('#allHeader').text('All (' + separatedData["all"].length + ')');

	return separatedData;
}
function sellerTables(tableId, columns, list) {
	console.log(tableId, columns, list)
	SellerTables = $("#" + tableId)
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
				data: list,
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
				columns: columns,
				columnDefs: [{
					"defaultContent": "-",
					"targets": "_all"
				}],
				rowCallback: function(row, data, index) {
					$('td:eq(0)', row).html(index + 1);
				}
			});
}

function buyerTable(data) {
	country = data.country
	const otherColumns = [{
		data: null,
		title: "S.NO",
		class: "round-left",
		orderable: false,
		render: function(data, type, row, meta) {
			return meta.row + 1;
		}
	},
	{
		data: "name",
		class: "name",
		title: "Name",
		orderable: false,
		render: function(data, type, row) {
			var url;
			switch (row.userRole) {
				case "PM":
					url = "/getPmDetails";
					break;
				case "SELLER":
					url = "/getSellerCompanyDetails";
					break;
				case "BUYER":
				default:
					url = "/getBuyerDetails";
					break;
			}
			return "<span class='name-cell' onclick='handleRowClick(" + JSON.stringify(row) + ", \"" + url + "\")'>" + data + "</span>";
		}
		//							return "<span class='name-cell' onclick='handleRowClick(" + JSON.stringify(row) + ")'>" + data + "</span>";
		//						}
	},
	{
		data: "companyName",
		title: "Company Name",
		orderable: false,
	},
	{
		data: "industry",
		title: "Industry",
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
				case "inreview":
					return '<span class="status ' + data.toLowerCase() + '">' + "In Review" + '</span>';
				case "onhold":
					return '<span class="status ' + data.toLowerCase() + '">' + "On Hold" + '</span>';
				default:
					return '<span class="status ' + data.toLowerCase() + '">' + data + '</span>';
			}
		}
	}
	];
	const pmColumns = [{
		data: null,
		title: "S.NO",
		class: "round-left",
		orderable: false,
		render: function(data, type, row, meta) {
			return meta.row + 1;
		}
	},
	{
		data: "name",
		class: "name",
		title: "Name",
		orderable: false,
		render: function(data, type, row) {
			var url;
			switch (row.userRole) {
				case "PM":
					url = "/getPmDetails";
					break;
				case "SELLER":
					url = "/getSellerCompanyDetails";
					break;
				case "BUYER":
				default:
					url = "/getBuyerDetails";
					break;
			}
			return "<span class='name-cell' onclick='handleRowClick(" + JSON.stringify(row) + ", \"" + url + "\")'>" + data + "</span>";
		}
		//							return "<span class='name-cell' onclick='handleRowClick(" + JSON.stringify(row) + ")'>" + data + "</span>";
		//						}
	},
	{
		data: "companyName",
		title: "Company Name",
		orderable: false,
	},
	{
		data: "industry",
		title: "Industry",
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
		data: "activeProjects",
		title: "Active Projects",
		orderable: false,
	}, {
		data: "status",
		orderable: false,
		title: "Status",
		class: "text-capitalize round-right",
		render: function(data, type, row) {

			switch (data.toLowerCase()) {
				case "inreview":
					return '<span class="status ' + data.toLowerCase() + '">' + "In Review" + '</span>';
				case "onhold":
					return '<span class="status ' + data.toLowerCase() + '">' + "On Hold" + '</span>';
				default:
					return '<span class="status ' + data.toLowerCase() + '">' + data + '</span>';
			}
		}
	}
	];
	if (data.length > 0) {
		var columns = (data[0].userRole === "PM") ? pmColumns : otherColumns;

	}

	buyerDataTable = $("#buyerTable")
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
										<img class="icon" style="" src="assets/icons/Group.svg"> No Data
										Available
									</div>`,
				},
				lengthMenu: [[15, 25, 50, 100, -1],
				[15, 25, 50, 100, "All"],],
				ordering: true,
				columns: columns,
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
		companyIdForSeller = rowData
		apiCall(rowData.companyId, url)
			.then(data => {
				console.log(data)
				if (data) {
					addToId(data, rowData);
					country = data.data.country;
					if (country === "IN") {
						$(".india").css("display", "block");
						$(".us").css("display", "none");
					} else if (country === "US") {
						$(".india").css("display", "none");
						$(".us").css("display", "block");
					}
					if (rowData.userRole == "SELLER") {
						contactPerson(data);
						if (data.data.companyLogoUrl) {
							// Assuming relevantDocumentUrl is the id of the element
							const companyLogoUrl = document.getElementById("companyLogoUrl");
							const ModalcompanyLogoUrl = document.getElementById("ModalcompanyLogoUrl");
							forSignature(ModalcompanyLogoUrl, data.data.companyLogoUrl)
							forSignature(companyLogoUrl, data.data.companyLogoUrl)
							// Function to check if the URL points to a PDF

						}

					}
					if (rowData.userRole === "PM") {
						References(data.data.pmRefrenceModels)
						companyPM(data.data)
						if (data.data.relevantDocumentUrl) {
							// Assuming relevantDocumentUrl is the id of the element
							const relevantDocumentUrl = document.getElementById("relevantDocumentUrl");

							// Attach an event listener to the element
							relevantDocumentUrl.addEventListener("click", function() {
								// Open the URL in a new window
								window.open(data.data.relevantDocumentUrl, "_blank");
							});

							// Set the inner HTML of the element
							relevantDocumentUrl.innerHTML = "Document";
						}
						if (data.data.resumeLink) {
							// Assuming relevantDocumentUrl is the id of the element
							const resumeLink = document.getElementById("resumeLink");

							// Attach an event listener to the element
							resumeLink.addEventListener("click", function() {
								// Open the URL in a new window
								window.open(data.data.resumeLink, "_blank");
							});

							// Set the inner HTML of the element
							resumeLink.innerHTML = "Resume";
						}
						if (data.data.singatureDocumentUrl) {
							// Assuming relevantDocumentUrl is the id of the element
							const singatureDocumentUrl = document.getElementById("singatureDocumentUrl");
							forSignature(singatureDocumentUrl, data.data.singatureDocumentUrl)
							// Function to check if the URL points to a PDF

						}

					}
					if (rowData.userRole === "BUYER") {

						if (data.data.companySignatureUrl) {
							// Assuming relevantDocumentUrl is the id of the element
							const companySignatureUrl = document.getElementById("companySignatureUrl");
							forSignature(companySignatureUrl, data.data.companySignatureUrl)
							// Function to check if the URL points to a PDF

						}
						if (data.data.companyLogoUrl) {
							// Assuming relevantDocumentUrl is the id of the element
							const companyLogoUrl = document.getElementById("companyLogoUrl");
							const ModalcompanyLogoUrl = document.getElementById("ModalcompanyLogoUrl");


							forSignature(companyLogoUrl, data.data.companyLogoUrl)
							forSignature(ModalcompanyLogoUrl, data.data.companyLogoUrl)


							// Function to check if the URL points to a PDF

						}
					}
					if (rowData.status === "approved" || rowData.status === "rejected") {
						$("#approveButton").hide()
						$("#rejectButton").hide()
					}


					tableDiv.hide();
					displayDiv.show();
				}
			})
			.catch(error => {
				// Handle errors
				console.error('Error:', error);
			});
	}
}

function forSignature(div, url) {
	const isPdf = (url) => {
		return url.endsWith(".pdf");
	};

	// Function to check if the URL points to an image
	const isImage = (url) => {
		return url.match(/\.(jpeg|jpg|gif|png)$/) != null;
	};

	if (isPdf(url)) {
		// Create an iframe to view the PDF
		const iframe = document.createElement("iframe");
		iframe.src = url;
		iframe.width = "100%";
		iframe.height = "600px"; // Adjust height as needed
		div.innerHTML = ""; // Clear existing content
		div.appendChild(iframe);
	} else if (isImage(url)) {
		// Create an image element to view the image
		const img = document.createElement("img");
		img.src = url;
		img.style.maxWidth = "100%";
		img.style.height = "auto";
		div.innerHTML = ""; // Clear existing content
		div.appendChild(img);
	} else {
		// Fallback content in case the URL is neither a PDF nor an image
		div.innerHTML = "Document";
	}
}

function apiCall(rowData, url) {
	return fetch(contextPath + url + "?companyId=" + rowData, {
		method: 'GET', // or 'GET', 'PUT', etc.
		headers: {
			'Content-Type': 'application/json'
			// Add any other headers if needed
		},
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.json();
		})
		.catch(error => {
			// Handle errors
			console.error('Error:', error);
		});
}

function addToId(rowData, data) {
	var name = $("#BuyerDiv #name");
	if (role === "ADMIN") {
		name.html(data.name);


		$("#approveButton").off("click").on("click", function() {
			changeAccountStatus(data.id, "approved");
		});
		$("#rejectButton").off("click").on("click", function() {
			changeAccountStatus(data.id, "rejected");
		});
		$("#query #concernButton").off("click").on("click", function() {
			var messageText = document.getElementById("message-text").value;
			changeAccountStatus(data.id, "onHold", messageText);
		});
		var status = $("#BuyerDiv #status");

		if (data.status) {
			status.removeClass("inreview approved rejected onhold");

			switch (data.status.toLowerCase()) {
				case "inreview":
					status.addClass("inreview").html("In Review");
					break;
				case "onhold":
					status.addClass("onhold").html("On Hold");
					break;
				default:
					status.addClass(data.status.toLowerCase()).html(data.status);
					break;
			}
		}
	}

	Object.keys(rowData.data).forEach(function(key) {
		var div = $("#BuyerDiv #" + key);

		if (!div.length) {
			return;
		}

		var value = rowData.data[key] ? rowData.data[key] : "";

		if (key === "personalEmailVerified") {
			if (value === true) {
				$(".verification-status").addClass("green");
				$(".verification-status").html("verified");
			}
			return;

		}
		if (key.includes("url") && value !== "") {
			var url = value.toLowerCase();
			var isImage = url.endsWith(".jpg") || url.endsWith(".jpeg") || url.endsWith(".png") || url.endsWith(".gif");
			var isPdf = url.endsWith(".pdf");

			if (isImage || isPdf) {
				// Create a downloadable link
				div.html('<a href="' + value + '" download>' + value + '</a>');
			} else if (url.startsWith("http")) {
				// Create a clickable link for external URLs
				div.html('<a href="' + value + '" target="_blank">' + value + '</a>');
			} else {
				div.html(value);
			}
		} else {
			div.html(value);
		}
	});

}


function handleBackClick() {
	window.location.reload();

}
function References(args) {
	var References = document.getElementById("References");
	References.innerHTML = "";
	References.innerHTML = `<div class="col-12">
                    <h6 class="section-heading">References</h6>
                </div>`;

	for (var i = 0; i < args.length; i++) {
		var content = document.createElement('div');

		if (args.length == 1) {
			content.className = "col-12 row row-gap-24 ";
		} else if (i == args.length - 1) {
			content.className = "col-12 row row-gap-24 ";
			content.style.padding = "20px 10px";
		} else {
			content.className = "col-12 row row-gap-24  borderBottom";
			content.style.padding = "20px 10px";

		}
		content.id = "mainRow";
		content.innerHTML = `
                    <h4  class="section-heading">${i + 1}.</h4>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <h6 class="heading">Name</h6>
                        <p class="text">${args[i].name}</p>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-6">
                        <h6 class="heading">Company/Organization</h6>
                        <p class="text">${args[i].companyName}</p>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <h6 class="heading">Email</h6>
                        <p class="text">${args[i].email}</p>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-3">
                        <h6 class="heading">Phone</h6>
                        <p class="text">${args[i].phone}</p>
                    </div>`;
		References.appendChild(content);
	}
}
function changeAccountStatus(id, status, concern = "") {
	// Make fetch request
	fetch(contextPath + "/changeAccountStatus", {
		method: 'POST', // or 'GET', 'PUT', etc.
		headers: {
			'Content-Type': 'application/json'
			// Add any other headers if needed
		},
		body: JSON.stringify({
			"id": id, // Account ID
			"status": status, // Status chosen by admin
			"concern": concern // Concern message if any
		})
		// Convert rowData to JSON and send it as body
	})
		.then(response => response.json()) // Parse response as JSON
		.then(data => {
			// Handle response data
			console.log(data);
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
function companyPM(args) {
	var Professional = document.getElementById("Professional");
	Professional.innerHTML = "";
	if (args.companyName.length != 0) {


		for (var i = 0; i < args.companyName.length; i++) { // Corrected the loop syntax
			var content = `<div class="col-12 col-sm-6 col-md-6 col-lg-3">
                            <h6 class="heading">Company Name ${i + 1}</h6>
                            <p class="text">${args.companyName[i]}</p> <!-- Insert actual company name from args -->
                        </div>`;
			Professional.innerHTML += content; // Append content to Professional element
		}
	}
}

function contactPerson(args) {
	var ContactPersonParent = document.getElementById("ContactPersonParent");
	ContactPersonParent.innerHTML = "";
	ContactPersonParent.innerHTML = `<div class="col-12">
		                   <h6 class="section-heading">Contact Person</h6>
		                </div>`;

	for (var i = 0; i < args.data.contactPersonModels.length; i++) {
		var content = document.createElement('div');

		if (args.data.contactPersonModels.length == 1) {
			content.className = "col-12 row row-gap-24 ";
		} else if (i == args.data.contactPersonModels.length - 1) {
			content.className = "col-12 row row-gap-24 ";
			content.style.padding = "20px 10px";
		} else {
			content.className = "col-12 row row-gap-24  borderBottom";
			content.style.padding = "20px 10px";

		}

		content.id = "mainRow";
		content.innerHTML =
			`<div class="row row-gap-24">
						
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Name</h6>
							<p class="text">${args.data.contactPersonModels[i].name}</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Designation</h6>
							<p class="text">${args.data.contactPersonModels[i].designation}</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Email</h6>
							<p class="text">${args.data.contactPersonModels[i].email}</p>
						</div>
						<div class="col-12 col-sm-6 col-md-6 col-lg-3">
							<h6 class="heading">Phone</h6>
							<p class="text">${args.data.contactPersonModels[i].phone}</p>
						</div>
					</div>`
		ContactPersonParent.appendChild(content);
	}
}