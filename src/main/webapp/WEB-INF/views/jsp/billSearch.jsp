<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <title>YOYO</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <spring:url value="/resources/core/css/lib/bootstrap.min.css" var="bootstrapCss" />
        <spring:url value="/resources/core/css/lib/fontawesome.min.css" var="fontawesomeCss" />
        <spring:url value="/resources/core/css/lib/custmicons.min.css" var="custmiconsCss" />
        <spring:url value="/resources/core/css/lib/fix_style.css" var="fix_styleCss" />
        <spring:url value="/resources/core/css/lib/blue.css" var="blueCss" />
        <spring:url value="/resources/core/css/lib/animate.css" var="animateCss" />
        <spring:url value="/resources/core/css/app/style1.css" var="styleCss" />
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
	
	.table th{
		background-color:#00c0ef !important;
		color:white;
	}
	
	.table th:after{	
		opacity:1 !important;
	}
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapp1er">

  <header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>YOYO</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>YOYO</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle hidden" data-toggle="offcanvas" role="button">
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
          <
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="images/avatar51.png" class="user-image" alt="User Image">
              <span class="hidden-xs">Darshan Bhogale</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="images/avatar51.png" class="img-circle" alt="User Image">

                <p>
                  Darshan Bhogale - Cashier
                  
                </p>
              </li>
              <!-- Menu Body -->
             
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
  <aside class="main-sidebar hidden" style="display:none">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <!--<li class="header">MAIN NAVIGATION</li>-->
       
        <li class="treeview active">
          <a href="#">
            <i class="fa fa-table"></i> <span>Reports</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="#"><i class="fa fa-circle-o"></i> Report 1</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>Report 2</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>Report 3</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>Report 4</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>Report 5</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapp1er. Contains page content -->
  <div class="content-wrapp1er" style="margin-left:0px !important;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Search Bill
        <!--<small>Report 1</small>-->
      </h1>
    
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              
            </div>
            <!-- /.box-header -->
            <div class="box-body">
			  <div class="form-inline row" style="margin-bottom:15px;">
				  <div class="form-group col-sm-2">
					<label for="email">Bill No. : </label>
					<select class="form-control bill-no-select">
						<option value="0">B0</option>
						<option value="1">B1</option>
						<option value="2">B2</option>
						<option value="3">B3</option>
						<option value="4">B4</option>
						<option value="5">B5</option>
						<option value="6">B6</option>
					</select>	
				  </div>	
				  <div class="form-group col-sm-2">
					<label for="email">Table No. : </label>
					<select class="form-control table-no-select">
						<option value="0">T0</option>
						<option value="1">T1</option>
						<option value="2">T2</option>
						<option value="3">T3</option>
						<option value="4">T4</option>
						<option value="5">T5</option>
						<option value="6">T6</option>
					</select>	
				  </div>
				  <div class="form-group col-sm-2">
					<label for="email">Waiter : </label>
					<select class="form-control waiter-select">
						<option value="0">Rahul</option>
						<option value="1">Alex</option>
					</select>	
				  </div>
				  <div class="form-group col-sm-2">
					
					<input type="text" class="form-control" name="startDate" placeholder = "From Date" id="startDate">
				  </div>
				  <div class="form-group col-sm-2">
					
					<input type="text" class="form-control" name="toDate" placeholder = "To Date" id="toDate">
				  </div>
				 
				  <div class="col-sm-2 pull-right"><button type="submit"  class="btn btn-success search">Search</button></div>
				</div>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Rendering engine</th>
                  <th>Browser</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                  <th>CSS grade</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td> 4</td>
                  <td>X</td>
                </tr>
                <tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 5.0
                  </td>
                  <td>Win 95+</td>
                  <td>5</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 5.5
                  </td>
                  <td>Win 95+</td>
                  <td>5.5</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 6
                  </td>
                  <td>Win 98+</td>
                  <td>6</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Trident</td>
                  <td>Internet Explorer 7</td>
                  <td>Win XP SP2+</td>
                  <td>7</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Trident</td>
                  <td>AOL browser (AOL desktop)</td>
                  <td>Win XP</td>
                  <td>6</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Firefox 1.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Firefox 1.5</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Firefox 2.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Firefox 3.0</td>
                  <td>Win 2k+ / OSX.3+</td>
                  <td>1.9</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Camino 1.0</td>
                  <td>OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Camino 1.5</td>
                  <td>OSX.3+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Netscape 7.2</td>
                  <td>Win 95+ / Mac OS 8.6-9.2</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Netscape Browser 8</td>
                  <td>Win 98SE+</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Netscape Navigator 9</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Mozilla 1.0</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>1</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Mozilla 1.1</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>1.1</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Mozilla 1.2</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>1.2</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Mozilla 1.3</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>1.3</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Mozilla 1.4</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>1.4</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Mozilla 1.5</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>1.5</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Mozilla 1.6</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>1.6</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Mozilla 1.7</td>
                  <td>Win 98+ / OSX.1+</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Mozilla 1.8</td>
                  <td>Win 98+ / OSX.1+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Seamonkey 1.1</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Gecko</td>
                  <td>Epiphany 2.20</td>
                  <td>Gnome</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Webkit</td>
                  <td>Safari 1.2</td>
                  <td>OSX.3</td>
                  <td>125.5</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Webkit</td>
                  <td>Safari 1.3</td>
                  <td>OSX.3</td>
                  <td>312.8</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Webkit</td>
                  <td>Safari 2.0</td>
                  <td>OSX.4+</td>
                  <td>419.3</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Webkit</td>
                  <td>Safari 3.0</td>
                  <td>OSX.4+</td>
                  <td>522.1</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Webkit</td>
                  <td>OmniWeb 5.5</td>
                  <td>OSX.4+</td>
                  <td>420</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Webkit</td>
                  <td>iPod Touch / iPhone</td>
                  <td>iPod</td>
                  <td>420.1</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Webkit</td>
                  <td>S60</td>
                  <td>S60</td>
                  <td>413</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Opera 7.0</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Opera 7.5</td>
                  <td>Win 95+ / OSX.2+</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Opera 8.0</td>
                  <td>Win 95+ / OSX.2+</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Opera 8.5</td>
                  <td>Win 95+ / OSX.2+</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Opera 9.0</td>
                  <td>Win 95+ / OSX.3+</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Opera 9.2</td>
                  <td>Win 88+ / OSX.3+</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Opera 9.5</td>
                  <td>Win 88+ / OSX.3+</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Opera for Wii</td>
                  <td>Wii</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Nokia N800</td>
                  <td>N800</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Presto</td>
                  <td>Nintendo DS browser</td>
                  <td>Nintendo DS</td>
                  <td>8.5</td>
                  <td>C/A<sup>1</sup></td>
                </tr>
                <tr>
                  <td>KHTML</td>
                  <td>Konqureror 3.1</td>
                  <td>KDE 3.1</td>
                  <td>3.1</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>KHTML</td>
                  <td>Konqureror 3.3</td>
                  <td>KDE 3.3</td>
                  <td>3.3</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>KHTML</td>
                  <td>Konqureror 3.5</td>
                  <td>KDE 3.5</td>
                  <td>3.5</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Tasman</td>
                  <td>Internet Explorer 4.5</td>
                  <td>Mac OS 8-9</td>
                  <td>-</td>
                  <td>X</td>
                </tr>
                <tr>
                  <td>Tasman</td>
                  <td>Internet Explorer 5.1</td>
                  <td>Mac OS 7.6-9</td>
                  <td>1</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>Tasman</td>
                  <td>Internet Explorer 5.2</td>
                  <td>Mac OS 8-X</td>
                  <td>1</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>NetFront 3.1</td>
                  <td>Embedded devices</td>
                  <td>-</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>NetFront 3.4</td>
                  <td>Embedded devices</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>Dillo 0.8</td>
                  <td>Embedded devices</td>
                  <td>-</td>
                  <td>X</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>Links</td>
                  <td>Text only</td>
                  <td>-</td>
                  <td>X</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>Lynx</td>
                  <td>Text only</td>
                  <td>-</td>
                  <td>X</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>IE Mobile</td>
                  <td>Windows Mobile 6</td>
                  <td>-</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>PSP browser</td>
                  <td>PSP</td>
                  <td>-</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>Other browsers</td>
                  <td>All others</td>
                  <td>-</td>
                  <td>-</td>
                  <td>U</td>
                </tr>
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
  <footer class="main-footer text-center" style="margin-left:0px !important">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; 2014-2015 <a href="#">YOYO Bar & Grill</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside>
    </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  
</div>
<!-- ./wrapp1er -->

<!-- ./wrapp1er -->

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
        <script src="${datepickerJs}"></script>
        
        <!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
	
	$('#startDate').datepicker({format: 'mm/dd/yyyy',todayHighlight: true,autoclose:true});
	$('#toDate').datepicker({format: 'mm/dd/yyyy',todayHighlight: true,autoclose:true});
  });
</script>
</body>
</html>