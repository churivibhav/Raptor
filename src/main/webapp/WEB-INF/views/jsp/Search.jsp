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

.dt-button{
	padding:10px;
}

.margin-top-10{
	margin-top:10px;
}

.sort-hide::after{
	content:"" !important;
	display:none;
}

.modal-header{
	background:rgb(0,112,192);
	color:white;
}

.close{
	opacity:1;
	color:white;
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
					style="display: inline-block;color:white; font-weight: 700; font-size: 28px; margin-left: -150px; margin-top: 5px;">YOYO
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
								<div>
										<!-- <label for="email">Module Name: </label>-->
										<select class="form-control select-module-name" style="width:130px;display:inline-block;margin-bottom:10px;">
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
										
										<button type="submit" class="btn btn-success btn-flat search pull-right">Search</button>
										<button class="btn btn-primary btn-flat pull-right add-more" style="margin-right:10px;">Add Criteria</button>
									</div>
									
								<div class="search-container">	
								<div class="form-inline row fixed-search-bar" style="margin-bottom: 15px;">
									
									<div class="form-group col-sm-2">
										<!--  <label for="email">Columns: </label>-->
										<select class="form-control column-select">
											<option value="-1">Select Column</option>
											<!--  <option value="0">Id</option>
											<option value="1">tableNumber</option>
											<option value="2">Date</option>-->
										</select>
									</div>
									<div class="form-group col-sm-2">
										<!-- <label for="email">Operator : </label>-->
										<select class="form-control operator-select">
											<option value="-1">Select Operator</option>
										</select>
									</div>
									<div class="form-group col-sm-2">
										<input type="text" class="form-control dynamic-field1" name="data1"
											placeholder="Value 1">
									</div>
									<div class="form-group col-sm-2">
										<input type="text" class="form-control dynamic-field2" name="data2"
											placeholder="Value 2" >
									</div>

									
								</div>
								</div>
								
								<div class="clearfix">
									<button class="btn btn-info pull-right" id="add-btn" style="display:none;"><i class="fa fa-plus"></i> Add</button>
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
	
	<div id="TableModal" class="modal fade" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add / Edit Table</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="col-sm-4">
						<label>Table No.</label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control table-no"/>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-sm-4">
						<label>Capacity</label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control capacity"/>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-sm-4">
						<label>Type</label>
					</div>
					<div class="col-sm-6">
						<select class="form-control" class="table-type">
							<option value="-1">Select Type</option>
							<option value="1">Bar</option>
							<option value="2">Lounge</option>
							<option value="3">VIP</option>
						</select>
					</div>
				</div>
				</div>
			<div class="modal-footer">
			<button  class="btn btn-success save-table">Save Changes</button>
		  </div>
			</div>

		</div>
	</div>
	
	<div id="FoodModal" class="modal fade" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add / Edit Food Menu</h4>
				</div>
				<div class="modal-body">
				<div class="row">
					<div class="col-sm-4">
						<label>Item Name</label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control food-item-name"/>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-sm-4">
						<label>Type</label>
					</div>
					<div class="col-sm-6">
						<select class="form-control" class="food-item-type">
							<option value="-1">Select Type</option>
							<option value="1">Starter</option>
							<option value="2">Main Course</option>
						</select>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-sm-4">
						<label>Veg</label>
					</div>
					<div class="col-sm-6 user-map-active">
						<div class="radio radio-info radio-inline">
							<input type="radio" id="inlineRadio1" value="yes" name="radioInline" checked="">
							<label for="inlineRadio1">Yes</label>
						</div>
						<div class="radio radio-info radio-inline">
							<input type="radio" id="inlineRadio1" value="no" name="radioInline">
							<label for="inlineRadio1">No</label>
						</div>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-sm-4">
						<label>Cost</label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control food-item-cost"/>
					</div>
				</div>
				</div>
			<div class="modal-footer">
			<button class="btn btn-success save-food-menu">Save Changes</button>
		  </div>
			</div>

		</div>
	</div>
	
	<div id="BarModal" class="modal fade" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add / Edit BAR Menu</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="col-sm-4">
						<label>Item Name</label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control bar-item-name"/>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-sm-4">
						<label>Type</label>
					</div>
					<div class="col-sm-6">
						<select class="form-control" class="bar-item-type">
							<option value="-1">Select Type</option>
							<option value="1">Whisky</option>
							<option value="2">Rum</option>
							<option value="3">Vodka</option>
						</select>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-sm-4">
						<label>Cost</label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control bar-item-cost"/>
					</div>
				</div>
				</div>
			<div class="modal-footer">
			<button  class="btn btn-success save-bar-menu">Save Changes</button>
		  </div>
			</div>

		</div>
	</div>
	
	<div id="WaiterModal" class="modal fade" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add / Edit Waiter</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="col-sm-4">
						<label>First Name</label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control first-name"/>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-sm-4">
						<label>Last Name</label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control last-name"/>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-sm-4">
						<label>Middle Name</label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control middle-name"/>
					</div>
				</div>
				</div>
			<div class="modal-footer">
			<button class="btn btn-success save-bar-menu">Save Changes</button>
		  </div>
			</div>

		</div>
	</div>	
	
	<div id="displayModal" class="modal fade" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Details</h4>
				</div>
				<div class="modal-body">
					
				</div>
			</div>

		</div>
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
	
	<spring:url value="/resources/core/js/lib/dataTables.buttons.min.js"
		var="file_export1" />
		
	<spring:url value="/resources/core/js/lib/buttons.flash.min.js"
		var="file_export2" />	
		
	<spring:url value="/resources/core/js/lib/jszip.min.js"
		var="file_export3" />
		
	<spring:url value="/resources/core/js/lib/pdfmake.min.js"
		var="file_export4" />	
		
	<spring:url value="/resources/core/js/lib/vfs_fonts.js"
		var="file_export5" />
		
	<spring:url value="/resources/core/js/lib/buttons.html5.min.js"
		var="file_export6" />	
		
	<spring:url value="/resources/core/js/lib/buttons.print.min.js"
		var="file_export7" />
			
	<!--<spring:url value="https://cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.min.js"
		var="file_export1" />
		
	<spring:url value="https://cdn.datatables.net/buttons/1.2.4/js/buttons.flash.min.js"
		var="file_export2" />	
		
	<spring:url value="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"
		var="file_export3" />
		
	<spring:url value="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.24/build/pdfmake.min.js"
		var="file_export4" />	
		
	<spring:url value="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.24/build/vfs_fonts.js"
		var="file_export5" />
		
	<spring:url value="https://cdn.datatables.net/buttons/1.2.4/js/buttons.html5.min.js"
		var="file_export6" />	
		
	<spring:url value="https://cdn.datatables.net/buttons/1.2.4/js/buttons.print.min.js"
		var="file_export7" />-->						


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
	
	<script src="${file_export1}"></script>
	<script src="${file_export2}"></script>
	<script src="${file_export3}"></script>
	<script src="${file_export4}"></script>
	<script src="${file_export5}"></script>
	<script src="${file_export6}"></script>
	<script src="${file_export7}"></script>
	

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
		
		$('.openPopup').on('')
		
		$(document).on('click','.openPopup',function(){
			$('#displayModal').modal('show');
		})
		
		$('.modal').on('hidden.bs.modal',function(){
			location.reload(true);
		});
		
		$(document).on('click','.delete-btn',function(){
			var module = $('.select-module-name option:selected').val();
			
			if(module == "1"){
				//table 
				var r = confirm("Are you sure want to delete this table?");
				if (r == true) {
				    
				} 
				
			}
			else if(module == "5"){
				//foodmenu
				var r = confirm("Are you sure want to delete this food menu?");
				if (r == true) {
				    
				} 
			}
			else if(module == "6"){
				//barmenu
				var r = confirm("Are you sure want to delete this bar menu?");
				if (r == true) {
				    
				} 
			}
			else{
				//waiter
				var r = confirm("Are you sure want to delete this waiter?");
				if (r == true) {
				    
				} 
			}
		})
		

		$(document).on('click','.edit-btn',function(){
			var module = $('.select-module-name option:selected').val();
			
			if(module == "1"){
				//table 
				$('#TableModal').modal('show');
			}
			else if(module == "5"){
				//foodmenu
				$('#FoodModal').modal('show');
			}
			else if(module == "6"){
				//barmenu
				$('#BarModal').modal('show');
			}
			else{
				//waiter
				$('#WaiterModal').modal('show');
			}
		})
		
		$('#add-btn').on('click',function(){
			var module = $('.select-module-name option:selected').val();
			
			if(module == "1"){
				//table 
				$('#TableModal').modal('show');
			}
			else if(module == "5"){
				//foodmenu
				$('#FoodModal').modal('show');
			}
			else if(module == "6"){
				//barmenu
				$('#BarModal').modal('show');
			}
			else{
				//waiter
				$('#WaiterModal').modal('show');
			}
		});
		
		$('.add-more').on('click',function(){
			var html = $('.search-container .fixed-search-bar')[0].outerHTML;
			
			$('.search-container').append(html);
			
		});
		
		$('.operator-select').on('change',function(){
			$('.dynamic-field1').each(function(){
				$(this).val('');
			})
			
			$('.dynamic-field2').each(function(){
				$(this).val('');
			})
		})

		$('.column-select').on(
				'change',
				function() {
					
					$('.dynamic-field1').each(function(){
						$(this).val('');
					})
					
					$('.dynamic-field2').each(function(){
						$(this).val('');
					})
					
					$('.operator-select').each(function(){
						$(this).find('option:selected').removeAttr('selected');
					})
					
					var selcted_value = $(this).find('option:selected').attr(
							'dataType');

					if (selcted_value === 'java.util.Date') {
						$(this).closest('.row').find('.dynamic-field1').datepicker({
							format : 'dd-M-yyyy',
							todayHighlight : true,
							autoclose : true
						});
						$(this).closest('.row').find('.dynamic-field2').datepicker({
							format : 'dd-M-yyyy',
							todayHighlight : true,
							autoclose : true
						});
					} else {
						$(this).closest('.row').find('.dynamic-field1').datepicker('remove');
						$(this).closest('.row').find('.dynamic-field2').datepicker('remove');
					}

				});

		$('.select-module-name').on('change', function() {
			var className = $(this).find('option:selected').text();
			$('.column-select').find('option').remove().end();
			$('.operator-select').find('option').remove().end();
			
			$('.dynamic-field1').each(function(){
				$(this).val('');
			})
			
			$('.dynamic-field2').each(function(){
				$(this).val('');
			})
			
			$('.column-select').each(function(){
				$(this).find('option:selected').removeAttr('selected');
			})
			
			$('.operator-select').each(function(){
				$(this).find('option:selected').removeAttr('selected');
			})

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
		var searchTable = "";
		$(document)
				.on(
						'click',
						'.search',
						function() {
							/*$('#searchTable tbody').html('');
							$('#searchTable thead').html('');*/
							
							
							
							var module_select_value = $('.select-module-name option:selected').val();
							
							if(module_select_value == "-1"){
								alert('Please select module to Search.');
								return;
							}
							
							if(searchTable != "")
								searchTable.destroy();
							
							var className = $(
									'.select-module-name option:selected')
									.text();
							var column = $('.column-select option:selected')
									.val();
							var dataType = $('.column-select option:selected')
									.attr('dataType');
							var operation = $(
									'.operator-select option:selected').val();
							var data1 = $('.dynamic-field1').val();
							var data2 = $('.dynamic-field2').val();
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
							
							if(["1","5","6","10"].indexOf(module_select_value) != -1)
								tr += "<th class='sort-hide text-center'>Action</th>";
								
							tr = tr + '</tr>';
							$('#searchTable thead').html('');
							$('#searchTable thead').append(tr);
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
											$('#searchTable tbody').html('');
											
											
											
											if(["1","5","6","10"].indexOf(module_select_value) != -1)
												$('#add-btn').css('display','block');
											else
												$('#add-btn').css('display','none');
												
											for (var i = 0; i < data.length; i++) {
												var tr = '<tr id="'+data[i].id+'"class="'+data[i].id+'">';
												$
														.each(
																data[i],
																function(k, v) {
																	if (jQuery
																			.type(v) != "array")
																		if(k == 'id'){
																			tr = tr
																			+ '<td class="'+k+'">'
																			+ '<a href="#" class="openPopup">'+v+'</a>'
																			+ '</td>'
																		}
																		else{
																			tr = tr
																			+ '<td class="'+k+'">'
																			+ v
																			+ '</td>'
																		}
																		
																});
												
												if(["1","5","6","10"].indexOf(module_select_value) != -1)
													tr += "<td class='text-center' ><a class='edit-btn' href='#' style='margin-right:5px;'><i class='fa fa-edit'></i></a><a class='delete-btn' href='#'><i class='fa fa-trash'></i></a></td>";
													
												tr += '</tr>';
												$('#searchTable tbody').append(tr);
											}
												searchTable = $("#searchTable").DataTable({
													dom: 'Bfrtip',
											        buttons: [
											             'csv', 'excel', 'pdf', 'print'
											        ]
												});
											
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
