<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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

<spring:url value="/resources/core/css/app/style1.css" var="style1Css" />

<spring:url value="/resources/core/css/app/style.css" var="styleCss" />

<spring:url value="/resources/core/css/lib/checkbox.css"
	var="checkboxCss" />

<spring:url value="/resources/core/css/lib/_all-skins.min.css"
	var="allskinsCss" />

<spring:url value="/resources/core/css/lib/dataTables.bootstrap.min.css"
	var="dataTablesCss" />

<spring:url value="/resources/core/css/lib/responsive.bootstrap.min.css"
	var="responsiveCss" />

<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${fontawesomeCss}" rel="stylesheet" />
<link href="${custmiconsCss}" rel="stylesheet" />
<link href="${fix_styleCss}" rel="stylesheet" />
<link href="${blueCss}" rel="stylesheet" />
<link href="${animateCss}" rel="stylesheet" />
<link href="${style1Css}" rel="stylesheet" />
<link href="${styleCss}" rel="stylesheet" />
<link href="${checkboxCss}" rel="stylesheet" />
<link href="${allskinsCss}" rel="stylesheet" />
<link href="${dataTablesCss}" rel="stylesheet" />
<link href="${responsiveCss}" rel="stylesheet" />

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

.border-bottom-dotted {
	padding: 5px;
	border-bottom: 2px dotted lightgrey;
}

.report-details {
	padding: 5px;
	font-size: 15px;
	margin-bottom: 30px;
}

.table-header {
	display: block;
	margin-bottom: 20px;
	width: 100px;
}

.table-details {
	font-size: 15px;
	margin-bottom: 20px;
}
</style>
<script type="text/javascript"
	src="https://ff.kis.v2.scr.kaspersky-labs.com/168F19AC-92B3-8844-9C05-1485DD6E0C98/main.js"
	charset="UTF-8"></script>
<link rel="stylesheet" crossorigin="anonymous"
	href="https://ff.kis.v2.scr.kaspersky-labs.com/89C0E6DD5841-50C9-4488-3B29-CA91F861/abn/main.css" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>YOYO</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>YOYO</b></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle hidden" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->

						<!-- Notifications: style can be found in dropdown.less -->

						<!-- Tasks: style can be found in dropdown.less -->
						<
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="images/avatar5.png" class="user-image" alt="User Image">
								<span class="hidden-xs">Darshan Bhogale</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img src="images/avatar5.png"
									class="img-circle" alt="User Image">

									<p>Darshan Bhogale - Cashier</p></li>
								<!-- Menu Body -->

								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-right">
										<a href="#" class="btn btn-default btn-flat">Sign out</a>
									</div>
								</li>
							</ul></li>

					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar hidden">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar hidden"></section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="margin-left: 0px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Daily Summary Report
					<!--<small>Report 1</small>-->
				</h1>

			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<!--<h3 class="box-title">Report Name</h3>-->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="report-details">
									<span>Beyond</span> <br /> <span>Daily Summary Report</span></br/> <span>Reporting
										for : </span><span class="reporting-for">17-Mar-2017 -
										18-Mar-2017</span></br/> <span>Printed On : </span><span class="printed-on">18-Mar-2017</span>
								</div>

								<span class="border-bottom-dotted table-header"
									style="width: 150px;">Collection Summary</span>

								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Terminal</th>
												<th>Cash</th>
												<th>Credit Card</th>
												<th>BTC</th>
												<th>Other</th>
												<th>Total</th>
												<th>Refund</th>
											</tr>
										<tbody>
											<c:forEach items="${reportData}" var="data">
												<tr>
													<c:forEach items="${data}" var="column">
														<td>${column}</td>
													</c:forEach>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td>Total</td>
												<td>7991.00</td>
												<td>0.00</td>
												<td>0.00</td>
												<td>0.00</td>
												<td>7991.00</td>
												<td>1000.00</td>
											</tr>
										</tfoot>
										</thead>
									</table>
								</div>

								<div class="table-details">
									<span>Refund : </span><span class="refund"
										style="margin-left: 200px;">1000.00</span> <br /> <span>Entry
										: </span><span class="entry" style="margin-left: 210px;">101.00</span></br/>
									<span>Toatl Cash : </span><span class="total-cash"
										style="margin-left: 178px;">6890.00</span></br/>
								</div>

								<span class="border-bottom-dotted table-header">Sale
									Summary</span>

								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Tax Category</th>
												<th>Amount</th>
												<th>VAT</th>
												<th>S/C</th>
												<th>Total</th>
											</tr>
										<tbody>
											<tr>
												<td>FOOD TAXABLE</td>
												<td>241.00</td>
												<td>32.00</td>
												<td>15.00</td>
												<td>288.00</td>

											</tr>
											<tr>
												<td>Liquor TAXABLE</td>
												<td>241.00</td>
												<td>32.00</td>
												<td>15.00</td>
												<td>288.00</td>
											</tr>
											<tr>
												<td>BEVERAGES TAXABLE</td>
												<td>241.00</td>
												<td>32.00</td>
												<td>15.00</td>
												<td>288.00</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td>Total</td>
												<td>5670.00</td>
												<td>581.00</td>
												<td>356.00</td>
												<td>6607.00</td>
											</tr>
										</tfoot>
										</thead>
									</table>
								</div>

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
		<!-- /.content-wrapper -->
		<footer class="main-footer text-center" style="margin-left: 0;">
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
	<!-- ./wrapper -->

	<!-- ./wrapper -->

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

	<script src="${jqueryJs}"></script>
	<script src="${bootstrapJs}"></script>
	<script src="${fastclickJs}"></script>
	<script src="${appMinJs}"></script>
	<script src="${demoJs}"></script>
	<script src="${dataTablesJs}"></script>
	<script src="${dataTablesbootstrapJs}"></script>
	<script src="${dataTablesResponsiveJs}"></script>
	<script src="${responsiveBootstrapJs}"></script>
	<script src="${jqueryNicescrollJs}"></script>

	<!-- page script -->
	<script>
		$(function() {
			$("#example1").DataTable();
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false
			});
		});
	</script>
</body>
</html>
