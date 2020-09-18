<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	/* �� ������ �� ����� ��ġ�ϴ� ���� */
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
		<h1>����Ʈ�̵�����簳�߿� ����� ver.3</h1>
		<br><br><br>
		<div id = "view">
		<img src = "smhrd.jpg" id = "img">
		<ul id="list"> </ul>
		</div>
		<br>
		<table>
			<tr>
				
				<td><input placeholder="�����Է�" type="text" id="content"></td>
				<td><button id="btn">�Է�</button></td>
			</tr>
		</table>
		
		<div id="dev">
			<span>developer. �긣����. Justin</span>
		</div>
	</div>
	
	
	
	<!-- javascript -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		console.log('���̵�>>','${param.id}');
		$('#btn').on('click', play);
		$('#content').on('keydown',da);
		setInterval(select,1000);
		
		function da(key){
			if(key.keyCode == 13){
				play();
			}
		}
		
		function select(){

			//��ũ�� ���ϴ�
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
			//��ũ�� ���ϴ�
			$('#view').scrollTop($('#view')[0].scrollHeight);
			
			var id = '${param.id}';
			var content = $('#content').val();
			$('#content').val('');
			$('#content').focus();
			
			if(id === '?'){ //����ǥ -> �ƽ�Ű�ڵ�� ��ȯ
				id = '0x3F';
			}
			/*
			escape() <> unescape()
			encodeURI() : ���ͳ� �ּҿ��� ����ϴ� :, ;, /, =, ?, & ���� �����ϰ� ���ڵ�
			encodeURIComponent() : ��� ���ڸ� ���ڵ�
			decodeURI() : encodeURI()�� ���ڵ��� ���ڿ��� ���ڵ�
			decodeURIComponent() : encodeURIComponent()�� ���ڵ��� ���ڿ��� ���ڵ�
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