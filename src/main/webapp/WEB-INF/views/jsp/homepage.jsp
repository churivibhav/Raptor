<%@page import="com.base.test.Utils.Utils"%>
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
<spring:url value="/resources/core/css/lib/checkbox.css"
	var="checkboxCss" />
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

<link rel="stylesheet" href="${bootstrapCss}" />
<link rel="stylesheet" href="${fontCss}" />

<link rel="stylesheet" href="${menuCss}" />
<link rel="stylesheet" href="${styleCss}" />
<link rel="stylesheet" href="${checkboxCss}" />

<link rel="stylesheet" href="${dataTablesCss}" />
<link rel="stylesheet" href="${treeViewCss}" />
<link rel="stylesheet" href="${spinnerCss}" />

<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>

</head>

<body>
	<%
		String sessionID = (String)session.getAttribute("sessionID");
		if(!Utils.checkSession(sessionID))
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
						YOYO Bar and Grill</div>


				</div>
				<div class="main-content">
					<div class="project-title mobile  hidden-lg">YOYO Bar and
						Grill</div>

					<div class="container-fluid main-container">
						<div class="section-selection">
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
						</div>

						<div class="row">
							<div class="col-sm-8">
								<div class="table-layout-section">
									<div class="label">Table Layout</div>
									<div class="table-layout-container bar">
										<!--<div class="table-row">-->
										<c:forEach items="${allTables}" var="allTables">
											<span class="table"> 
												<span class="table-header text-center">${allTables.tableNumber}</span>
												<span class="table-content"></span>
											</span>
										</c:forEach>
									</div>
									<div class="table-layout-container lounge"
										style="display: none;">
										<div class="row">
											<div class="col-sm-3">
												<div class="lounge-box occupied">L1</div>
											</div>
											<div class="col-sm-3">
												<div class="lounge-box">L2</div>

											</div>
											<div class="col-sm-3">
												<div class="lounge-box">L3</div>

											</div>
											<div class="col-sm-3">
												<div class="lounge-box">L4</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<div class="lounge-box">L5</div>

											</div>
											<div class="col-sm-6">
												<div class="lounge-box">L6</div>

											</div>
										</div>
										<div class="row">
											<div class="col-sm-4">
												<div class="lounge-box">L7</div>

											</div>
											<div class="col-sm-4">
												<div class="lounge-box">L8</div>

											</div>
											<div class="col-sm-4">
												<div class="lounge-box">L9</div>

											</div>
										</div>
										<div class="table-row"></div>
										<div class="table-row"></div>
									</div>
									<div class="table-layout-container vip" style="display: none;">
										<div class="row">
											<div class="col-sm-12">
												<div class="vip-box occupied">VIP1</div>
											</div>
											<div class="col-sm-12">
												<div class="vip-box">VIP2</div>
											</div>
											<div class="col-sm-12">
												<div class="vip-box">VIP3</div>
											</div>
											<div class="col-sm-12">
												<div class="vip-box">VIP4</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="row">
									<div class="col-sm-12 padding-left-0">
										<div class="order-management box">
											<div class="box-header">Order Management</div>
											<div class="box-content">
												<button class="btn btn-lg login-button new-order"
													data-toggle="modal" data-target="#myModal">New
													Order</button>
												<button class="btn btn-lg login-button edit-order">Edit
													Order</button>
											</div>
										</div>
									</div>
									<div class="col-sm-12 padding-left-0">
										<div class="bill-management box">
											<div class="box-header">Bill Management</div>
											<div class="box-content">
												<button class="btn btn-lg login-button generate-bill">Generate
													Bill</button>
												<button class="btn btn-lg login-button settle-bill">Settle
													Bill</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">New Order</h4>
				</div>
				<div class="modal-body">
					<div class="modal-top row">
						<div class="col-sm-6 modal-top-title">
							<span class="title">Section : </span> <span class="order-type">Bar</span>
						</div>
						<div class="col-sm-6 modal-top-title text-right">
							<span class="title">Table : </span> <span class="order-table">B1</span>
						</div>
					</div>
					<hr />
					<div class="form-inline row person-count">
						<div class="col-sm-6">
							<label>Waiter Name : </label> <select
								class="form-control waiter-select">
								<!-- new code -->
								<option value="0">Option 1</option>
								<option value="1">Option 2</option>
								<option value="2">Option 3</option>
								<option value="3">Option 4</option>
								<option value="4">Option 5</option>
							</select>
						</div>
						<div class="col-sm-6 text-right">
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
						</div>
					</div>
					<div class="row modal-main-content">
						<div class="col-sm-6 tree-view">
							<div class="search-tree">
								<input type="text" class="form-control" id="searchTree"
									placeholder="Search..." />
							</div>
							<div id="tree"></div>
						</div>
						<div class="col-sm-6 order-table">
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

								<div class="buttons text-center">
									<button class="btn btn-success give-order">Order</button>
									<button class="btn btn-danger discard-order">Abort</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div id="bill" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Generate Bill</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12 order-table">
							<div class="table-responsive">
								<table id="billTable"
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
										<tr>
											<td>Chicken Tikka Masala</td>
											<td>1</td>
											<td>100</td>

										</tr>
										<tr>
											<td>Beer</td>
											<td>1</td>
											<td>200</td>

										</tr>
										<tr>
											<td>Chicken Tikka Masala</td>
											<td>1</td>
											<td>100</td>

										</tr>
										<tr>
											<td>Beer</td>
											<td>1</td>
											<td>200</td>

										</tr>
										<tr>
											<td>Chicken Tikka Masala</td>
											<td>1</td>
											<td>100</td>

										</tr>
										<tr>
											<td>Beer</td>
											<td>1</td>
											<td>200</td>

										</tr>
									</tbody>
								</table>

								<div class="text-right form-inline total-price">
									<label>Total : </label> <input type="text"
										class="form-control bill-total-cost" value="900" disabled />
								</div>
							</div>
						</div>
					</div>
					<div class="row payement-options">
						<div class="form-inline col-sm-8">
							<label>Payment By : <label> <select
									class="form-control">
										<option value="0">Debit Card</option>
										<option value="1">Credit Card</option>
										<option value="2">Cash</option>
										<option value="3">YOYO Club Card</option>
								</select>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success save-bill"
						data-dismiss="modal">Save</button>
					<button type="button" class="btn btn-primary print-bill"
						data-dismiss="modal">Print</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
	$('.bg-img').css("min-height", $(window).height() + "px");
	$(window).resize(function() {
		$('.bg-img').css("min-height", $(window).height() + "px");
	});

	$('.sec-select').change(
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

			});

	var tree = [ {
		text : "Food Menu",
		nodes : [ {
			text : "Veg",
			nodes : [ {
				text : "Paneer Tikka Masala",
				tags : [ '100' ]
			}, {
				text : "Veg Kolhapuri",
				tags : [ '200' ]
			} ]
		}, {
			text : "Non Veg",
			nodes : [ {
				text : "Chicken Tikka Masala",
				tags : [ '220' ]
			}, {
				text : "Chicken Tandoori",
				tags : [ '400' ]
			} ]
		} ]
	}, {
		text : "Bar Mneu",
		nodes : [ {
			text : "Special",
			nodes : [ {
				text : "Takeela",
				tags : [ '1000' ]
			}, {
				text : "Jack Daniel",
				tags : [ '2000' ]
			} ]
		}, {
			text : "Normal",
			nodes : [ {
				text : "Rum",
				tags : [ '500' ]
			/*state: { 
				checked: true,    //for default check on edit order
				
			},*/
			}, {
				text : "Vodka",
				tags : [ '700' ]
			} ]
		} ]
	} ];

	/*** new code *********/

	$('.generate-bill').on('click', function() {
		$('.payement-options').hide();
		$('.save-bill').hide();
		$('.print-bill').show();
		$('#bill').modal('show');
	});

	$('.settle-bill').on('click', function() {
		$('.payement-options').show();
		$('.save-bill').show();
		$('.print-bill').hide();
		$('#bill').modal('show');
	});

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
							input.val(parseInt(input.val(), 10));
						} else {
							btn.next("disabled", true);
						}
						var row = $(this).closest('tr');
						fnChangeRowPrice(row, parseInt(input.val()) + 1);
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
							input.val(parseInt(input.val(), 10));
						} else {
							btn.prev("disabled", true);
						}
						var row = $(this).closest('tr');
						fnChangeRowPrice(row, parseInt(input.val()) - 1);
					});

	$(document).on(
			'click',
			'.delete-item',
			function() {
				var row = $(this).closest('tr');
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

				fnCalculateTotalPrice();
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

	function fnChangeRowPrice(row, val) {
		var totalRowPrice = "";

		var unitPrice = $(row).attr('data-unit-price');

		totalRowPrice = unitPrice * val;

		$(row).find('.total-row-price').text(totalRowPrice);

		fnCalculateTotalPrice();
	}

	function fnCalculateTotalPrice() {
		var tableRows = $('#mainTable tbody tr');
		var totalPrice = 0;
		for (var i = 0; i < tableRows.length; i++) {
			var row = tableRows[i];
			var rowTotalPrice = $(row).find('.total-row-price').text();
			totalPrice += parseInt(rowTotalPrice);
		}

		$('.total-cost').val(totalPrice);
	}

	$('#searchTree').on('keyup', search);

	var tree = $('#tree')
			.treeview(
					{
						showTags : true, //newly added for tags as price
						data : tree,
						onhoverColor : "#eee",
						showCheckbox : true,
						showIcon : true,
						selectable : true,
						onNodeChecked : function(event, node) {
							if (node.nodes == undefined) {
								var item = node.text;
								var price = node.tags[0];

								var className = (item).replace(/ /g, '-');
								;

								var tr = "";
								tr = '<tr class="'+className+'" data-unit-price="'+price+'"><td>'
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
						},
						onNodeUnchecked : function(event, node) {
							console.log(node);
							if (node.nodes == undefined) {
								var item = node.text;
								var price = node.tags[0];

								var className = (item).replace(/ /g, '-');

								$('.' + className).remove();

								fnCalculateTotalPrice();
							}
						}

					});

	function search() {
		var pattern = $('#searchTree').val();
		var options = {

		};
		var results = tree.treeview('search', [ pattern, options ]);

	}
</script>