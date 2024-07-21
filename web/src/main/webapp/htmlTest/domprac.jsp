<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dom 연습</title>
   
<script type="text/javascript">

function cal(sym) {
		
	let num_1 = document.getElementById("num1").value;
	let num_2 = document.getElementById("num2").value;
	//alert(num_2);
	
	switch(sym){
	
	case "+" :
		alert(num_1 + num_2 );
		
	
	
	}

}


</script>
   
</head>
<body>

<input id = "num1">
<input id = "num2">

<button onclick ="cal('+')">+</button>
<button onclick ="cal('-')">-</button>
<button onclick ="cal('*')">*</button>
<button onclick ="cal('/')">/</button>
<button onclick ="cal('%')">%</button>
   



</body>
</html>
