<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
<div class= "container">
<h3>로그인</h3>
<form action="login.do" method="post">
  <div class="form-group">
    <label for="id">id:</label>
    <input type="text" class="form-control" placeholder="Enter id" id="id" autocomplete="true" name= "id" value= "test"> 
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" placeholder="Enter password" id="pw" name= "pw" value= "1111">
  </div>
  
  <button type="submit" class="btn btn-primary">로그인</button>
</form>
</div>
</body>
</html>