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
		ul{
			display: none;
		}
	</style>
	<body>
		<b>${profile.user_id}</b><div id="toggle">...</div>
		<ul>
			<li>거래 현황</li>
			<li>구매 후기</li>
			<li>로그아웃</li>
		</ul>
		<br/>
		팔로우 수: ${profile.follow_num }             팔로워 수: ${profile.follower_num }
		<br/><h3><b>${profile.user_name }</b></h3>
		<br/><button onclick="profileModify?id=${profile.user_id}">프로필 수정</button>
		<br/><button onclick="#">글쓰기</button>
	</body>
	<script>
		$("#toggle").click(function(e){
			console.log(e);
			if($("ul").css("display") == "none"){
				$("ul").show();
			}else{
				$("ul").hide();
			}
		});
	</script>
</html>