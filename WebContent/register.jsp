<%@page import="com.DTO.CLASS_MEMBER_DTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Register</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
	<% CLASS_MEMBER_DTO info =(CLASS_MEMBER_DTO)session.getAttribute("info"); %>

	<div class="container">

		<!-- Header -->
		<header id="header" class="alt"> <a href="mypage_t.jsp"
			class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a> <nav>
		<c:choose>
			<c:when test="${empty info}">
				<a href="Login.jsp"></a>
			</c:when>
			<c:otherwise>
				<a href="mypage_t.jsp"></a>
			</c:otherwise>
		</c:choose> <!-- 로그인 후 Logout.jsp로 이동할 수 있는'로그아웃'링크와 '개인정보수정'링크를 출력하시오. --> </nav> </header>
		<div class="container">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
						<div class="col-lg-7">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
								</div>
								<form class="user" action="JoinService.do" method="post">
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input name="nickname" type="text"
												class="form-control form-control-user" id="exampleFirstName"
												placeholder="nickname">
										</div>
										<div class="col-sm-6">
											<input type="radio" name="job" value="강사">강사 <input
												type="radio" name="job" value="학생">학생
										</div>
									</div>
									<div class="form-group">
										<input name="email" type="text"
											class="form-control form-control-user" id="exampleInputEmail"
											placeholder="Email Address">
									</div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input name="pw" type="password"
												class="form-control form-control-user"
												id="exampleInputPassword" placeholder="Password">
										</div>
										<div class="col-sm-6">
											<input type="password" class="form-control form-control-user"
												id="exampleRepeatPassword" placeholder="Repeat Password">
										</div>
									</div>
									<a href="login.jsp"> <input type="submit"
										class="btn btn-primary btn-user btn-block" value="회원가입">
									</a>
									<hr>
									<a href="Login.jsp" class="btn btn-google btn-user btn-block">
										<i class="fab fa-google fa-fw"></i> Register with Google
									</a> <a href="Login.jsp"
										class="btn btn-facebook btn-user btn-block"> <i
										class="fab fa-facebook-f fa-fw"></i> Register with Facebook
									</a>
								</form>
								<hr>
								<div class="text-center">
									<a class="small" href="forgot-password.html">Forgot
										Password?</a>
								</div>
								<div class="text-center">
									<a class="small" href="login.jsp">Already have an account?
										Login!</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin-2.min.js"></script>
</body>
</html>