<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<link rel="stylesheet" href="/resources/css/admin.css" />
<style type="text/css">
a {
	text-decoration: none;
}
</style>
</head>
<body>
	<h4>${msg }</h4>
	<div class="container">
		<form action="/admin/loginAction" method="POST" onsubmit="return checkInput();">
			<div>
			<label for="mngrId"><b>MANAGER ID</b></label> <input type="text"
				placeholder="Enter Username" name="mngrId"> 
			</div>
			
			<div>
				<label for="password"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="pwd" />
			
			</div>



			<button type="submit">Login</button>
		</form>
	</div>
	<script type="text/javascript">
		function checkInput() {
			let inputArr = document.getElementsByTagName("input");
			const idFld = inputArr[0];
			const pwdFld = inputArr[1];
			if (idFld.value == "") {
				alert(idFld.name + " is empty")
				return false;
			}
			if (pwdFld.value == "") {
				alert(pwdFld.name + " is empty")
				return false;
			}
			return true;
		}
	</script>
</body>
</html>


