<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>YOYO</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<spring:url value="/resources/core/css/lib/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/core/css/lib/fontawesome.min.css"
	var="fontawesomeCss" />
<spring:url value="/resources/core/css/lib/custmicons.min.css"
	var="custmiconsCss" />
<spring:url value="/resources/core/css/lib/fix_style.css"
	var="fix_styleCss" />
<spring:url value="/resources/core/css/lib/blue.css" var="blueCss" />
<spring:url value="/resources/core/css/lib/animate.css" var="animateCss" />
<spring:url value="/resources/core/css/app/style1.css" var="styleCss" />
<spring:url value="/resources/core/css/lib/checkbox.css"
	var="checkboxCss" />
<spring:url value="/resources/core/css/lib/_all-skins.min.css"
	var="allskinsCss" />
<spring:url value="/resources/core/css/lib/dataTables.bootstrap.min.css"
	var="dataTablesCss" />
<spring:url value="/resources/core/css/lib/responsive.bootstrap.min.css"
	var="responsiveCss" />
<spring:url value="/resources/core/css/lib/datepicker.css"
	var="datePickerCss" />

<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${fontawesomeCss}" rel="stylesheet" />
<link href="${custmiconsCss}" rel="stylesheet" />
<link href="${fix_styleCss}" rel="stylesheet" />
<link href="${blueCss}" rel="stylesheet" />
<link href="${animateCss}" rel="stylesheet" />
<link href="${styleCss}" rel="stylesheet" />
<link href="${checkboxCss}" rel="stylesheet" />
<link href="${allskinsCss}" rel="stylesheet" />
<link href="${dataTablesCss}" rel="stylesheet" />
<link href="${responsiveCss}" rel="stylesheet" />
<link href="${datePickerCss}" rel="stylesheet" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<style>
.logo-mini {
	font-size: 16px !important;
}

.report-header {
	margin-bottom: 10px !important;
}

.table th {
	background-color: #00c0ef !important;
	color: white;
}

.table th:after {
	opacity: 1 !important;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapp1er">

		<header class="main-header">
			<!-- Logo -->
			<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>YOYO</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>YOYO</b></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top text-center">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle hidden" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>

				<div class="title"
					style="display: inline-block; font-weight: 700; font-size: 28px; margin-left: -150px; margin-top: 5px;">YOYO
					BAR & GRILL</div>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->

						<!-- Notifications: style can be found in dropdown.less -->

						<!-- Tasks: style can be found in dropdown.less -->

						<!-- User Account: style can be found in dropdown.less -->


					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar hidden" style="display: none">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<!--<li class="header">MAIN NAVIGATION</li>-->

					<li class="treeview active"><a href="#"> <i
							class="fa fa-table"></i> <span>Reports</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li class="active"><a href="#"><i class="fa fa-circle-o"></i>
									Report 1</a></li>
							<li><a href="#"><i class="fa fa-circle-o"></i>Report 2</a></li>
							<li><a href="#"><i class="fa fa-circle-o"></i>Report 3</a></li>
							<li><a href="#"><i class="fa fa-circle-o"></i>Report 4</a></li>
							<li><a href="#"><i class="fa fa-circle-o"></i>Report 5</a></li>
						</ul></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapp1er. Contains page content -->
		<div class="content-wrapp1er" style="margin-left: 0px !important;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Search
					<!--<small>Report 1</small>-->
				</h1>

			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header"></div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="form-inline row" style="margin-bottom: 15px;">
									<div class="form-group col-sm-2">
										<!-- <label for="email">Module Name: </label>-->
										<select class="form-control select-module-name">
											<option value="-1">Select Module</option>
											<option value="0">Bill</option>
											<option value="1">Tables</option>
											<option value="2">Cards</option>
											<option value="3">CardsHistory</option>
											<option value="4">DailyTransaction</option>
											<option value="5">FoodMenu</option>
											<option value="6">BarMenu</option>
											<option value="7">Orders</option>
											<option value="8">Payments</option>
											<option value="9">TaxDetails</option>
											<option value="10">Waiter</option>
											<option value="11">Users</option>
										</select>
									</div>
									<div class="form-group col-sm-2">
										<!--  <label for="email">Columns: </label>-->
										<select class="form-control column-select">
											<option value="-1">Select Column</option>
											<option value="0">Id</option>
											<option value="1">tableNumber</option>
											<option value="2">Date</option>
										</select>
									</div>
									<div class="form-group col-sm-2">
										<!-- <label for="email">Operator : </label>-->
										<select class="form-control operator-select">
											<option value="-1">Select Operator</option>
										</select>
									</div>
									<div class="form-group col-sm-2">
										<input type="text" class="form-control" name="data1"
											placeholder="Value 1" id="data1">
									</div>
									<div class="form-group col-sm-2">
										<input type="text" class="form-control" name="data2"
											placeholder="Value 2" id="data2">
									</div>

									<div class="col-sm-2 pull-right">
										<button type="submit" class="btn btn-success search">Search</button>
									</div>
								</div>
								<table id="searchTable"
									class="table table-bordered table-striped">
									<thead>
										<tr>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapp1er -->
		<footer class="main-footer text-center"
			style="margin-left: 0px !important">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0
			</div>
			<strong>Copyright &copy; 2014-2015 <a href="#">YOYO Bar
					& Grill</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside></aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->

	</div>
	<!-- ./wrapp1er -->

	<!-- ./wrapp1er -->

	<!-- jQuery 2.2.3 -->
	<spring:url value="/resources/core/js/lib/jquery-2.2.3.min.js"
		var="jqueryJs" />
	<spring:url value="/resources/core/js/lib/bootstrap.min.js"
		var="bootstrapJs" />
	<spring:url value="/resources/core/js/lib/fastclick.js"
		var="fastclickJs" />
	<spring:url value="/resources/core/js/lib/app.min.js" var="appMinJs" />
	<spring:url value="/resources/core/js/lib/demo.js" var="demoJs" />
	<spring:url value="/resources/core/js/lib/jquery.dataTables.min.js"
		var="dataTablesJs" />
	<spring:url value="/resources/core/js/lib/dataTables.bootstrap.min.js"
		var="dataTablesbootstrapJs" />
	<spring:url value="/resources/core/js/lib/dataTables.responsive.min.js"
		var="dataTablesResponsiveJs" />
	<spring:url value="/resources/core/js/lib/responsive.bootstrap.min.js"
		var="responsiveBootstrapJs" />
	<spring:url value="/resources/core/js/lib/jquery.nicescroll.min.js"
		var="jqueryNicescrollJs" />
	<spring:url value="/resources/core/js/lib/datepicker.js"
		var="datepickerJs" />

	<script src="${jqueryJs}"></script>
	<script src="${bootstrapJs}"></script>
	<script src="${fastclickJs}"></script>
	<script src="${appMinJs}"></script>
	<script src="${dataTablesJs}"></script>
	<script src="${dataTablesbootstrapJs}"></script>
	<script src="${dataTablesResponsiveJs}"></script>
	<script src="${responsiveBootstrapJs}"></script>
	<script src="${jqueryNicescrollJs}"></script>
	<script src="${datepickerJs}"></script>

	<!-- page script -->
	<script>
		$(function() {
			//$("#searchTable").DataTable();
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false
			});
		});

		$('.column-select').on(
				'change',
				function() {
					var selcted_value = $(this).find('option:selected').attr(
							'dataType');

					if (selcted_value === 'java.util.Date') {
						$('#data1').datepicker({
							format : 'dd-M-yyyy',
							todayHighlight : true,
							autoclose : true
						});
						$('#data2').datepicker({
							format : 'dd-M-yyyy',
							todayHighlight : true,
							autoclose : true
						});
					} else {
						$('#data1').datepicker('remove');
						$('#data2').datepicker('remove');
					}

				});

		$('.select-module-name').on('change', function() {
			var className = $(this).find('option:selected').text();
			$('.column-select').find('option').remove().end();
			$('.operator-select').find('option').remove().end();

			$.ajax({
				url : 'getSearchCriteria',
				data : className,
				type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
				},
				success : function(data) {
					alert(JSON.stringify(data));
					$('.column-select').append($('<option>', {
						value : -1
					}).text('Select Column'));
					$.each(data.columns, function(key) {
						var columnName = data.columns[key].columnName;
						var dataType = data.columns[key].dataType;
						$('.column-select').append($('<option>', {
							value : columnName,
							dataType : dataType
						}).text(data.columns[key].displayName));
					});
					$('.operator-select').append($('<option>', {
						value : -1
					}).text('Select Operator'));
					$.each(data.operations, function(value) {
						$('.operator-select').append($('<option>', {
							value : value
						}).text(value));
					});
				},
				error : function(xhr, textStatus, errorThrown) {
					alert('request failed');
					return false;
				}
			});
		})

		$(document)
				.on(
						'click',
						'.search',
						function() {
							$('#searchTable tbody').html('');
							var className = $(
									'.select-module-name option:selected')
									.text();
							var column = $('.column-select option:selected')
									.val();
							var dataType = $('.column-select option:selected')
									.attr('dataType');
							var operation = $(
									'.operator-select option:selected').val();
							var data1 = $('#data1').val();
							var data2 = $('#data2').val();
							var criteriaDTO = {
								"className" : className,
								"restrictions" : [ {
									"column" : column,
									"columnDataType" : dataType,
									"operation" : operation,
									"data1" : data1,
									"data2" : data2
								} ]
							};
							alert(JSON.stringify(criteriaDTO));
							var tr = '<tr id="header">';
							$('.column-select option').each(
									function() {
										$this = $(this);
										if ($this.val() != -1)
											tr = tr + '<th class="'
													+ $this.val() + '">'
													+ $this.text() + '</th>';
									});
							tr = tr + '</tr>';
							$('#searchTable tbody').append(tr);
							$
									.ajax({
										url : 'getByCriteria',
										data : JSON.stringify(criteriaDTO),
										type : "POST",
										beforeSend : function(xhr) {
											xhr.setRequestHeader("Accept",
													"application/json");
											xhr.setRequestHeader(
													"Content-Type",
													"application/json");
										},
										success : function(data) {
											//alert(JSON.stringify(data));
											for (var i = 0; i < data.length; i++) {
												var tr = '<tr id="'+data[i].id+'"class="'+data[i].id+'">';
												$
														.each(
																data[i],
																function(k, v) {
																	if (jQuery
																			.type(v) != "array")
																		tr = tr
																				+ '<td class="'+k+'">'
																				+ v
																				+ '</td>'
																});
												tr += '</tr>';
												$('#searchTable tbody').append(
														tr);
											}
											$("#searchTable").DataTable();
										},
										error : function(xhr, textStatus,
												errorThrown) {
											alert('request failed');
											return false;
										}
									});
						});
	</script>
</body>
</html>
