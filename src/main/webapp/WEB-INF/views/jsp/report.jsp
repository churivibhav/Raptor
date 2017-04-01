<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>YOYO</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <!-- Bootstrap 3.3.6 -->
        <spring:url value="/resources/core/css/lib/bootstrap.min.css" var="bootstrapCss" />
        <spring:url value="/resources/core/css/lib/fontawesome.min.css" var="fontawesomeCss" />
        <spring:url value="/resources/core/css/lib/custmicons.min.css" var="custmiconsCss" />
        <spring:url value="/resources/core/css/lib/fix_style.css" var="fix_styleCss" />
        <spring:url value="/resources/core/css/lib/blue.css" var="blueCss" />
        <spring:url value="/resources/core/css/lib/animate.css" var="animateCss" />
        <spring:url value="/resources/core/css/app/style.css" var="styleCss" />
        <spring:url value="/resources/core/css/lib/checkbox.css" var="checkboxCss" />
        <spring:url value="/resources/core/css/lib/_all-skins.min.css" var="allskinsCss" />
        <spring:url value="/resources/core/css/lib/dataTables.bootstrap.min.css" var="dataTablesCss" />
        <spring:url value="/resources/core/css/lib/responsive.bootstrap.min.css" var="responsiveCss" />
        <spring:url value="/resources/core/css/lib/datepicker.css" var="datePickerCss" />
        
        <link href="${bootstrapCss}" rel="stylesheet"/>
        <link href="${fontawesomeCss}" rel="stylesheet"/>
        <link href="${custmiconsCss}" rel="stylesheet"/>
        <link href="${fix_styleCss}" rel="stylesheet"/>
        <link href="${blueCss}" rel="stylesheet"/>
        <link href="${animateCss}" rel="stylesheet"/>
        <link href="${styleCss}" rel="stylesheet"/>
        <link href="${checkboxCss}" rel="stylesheet"/>
        <link href="${allskinsCss}" rel="stylesheet"/>
        <link href="${dataTablesCss}" rel="stylesheet"/>
        <link href="${responsiveCss}" rel="stylesheet"/>
        <link href="${datePickerCss}" rel="stylesheet"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
  <style>
	.logo-mini{
		font-size:16px !important;
	}
	
	.report-header{
		margin-bottom:10px !important;
	}
  </style>
  
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="../../index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">YOYO</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>YOYO</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          
          <!-- Notifications: style can be found in dropdown.less -->
          
          <!-- Tasks: style can be found in dropdown.less -->
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="images/avatar5.png" class="user-image" alt="User Image">
              <span class="hidden-xs">Darshan Bhogale</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="images/avatar5.png" class="img-circle" alt="User Image">

                <p>
                  Darshan Bhogale - Cashier
                  
                </p>
              </li>
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
       
       
      
        <li class="treeview active">
          <a href="#">
            <i class="fa fa-copy"></i>
            <span>Reports</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            
            <li  class="active"><a href="#"><i class="fa fa-circle-o"></i> Report 1</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Report 2</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Report 3</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Report 4</a></li>
            
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1 class="report-header">
        Reports
        <small>Report 1</small>
         <small><a href="generate/excel.xls">Generate Report</a> </small> 
      </h1>
      <!--<ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">UI</a></li>
        <li class="active">General</li>
      </ol>-->
	  
	  <div class="form-group col-sm-2">
		<input type="text" class="form-control" name="startDate" placeholder = "From Date" id="startDate">
	  </div>
	  <div class="form-group col-sm-2">
		<input type="text" class="form-control" name="toDate" placeholder = "To Date" id="toDate">
	  </div>
	  <div class="table-respnsive">
		<table  class="table nowrap table-striped table-bordered hover table-condensed " id="installTable"  cellspacing="0">
			<thead>
				<tr>
					<th>Column Header 1</th>
					<th>Column Header 2</th>
					<th>Column Header 3</th>
					<th>Column Header 4</th>
					<th>Column Header 4</th>
					<th>Column Header 4</th>
					<th>Column Header 4</th>
					<th>Column Header 4</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bills}" var="bill">
				<tr>
					<td><c:out value="${bill.tableNumber}"/></td>
					<td>${bill.amount}</td>
					<td>${bill.taxAmount}</td>
					<td>${bill.totalAmount}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	  </div>
    </section>

    <!-- Main content -->
    <section>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; 2017<a href="http://almsaeedstudio.com"> YOYO Bar & Grill</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

 <!-- jQuery 2.2.3 -->
 
 		<spring:url value="/resources/core/js/lib/jquery-2.2.3.min.js" var="jqueryJs" />
 		<spring:url value="/resources/core/js/lib/bootstrap.min.js" var="bootstrapJs" />
 		<spring:url value="/resources/core/js/lib/fastclick.js" var="fastclickJs" />
 		<spring:url value="/resources/core/js/lib/app.min.js" var="appMinJs" />
 		<spring:url value="/resources/core/js/lib/demo.js" var="demoJs" />
 		<spring:url value="/resources/core/js/lib/jquery.dataTables.min.js" var="dataTablesJs" />
 		<spring:url value="/resources/core/js/lib/dataTables.bootstrap.min.js" var="dataTablesbootstrapJs" />
 		<spring:url value="/resources/core/js/lib/dataTables.responsive.min.js" var="dataTablesResponsiveJs" />
 		<spring:url value="/resources/core/js/lib/responsive.bootstrap.min.js" var="responsiveBootstrapJs" />
 		<spring:url value="/resources/core/js/lib/jquery.nicescroll.min.js" var="jqueryNicescrollJs" />
 		<spring:url value="/resources/core/js/lib/datepicker.js" var="datepickerJs" />
 		
        <script src="${jqueryJs}"></script>
        <script src="${bootstrapJs}"></script>
        <script src="${fastclickJs}"></script>
        <script src="${appMinJs}"></script>
        <script src="${dataTablesJs}"></script>
        <script src="${dataTablesbootstrapJs}"></script>
        <script src="${dataTablesResponsiveJs}"></script>
        <script src="${responsiveBootstrapJs}"></script>
        <script src="${jqueryNicescrollJs}"></script>
        <script src="${demoJs}"></script>
        <script src="${datepickerJs}"></script>
        
<script>
  $(function () {
	$('#startDate').datepicker({format: 'mm/dd/yyyy',todayHighlight: true,autoclose:true});
	$('#toDate').datepicker({format: 'mm/dd/yyyy',todayHighlight: true,autoclose:true});
  });
</script>
        
        
</body>
</html>
