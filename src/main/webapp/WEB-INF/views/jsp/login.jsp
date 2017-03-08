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

<link rel="stylesheet" href="${bootstrapCss}" />
<link rel="stylesheet" href="${fontCss}" />

<link rel="stylesheet" href="${menuCss}" />
<link rel="stylesheet" href="${styleCss}" />
<link rel="stylesheet" href="${checkboxCss}" />

</head>

<body>
	<div class="main">
		<header class="bg-img header">

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

					<div class="login-form-container">
						<div class="login-form">
							<div class="login">
								<form class="form-horizontal" action="home" method="post">
									<div class="form-group">
										<div class="col-sm-12">
											<select class="form-control">
												<option value="-1">I am ...</option>
												<option value="0">Cashier</option>
												<option value="1">Podium</option>
												<option value="2">Admin</option>
											</select>

										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-12">
											<input type="text" class="form-control" name="username" id="name"
												placeholder="Username" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-12">
											<input type="password" class="form-control" name="password"
												id="password" placeholder="Password" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-6">
											<div class="checkbox margin-left-20">
												<input id="checkbox1" class="styled" type="checkbox">
												<label for="checkbox1" class="remember-me"> Remember
													Me </label>
											</div>
										</div>
										<div class="col-sm-6">
											<a href="#" class="forgot-passowrd pull-right">Forgot
												Password?</a>
										</div>
									</div>

									<div class="form-group text-center">
										<input type="submit" value="Login" class="btn btn-lg login-button"/>
									</div>

									<div class="form-group incorrect-msg">
										<span>Incorrect Username or Password, Please try again.</span>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>

	<div class="main-side-menu">
		<div class="close-menu-btn">
			<i class="fa fa-close fa-2x"></i>
		</div>
		<div class="menu">Menu1</div>
		<div class="menu">Menu2</div>
		<div class="menu">Menu3</div>
		<div class="menu">Menu4</div>
		<div class="menu">Menu5</div>
	</div>

	<div class="menu-overlay"></div>

</body>

</html>

<spring:url value="/resources/core/js/lib/jquery-1.9.1.min.js"
	var="jqueryJs" />
<spring:url value="/resources/core/js/lib/bootstrap.min.js"
	var="bootstrapJs" />

<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>



<script>
	$('.bg-img').css("min-height", $(window).height() + "px");

	$(window).resize(function() {
		$('.bg-img').css("min-height", $(window).height() + "px");
	});
</script>