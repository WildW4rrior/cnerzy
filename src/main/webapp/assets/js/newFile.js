document.addEventListener("DOMContentLoaded", function() {
	document.getElementById('upload-document-form').addEventListener('submit', function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		if (true) {
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
				.then(response => response.json()) // Parse the response as JSON
				.then(result => {
					console.log(result);

					if (result.status === 'true') {
						chooseAgain('document-upload-section');
						var discussModalInputCid = $("#DiscussModal #addedForCid");
						var uploadLoiAndPoFormCid = $("#upload-loi-and-po-form #addedForCid ");
						var discussModalInputReqId = $("#DiscussModal #reqId");
						var uploadLoiAndPoFormReqId = $("#upload-loi-and-po-form #reqId");
						var reviewInputCid = $("#submitted-and-review #addedForCid");
						var reviewCid = $("#submitted-and-review #addedForCid ");


						reviewInputCid.val(reqId);
						reviewCid.val(args[0].sellerCompanyId);

						uploadLoiAndPoFormReqId.val(requirementId);
						discussModalInputReqId.val(requirementId);

						uploadLoiAndPoFormCid.val(sellerId);
						discussModalInputCid.val(sellerId);

						getDocumnets(sellerId, requirementId);
						toastr.success('Sucessfully Updated The Documents');


					} else {
						toastr.error('Something went wrong');
					}
				});
		}
	});
	document.getElementById('upload-loi-and-po-modal').addEventListener('submit', function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		if (true) {
			// Get form data
			const form = document.getElementById('upload-loi-and-po-form');
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
				.then(response => response.json()) // Parse the response as JSON
				.then(result => {
					console.log(result);

					if (result.isSellerFinalized === 'true') {
						chooseAgain('loi-upload-section');
						chooseAgain('po-upload-section');
						var discussModalInputCid = $("#DiscussModal #addedForCid");
						var uploadLoiAndPoFormCid = $("#upload-loi-and-po-form #addedForCid ");
						var discussModalInputReqId = $("#DiscussModal #reqId");
						var uploadLoiAndPoFormReqId = $("#upload-loi-and-po-form #reqId");
						var reviewInputCid = $("#submitted-and-review #addedForCid");
						var reviewCid = $("#submitted-and-review #addedForCid ");


						reviewInputCid.val(reqId);
						reviewCid.val(args[0].sellerCompanyId);

						uploadLoiAndPoFormReqId.val(requirementId);
						discussModalInputReqId.val(requirementId);

						uploadLoiAndPoFormCid.val(sellerId);
						discussModalInputCid.val(sellerId);
						getDocumnets(sellerId, requirementId);
						toastr.success('Sucessfully Updated The Details');

						$("#upload-loi-and-po-modal").modal('hide');
						makeRow; { }

						$("#submitted-and-review").modal('show');

					} else {
						toastr.error('Something went wrong');
					}
				});


		}
	});
});
