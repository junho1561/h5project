<%@page import="com.DAO.keywordDAO"%>
<%@page import="com.DTO.keywordDTO"%>
<%@page import="com.DTO.ChatDTO"%>
<%@page import="com.DAO.QuestionDAO"%>
<%@page import="com.DTO.QuestionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.CLASS_MEMBER_DTO"%>
<%@page import="com.DAO.CLASS_MEMBER_DAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">
   <% ChatDTO chatdto =(ChatDTO)session.getAttribute("chatdto"); %>
   <% CLASS_MEMBER_DTO info =(CLASS_MEMBER_DTO)session.getAttribute("info"); %>

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Login.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
        </div>
        <img style="width:160px; margin-left: 10px"src="img/logo.png">
        <div class="sidebar-brand-text mx-3"></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        
      </div>

      <!-- Nav Item - Tables -->
      <li class="nav-item active">
        <a class="nav-link" href="mypage_t_class.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>강사 마이페이지</span></a>
      </li>

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <form class="form-inline">
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
              <i class="fa fa-bars"></i>
            </button>
          </form>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button onClick="location.href='search.jsp'"class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=info.getNickname() %></span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="forgot-password.jsp">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                     회원정보 수정
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="LogoutService.do" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                     로그아웃
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
 <!--            <h1 class="h3 mb-0 text-gray-800">마이페이지</h1>--> 
     <!--        <a href="chat.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i>강의 만들기</a> -->
          </div>
<!--      <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>-->

       <!--나의 강의실-->
          <!-- Page Heading -->
          <div class="card mb-4">
          <form class="user" action="classnameService.do" method="post">
                 <div class="card-header py-3">
                 <div class="d-sm-flex align-items-center justify-content-between mb-4">
               <input name="classname" type="text" class="form-control form-control-user"placeholder="수업 이름">
                <input name="teacher" type="text" class="form-control form-control-user"placeholder="강사 이름">
               <input type = "submit" class = "d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="채팅방 개설">
               
               
               
               <!-- <?php $chat.jsp = isset($_GET['chat.jsp'])&&$_GET['chat.jsp'] ? sanitize_text_field($_GET['chat.jsp']) : ''; ?>  
					<form method="get" id="my-search-form" class="my-search-form" action="<?php echo site_url()?>/activity2/?chat.jsp">
					   <div>
					      <input type="text" value="1" name="chat.jsp?cnt" id="chat.jsp">
					      <input type="submit" class="my-search-submit" id="my-search-submit" value="검색">
					   </div>
					</form> -->
					
               
            </form>
          </div>
                  <div class="dropdown no-arrow mb-4">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         나의 강의
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">머신러닝 1주차</a>
                      <a class="dropdown-item" href="#">머신러닝 2주차</a>
                      <a class="dropdown-item" href="#">머신러닝 3주차</a>
                    </div>
                  </div>
                    <h10>강의를 선택해 주세요. 받았던 질문과 키워드를 볼 수 있습니다</h10>
                </div>
            </div>
            <!-- Content Row  <div class="row">-->
         

            <!-- 질문 키워드<div class="col-lg-6 mb-4"> -->
            

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
              
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">질문 키워드</h6>
                </div>
                 <% 
                 keywordDAO keyworddao = new keywordDAO();
                 ArrayList<keywordDTO> keywordlist = new ArrayList<keywordDTO>();
                 keywordlist = keyworddao.keywordselect();
        			%>
                <div class="card-body">
                  <h4 class="small font-weight-bold"><%= keywordlist.get(4).getKeyword() %><span class="float-right">90%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 90%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold"><%= keywordlist.get(1).getKeyword() %><span class="float-right">80%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: 80%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold"><%= keywordlist.get(0).getKeyword() %><span class="float-right">70%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar" role="progressbar" style="width: 70%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold"><%= keywordlist.get(2).getKeyword() %><span class="float-right">60%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold"><%= keywordlist.get(3).getKeyword() %><span class="float-right">50%</span></h4>
                  <div class="progress">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" ></div>
                  </div>
                </div>
                
              </div>
              
              
              <% String mg1 = request.getParameter("img"); %>
        	 <!-- <img style = "width:300px; height:300px;" src = "http://localhost:8083/gitproject/mypage_t.jsp/ <%=mg1 %>.png"><br>
         
         
         
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">수업별 질문 살펴보기</h6>
            </div>
            
         
            <% 
               QuestionDAO dao = new QuestionDAO();
                 ArrayList<QuestionDTO> list = new ArrayList<QuestionDTO>();
                 list = dao.viewT();
         %>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>질문 내용</th> 
                      <th>수업</th>
                      <th>강사</th>
                      <th>수업 날짜</th>
                    </tr>
                  </thead>
                  <tbody>
                     <% for (int i = 1; i < list.size(); i++) { %>
                       <tr>
                         <td><%= list.get(i).getQuestion() %></td>
                         <td><%= list.get(i).getClassname() %></td>
                         <td><%= list.get(i).getTeacher() %></td>
                         <td><%= list.get(i).getClassdate() %></td>
                       </tr>
                    <% } %>
                  </tbody>
                  <!-- <tfoot>
                    <tr>
                      <th>질문 내용</th> 
                      <th>수업</th>
                      <th>강사</th>
                      <th>수업 날짜</th>
                    </tr>
                  </tfoot> -->
                  
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã </span>
          </button>
        </div>
        <div class="modal-body">로그아웃 하시겠습니까?</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="Login.jsp">로그아웃</a>
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

  <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>