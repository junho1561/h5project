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
#test{
   color: #4e73df;
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
   width : 65%;
   text-align: center;
   margin: 0px auto;
   height: 500px;
   overflow: scroll;
   border: 2px solid #4e73df;
   border-radius: 10px;
   margin: 0px auto;
   padding-bottom: 10px;
}
#view1{
   position:relative;
   width : 65%;
   text-align: center;
   margin: 0px auto;
   height: 300px;
   overflow: scroll;
   border: 4px solid #4e73df;
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
   border: 2px solid #4e73df;
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
   border: 2px solid #4e73df;
   background-color: white;
}

button2{
   width: 200px;
   height: 30px;
   border-radius: 10px;
   border: 2px solid #4e73df;
   background-color: white;
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

#toast.reveal {
    opacity: 1;
    visibility: visible;
    transform: translate(-50%, 0)
}

.button{
    background-image: url(https://kids.nationalgeographic.com/content/dam/kids/photos/articles/Science/H-P/heart.ngsversion.1396531395268.adapt.1900.1.jpg); 
    background-repeat: no-repeat;  
    background-color: transparent;
    background-size: 20px 20px;  
    border: none;          
    cursor: pointer;       
   width: 20px;
   height: 20px;
}

.con_btn {
   margin: 0px auto;
   text-align: center;
}
body{
   background-image: url('img/test1.png');
   background-size: 100%;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <% request.setCharacterEncoding("UTF-8"); %>
   <% int num = Integer.parseInt(request.getParameter("cnt")); %>
   <input type="hidden" id = "chat_num" value = "<%= num %>">

   <div id="chat-container">
      <br><br><br>
      <h1 id ="test">마음껏 질문하세요!</h1>
      <br><br><br>
      
      <% 
               QuestionDAO dao = new QuestionDAO();
                 ArrayList<QuestionDTO> list = new ArrayList<QuestionDTO>();
                 list = dao.topQ1();
         %>
            
            <div class="card-body">  
              <div class="table-responsive">
            <tbody>
            <table class="table table-bordered" id="view1" width="100%" cellspacing="0">
             <thead>
                    <tr>
                      <th>질문 내용</th> 
                      <th>공감 수  </th>
                    </tr>
                  </thead>
                     <tbody>
                       <tr>
                   <% for (int i = 0; i < list.size(); i++) { %>
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
         <ul id="list"> </ul> 
      </div>
      <br>
      <table>
         <tr>
            <td><input placeholder="내용입력" type="text" id="content"></td>
            <td><button id="btn">입력</button></td>
         </tr>
      </table>
      <div class="con_btn">
         <button id="pop1" onclick="pop1()"> 수업이 너무 빨라요! </button>
         <button id="pop2" onclick="pop2()"> 다시 설명해 주세요! </button>
         <button id="pop3" onclick="pop3()"> 이해가 잘 돼요! </button>
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
            treemodel();
         }
      }
   
 
      function treemodel() {
         $.ajax({
            url : "http://localhost:8000/question/predict",
            type : "post",
            success : function(res) {
               alret("접속성공")
            },
            error : function() {

            }
         });
      }

      function select() {

         //스크롤 최하단
         $('#view').scrollTop($('#view')[0].scrollHeight);
         var chat_num = $('#chat_num').val();
         $
               .ajax({
                  url : "SelectChat?chat_num=" + chat_num,
                  dataType : "json",
                  success : function(result) {
                     $('#list').empty();
                     for (var i = 0; i < result.length; i++) {
                        var chatData = '';

                        if ('${info.nickname}' === result[i].nickname) {
                           chatData = '<li class="me-corpus"><span>'
                                 + result[i].nickname
                                 + '</span><br><form action="addLikes.do" method="post"><button type = "submit" class = "button" id ="button2"></form>'
                                 + result[i].likes
                                 + '</button><p class="corpus">'
                                 + result[i].chat
                                 + '</p><p class="sysdate">'
                                 + result[i].chattime + '</p></li>';
                        } else {
                           chatData = '<li><span>'
                                 + result[i].nickname
                                 + '</span><br><input type = "button" class = "button">'
                                 + result[i].likes
                                 + '</button><p class="corpus">'
                                 + result[i].chat + '</p></li>';
                        }

                        $('#list').prepend(chatData);

                        console.log(result[i].nickname);
                        console.log(result[i].chat);
                        console.log(result[i].likes);
                     }
                  },
                  error : function() {
                     alert('errorS');
                  }
               });

      }

      /* /* 좋아요 */
      /* function like_func(){
      var frm_read = $('#frm_read');
      var boardno = $('#boardno', frm_read).val(); */
      //var mno = $('#mno', frm_read).val();
      //console.log("boardno, mno : " + boardno +","+ mno); */

      function play() {
         //스크롤 최하단
         $('#view').scrollTop($('#view')[0].scrollHeight);

         var nickname = '${info.nickname}';
         var chat = $('#content').val();
         $('#content').val('');
         $('#content').focus();

         if (nickname === '?') { //물음표 -> 아스키코드로 변환
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
            url : "AddChat?chat_num=" + chat_num,
            type : "POST",
            dataType : "json",
            data : "nickname=" + nickname + "&chat=" + chat,
            success : function(result) {

               $('#list').empty();
               for (var i = 0; i < result.length; i++) {
                  $('#list').prepend(
                        '<li><span>' + result[i].nickname
                              + '</span> : ' + result[i].chat
                              + '</li>');
                  //console.log(result[i].nickname);
                  //console.log(result[i].chat);

               }
            },
            error : function() {
               alert('errorA');
            }
         });
      }

      // 수업 상태 버튼 1
      var pop1_count = 0;
      $('#pop1').on('click', function() {

         if (pop1_count < 3) {
            alert('수업이 너무 빨라요!');
            pop1_count++;
         } else {
            alert('상태 버튼 전송은 세 번만 가능합니다.');
         }
      });

      /* var pop1_count = $('#pop1').val();
      $('#pop1').on('click', function() {
            if (num < 3) {
               $.ajax({
                     url:'AddState.do', //request 보낼 서버의 파일 경로
                     type:'POST', 
                     data:{'pop1':pop1_count}, //보낼 데이터
                     success: function(result) {
                     alert('수업이 너무 빨라요!')                        
                     },
                     error: function() {
                        alert('실패')
                     }
                 })
                 pop1_count++;
            } else {
                  alert('상태 버튼 전송은 세 번만 가능합니다.')
            }
            
      }); */

      // 수업 상태 버튼 2
      var pop2_count = 0;
      $('#pop2').on('click', function() {

         if (pop2_count < 3) {
            alert('다시 설명해 주세요!');
            pop2_count++;
         } else {
            alert('상태 버튼 전송은 세 번만 가능합니다.');
         }
      });

      // 수업 상태 버튼 3
      var pop3_count = 0;
      $('#pop3').on('click', function() {

         if (pop3_count < 3) {
            alert('이해가 잘 돼요!');
            pop3_count++;
         } else {
            alert('상태 버튼 전송은 세 번만 가능합니다.');
         }
      });
   </script>
</body>
</html>