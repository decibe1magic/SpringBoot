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
<h1>Chatting</h1>
<c:forEach items="${rooms}" var="room">
	<a href="${room.roomId }">${room.name }</a>
	<a>${room.roomId }</a>
	<a>${room.sessions }</a><br>
	<hr>
</c:forEach>

<h3>채팅방 접속</h3>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	let sendData = "username="+$('input[name=username]').val();   //폼의 이름 값을 변수 안에 담아줌
	$.ajax({
		type: 'post',	//데이터 전송 타입,
		url : '/chat'	//데이터를 주고받을 파일 주소 입력,
		data: 			//보내는 데이터,
		dataType:		//문자형식으로 받기 , 
		success: function(result){
			//작업이 성공적으로 발생했을 경우
		},
		error:function(){  
            //에러가 났을 경우 실행시킬 코드
		}
	})
});
</script>
</body>
</html>