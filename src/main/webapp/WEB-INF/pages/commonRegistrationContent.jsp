<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="main-content" id="tableDiv">
	<section class="projects mainShadow">
		<div class="heading">
			<div class="headingStatus">
				<h1 id="allHeader" class="active">All (0)</h1>
				<h1 id="inReviewHeader">In Review (0)</h1>
				<h1 id="approvedHeader">Approved (0)</h1>
				<h1 id="rejectedHeader">Rejected (0)</h1>
				<h1 id="onHoldHeader">On Hold (0)</h1>
				
			</div>
			<div class="sorting ">
				<p>Sort by:</p>
				<div class="btn-group">
					<button class="btn  dropdown-toggle expand-icon " type="button"
						id="dropdownMenuClickableInside" data-bs-toggle="dropdown"
						data-bs-auto-close="inside" aria-expanded="true">Newest</button>
					<ul class="dropdown-menu"
						aria-labelledby="dropdownMenuClickableInside">

						<li><a class="dropdown-item disabled">Select</a></li>
						<li><a class="dropdown-item">Newest</a></li>
						<li><a class="dropdown-item">Oldest</a></li>
					</ul>
				</div>

			</div>
		</div>
		<div class="">


			<table id="buyerTable" class="" style="width: 100%">
			
				<tbody>
					<!-- DataTables will dynamically populate rows here -->
				</tbody>
			</table>
		</div>
	</section>
</div>

<div class="main-content" id="BuyerDiv" style="display: none">
	<c:set var="url" value="${pageContext.request.requestURI}" />
	<div class="row">
		<div class="col-12 col-sm-12 col-md-12 col-lg-12">
			<div class="breadcrumb-row d-flex gap-3 align-items-center flex-wrap">
				<div class="breadcrumb-icon-box ">
					<img class="breadcrumb-icon" src="assets/icons/breadcrumb-arrow.svg"
						onclick="handleBackClick()" alt="">
				</div>
				<div class="breadcrumb-text" id="name"></div>
				<div id="status" class=" status text-capitalize"></div>
				<div class=" d-flex justify-content-end gap-3 flex-grow-1">
					<button class="btn-style " id="approveButton" type="button" >Accept</button>
					<button class="btn-style-5 " id="rejectButton"  type="button" >Reject</button>
					<button class="btn-style-5 "  id="concern"  type="button" data-bs-toggle="modal"
						data-bs-target="#query">Raise A Concern</button>
				</div>
			</div>

			<c:choose>
				<c:when test="${url.contains('buyerRegistration')}">
					<c:import url="buyerProfileModal.jsp"></c:import>
				</c:when>
				<c:when test="${url.contains('sellerRegistration')}">
					<c:import url="sellerProfileModal.jsp"></c:import>
				</c:when>
				<c:when test="${url.contains('pmRegistration')}">
					<c:import url="pmProfileModal.jsp"></c:import>
				</c:when>

			</c:choose>
		</div>
	</div>
	
 <div class="modal fade custom-profile-pic-view-modal modal-sm" id="view-profile-pic" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <span class="close-btn" data-bs-dismiss="modal" aria-label="Close">&times;</span>
               <div id="ModalcompanyLogoUrl">
                <img class="modal-img" src="assets/images/profile/user.png" alt="Success Animation">
          
               </div>
                 </div>
        </div>
    </div>
<div class="modal fade" id="query" tabindex="-1" aria-labelledby="query" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-body">
        <form>
        <h6 class="section-heading">Raise A Concern</h6>
          <div class="mb-3">
             <textarea class="form-control" id="message-text" placeHolder="Write here..."></textarea>
          </div>
        </form>
         <div class="buttonsDiv">
        <button type="button" class="btn-style-5" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn-style" id="concernButton" >Send</button>
      </div>
      </div>
     
    </div>
  </div>
</div>
</div>