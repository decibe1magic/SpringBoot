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
<h1>Chatting ${room.roomId}</h1>
<div id="_chatbox">
	<fieldset>
		<div id="messageWindow"></div>
		<br /> 
			<input name="sender" type="text"/>
			<input id="message" name="message" type="text" onkeyup="enterkey()" />
			<input name="roomId" type="hidden" value="${room.roomId}"/>
		<input type="submit" value="send" onclick="send()" />
	</fieldset>
</div>

<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://<%=request.getServerName() %>:8080/ws');
	var message = document.getElementById('message');
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	
	console.log(webSocket)
	function onMessage(event) {
		var message = event.data
		var sender = message.substring(message.indexOf("sender")+9,message.indexOf("message")-3)
		var content = message.slice(message.indexOf("message")+10,-2)
		if (content == "") {

		} else {
			if (content.match("/")) {
				if (content.match(("/" + $("#sender").val()))) {
					var temp = content.replace("/" + $("#sender").val(),
							"(귓속말) :").split(":");
					if (temp[1].trim() == "") {
					} else {
						$("#messageWindow").html(
								$("#messageWindow").html()
										+ "<p class='whisper'>"
										+ sender
										+ content.replace("/"
												+ $("#sender").val(),
												"(귓속말) :") + "</p>");
					}
				} else {
				}
			} else {
				if (content.match("!")) {
					$("#messageWindow")
							.html(
									$("#messageWindow").html()
											+ "<p class='chat_content'><b class='impress'>"
											+ sender + " : " + content
											+ "</b></p>");
				} else {
					$("#messageWindow").html(
							$("#messageWindow").html()
									+ "<p class='chat_content'>" + sender
									+ " : " + content + "</p>");
				}
			}
		}
	}
	
	function onOpen(event) {
		$("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
	}
	
	function onError(event) {
		alert(event.data);
	}
	
	function send() {
		
		if (message.value == "" | message.value == null) {
		} else {
			$("#messageWindow").html(
					$("#messageWindow").html() + "<p class='chat_content'>나 : "
							+ message.value + "</p>");
		}
		//webSocket.send($("#sender").val() + "|" + message.value);
		data={
				"type"   :"TALK",
				"roomId" :$('input[name=roomId]').val(),
				"sender" :$('input[name=sender]').val(),
				"message":$('input[name=message]').val()
			}
		console.log(data)
		webSocket.send(JSON.stringify(data));
		message.value = "";
	}
	//     엔터키를 통해 send함
	function enterkey() {
		if (window.event.keyCode == 13) {
			send();
		}
	}
	//     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	window.setInterval(function() {
		var elem = document.getElementById('messageWindow');
		elem.scrollTop = elem.scrollHeight;
	}, 0);
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</body>
</html>