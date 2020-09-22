<%@page import="com.DTO.ChatDTO"%>
<%@page import="com.DTO.QuestionDTO"%>
<%@page import="com.DAO.QuestionDAO"%>
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
	<% request.setCharacterEncoding("UTF-8"); %>
	<% 
		int num = Integer.parseInt(request.getParameter("cnt"));
	%>
	<input type="hidden" id = "chat_num" value = "<%= num %>">
	
	<div id="chat-container">
		<br><br><br>
		<h1>마음껏 질문하세요!</h1>
		<br><br><br>
		
		
		<div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">공감이 많은 질문들</h6>
            </div>
            
            <div class="card-body">  
              <div class="table-responsive">
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
		console.log('아이디>>','${info.nickname}');
		$('#btn').on('click', play);
		$('#content').on('keydown',da);
		setInterval(select,100);
		function da(key){
			if(key.keyCode == 13){
				play();
			}
		}
		
		function select(){

			//스크롤 최하단
			$('#view').scrollTop($('#view')[0].scrollHeight);
			var chat_num = $('#chat_num').val();
			$.ajax({
				url : "SelectChat?chat_num=" + chat_num,
				dataType : "json",
				success : function(result) {   
					$('#list').empty();
					for(var i = 0; i < result.length; i++){
						var chatData = '';
						if('${info.nickname}' === result[i].nickname){
							chatData = '<li class="me-corpus"><span>'+result[i].nickname +'</span><br><p class="corpus">'+result[i].chat+'</p></li>';
						}else{
							chatData = '<li><span>'+result[i].nickname +'</span><br><p class="corpus">'+result[i].chat+'</p></li>';
						}
						
						$('#list').prepend(chatData);
						
						console.log(result[i].nickname);
						console.log(result[i].chat);
					}
				},
				error : function() {
					alert('errorS');
				}
			});

		}
		
		
		function play(){
			//스크롤 최하단
			$('#view').scrollTop($('#view')[0].scrollHeight);
			
			var nickname = '${info.nickname}';
			var chat = $('#content').val();
			$('#content').val('');
			$('#content').focus();
			
			if(nickname === '?'){ //물음표 -> 아스키코드로 변환
				nickname = '0x3F';
			}
			/*
			escape() <> unescape()
			encodeURI() : 인터넷 주소에서 사용하는 :, ;, /, =, ?, & 등을 제외하고 인코딩
			encodeURIComponent() : 모든 문자를 인코딩
			decodeURI() : encodeURI()로 인코딩한 문자열을 디코딩
			decodeURIComponent() : encodeURIComponent()로 인코딩한 문자열을 디코딩
			*/
			
			
			var chat_num = $('#chat_num').val();
			$.ajax({
				url : "AddChat?chat_num="+chat_num,
				type : "POST",
				dataType : "json",
				data : "nickname=" + nickname + "&chat=" + chat,
				success : function(result) {
					
					$('#list').empty();
					for(var i = 0; i < result.length; i++){
						$('#list').prepend('<li><span>'+result[i].nickname +'</span> : '+result[i].chat+'</li>');
						//console.log(result[i].nickname);
						//console.log(result[i].chat);
						
					}
				},
				error : function() {
					alert('errorA');
				}
			});
		}
	</script>
</body>
</html>