<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>Insert title here</title>
	</head>
	<style>
		
	</style>
	<body>
		<form>
			대화명 : <input type="text" id="nick"/>
			<br/>
			메시지창 : <textarea rows="10" cols="20" id="monitor"></textarea>
			<br/>
			메시지 입력 : <input type="text" id="msg"/>
			<input type="button" value="전송" onclick="sendMsg()"/>
			<br/>
			<input type="button" value="나가기" onclick="DisConn()"/>
		</form>
	</body>
	<script>
		//서버 접속
		var url = "ws://localhost/main/websocket";
		var ws = new WebSocket(url);
		
		//웹소켓 연결
		ws.onopen = function(e){
			console.log(e);
			$("#monitor").val("웹소켓에 연결 되었습니다.\n");
		};
		
		//웹소켓 끊김
		ws.onclose = function(e){
			console.log(e);
			$("#monitor").val("웹소켓 끊겼습니다.\n");
		};
		
		//서버로부터 메시지 수신
		ws.onmessage = function(e){
			console.log(e);
			$("#monitor").val(e.data);
		};
		
		//서버로 메시지 전송
		function sendMsg(){
			ws.send($("#msg").val());
		}
		
		//접속을 완전 끊음
		function DisConn(){
			ws.close();
		}
		
	</script>
</html>