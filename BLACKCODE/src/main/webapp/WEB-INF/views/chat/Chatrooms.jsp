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
<div id="ChattingDiv">
	<h1 >Chatting</h1>
	<table id=ChattingRoomList>
		<th>방제목</th>
		<th>RoomID</th>
		<th>SESSION</th>
		<th>BUTTON</th>
		<c:forEach items="${rooms}" var="room">
			<tr>
				<td><a href="join?roomId=${room.roomId }">${room.name }</a> </td>
				<td><a href="join?roomId=${room.roomId }">${room.roomId }</a></td>
				<td><a href="join?roomId=${room.roomId }">${room.sessions }</a></td>
				<td><button name="deleteRoom_roomID" type="button" onclick=deleteRoom("${room.roomId }")>방 삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<h1>채팅방 생성</h1>
		<form>
		<label>방제</label><input type="text" name="username" class="user"><input type="button" id="submit" value="입력">
		</form>
		<br><br>
		<div id="message"></div>
</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function deleteRoom(roomId) {
	data = {roomId : roomId}
	$.ajax({
		type:'post',					//post 방식으로 전송
		url:'/chat/delete',				//데이터를 주고받을 파일 주소
		data:data,					//위의 변수에 담긴 데이터를 전송해준다.
		dataType:'json',				//html 파일 형식으로 값을 담아온다.
		success : function(roomId){	//파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
			console.log(roomId)
			$("#ChattingDiv").load("${contextPath}/chat/rooms")
		}
	});
}

$(document).ready(function(){
	$('#submit').click(function(){   //submit 버튼을 클릭하였을 때
		let sendData = "username="+$('button[name=username]').val();   //폼의 이름 값을 변수 안에 담아줌
		
		data = {
				name : $('input[name=username]').val()
		}
		
		$.ajax({
			type:'post',				//post 방식으로 전송
			url:'/chat',				//데이터를 주고받을 파일 주소
			data:data,					//위의 변수에 담긴 데이터를 전송해준다.
			dataType:'json',			//html 파일 형식으로 값을 담아온다.
			success : function(data){	//파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				console.log(data)
				$('#ChattingRoomList').append(
					'<tr>'
						+'<td><a href="join?roomId='+data.roomId+'">'+data.name+'</a></td>'
						+'<td><a href="join?roomId='+data.roomId+'">'+data.roomId+'</a></td>'
						+'<td><a href="join?roomId='+data.roomId+'">'+data.sessions+'</a></td>'
						+'<td><button name="deleteRoom_roomID" type="button" onclick=deleteRoom("'+data.roomId+'")>방 삭제</button></td>'
					+'</tr>'		
				)
			}
		});
	});
});
</script>

</body>
</html>