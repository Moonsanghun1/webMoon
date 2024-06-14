<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>CheckData :<span id="result"></span></p>
<input type="checkbox" name="color" value="red" checked />Red
<input type="checkbox" name="color" value="blue" />Blue
<input type="checkbox" name="color" value="yellow" />Yellow
<input type="button" value="Button" onclick="clickBtn()" /> 
    
<script>
  function clickBtn() {
    // 체크한 데이터를 담을 배열 선언
    const arr = [];
    // Name이 Color인 속성 취득
    const color = document.getElementsByName("color");
    // 취득한 속성 만큼 루프
    for (let i = 0; i < color.length; i++) {
      // 속성중에 체크 된 항목이 있을 경우
      if (color[i].checked == true) {
      	arr.push(color[i].value);
      }
    }
    // 결과를 표시
    document.getElementById("result").textContent = arr;
  }
</script>
</body>
</html>