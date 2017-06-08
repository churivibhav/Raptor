<%@page import="com.base.test.utility.Utils"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>YOYO</title>

<spring:url value="/resources/core/css/lib/font-awesome.min.css"
	var="fontCss" />
<spring:url value="/resources/core/css/lib/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/core/css/menu.css" var="menuCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<!--<spring:url value="/resources/core/css/lib/checkbox.css" var="checkboxCss" />-->
<spring:url value="/resources/core/css/lib/dataTables.bootstrap.min.css"
	var="dataTablesCss" />
<spring:url value="/resources/core/css/lib/bootstrap-treeview.css"
	var="treeViewCss" />
<spring:url value="/resources/core/css/lib/bootstrap-spinner.css"
	var="spinnerCss" />
<spring:url value="/resources/core/js/lib/jquery-1.9.1.min.js"
	var="jqueryJs" />
<spring:url value="/resources/core/js/lib/bootstrap.min.js"
	var="bootstrapJs" />
<spring:url value="/resources/core/css/lib/bootstrap-multiselect.css"
	var="multiselectCss" />
<spring:url value="/resources/core/js/lib/bootstrap-multiselect.js"
	var="multiselectJs" />
<spring:url value="/resources/core/js/lib/toastr.js" var="toastrJs" />
<spring:url value="/resources/core/css/lib/toastr.css" var="toastrCss" />


<link rel="stylesheet" href="${bootstrapCss}" />
<link rel="stylesheet" href="${fontCss}" />
<link rel="stylesheet" href="${menuCss}" />
<link rel="stylesheet" href="${styleCss}" />
<!-- <link rel="stylesheet" href="${checkboxCss}" /> -->
<link rel="stylesheet" href="${dataTablesCss}" />
<link rel="stylesheet" href="${treeViewCss}" />
<link rel="stylesheet" href="${spinnerCss}" />
<link rel="stylesheet" href="${multiselectCss}" />
<link rel="stylesheet" href="${toastrCss}" />

<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="${multiselectJs}"></script>
<script src="${toastrJs}"></script>

</head>

<body>
	<%
		String sessionID = (String) session.getAttribute("sessionID");
		if (!Utils.checkSession(sessionID))
			response.sendRedirect("/Raptor");
	%>
	<div class="main">
		<header class="bg-img header inside">

			<div class="container-fluid">
				<div class="main-header" style="text-align: center;">
					<div class="jci-logo">
						<a href="index.html"><span
							style="color: white; font-size: 40px;">LOGO</span></a>
					</div>
					<div class="project-title hidden-xs hidden-sm hidden-md">
						YOYO Bar and Gril</div>
					<div class="pull-right logout-btn" style="margin-right: 5px;">
						<a href="logout" title="Logout" data-toggle="tooltip"
							data-placement="left" title="Logout"><i
							class="fa fa-power-off fa-lg fa-2x"></i></a>
					</div>
				</div>
				<div class="main-content">
					<div class="project-title mobile  hidden-lg">YOYO Bar and
						Grill</div>
					<div class="main-container">
						<!--<div class="section-selection">
							<div class="form-inline form-horizontal">
								<div class="form-group">
									<label class="label">Section : </label> <select
										class="form-control sec-select">
										<option value="bar">Bar</option>
										<option value="lounge">Lounge</option>
										<option value="vip">VIP</option>
									</select>
								</div>
							</div>
						</div>-->



						<div class="row">
							<div class="col-sm-2" style="width: 9%; padding-left: 0px;">
								<div class="box-content section-select-conetnt"
									style="padding-top: 0px;">
									<a href="#bar" class="btn btn-lg login-button active"
										data-show="bar"
										style="margin-bottom: 0px; margin-left: 2px; width: 120px;">Bar</a>
									<a href="#lounge" class="btn btn-lg login-button"
										data-show="lounge"
										style="margin-bottom: 0px; margin-left: 2px; width: 120px;">Lounge</a>
									<a href="#vip" class="btn btn-lg login-button" data-show="vip"
										style="margin-bottom: 0px; margin-left: 2px; width: 120px;">VIP</a>
								</div>
							</div>
							<div class="col-sm-8"
								style="width: 68%; padding-right: 10px; padding-left: 10px;">

								<div class="table-layout-section">
									<div class="label">Table Layout</div>
									<div class="table-layout-container bar">
										<c:forEach items="${model.allTables}" var="allTables">
											<c:if test="${allTables.type == 'Bar'}">
												<c:choose>
													<c:when test="${allTables.isActive == 'true' }">
														<div class="table tableSelect occupied"
															id="${allTables.id}">
															<div class="table-header text-center">${allTables.tableNumber}</div>
															<div class="table-content"></div>
														</div>
													</c:when>

													<c:otherwise>
														<div class="table tableSelect" id="${allTables.id}">
															<div class="table-header text-center">${allTables.tableNumber}</div>
															<div class="table-content"></div>
														</div>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
									</div>
									<div class="table-layout-container lounge"
										style="display: none;">
										<c:forEach items="${model.allTables}" var="allTables">
											<c:if test="${allTables.type == 'Lounge'}">
												<c:choose>
													<c:when test="${allTables.isActive == 'true' }">
														<div class="table tableSelect occupied"
															id="${allTables.id}">
															<div class="table-header text-center">${allTables.tableNumber}</div>
															<div class="table-content"></div>
														</div>
													</c:when>

													<c:otherwise>
														<div class="table tableSelect" id="${allTables.id}">
															<div class="table-header text-center">${allTables.tableNumber}</div>
															<div class="table-content"></div>
														</div>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
									</div>
									<div class="table-layout-container vip" style="display: none;">
										<c:forEach items="${model.allTables}" var="allTables">
											<c:if test="${allTables.type == 'VIP'}">
												<c:choose>
													<c:when test="${allTables.isActive == 'true' }">
														<div class="table tableSelect occupied"
															id="${allTables.id}">
															<div class="table-header text-center">${allTables.tableNumber}</div>
															<div class="table-content"></div>
														</div>
													</c:when>

													<c:otherwise>
														<div class="table tableSelect" id="${allTables.id}">
															<div class="table-header text-center">${allTables.tableNumber}</div>
															<div class="table-content"></div>
														</div>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>


							<div class="col-sm-2 all-btns"
								style="padding-right: 0px; width: 23%; padding-left: 0px;">
								<div class="row">
									<div class="col-sm-12 padding-left-0">
										<c:choose>
											<c:when test="${model.role.contains('Cashier')}">
												<div class="order-management box">
													<!-- <c:out value="${model.role}"/> -->

													<div class="box-header">Order Management</div>
													<div class="box-content clearfix">

														<div
															style="width: 49%; display: inline-block; float: left;">
															<button class="btn new-order btn-default">New
																Order</button>
														</div>

														<div style="display: inline-block; width: 50%;">
															<button class="btn edit-order btn-default">Edit
																Order</button>
														</div>
													</div>
												</div>
											</c:when>
										</c:choose>
									</div>
									<c:choose>
										<c:when
											test="${model.role.contains('Cashier') or model.role.contains('Admin')}">
											<div class="col-sm-12 padding-left-0">
												<div class="bill-management box">
													<div class="box-header">Bill Management</div>
													<div class="box-content">
														<c:choose>
															<c:when test="${model.role.contains('Cashier')}">
																<div class="clearfix">
																	<div
																		style="width: 49%; display: inline-block; float: left;">
																		<button class="btn generate-bill btn-default">Print
																			Bill</button>
																	</div>
																	<div
																		style="width: 50%; display: inline-block; float: left;">
																		<button class="btn settle-bill btn-default">Settle
																			Bill</button>
																	</div>
																</div>

																<div class="clearfix">
																	<div
																		style="width: 49%; display: inline-block; float: left;">
																		<button class="btn active-bills btn-default">Active
																			Bills</button>
																	</div>
																	<div
																		style="width: 50%; display: inline-block; float: left;">
																		<a href="#"
																			class="btn btn-default active-orders btn-default">Active
																			Orders</a>
																	</div>
																</div>
															</c:when>
														</c:choose>
														<c:choose>
															<c:when test="${model.role.contains('Admin')}">
																<div class="clearfix">
																	<div
																		style="width: 49%; display: inline-block; float: left;">
																		<a href="#"
																			class="btn btn-default search-link btn-default">Search</a>
																	</div>

																	<div
																		style="width: 50%; display: inline-block; float: left;">
																		<a href="#"
																			class="btn btn-default report-link btn-default">Report</a>
																	</div>

																</div>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</c:when>
									</c:choose>

									<div class="col-sm-12 padding-left-0">
										<c:choose>
											<c:when
												test="${model.role.contains('Cashier') or model.role.contains('Podium')}">
												<div class="bill-management box">

													<div class="box-header">YOYO Card</div>
													<div class="box-content clearfix">
														<div
															style="width: 49%; display: inline-block; float: left;">
															<button class="btn card-recharge btn-default">Card
																Recharge</button>
														</div>

														<c:choose>
															<c:when test="${model.role.contains('Cashier')}">
																<div
																	style="width: 50%; display: inline-block; float: left;">
																	<button class="btn card-refund btn-default">Refund</button>
																</div>
															</c:when>
														</c:choose>
													</div>
												</div>
											</c:when>
										</c:choose>
									</div>

									<div class="col-sm-12 padding-left-0">
										<c:choose>
											<c:when test="${model.role.contains('Admin')}">
												<div class="bod-eod box">
													<div class="box-header">Daily(BOD/EOD)</div>
													<div class="box-content clearfix">
														<div
															style="width: 49%; display: inline-block; float: left;">
															<button class="btn start-day btn-default">Start
																Day</button>
														</div>

														<div
															style="width: 50%; display: inline-block; float: left;">
															<button class="btn end-day btn-default">End Day</button>
														</div>
													</div>
												</div>
											</c:when>
										</c:choose>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>

	<!--  card recharge modal -->

	<div id="cardRechargeModal" class="modal fade custom-width"
		role="dialog" data-backdrop="static">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Card Recharge</h4>
				</div>
				<div class="modal-body">
					<div class="row" style="margin-bottom: 10px;">
						<div class="col-sm-4">
							<label>Registration No.</label>
						</div>
						<div class="col-sm-6">
							<input type="password" class="form-control register-no" autofocus />
						</div>
					</div>
					<div class="row" style="margin-bottom: 10px;">
						<div class="col-sm-4">
							<label>Balance</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control balance-amount" disabled />
						</div>
					</div>
					<div class="row" style="margin-bottom: 10px;">
						<div class="col-sm-4">
							<label>Recharge Amount</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control recharge-amount" />
						</div>
					</div>
					<div class="row" style="margin-bottom: 10px;">
						<div class="col-sm-4">
							<label>Total Balance</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control total-balance" disabled />
						</div>
					</div>
					<div class="row payement-options" style="margin-bottom: 10px;">
						<div class="col-sm-4">
							<label>Payment By : </label>
						</div>
						<div class="col-sm-6">
							<select class="form-control recharge-payment-option">
								<option value="0">-----Select-----</option>
								<option value="1">Cash</option>
								<option value="2">Debit/Credit Card</option>

							</select>
						</div>
					</div>
					<div class="table-resposive recharge-money-table"
						style="display: none;">
						<table id="cardRechargeDenomination"
							class="moneyTable table table-striped table-bordered hover"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Denomination</th>
									<th>No.of Notes</th>
									<th>Total Amount</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="type-of-note">Chillar</td>
									<td></td>
									<td class="chillarTotalRecharge total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">10</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">20</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">50</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">100</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">500</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">2000</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
							</tbody>

						</table>
						<div class="text-right" style="margin-bottom: 10px;">
							<div class="form-inline">
								<label>Cash Amount : </label> <input type="text"
									class="form-control cash-amount" disabled value="0" />
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success save-card-recharge">Recharge</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal -->
	<div id="newModal" class="modal fade newModal" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">New Order</h4>
				</div>
				<div class="modal-body" style="min-height: 475px;">
					<div class="modal-top row">
						<div class="col-sm-6 modal-top-title">
							<span class="title">Section : </span> <span class="order-type">Bar</span>
						</div>
						<div class="col-sm-6 modal-top-title text-right">
							<span class="title">Table : </span> <span
								class="order-table newOrderTableNumber">B1</span>
						</div>
					</div>
					<div class="form-inline row person-count">
						<div class="col-sm-6">
							<label>Waiter Name : </label> <select
								class="form-control waiter-select">
								<option value="-2">Select</option>
								<c:forEach items="${model.allWaiter}" var="allWaiter">
									<option value="${allWaiter.id}" class="waiter-id">${allWaiter.firstName}</option>
								</c:forEach>
								<option value="-1">Other</option>
							</select> <input type="text" class="form-control other-waiter-text"
								style="display: none;" placeholder="Waiter name" />
						</div>
						<!-- <div class="col-sm-6 text-right">
							<label>No. Of Persons : </label>
							<div class="input-group spinner">
								<input type="text" class="form-control" value="1" min="0"
									max="250">
								<div class="input-group-btn-vertical">
									<button class="btn btn-default" type="button">
										<i class="fa fa-caret-up"></i>
									</button>
									<button class="btn btn-default" type="button">
										<i class="fa fa-caret-down"></i>
									</button>
								</div>
							</div> 
						</div>-->
					</div>
					<div class="row modal-main-content">
						<div class="col-sm-4 tree-view">
							<!--<div class="search-tree">
								<input type="text" class="form-control" id="searchTree" placeholder="Search..." />
							</div>-->

							<select id="menu_select" multiple="multiple">
								<c:forEach items="${model.allMenu}" var="all_Menu">
									<optgroup label="${all_Menu.key}" class="group-1">
										<c:forEach items="${all_Menu.value}" var="subMenu">
											<optgroup label="${subMenu.key}" class="group-2">
												<c:forEach items="${subMenu.value}" var="menu">
														<option value="${menu.id}"
															data-cost="${menu.cost}" id="${menu.id}">${menu.name}</option>
												</c:forEach>
											</optgroup>
										</c:forEach>
									</optgroup>
								</c:forEach>
							</select>

							<!-- <div id="tree"></div>-->
						</div>
						<div class="col-sm-8 order-table">
							<div class="table-responsive">
								<table id="mainTable"
									class="table table-striped table-bordered hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Item</th>
											<th>Quantity</th>
											<th>Price</th>
											<th class="sort-hide">Delete</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div class="text-right form-inline total-price">
									<label>Total : </label> <input type="text"
										class="form-control total-cost" value="0" disabled />
								</div>
								<!--<div class="buttons text-center">
									<button class="btn btn-success give-order">Order</button>
									 <button class="btn btn-danger discard-order">Abort</button> 
								</div>-->
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success give-order">Order</button>
					<button type="button" class="btn btn-success settle-bill" disabled>Settle
						Bill</button>
				</div>
			</div>
		</div>
	</div>

	<div id="editModal" class="modal fade editModal" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Order</h4>
				</div>
				<div class="modal-body" style="min-height: 475px;">
					<div class="modal-top row">
						<div class="col-sm-6 modal-top-title">
							<span class="title">Section : </span> <span class="order-type">Bar</span>
						</div>
						<div class="col-sm-6 modal-top-title text-right">
							<span class="title">Table : </span> <span
								class="order-table editOrderTableNumber">B1</span>
						</div>
					</div>
					<div class="form-inline row person-count">
						<div class="col-sm-6">
							<label>Waiter Name : </label> <select
								class="form-control waiter-select">
								<option value="-2">Select</option>
								<c:forEach items="${model.allWaiter}" var="allWaiter">
									<option value="${allWaiter.id}"
										waiter-name="${allWaiter.firstName}" class="waiter-id">${allWaiter.firstName}</option>
								</c:forEach>
								<option value="-1">Other</option>
							</select> <input type="text" class="form-control other-waiter-text"
								style="display: none;" placeholder="Waiter name" />
						</div>
						<!-- <div class="col-sm-6 text-right">
							<label>No. Of Persons : </label>
							<div class="input-group spinner">
								<input type="text" class="form-control" value="1" min="0"
									max="250">
								<div class="input-group-btn-vertical">
									<button class="btn btn-default" type="button">
										<i class="fa fa-caret-up"></i>
									</button>
									<button class="btn btn-default" type="button">
										<i class="fa fa-caret-down"></i>
									</button>
								</div>
							</div>
						</div>-->
					</div>
					<div class="row modal-main-content">
						<div class="col-sm-4 tree-view">

							<!-- <div class="search-tree">
								<input type="text" class="form-control" id="editsearchTree"
									placeholder="Search..." />
							</div> -->

							<select id="menu_select_edit" multiple="multiple">
								<optgroup label="Veg" class="group-1">
									<c:forEach items="${model.allFoodMenu}" var="allFoodMenu">
										<c:if test="${allFoodMenu.veg == 'true'}">
											<option value="${allFoodMenu.id}+${allFoodMenu.itemName}"
												data-cost="${allFoodMenu.cost}" type="FOOD"
												id="${allFoodMenu.id}">${allFoodMenu.itemName}</option>
										</c:if>
									</c:forEach>
								</optgroup>
								<optgroup label="Non Veg" class="group-2">
									<c:forEach items="${model.allFoodMenu}" var="allFoodMenu">
										<c:if test="${allFoodMenu.veg == 'false'}">
											<option value="${allFoodMenu.id}+${allFoodMenu.itemName}"
												data-cost="${allFoodMenu.cost}" type="FOOD"
												id="${allFoodMenu.id}">${allFoodMenu.itemName}</option>
										</c:if>
									</c:forEach>
								</optgroup>
								<optgroup label="Bar" class="group-3">
									<c:forEach items="${model.allBarMenu}" var="allBarMenu">
										<option value="${allBarMenu.id}+${allBarMenu.itemName}"
											data-cost="${allBarMenu.cost}" type="BAR"
											id="${allBarMenu.id}">${allBarMenu.itemName}</option>
									</c:forEach>
								</optgroup>
							</select>

							<!--  <div id="editTree"></div>-->
						</div>
						<div class="col-sm-8 order-table">
							<div class="table-responsive">
								<input type="hidden" value="" id="editBillID" />
								<table id="editMainTable"
									class="table table-striped table-bordered hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Item</th>
											<th>Quantity</th>
											<th>Price</th>
											<th class="sort-hide">Delete</th>
											<th>KOT</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div class="text-right form-inline editOrdertotal">
									<label>Total : </label> <input type="text"
										class="form-control total-cost" value="0" disabled />
								</div>
								<!--<div class="buttons text-center">
									<button class="btn btn-success add-order">Order</button>
									 <button class="btn btn-danger discard-order">Abort</button> 
								</div>-->
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success add-order">Order</button>
					<button type="button" class="btn btn-success settle-bill">Settle
						Bill</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="billModal" class="modal fade custom-width" role="dialog"
		data-backdrop="static" style="z-index: 9999;">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Bill</h4>
				</div>
				<div class="modal-body">
					<div class="modal-top row">
						<div class="col-sm-3 modal-top-title">
							<span class="title">Section : </span> <span class="order-type">Bar</span>
						</div>
						<div class="col-sm-6 modal-top-title form-inline">
							<span class="title">Waiter : </span> <select
								class="form-control waiter-select" disabled style="width: 70%;">
								<option value="-1">Select</option>
								<c:forEach items="${model.allWaiter}" var="allWaiter">
									<option value="${allWaiter.id}"
										waiter-name="${allWaiter.firstName}" class="waiter-id">${allWaiter.firstName}</option>
								</c:forEach>
								<option value="-1">Other</option>
							</select>
						</div>
						<div class="col-sm-3 modal-top-title text-right">
							<span class="title">Table : </span> <span
								class="section-order-table settleBillTableNumber">B1</span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 order-table">
							<div class="table-responsive">
								<input type="hidden" value="" id="settleBillID" />
								<table id="billMainTable"
									class="table table-striped table-bordered hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Item</th>
											<th>Quantity</th>
											<th>Price</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div class="text-right form-inline settleBilltotal"
									style="margin-top: 10px;">
									<label>Bill Amount : </label> <input type="text"
										class="form-control bill-total-cost" value="900"
										style="margin-top: 10px; margin-right: 10px" disabled /> <label
										style="margin-right: 41px">Bill Amount After Tax: </label> <input
										type="text" class="form-control bill-amt-after-tax" value="0"
										disabled />
								</div>
								<div class="text-right form-inline" style="margin-top: 10px;">
									<label>Discount %: </label> <input type="text"
										class="form-control discount-amount" value="0"
										style="margin-right: 10px;" /> <label>Bill Amount
										after discount: </label> <input type="text"
										class="form-control bill-amt-after-discount" value="0"
										disabled />
								</div>
								<div class="text-right form-inline settleBilltotal"
									style="margin-top: 10px;">
									<label>Final Bill Amount: </label> <input type="text"
										class="form-control actual-amount" value="0" disabled />
								</div>
							</div>
						</div>
					</div>
					<div class="row payement-options">
						<div class="form-inline col-sm-8">
							<label>Payment By : <label> <select
									class="form-control payment-option">
										<option value="0">-----Select-----</option>
										<option value="1">Cash</option>
										<option value="2">Debit/Credit Card</option>
										<option value="3">YOYO Club Card</option>
								</select>
						</div>
					</div>
					<div class="table-resposive money-table" style="display: none;">
						<table id="yoyoDenominationTableDirect"
							class="moneyTable table table-striped table-bordered hover"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Denomination</th>
									<th>No.of Notes</th>
									<th>Total Amount</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="type-of-note">Chillar</td>
									<td></td>
									<td class="chillarTotalDirect total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">10</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">20</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">50</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">100</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">500</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">2000</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
							</tbody>

						</table>
						<div class="text-right" style="margin-bottom: 10px;">
							<div class="form-inline">
								<label>Cash Amount : </label> <input type="text"
									class="form-control cash-amount" disabled value="0" />
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success save-settle-bill">Save</button>
					<button type="button" class="btn btn-primary print-bill"
						data-dismiss="modal">Print</button>
					<!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
				</div>
			</div>
		</div>
	</div>

	<div id="activeBills" class="modal fade custom-width" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Active Bills</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12 order-table">
							<div class="table-responsive">
								<table id="activebillsTable"
									class="table table-striped table-bordered hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Table</th>
											<th>Amount</th>
											<th>Tax Amount</th>
											<th>Total Amount</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody class="active-bill-tbody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--<div class="modal-footer">
			<button type="button" class="btn btn-success settle-bill">Settle Bill</button>
		  </div>-->
			</div>

		</div>
	</div>

	<div id="activeOrders" class="modal fade custom-width" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Active Orders</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12 order-table">
							<div class="table-responsive">
								<table id="activeOrdersTable"
									class="table table-striped table-bordered hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Item</th>
											<th>Amount</th>
											<th>Quantity</th>
											<th>Challan ID</th>
											<th>Waiter</th>
										</tr>
									</thead>
									<tbody class="active-orders-tbody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--<div class="modal-footer">
			<button type="button" class="btn btn-success settle-bill">Settle Bill</button>
		  </div>-->
			</div>

		</div>
	</div>

	<div id="refundYoyoCards" class="modal fade custom-width" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Refund</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12 order-table">
							<div class="table-responsive">
								<table id="refundcardsYoyo"
									class="table table-striped table-bordered hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Card No</th>
											<th>Balance</th>
											<th>Refund Amount</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-success clean-yoyo-cards">Clean All</button>
		  		</div> -->
			</div>

		</div>
	</div>


	<div id="YoyomPaymentModal"
		class="modal fade yoyo-card-payment-details custom-width"
		role="dialog" data-backdrop="static" style="z-index: 9999;">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">YOYO Card Payment</h4>
				</div>
				<div class="modal-body">
					<div class="modal-top row">
						<div class="col-sm-6 modal-top-title">
							<span class="title">Section : </span> <span class="order-type">Bar</span>
						</div>
						<div class="col-sm-6 modal-top-title text-right">
							<span class="title">Table : </span> <span
								class="order-table TableNumber">B1</span>
						</div>
					</div>
					<div class="form-inline">
						<label>Total Amount :</label> <input type="text"
							class="form-control yoyo-total-cost" disabled value="0" />
					</div>
					<div class="form-inline">
						<label>Registration No :</label> <input type="password"
							class="form-control yoyo-registration-number" value="0" autofocus />
					</div>
					<div class="form-inline">
						<label>Balance Amount :</label> <input type="text"
							class="form-control yoyo-balance-amount" value="0" disabled />
					</div>
					<div class="form-inline">
						<label>Remaining Amount :</label> <input type="text"
							class="form-control yoyo-remaining-amount" value="0" disabled />
					</div>
					<div class="form-inline">
						<label>Partial Payment By :</label> <select
							class="form-control yoyo-payment-option">
							<option value="0">None</option>
							<option value="1">Cash</option>
							<option value="2">Debit/Credit Card</option>
						</select>
					</div>
					<div class="table-resposive yoyo-money-table"
						style="display: none;">
						<table id="yoyoDenominationTable"
							class="moneyTable table table-striped table-bordered hover"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Denomination</th>
									<th>No.of Notes</th>
									<th>Total Amount</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="type-of-note">Chillar</td>
									<td></td>
									<td class="chillarTotal total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">10</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">20</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">50</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">100</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">500</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
								<tr>
									<td class="type-of-note">2000</td>
									<td>
										<div class="input-group spinner">
											<input type="text" class="form-control" value="0" min="0"
												max="250">
											<div class="input-group-btn-vertical">
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-up"></i>
												</button>
												<button class="btn btn-default" type="button">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									</td>
									<td class="total-row-price">0</td>
								</tr>
							</tbody>

						</table>
						<div class="text-right" style="margin-bottom: 10px;">
							<div class="form-inline">
								<label>Cash Amount : </label> <input type="text"
									class="form-control cash-amount" disabled value="0" />
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button"
						class="btn btn-success save-settle-bill save-yoyo-payment">Save</button>
				</div>

			</div>

		</div>
	</div>


	<div class="menu-overlay"></div>


</body>
</html>

<spring:url value="/resources/core/js/lib/jquery.nicescroll.js"
	var="nicescrollJs" />
<spring:url value="/resources/core/js/lib/bootstrap-treeview.js"
	var="treeviewJs" />
<spring:url value="/resources/core/js/lib/jquery.dataTables.min.js"
	var="dataTableJs" />
<spring:url value="/resources/core/js/lib/dataTables.bootstrap.min.js"
	var="dataBootJs" />

<script src="${nicescrollJs}"></script>
<script src="${treeviewJs}"></script>
<script src="${dataTableJs}"></script>
<script src="${dataBootJs}"></script>

<script>

	$('.card-recharge').on('click',function(){
		$('#cardRechargeModal').modal('show');
		
		$('#cardRechargeModal .register-no').val('');
		$('#cardRechargeModal .balance-amount').val('');
		$('#cardRechargeModal .recharge-amount').val('');
		$('#cardRechargeModal .total-balance').val('');
		
		$('#cardRechargeModal .register-no').focus();
	});
	
	$('.discount-amount').on('change',function(){
	
		if(!isNaN($(this).val())){
			var disamnt = $(this).val();
			var amnt = $(this).closest('.modal').find('.bill-total-cost').val();
			
			if(parseInt(amnt)*(parseInt(disamnt)/100) > parseInt(amnt))
			{
				alert('Discount Amount cannot be greater than Bill Amount');
				$(this).closest('.modal').find('.discount-amount').val('');
				$(this).closest('.modal').find('.bill-amt-after-discount').val(amnt);
				$(this).closest('.modal').find('.actual-amount').val(amnt);
			}
			else{
				var actual_amount = amnt - (amnt*(disamnt/100));
				$(this).closest('.modal').find('.bill-amt-after-discount').val(actual_amount);
				$(this).closest('.modal').find('.actual-amount').val(actual_amount);
			}
		}
		else
			alert('Please enter correct amount');
	})
	
	
	$('.bg-img').css("min-height", $(window).height() + "px");
	$(window).resize(function() {
		$('.bg-img').css("min-height", $(window).height() + "px");
	});

	/*$('.sec-select').change(
			function() {
				var section = $(".sec-select option:selected").val();
				if (section == "bar") {
					$('.table-layout-container.bar').siblings(
							'.table-layout-container').fadeOut(
							"slow",
							function() {
								setTimeout(function() {
									$('.table-layout-container.bar').fadeIn(
											"slow");
								}, 600)
							})
				} else if (section == "lounge") {
					$('.table-layout-container.lounge').siblings(
							'.table-layout-container').fadeOut(
							"slow",
							function() {
								setTimeout(function() {
									$('.table-layout-container.lounge').fadeIn(
											"slow");
								}, 600)
							})
				} else
					$('.table-layout-container.vip').siblings(
							'.table-layout-container').fadeOut(
							"slow",
							function() {
								setTimeout(function() {
									$('.table-layout-container.vip').fadeIn(
											"slow");
								}, 600)
							})
			});*/
			
$(document).on('click','.section-select-conetnt .btn',function(){
	var section = $(this).attr('data-show');
	
	$(this).siblings().removeClass('active');
	$(this).addClass('active');
	
	if(section == "bar"){
		$('.table-layout-container.bar').siblings('.table-layout-container').hide();
		$('.table-layout-container.bar').show();
		
	}
	else if(section == "lounge"){
		$('.table-layout-container.lounge').siblings('.table-layout-container').hide();
		$('.table-layout-container.lounge').show();
		
	}
	else{
		$('.table-layout-container.vip').siblings('.table-layout-container').hide();
		$('.table-layout-container.vip').show();
	}
	
});			

	/*var treeData = [ {
		text : "Food Menu",
		nodes : [ {
			text : "Veg",
			nodes : [
				<c:forEach items="${model.allFoodMenu}" var="allFoodMenu">
					<c:if test="${allFoodMenu.veg == 'true'}">
						{
							text : "${allFoodMenu.itemName}",
							tags : [${allFoodMenu.cost},'FOOD',${allFoodMenu.id}]
						},
					</c:if>
				</c:forEach>
			]
		}, {
			text : "Non Veg",
			nodes : [ 
				<c:forEach items="${model.allFoodMenu}" var="allFoodMenu">
					<c:if test="${allFoodMenu.veg == 'false'}">
						{
							text : "${allFoodMenu.itemName}",
							tags : [${allFoodMenu.cost},'FOOD',${allFoodMenu.id}]
						},
					</c:if>
				</c:forEach>
			]
		} ]
	}, {
		text : "Bar Mneu",
		nodes : [ {
			text : "Special",
			nodes : [ 
				<c:forEach items="${model.allBarMenu}" var="allBarMenu">
					{
						text : "${allBarMenu.itemName}",
						tags : [${allBarMenu.cost},'BAR',${allBarMenu.id}]
					},
				</c:forEach>	
			]
		}]
	} ];*/
	
	/*Print bill code - Ameya*/
	$('.print-bill').on('click', function() {
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		if($('.'+section).find('.occupied.selected').length > 0){
			var tableNumber = $('.settleBillTableNumber').text();
	    	var data = {
		    		"tableNumber":tableNumber
		    	};
	    	$.ajax({
	            url: 'printBill',
	            data: tableNumber,
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	        });
		}
		else
			alert('Please select occupied table');
		}
	);
	
	/**/

	/*** new code *********/

	$('.generate-bill').on('click', function() {
		//var section = $('.sec-select').val();
	
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		
		if($('.'+section).find('.occupied.selected').length > 0){
			$('#bill .order-type').html(section.toUpperCase());
			var table_no = $('.'+section).find('.occupied.selected').attr('data-table-no');
			$('#bill .section-order-table').html(table_no);
			$('.payement-options').hide();
			$('.save-settle-bill').hide();
			$('.print-bill').show();
			$('.yoyo-card-payment-details').hide();
			var tableNumber = $('.settleBillTableNumber').text();
	    	$('#billModal .section-order-table').html(tableNumber);
	    	var data = {
		    		"tableNumber":tableNumber
		    	};
	    	$.ajax({
	            url: 'getOrder',
	            data: tableNumber,
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){
	            	alert(JSON.stringify(data));
	            	var selectedWaiterId = data.waiterID;
	                $('#billModal .waiter-select [value="'+selectedWaiterId+'"]').attr('selected','true');
	                for (var i = 0; i < data.orders.length; i++) {
	                	var id = data.orders[i].id;
	                	var item = data.orders[i].orderItemID;
						var price = data.orders[i].cost;
						var quantity = data.orders[i].quantity;
						var className = (item).replace(/ /g, '-');
		                var tr = "";
						tr = '<tr id="'+id+'"class="'+className+'" data-unit-price="'+price+'"><td class="orderItem">'
								+ item
								+ '<td>'
								+ '<div class="input-group spinner">'
								+ '<input type="text" class="form-control quantity-value" value="'+quantity+'" min="0" max="100" disabled>'
								+ '<div class="input-group-btn-vertical">'
								+ '<button class="btn btn-default" type="button" disabled><i class="fa fa-caret-up"></i></button>'
								+ '<button class="btn btn-default" type="button" disabled><i class="fa fa-caret-down"></i></button>'
								+ '</div>'
								+ '</div>'
								+ '</td>'
								+ '<td class="total-row-price">'
								+ price
								+ '</td></tr>';
	
						$('#billMainTable tbody').append(tr);
						$('#settleBillID').val(data.id);
						$('.settleBilltotal').find('input').val(data.amount);
						$('#billModal').modal('show');
					}
	            },
	            error: function(xhr, textStatus, errorThrown){
	                alert('request failed');
	                return false;
	            }
	        });
		}
		else
			alert('Please select occupied table');
	});

	//$('.settle-bill').on('click', function() {
	$(document).on('click','.settle-bill', settleBill);
	
	function settleBill() {
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		
		//if($('.'+section).find('.occupied.selected').length > 0){
			$('#billMainTable .order-type').html(section.toUpperCase());
			$('.payement-options').show();
			$('#billMainTable tbody').html('');
			$('#billModal .total-cost').val('0');
	    	var tableNumber = $('.settleBillTableNumber').text();
	    	$('#billModal .section-order-table').html(tableNumber);
	    	var data = {
		    		"tableNumber":tableNumber
		    	};
	    	$.ajax({
	            url: 'getOrder',
	            data: tableNumber,
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){
	            	alert(JSON.stringify(data));
	            	var selectedWaiterId = data.waiterID;
	                $('#billModal .waiter-select [waiter-name="'+selectedWaiterId+'"]').attr('selected','true');
	                for (var i = 0; i < data.orders.length; i++) {
	                	var id = data.orders[i].id;
	                	var item = data.orders[i].orderItemID;
						var price = data.orders[i].cost;
						var quantity = data.orders[i].quantity;
						var className = (item).replace(/ /g, '-');
		                var tr = "";
						tr = '<tr id="'+id+'"class="'+className+'" data-unit-price="'+price+'"><td class="orderItem">'
								+ item
								+ '<td>'
								+ '<div class="input-group spinner">'
								+ '<input type="text" class="form-control quantity-value" value="'+quantity+'" min="0" max="100" disabled>'
								+ '<div class="input-group-btn-vertical">'
								+ '<button class="btn btn-default" type="button" disabled><i class="fa fa-caret-up"></i></button>'
								+ '<button class="btn btn-default" type="button" disabled><i class="fa fa-caret-down"></i></button>'
								+ '</div>'
								+ '</div>'
								+ '</td>'
								+ '<td class="total-row-price">'
								+ price
								+ '</td></tr>';
	
						$('#billMainTable tbody').append(tr);
						$('#settleBillID').val(data.id);
						$('.settleBilltotal').find('input').val(data.amount);
						$('#billModal .bill-amt-after-tax').val(data.totalAmount);
						$('#billModal .bill-amt-after-discount').val(data.amount);
						$('#billModal .actual-amount').val(data.amount);
						$('#billModal').modal('show');
					}
	            },
	            error: function(xhr, textStatus, errorThrown){
	                alert('request failed');
	                return false;
	            }
	        });
		//}
		//else
			//alert('Please select occupied table');

	}
	
	$('.active-bills').on('click',function(){
		$('#activeBills').modal('show');
		$('#activeBills tbody').html('');
		
		$.ajax({
            url: 'getBills',
            type: "GET",           
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(data){ 
                //alert(JSON.stringify(data));
                for (var i = 0; i < data.length; i++) {	
                
                	var tableNumber = data[i].tableNumber;
                	var amount = data[i].amount;
                	var taxAmount = data[i].taxAmount;
                	var totalAmount = data[i].totalAmount;
	                var tr = "";
					
					tr = '<tr>'
					   + '<td>' + tableNumber + '</td>'
					   + '<td>' + amount + '</td>'
					   + '<td>' + taxAmount + '</td>'
					   + '<td>' + totalAmount + '</td>'
					   + '<td><button type="button" class="btn btn-success active-settle-bill">Settle Bill</button></td>'
					   + '</tr>';

					$('#activeBills tbody').append(tr);
					$('#activeBills').modal('show');
				}
            },
        });
	});
	
	/*Settle bill from active bills*/
	$('.active-bill-tbody').on('click', '.active-settle-bill', function () {
		var currentRow = $(this).closest("tr");
		//$('#activeBills').modal('hide');
		$('.settleBillTableNumber').text(currentRow.find("td").eq(0).text());
		var tn = $('.settleBillTableNumber').text();
		settleBill();
		//$('#billModal').modal('show');
	});
	
	
	/*$(document).on('click','#activeBills .settle-active-bill',function({
		$('#activeBills').modal('hide');
		$('#bill').modal('show');
	});
	
	$('#activeBills .settle-active-bill').on('click',function(){
		$('#activeBills').modal('hide');
		$('#bill').modal('show');
	})*/
	
	/****** code to occupy table ****/

	/*$(document).on('click','.occupied',function(){
		$(this).toggleClass('selected');
	});*/

	$('.active-orders').on('click',function(){
		$('#activeOrders').modal('show');
		$('#activeOrders tbody').html('');
		
		$.ajax({
            url: 'getActiveOrders',
            type: "POST",           
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(data){ 
                //alert(JSON.stringify(data));
                for (var i = 0; i < data.length; i++) {	
                	
                	var orderItemID = data[i].orderItemID;
                	var cost = data[i].cost;
                	var quantity = data[i].quantity;
                	var chalanID = data[i].chalanID;
                	var waiterID = data[i].waiterID;
                	
	                var tr = "";
					
					tr = '<tr>'
					   + '<td>' + orderItemID + '</td>'
					   + '<td>' + cost + '</td>'
					   + '<td>' + quantity + '</td>'
					   + '<td>' + chalanID + '</td>'
					   + '<td>' + waiterID + '</td>'
					   + '</tr>';

					$('#activeOrders tbody').append(tr);
					$('#activeOrders').modal('show');
				}
            },
        });
	});
	
	$(document).on('click','.table-layout-container .table,.lounge-box,.vip-box',function(){
		$(this).siblings().removeClass('selected');
		if(!$(this).hasClass('selected'))
			$(this).addClass('selected');
		else
			//alert('Table is already occupied & order is already placed.');
			$(this).removeClass('selected');
	});
	
	$('#newModal').on('hidden.bs.modal', function () {
		//var section = $('.sec-select').val();
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		$('.'+section).find('.occupied.selected').toggleClass('selected');
		$('.'+section).find('.selected').removeClass('selected');
		location.reload(true);
	})
	
	$('.modal').on('hidden.bs.modal', function () {
		location.reload(true);
	});
	
	$('#editModal').on('hidden.bs.modal', function () {
		//var section = $('.sec-select').val();
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		$('.'+section).find('.occupied.selected').toggleClass('selected');
		$('.'+section).find('.selected').removeClass('selected');
		location.reload(true);
	})
	
	

	$('#billModal').on('hidden.bs.modal', function () {
		//var section = $('.sec-select').val();
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		$('.'+section).find('.occupied.selected').toggleClass('selected');
		$('.'+section).find('.selected').removeClass('selected');
		location.reload(true);
	})

	$(document)
			.on(
					'click',
					'.spinner .btn:first-of-type',
					function() {
						var btn = $(this);
						var input = btn.closest('.spinner').find('input');
						if (input.attr('max') == undefined
								|| parseInt(input.val()) < parseInt(input
										.attr('max'))) {
							input.val(parseInt(input.val(), 10) + 1);
						} else {
							btn.next("disabled", true);
						}
						
						if($(btn).closest('#billModal').length > 0 || $(btn).closest('#YoyomPaymentModal').length > 0 || $(btn).closest('#cardRechargeModal').length > 0){
							var row = $(this).closest('tr');
							fnChangeCashRowPrice(row, parseInt(input.val()));
						}
						else{
							var mode = "new";
							if(btn.closest('#editMainTable').length > 0)
								mode = "edit";
							
							var row = $(this).closest('tr');
							fnChangeRowPrice(row, parseInt(input.val()),mode);
						}
						
						
					});

	$(document)
			.on(
					'click',
					'.spinner .btn:last-of-type',
					function() {
						var btn = $(this);
						var input = btn.closest('.spinner').find('input');
						if (input.attr('min') == undefined
								|| parseInt(input.val()) > parseInt(input
										.attr('min'))) {
							input.val(parseInt(input.val(), 10) - 1);
						} else {
							btn.prev("disabled", true);
						}
						
						if($(btn).closest('#billModal').length > 0 || $(btn).closest('#YoyomPaymentModal').length > 0 || $(btn).closest('#cardRechargeModal').length > 0){
							var row = $(this).closest('tr');
							fnChangeCashRowPrice(row, parseInt(input.val()));
						}
						else{
							var mode = "new";
							if(btn.closest('#editMainTable').length > 0)
								mode = "edit";
							
							var row = $(this).closest('tr');
							fnChangeRowPrice(row, parseInt(input.val()),mode);
						}
						
					});

	$(document).on(
			'click',
			'.delete-item',
			function() {
				if($(this).attr('disabled')){
					alert('Order is already placed.You can not delete it.');
					return;
				}
				var row = $(this).closest('tr');
				var mode = "new";
				if(row.closest('#editMainTable').length > 0)
					mode = "edit";
				
				$(row).remove();
				if ($('#mainTable tbody tr').length == 0) {
					$('.check-icon').each(
							function() {
								$(this).removeClass('glyphicon-check')
										.addClass('glyphicon-unchecked');
							})
				}
				var item = $(this).closest('tr').attr('class').replace(/-/g,
						' ');
				
				var value = $(row).attr('data-value');
				
				if(mode == "new"){
					$('#menu_select').multiselect('deselect', [value]);
					$('#menu_select').multiselect('updateButtonText');
				}
				else{
					$('#menu_select_edit').multiselect('deselect', [value]);
					$('#menu_select_edit').multiselect('updateButtonText');
				}
				
				
				$('.node-tree').each(
						function() {
							var text = $(this).contents().filter(function() {
								return this.nodeType == Node.TEXT_NODE;
							}).text();

							if (text == item)
								$(this).find('.check-icon').removeClass(
										'glyphicon-check').addClass(
										'glyphicon-unchecked');
						})
				
				fnCalculateTotalPrice(mode);
			});

	$(document).on(
			'click',
			'.discard-order',
			function() {
				$('#mainTable tbody').html('');
				if ($('#mainTable tbody tr').length == 0) {
					$('.check-icon').each(
							function() {
								$(this).removeClass('glyphicon-check')
										.addClass('glyphicon-unchecked');
							})
				}
				$('.total-cost').val('0');
			});
	
	 
	$(document).on('change', '.quantity-value', function() {
		var row = $(this).closest('tr');
		var val = $(row).find('.quantity-value').val();
		fnChangeRowPrice(row);
	});

	function fnChangeRowPrice(row, val,mode) {
		var totalRowPrice = "";
		var unitPrice = $(row).attr('data-unit-price');
		totalRowPrice = unitPrice * val;
		$(row).find('.total-row-price').text(totalRowPrice);
		if(mode)
			fnCalculateTotalPrice(mode);
		else
			fnCalculateTotalPrice();
	}
	
	function fnChangeCashRowPrice(row, val) {
		var totalRowPrice = "";
		var unitPrice = $(row).find('td:first-child').text();
		totalRowPrice = unitPrice * val;
		$(row).find('.total-row-price').text(totalRowPrice);
		fnCalculateTotalCashPrice(row);
		
	}
	
	
	function fnCalculateTotalCashPrice(row){
		var tableRows = '';
		tableRows = $(row).closest('.moneyTable').find('tbody tr');
		
		var totalP = 0;
		for (var i = 0; i < tableRows.length; i++) {
			var row = tableRows[i];
			var rowTotalPrice = $(row).find('.total-row-price').text();
			totalP += parseInt(rowTotalPrice);
		}
		//$('.total-cost').val(totalP);
		$(row).closest('.modal').find('.cash-amount').val(totalP);
	}
	
	function fnCalculateTotalPrice(mode) {
		var tableRows = '';
		if(mode=="edit")
			tableRows = $('#editMainTable tbody tr');
		else
			tableRows = $('#mainTable tbody tr');
		var totalP = 0;
		for (var i = 0; i < tableRows.length; i++) {
			var row = tableRows[i];
			var rowTotalPrice = $(row).find('.total-row-price').text();
			totalP += parseInt(rowTotalPrice);
		}
		$('.total-cost').val(totalP);
	}
	
	
	
	function fnCalculateTotalPrice(mode) {
		var tableRows = '';
		if(mode=="edit")
			tableRows = $('#editMainTable tbody tr');
		else
			tableRows = $('#mainTable tbody tr');
		var totalP = 0;
		for (var i = 0; i < tableRows.length; i++) {
			var row = tableRows[i];
			var rowTotalPrice = $(row).find('.total-row-price').text();
			totalP += parseInt(rowTotalPrice);
		}
		$('.total-cost').val(totalP);
	}

	/*function fnCalculateTotalPrice(mode) {
		if (mode = 'New')
			{
			var tableRows = $('#mainTable tbody tr');
			var totalPrice = 0;
			for (var i = 0; i < tableRows.length; i++) {
				var row = tableRows[i];
				var rowTotalPrice = $(row).find('.total-row-price').text();
				totalPrice += parseInt(rowTotalPrice);
			}
			$('.total-cost').val(totalPrice);
			}
		else if (mode = 'Edit')
			{
			var tableRows = $('#editMainTable tbody tr');
			var totalPrice = 0;
			for (var i = 0; i < tableRows.length; i++) {
				var row = tableRows[i];
				var rowTotalPrice = $(row).find('.total-row-price').text();
				totalPrice += parseInt(rowTotalPrice);
			}
			$('.editOrdertotal').find('input').val(totalPrice);
			
			}
		
	}*/
	

	/*$('#searchTree').on('keyup', newOrdersearch);
	$('#editsearchTree').on('keyup', editOrdersearch);

	var tree = $('#tree')
			.treeview(
					{
						showTags : true, //newly added for tags as price
						data : treeData,
						onhoverColor : "#eee",
						//showCheckbox : true,
						showIcon : true,
						selectable : true,
						onNodeSelected : function(event, node) {
							if (node.nodes == undefined) {
								var item = node.text;
								var price = node.tags[0];
								var type = node.tags[1];
								var className = (item).replace(/ /g, '-');
								var tr = "";
								tr = '<tr class="'+className+'" data-unit-price="'+price+'"><td class="orderItem">'
										+ item
										+ '</td>'
										+ '<td>'
										+ '<div class="input-group spinner">'
										+ '<input type="text" class="form-control quantity-value" value="1" min="0" max="100">'
										+ '<div class="input-group-btn-vertical">'
										+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>'
										+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>'
										+ '</div>'
										+ '</div>'
										+ '</td>'
										+ '<td class="total-row-price">'
										+ price
										+ '</td>'
										+ '<td><a href="#" class="delete-item"><i class="fa fa-trash fa-lg"></i></a></td></tr>';

								$('#mainTable tbody').append(tr);
								fnCalculateTotalPrice();
							}
						}
					});
	*//*
	var edittree = $('#editTree')
			.treeview(
					{
						showTags : true, //newly added for tags as price
						data : treeData,
						onhoverColor : "#eee",
						//showCheckbox : true,
						showIcon : true,
						selectable : true,
						onNodeSelected : function(event, node) {
							if (node.nodes == undefined) {
								var item = node.text;
								var price = node.tags[0];
								var className = (item).replace(/ /g, '-');
								var tr = "";
								tr = '<tr class="'+className+'" data-unit-price="'+price+'"><td class="orderItem">'
										+ item
										+ '</td>'
										+ '<td>'
										+ '<div class="input-group spinner">'
										+ '<input type="text" class="form-control quantity-value" value="1" min="0" max="100">'
										+ '<div class="input-group-btn-vertical">'
										+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>'
										+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>'
										+ '</div>'
										+ '</div>'
										+ '</td>'
										+ '<td class="total-row-price">'
										+ price
										+ '</td>'
										+ '<td><a href="#" class="delete-item"><i class="fa fa-trash fa-lg"></i></a></td>'
										+ '<td>KOT</td>'
										+ '</tr>';
		
								$('#editMainTable tbody').append(tr);
								fnCalculateTotalPrice("edit");
							}
						}
					});	*/
	
	$(document).ready(function () {
		
		var url = window.location.href;
		
		if(url.indexOf('#') != -1){
			var section = url.split('#')[1];
			
			if(section != 'bar'){
				$('[data-show="'+section+'"]').trigger('click');
			}
		}
	}); 
	
	$(document).on('change','.waiter-select',function(){
		var val = $(this).find('option:selected').val();
		
		if(val == '-1'){
			$(this).closest('.modal').find('.other-waiter-text').show();
		}
		else
			$(this).closest('.modal').find('.other-waiter-text').hide();
	});
	
	
	$(document).on('change','.yoyo-payment-option',function(){
		var paymentMode = $('.yoyo-payment-option option:selected').val();
		
		
		if(paymentMode == '1'){
			$(this).closest('.modal').find('.yoyo-money-table').show();
			var remaining = $('.yoyo-remaining-amount').val();
			var chillar = remaining % 10;
			$('.chillarTotal').text(chillar);
		}
		else
			$(this).closest('.modal').find('.yoyo-money-table').hide();
	});
	
	
	$(document).on('change','.recharge-payment-option',function(){
		var paymentMode = $('.recharge-payment-option option:selected').val();
		
		
		if(paymentMode == '1'){
			$(this).closest('.modal').find('.recharge-money-table').show();
			var remaining = $('.recharge-amount').val();
			var chillar = remaining % 10;
			$('.chillarTotalRecharge').text(chillar);
		}
		else
			$(this).closest('.modal').find('.recharge-money-table').hide();
	});
	
	$(document).on('change','.payment-option',function(){
		var paymentMode = $('.payment-option option:selected').val();
		var section = $(this).closest('.modal').find('.order-type').text();
		var tableNo = $(this).closest('.modal').find('.settleBillTableNumber').text();
		var total_cost = $(this).closest('.modal').find('.actual-amount').val();
		
		if(paymentMode == '3'){
			$(this).closest('.modal').find('.money-table').hide();
			$('#YoyomPaymentModal').find('.order-type').text(section);
			$('#YoyomPaymentModal').find('.TableNumber').text(tableNo);
			$('#YoyomPaymentModal').find('.yoyo-total-cost').val(total_cost);
			$('#YoyomPaymentModal').find('.yoyo-remaining-amount').val(total_cost);
			$('#YoyomPaymentModal').find('.yoyo-registration-number').val('');
			$('#YoyomPaymentModal').modal('show');
			
			$('#YoyomPaymentModal').find('.yoyo-registration-number').focus();
		}
		else if(paymentMode == '1'){
			$(this).closest('.modal').find('.money-table').show();
			var remaining = $('.actual-amount').val();
			var chillar = remaining % 10;
			$('.chillarTotalDirect').text(chillar);
		}
		else
			$(this).closest('.modal').find('.money-table').hide();
	})

	function editOrdersearch() {
		var pattern = $('#editsearchTree').val();
		if(pattern){
			var options = {
			};
			var results = edittree.treeview('search', [ pattern, options ]);
		}
		else
			edittree.treeview('collapseAll', {});
		
	}
	
	
	function newOrdersearch() {
		var pattern = $('#searchTree').val();
		if(pattern){
			var options = {
			};
			var results = tree.treeview('search', [ pattern, options ]);
		}
		else
			tree.treeview('collapseAll', {});
		
	}
	
	
	$( "div" ).data( "tables", 
			{ 
				<c:forEach items="${model.allTables}" var="allTables">
					${allTables.id}: {tableNumber: "${allTables.tableNumber}", type: "${allTables.type}"},
				</c:forEach>
			}
	);
	
	var totalPrice = 0;
	
	$(document).ready(function () {
	    $(document).on('click', '.tableSelect', function () {
	        var tableid = $(this).attr('id');
	        $.each($( "div" ).data( "tables" ), function(key, item){
	            if(key == tableid){
	            	$('.newOrderTableNumber').text(item.tableNumber);
	            	$('.editOrderTableNumber').text(item.tableNumber);
	            	$('.settleBillTableNumber').text(item.tableNumber);
	            }
	        });
	        return true;
	    });
	}); 
	
	$(document).ready(function () {
		$('.new-order').on('click',function(){
			//var section = $('.sec-select').val();
		
			var section = $('.section-select-conetnt .btn.active').attr('data-show');
			totalPrice = 0;
			if($('.'+section).find('.selected').length > 0){
				if($('.'+section).find('.selected').hasClass('occupied')){
					alert('Order already placed.Please click on Edit Order');
					$('.'+section).find('.selected').removeClass('selected');
					return;
				}
				$('#newModal .order-type').html(section.toUpperCase());
				var table_no = $('.'+section).find('.occupied.selected').attr('data-table-no');
				$('#newModal .modal-top-title .order-table').text(table_no);
				$('#newModal #mainTable tbody').html('');
				$('#newModal .total-cost').val('0');
				$('#menu_select').multiselect('deselectAll', false);
	            $('#main_select').multiselect('updateButtonText');
				$('#newModal').modal('show');
			}
			else{
				alert('Please select the table');
				$('.'+section).find('.selected').removeClass('selected');
			}

		});
	});
	
	
	toastr.options = {"positionClass":"toast-top-center"};
	
	$(document).ready(function () {
	    $(document).on('click', '.give-order', function () {
	    	var btn = $(this);
	    	
	    	if($(btn).closest('.modal').find('.waiter-select option:selected').val() == "-2"){
	    		toastr.error("Please select a waiter");
	    		return;
	    	}
	    	
	    	if($('#mainTable tbody').children().length <= 0){
	    		toastr.error("Order is empty.You can not place an order.");
	    		return;
	    	}
	    	var tableNumber = $('.newOrderTableNumber').text();
	    	var totalAmount = $('.total-cost').val();
	    	var waiterID = $('#newModal .waiter-select :selected').val();
	    	var data = {
		    		"tableNumber":tableNumber,
		    	 	"amount":totalAmount,
		    	    "totalAmount":totalAmount,
		    	    "isActive":"true",
		    	    "waiterID":waiterID
		    	};
	    	data.orders = [];
	    	$('#mainTable tbody tr').each(function() {
	    		  $this = $(this)
	    		  var orderItemID = $this.find('input.orderItemID').val();;
	    		  var quantity = $this.find('.spinner').find('input').val();
	    		  var type = $this.find('input.orderType').val();
	    		  var cost = $this.find("td.total-row-price").html();
	    		  data.orders.push({
	    			  	"orderItemID":orderItemID,
	    			 	"cost":cost,
	        			"quantity":quantity,
	        			"type":type,
	        			"kot":"true",
	        			"waiterID":waiterID
	    			  }	);
	    	});
	    	alert(JSON.stringify(data));
	    	
	    	$.ajax({
	            url: 'saveOrder',
	            data: JSON.stringify(data),
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){ 
	                alert(JSON.stringify(data));
	                $(btn).attr('disabled','true');
	                $(btn).closest('.modal').find('.settle-bill').removeAttr('disabled');
	                
	                $(btn).closest('.modal').find('.delete-item').each(function(){
	                	$(this).attr('disabled','true');
	                })
	            },
	            error:function(data){
	            	alert("Server Failure");
	            	console.log(data);
	            }
	        });
	        return true;
	    });
	}); 
	
	$(document).ready(function () {
	    $(document).on('click', '.add-order', function () {
	    	var btn = $(this);
	    		    	
	    	if($(btn).closest('.modal').find('.waiter-select option:selected').val() == "-2"){
	    		toastr.error("Please select a waiter");
	    		return;
	    	}
	    	
	    	var billID = $('#editBillID').val();
	    	var tableNumber = $('.editOrderTableNumber').text();
	    	var totalAmount = $('.editOrdertotal').find('input').val();
	    	var waiterID = $('#editModal .waiter-select :selected').val();	    	
	    	var data = {
	    			"id":billID,
		    		"tableNumber":tableNumber,
		    	 	"amount":totalAmount,
		    	    "totalAmount":totalAmount,
		    	    "isActive":"true",
		    	    "waiterID":waiterID
		    	};
	    	data.orders = [];
	    	$('#editMainTable tbody tr').each(function() {
	    		  $this = $(this);
	    		  var orderID = $this.attr('id');
	    		  var orderItemID = $this.find('input.orderItemID').val();
	    		  var quantity = $this.find('.spinner').find('input').val();
	    		  var type = $this.find('input.orderType').val();
	    		  var cost = $this.find("td.total-row-price").html();
	    		  data.orders.push({
	    			  	"id":orderID,
	    			  	"orderItemID":orderItemID,
	    			 	"cost":cost,
	        			"quantity":quantity,
	        			"type":type,
	        			"kot":"false",
	        			"waiterID":waiterID
	    			  }	);
	    	});
	    	alert(JSON.stringify(data));
	    	
	    	$.ajax({
	            url: 'editOrder',
	            data: JSON.stringify(data),
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){ 
	                alert(JSON.stringify(data));
	                $(btn).attr('disabled','true');
	                
	                $(btn).closest('.modal').find('.delete-item').each(function(){
	                	$(this).attr('disabled','true');
	                })
	                
	            },
	            error:function(data){
	            	alert("Server Failure");
	            	console.log(data);
	            }
	        });
	        return true;
	    });
	}); 
	
	$(document).on('click', '.edit-order', function () {
		$('#editMainTable tbody').html('');
		$('#editModal .total-cost').val('0');
    	var tableNumber = $('.editOrderTableNumber').text();
    	var data = {
	    		"tableNumber":tableNumber
	    	};
    	//alert(JSON.stringify(data));
    	
    	$.ajax({
            url: 'getOrder',
            data: tableNumber,
            type: "POST",           
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(data){ 
                //alert(JSON.stringify(data));
                var selectedWaiterId = data.waiterID;//its returning waiter name

                $('#editModal .waiter-select [waiter-name="'+selectedWaiterId+'"]').attr('selected','true');
                for (var i = 0; i < data.orders.length; i++) {
                	var id = data.orders[i].id;
                	var item = data.orders[i].orderItemID;
					var price = data.orders[i].cost;
					var quantity = data.orders[i].quantity;
					var className = (item).replace(/ /g, '-');
	                var tr = "";
	                tr = '<tr id="'+id+'"class="'+className+'" data-unit-price="'+price+'"><td class="orderItem">'
							+ item
							+ '</td>'
							+ '<td>'
							+ '<div class="input-group spinner">'
							+ '<input type="text" class="form-control quantity-value" value="'+quantity+'" min="0" max="100" disabled>'
							+ '<div class="input-group-btn-vertical">'
							+ '<button class="btn btn-default" type="button" disabled><i class="fa fa-caret-up"></i></button>'
							+ '<button class="btn btn-default" type="button" disabled><i class="fa fa-caret-down"></i></button>'
							+ '</div>'
							+ '</div>'
							+ '</td>'
							+ '<td class="total-row-price">'
							+ price
							+ '</td>'
							+ '<td><a href="#" class="delete-item hidden"><i class="fa fa-trash fa-lg"></i></a></td>'
							+'<td>KOT</td>'
							+ '</tr>';

					$('#editMainTable tbody').append(tr);
				}
                $('#editBillID').val(data.id);
                $('#menu_select_edit').multiselect('deselectAll', false);
	            $('#menu_select_edit').multiselect('updateButtonText');
				$('#editModal').modal('show');
				totalPrice = data.amount;
                $('.editOrdertotal').find('input').val(data.amount);
            },
            error: function(xhr, textStatus, errorThrown){
                alert('request failed');
                return false;
            }
        });
    });
    
	$(document).on('click', '.save-settle-bill', function () {
    
		var billID = $('#settleBillID').val();
    	var tableNumber = $('.settleBillTableNumber').text();
    	var discount = $('.discount-amount').val();
    	var totalAmount = $('.settleBilltotal').find('input').val();
    	var paymentMode = $('.payment-option option:selected').text();
    	var waiterID = $('#billModal .waiter-select :selected').val();	  
    	
    	var data = {
    			"id":billID,
	    		"tableNumber":tableNumber,
	    	 	"amount":totalAmount,
	    	 	"discount":discount,
	    	    "totalAmount":totalAmount,
	    	    "paymentMode":paymentMode,
	    	    "isActive":"false",
	    	    "waiterID":waiterID
	    	};
    	data.orders = [];
    	$('#billMainTable tbody tr').each(function() {
    		  $this = $(this);
    		  var orderID = $this.attr('id');
    		  var orderItem = $this.find("td.orderItem").html();
    		  var quantity = $this.find('.spinner').find('input').val();
    		  var cost = $this.find("td.total-row-price").html();
    		  data.orders.push({
    			  	"id":orderID,
    			  	"orderItem":orderItem,
    			 	"cost":cost,
        			"quantity":quantity,
        			"waiterID":waiterID
    			  }	);
    	});
    	
    	if(paymentMode == 'YOYO Club Card')
    		{
    		data.payments = [];
        	var cardBalance = $('.yoyo-balance-amount').val();
        	var totalAmount = $('.yoyo-total-cost').val();
        	var cardNumber = $('.yoyo-registration-number').val();
        	var updatedCardBalance = 0;
        	var updatedTotalAmount = 0;
        	if(cardBalance != 0){
        		if(parseInt(cardBalance) > parseInt(totalAmount))
        		{
        			updatedCardBalance = cardBalance-totalAmount;
        			updatedTotalAmount = totalAmount;
        		}
        		else
        		{
        			updatedCardBalance = cardBalance;
        			updatedTotalAmount = cardBalance;
        		}
        		data.payments.push({
        			"paymentMode":paymentMode,	
        			"cost":updatedTotalAmount,
        			"balance":updatedCardBalance,
        			"cardNumber":cardNumber
        		});
        	}
        	var secondPayment = $('.yoyo-payment-option option:selected').text();
        	var remainingAmount = $('.yoyo-remaining-amount').val();
        	var denomination = '';
        	var totalCash = 0;
        	$('#yoyoDenominationTable tbody tr').each(function() {
        		  $this = $(this);
        		  var quantity = $this.find('.spinner').find('input').val();
        		  if(typeof quantity === "undefined"){
        		  quantity = 1;
        		  }
        		  var cost = $this.find("td.total-row-price").text();
        		  var typeofnote = $this.find("td.type-of-note").text();
        		  if(typeofnote == 'Chillar')
        			{
        			  typeofnote = cost;
        			}
        		  totalCash = totalCash + parseInt(cost);
        		  denomination = denomination + quantity +',' + typeofnote + ';';
        	});
        	if(remainingAmount > 0 && secondPayment == 'None')
        		{
        		toastr.error("Please select partial payment");
    	    	return;
    	    	}    		
    				if(secondPayment == 'Cash'){
    	        		if(remainingAmount!= parseInt(totalCash)){
    	        			alert("Cash is not matching");
    	        			return false;
    	        		}
    	        		data.payments.push({
    	        			"paymentMode":secondPayment,	
    	        			"cost":remainingAmount,
    	        			"balance":updatedCardBalance,
    	        			"denomination":denomination
    	        		});
    	        	}else if(secondPayment == 'Debit/Credit Card'){
    	        		data.payments.push({
    	        			"paymentMode":secondPayment,	
    	        			"cost":remainingAmount,
    	        			"balance":updatedCardBalance,
    	        			"denomination":denomination
    	        		});
    	        	}
			}
    	else if(paymentMode == 'Debit/Credit Card' || paymentMode == 'Cash')
    		{
    		data.payments = [];
        	var totalAmount = $('.actual-amount').val();
        	var denomination = '';
        	var totalCash = 0;
        	$('#yoyoDenominationTableDirect tbody tr').each(function() {
        		  $this = $(this);
        		  var quantity = $this.find('.spinner').find('input').val();
        		  if(typeof quantity === "undefined"){
        			  quantity = 1;
        		  }
        		  var cost = $this.find("td.total-row-price").text();
        		  var typeofnote = $this.find("td.type-of-note").text();
        		  if(typeofnote == 'Chillar')
      				{
      			  		typeofnote = cost;
      				}
        		  totalCash = totalCash + parseInt(cost);
        		  denomination = denomination + quantity +',' + typeofnote + ';';
        	});
        	
        	if(paymentMode == 'Cash')
        	{
    	       if(totalAmount!= parseInt(totalCash))
    	        {
    	        	alert("Cash is not matching");
    	        	return false;
    	        }
    	        		data.payments.push({
    	        			"paymentMode":paymentMode,	
    	        			"cost":totalAmount,
    	        			"denomination":denomination
    	        		});
    	     }
        	else if(paymentMode == 'Debit/Credit Card')
    	        {
    	        		data.payments.push({
    	        			"paymentMode":paymentMode,	
    	        			"cost":totalAmount,
    	        			"denomination":denomination
    	        		});
    	        }
    	}
    	else
    		{
    		toastr.error("Please select payment option");
        	return;
    		}
    	
    		
    	alert(JSON.stringify(data));
    	$.ajax({
            url: 'editOrder',
            data: JSON.stringify(data),
            type: "POST",           
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(data){ 
                alert(JSON.stringify(data));
                $('#billModal').modal('hide');
            },
            error: function(xhr, textStatus, errorThrown){
                alert('request failed');
                return false;
            }
        });
        return true;
    });
	
	$(document).on('click', '.save-card-recharge', function () {
		var cardNumber = $('.register-no').val();
		var balance = $('.total-balance').val();
		var rechargeAmount = $('.recharge-amount').val();
		var paymentMode = $('.recharge-payment-option option:selected').text();
		var denomination = '';
    	
		if(!rechargeAmount)
			{
			toastr.error("Please enter recharge amount");
			return;
			}
		
    	if(paymentMode == 'Debit/Credit Card' || paymentMode == 'Cash')
		{
			
	    	var totalAmount = rechargeAmount;
	    	//var totalCash = $('.save-card-recharge').closest('.modal').find('.cash-amount').val();
	    	var totalCash = 0;
	    	$('#cardRechargeDenomination tbody tr').each(function() {
	    		  $this = $(this);
	    		  var quantity = $this.find('.spinner').find('input').val();
	    		  if(typeof quantity === "undefined"){
        			  quantity = 1;
        		  }
	    		  var cost = $this.find("td.total-row-price").text();
	    		  var typeofnote = $this.find("td.type-of-note").text();
	    		  if(typeofnote == 'Chillar')
    				{
    			  		typeofnote = cost;
    				}
	    		  totalCash = totalCash + parseInt(cost);
	    		  denomination = denomination + quantity +',' + typeofnote + ';';
	    	});
	    	
	    	if(paymentMode == 'Cash')
	    	{
		       	if(rechargeAmount != parseInt(totalCash))
		        {
		        	alert("Cash is not matching");
		        	return false;
		        }
		    }
		}
		else
		{
			toastr.error("Please select payment option");
			return;
		}
    	
    	var cardData = {
	    		"cardNumber": cardNumber,
	    	 	"balance": balance
	    	};
    	var billData = {
    			"tableNumber": "YOYOCard",
	    	 	"amount": rechargeAmount,
	    	    "totalAmount": rechargeAmount,
	    	    "isActive": "false",
	    	    "waiterID": 0
    		
    		};
    	var paymentData = {
    			"paymentMode" : paymentMode,
    			"cost": rechargeAmount,
    			"denomination": denomination
    		};
    	
    	JSON.stringify({cardData:cardData, billData:billData, paymentData:paymentData});
    	$.ajax({
            url: 'addBalance',
            data: JSON.stringify({cardData:cardData, billData:billData, paymentData:paymentData}),
            type: "POST",           
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(data){ 
                alert(JSON.stringify(data));
                $('#cardRechargeModal').modal('hide');
            },
            error: function(xhr, textStatus, errorThrown){
                alert('request failed');
                return false;
            }
        });
        return true;
    });
	
    $('.yoyo-registration-number').keypress(function(e) {
		var key = e.which;
		if (key == 13)
		{
			var cardNumber = $('.yoyo-registration-number').val();
			var totalCost = $('.yoyo-total-cost').val();
	    	$.ajax({
	            url: 'getBalance',
	            data: cardNumber,
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){
	            	$('.yoyo-balance-amount').val(data.balance);
	            	if(data.balance<totalCost)
	            	{$('.yoyo-remaining-amount').val(totalCost-data.balance);}
	            	else
	            	{$('.yoyo-remaining-amount').val(0);}
	            		
	            },
	            error: function(xhr, textStatus, errorThrown){
	                alert('request failed');
	                return false;
	            }
	        });
			
			return false;
		}
	});
	
	$('.register-no').keypress(function(e) {
		var key = e.which;
		if (key == 13)
		{
			var cardNumber = $('.register-no').val();
	    	$.ajax({
	            url: 'getBalance',
	            data: cardNumber,
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){
	            	$('.balance-amount').val(data.balance);
	            	$('.total-balance').val(data.balance);
	            },
	            error: function(xhr, textStatus, errorThrown){
	                alert('request failed');
	                return false;
	            }
	        });
			
			return false;
		}
	});
	
	$('.recharge-amount').on('change',function(){
	
		if(!isNaN($(this).val()))
		{
			var cardRecharge = $(this).val();
			var cardBalance = $(this).closest('.modal').find('.balance-amount').val();
			
			var cardBalance = parseInt(cardBalance) + parseInt(cardRecharge);
			$(this).closest('.modal').find('.total-balance').val(cardBalance);
			
		}
		else
			alert('Please enter correct amount');
	})
	
	/*search*/
	$('#menu_select').multiselect({
		enableFiltering: true,
		enableCaseInsensitiveFiltering:true,
		onChange: function(option, checked) {
			if(checked){
				var price = $(option).attr('data-cost');
				var type = $(option).attr('type');
				var id = $(option).attr('id');
				var item = option[0].text;
				var value = option[0].value;
				var className = (item).replace(/ /g, '-');		
				var tr = "";
				tr = '<tr class="'+className+'" data-unit-price="'+price+'" data-value="'+value+'">'+
					 '<td class="orderItem">'+item+'</td><input class="orderType" type="hidden" value="'+type+'" />'+
					 '<input class="orderItemID" type="hidden" value="'+id+'" />'+
					 '<td>'+
						'<div class="input-group spinner">'+
							'<input type="text" class="form-control quantity-value" value="1" min="0" max="100">'+
							'<div class="input-group-btn-vertical">'+
								'<button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>'+
								'<button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>'+
							'</div>'+
						'</div>'+
					  '</td>'+
					  '<td class="total-row-price">'+price+'</td>'+
					  '<td><a href="#" class="delete-item"><i class="fa fa-trash fa-lg"></i></a></td></tr>';
					  
				$('#mainTable tbody').append(tr);
				fnCalculateTotalPrice();
			}				
		}
	});

	/*search*/
	$('#menu_select_edit').multiselect({
		enableFiltering: true,
		enableCaseInsensitiveFiltering:true,
		onChange: function(option, checked) {
			if(checked){
				var price = $(option).attr('data-cost');
				var item = option[0].text;
				var type = $(option).attr('type');
				var id = $(option).attr('id');
				var className = (item).replace(/ /g, '-');
				var value = option[0].value;	
				var tr = "";
				tr = '<tr class="'+className+'" data-unit-price="'+price+'" data-value="'+value+'">'+
					 '<td class="orderItem">'+item+'</td><input class="orderType" type="hidden" value="'+type+'" />'+
					 '<input class="orderItemID" type="hidden" value="'+id+'" />'+
					 '<td>'+
						'<div class="input-group spinner">'+
							'<input type="text" class="form-control quantity-value" value="1" min="0" max="100">'+
							'<div class="input-group-btn-vertical">'+
								'<button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>'+
								'<button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>'+
							'</div>'+
						'</div>'+
					  '</td>'+
					  '<td class="total-row-price">'+price+'</td>'+
					  '<td><a href="#" class="delete-item"><i class="fa fa-trash fa-lg"></i></a></td></tr>';
					  
				$('#editMainTable tbody').append(tr);
				fnCalculateTotalPrice("edit");
			}	
		}
	});
	
	$(document).on(
			'click',
			'.search-link',
			function() {
				var url = "getSearch";
				window.open(url, '_blank');
			});
	
	$(document).on(
			'click',
			'.report-link',
			function() {
				var url = "report";
				window.open(url, '_blank');
			});
	
	$('.start-day').on('click',function() {
				$.ajax({
		            url: 'startBusinessDay',
		            data: '',
		            type: "POST",           
		            beforeSend: function(xhr) {
		                xhr.setRequestHeader("Accept", "application/json");
		                xhr.setRequestHeader("Content-Type", "application/json");
		            },
		            success: function(data){
		            	alert(data.message);
		            },
		            error: function(xhr, textStatus, errorThrown){
		                alert('request failed');
		                return false;
		            }
		        });
			});
	
	$('.end-day').on('click',function(){
		var r = confirm("Are you sure want to End the day?")
		if(r){
			$.ajax({
	            url: 'endBusinessDay',
	            data: '',
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){
	            	alert(data.message);
	            },
	            error: function(xhr, textStatus, errorThrown){
	                alert('request failed');
	                return false;
	            }
	        });
			
		}
	});
	
	$('.card-refund').on('click',function(){
		$('#refundYoyoCards').modal('show');
		$('#refundYoyoCards tbody').html('');
		
		$.ajax({
            url: 'getAllCardsBalances',
            type: "GET",           
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(data){ 
                //alert(JSON.stringify(data));
                for (var i = 0; i < data.length; i++) {	
                
                	var cardNumber = data[i].cardNumber;
                	var balance = data[i].balance;
	                var tr = "";
	                
					tr = '<tr>'
					   + '<td class="card-number">' + cardNumber + '</td>'
					   + '<td class="balance">' + balance + '</td>'
					   + '<td><input type="text" class="form-control refund-amount" value="' + balance + '"/></td>'
					   + '<td><button class="btn btn-primary refund-card-balance">Refund</button></td>'
					   + '</tr>';

					$('#refundYoyoCards tbody').append(tr);
					$('#refundYoyoCards').modal('show');
				}
            },
        });
	});
	
	$(document).on('click', '.refund-card-balance', function () {
		
		var row = $(this).closest('tr');
		var refundAmount = $(row).find('.refund-amount').val();
		
		if(refundAmount == "" || refundAmount == "undefined"){
			toastr.error("Please enter refund amount");
			return;
		}
			
		var cardNumber = $(row).find('.card-number').text();
		var balance = $(row).find('.balance').text();
		
		if(parseInt(refundAmount) > parseInt(balance))
		{
			alert("Refund Amount cannot be greater than Balance Amount");
			return;
		}
		else if(parseInt(refundAmount) <= parseInt(balance))
		{
		balance = balance - refundAmount;
		}
		
    	var data = {
	    		"cardNumber":cardNumber,
	    	 	"balance":balance,
	    	};
    	
    	alert(JSON.stringify(data));
    	$.ajax({
            url: 'refundBalance',
            data: JSON.stringify(data),
            type: "POST",           
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(data){ 
                alert(JSON.stringify(data));
                $('#refundYoyoCards').modal('hide');
            },
            error: function(xhr, textStatus, errorThrown){
                alert('request failed');
                return false;
            }
        });
        return true;
    });
	
</script>