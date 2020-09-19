<%@page import="com.DAO.test_BoardDAO"%>
<%@page import="com.DTO.test_BoardDTO"%>
<%@page import="com.DAO.test_MemberDAO"%>
<%@page import="com.DTO.test_MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.CLASS_MEMBER_DTO"%>
<%@page import="com.DAO.CLASS_MEMBER_DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#chat-container{
	position:relative;
	width: 100%;
	text-align: center;
}
#dev{
	position: absolute;
	right: 27.5%;
}
#img{
	text-align: center;
	opacity: 0.2;
	position: absolute;
	height: 500px;
}
#view{
	position:relative;
	width : 45%;
	text-align: center;
	margin: 0px auto;
	height: 500px;
	overflow: scroll;
	border: 2px solid #0090d0;
	border-radius: 10px;
	margin: 0px auto;
	padding-bottom: 10px;
}
#view > img{
	position: fixed;
	/* 웹 페이지 내 가운데로 배치하는 공식 */
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
}
ul{
	list-style: none;
	margin: 0;
	padding: 10px;
}
li{
	text-align: left;
}
span{
	color: #0090d0;
}
h1{
	color: #0090d0;
}
table{
	margin: 0px auto;
	text-align: center;
}
input{
	border-radius: 10px;
	border: 2px solid #0090d0;
	padding: 2px;
}
#id{
	width: 100px;
	height: 30px;
}
#content{
	width: 400px;
	height: 30px;
}
button{
	width: 100px;
	height: 39px;
	border-radius: 10px;
	border: 2px solid #0090d0;
}
.corpus{
	display:inline-block;
	padding:5px;
	border-radius: 5px;
	border-top-left-radius:0px;
	background-color: #74b9ff;
}
.me-corpus{
	text-align: right;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
	%>
	
	<div id="chat-container">
		<br><br><br>
		<h1>마음껏 질문하세요!</h1>
		<br><br><br>
		
		
		<div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">공감이 많은 질문들</h6>
            </div>
            
            <% 
            	test_BoardDAO dao = new test_BoardDAO();
           		ArrayList<test_BoardDTO> list = new ArrayList<test_BoardDTO>();
           		list = dao.viewAll();
			%>
            
            <div class="card-body">  
              <div class="table-responsive">
                <table class="table table-bordered" id="view" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>질문 내용</th> 
                      <th>공감 수</th>
                    </tr>
                  </thead>

				 <tbody>
                  	<% for (int i = 0; i < list.size(); i++) { %>
	                    <tr>
	                    <!-- 이건 제가 시험 삼아 만든 데이터라서 나중에 주희언니가 만든 데이터로 바꿔야 해요. -->
	                      <td><%= list.get(i).getQuestion() %></td>
	                      <td><%= list.get(i).getLikes() %></td>
	                    </tr>
                    <% } %>

                  </tbody>                
                </table>
              </div>
            </div>
          </div>
		
		
		
		<div id = "view">
			<img src = "questionmark.png" id = "img">
			<ul id="list"> </ul>
		</div>
		<br>
		<table>
			<tr>
				<td><input placeholder="내용입력" type="text" id="content"></td>
				<td><button id="btn">입력</button></td>
			</tr>
		</table>
		
		<div id="dev">
			<span>나도 하고 싶었던 질문에 공감 버튼을 눌러 주세요</span>
		</div>
	</div>
	
	
	
	<!-- javascript -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		console.log('아이디>>','${param.id}');
		$('#btn').on('click', play);
		$('#content').on('keydown',da);
		setInterval(select,1000);
		
		function da(key){
			if(key.keyCode == 13){
				play();
			}
		}
		
		function select(){

			//스크롤 최하단
			$('#view').scrollTop($('#view')[0].scrollHeight);
				
			$.ajax({
				url : "SelectChat",
				dataType : "json",
				success : function(result) {   
					$('#list').empty();
					for(var i = 0; i < result.length; i++){
						var chatData = '';
						if('${param.id}' === result[i].id){
							chatData = '<li class="me-corpus"><span>'+result[i].id +'</span><br><p class="corpus">'+result[i].content+'</p></li>';
						}else{
							chatData = '<li><span>'+result[i].id +'</span><br><p class="corpus">'+result[i].content+'</p></li>';
						}
						
						$('#list').prepend(chatData);
						
						console.log(result[i].id);
						console.log(result[i].content);
					}
				},
				error : function() {
					alert('error');
				}
			});

		}
		
		
		function play(){
			//스크롤 최하단
			$('#view').scrollTop($('#view')[0].scrollHeight);
			
			var id = '${param.id}';
			var content = $('#content').val();
			$('#content').val('');
			$('#content').focus();
			
			if(id === '?'){ //물음표 -> 아스키코드로 변환
				id = '0x3F';
			}
			/*
			escape() <> unescape()
			encodeURI() : 인터넷 주소에서 사용하는 :, ;, /, =, ?, & 등을 제외하고 인코딩
			encodeURIComponent() : 모든 문자를 인코딩
			decodeURI() : encodeURI()로 인코딩한 문자열을 디코딩
			decodeURIComponent() : encodeURIComponent()로 인코딩한 문자열을 디코딩
			*/
			
			$.ajax({
				url : "AddChat",
				type : "POST",
				dataType : "json",
				data : "id=" + id + "&content=" + content,
				success : function(result) {
					
					$('#list').empty();
					for(var i = 0; i < result.length; i++){
						$('#list').prepend('<li><span>'+result[i].id +'</span> : '+result[i].content+'</li>');
						//console.log(result[i].id);
						//console.log(result[i].content);
						
					}
				},
				error : function() {
					alert('error');
				}
			});
		}
	</script>
</body>
</html>