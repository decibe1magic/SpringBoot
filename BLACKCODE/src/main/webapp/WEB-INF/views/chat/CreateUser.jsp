<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Create User</h1>
	<form>
	<label>방제</label>
	<input type="text" name="username" class="user">   //이름을 입력하는 text 상자
	<input type="button" id="submit" value="입력">   //버튼을 누르면 스크립트 실행
	</form>
	<br><br>
	<div id="message"></div>
	
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

/* {
    "type":"ENTER",
    "roomId":"<기록해둔 roomId 입력>",
    "sender":"<참가자 ID>",
    "message":"<채팅할때만 message 입력>"
} */

$(document).ready(function(){
	$('#submit').click(function(){   //submit 버튼을 클릭하였을 때
		let sendData = "username="+$('input[name=username]').val();   //폼의 이름 값을 변수 안에 담아줌
		
		data = {
				name : $('input[name=username]').val()
				"type":"ENTER",
				"roomId":"<기록해둔 roomId 입력>",
				"sender":"<참가자 ID>",
				"message":""
		}
		
		$.ajax({
			type:'post',		//post 방식으로 전송
			url:'ws://127.0.0.1:8080/ws',		//데이터를 주고받을 파일 주소
			data:data,			//위의 변수에 담긴 데이터를 전송해준다.
			dataType:'json',	//html 파일 형식으로 값을 담아온다.
			success : function(data){		//파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#message').html(data);	//현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		});
	});
});
</body>
</html>