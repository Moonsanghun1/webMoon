<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL과 JSTL</title>
</head>
<body>
<form action="12_colorSelect.jsp">
<label for = "color">색상을 선택하세요</label> <br>
<select id = "color" name = "color">
<!-- 보여지는 것 빨강, 넘어가는 데이터는 1 - 보여지는 것과 넘어가는 것이 다르면 value 속성 사용 -->
<option value = "1">빨강</option>
<option value = "2">초록</option>
<option value = "3">파랑</option>
</select>
<input type="submit" value="전송">
</form>
</body>
</html>