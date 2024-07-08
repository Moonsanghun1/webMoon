<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 Error</title>

<style type="text/css">

	#errorDiv>div{
		padding: 10px;
		border-top: 1px dotted #ccc;
	}
	#errorDiv{
		padding: 30px;
	}

</style>

</head>
<body>
<div class = "container">
	<div class="card">
  		<div class="card-header">처리 프로세스 오류(500)</div>
  		<div class="card-body" id = "errorDiv">
  			<div>
  			<i class="fa fa-exclamation-circle" style="font-size:100px;color:red"></i>
  			</div>
  			<div class = "row">
  				<div class= "col-md-3" ><i class="fa fa-check"></i>오류객체</div>
  				<div class= "col-md-9" >${e.getClass().simpleName }</div>
  			</div>
  			<div class = "row">
  				<div class= "col-md-3" ><i class="fa fa-check"></i>오류 메세지</div>
  				<div class= "col-md-9" >${e.message }</div>
  			</div>
  			<div class = "row">
  				<div class= "col-md-3" ><i class="fa fa-check"></i>조치 사항</div>
  				<div class= "col-md-9" >
  				다시 시도하시오 <br>
  				오류가 계속 발생되면 전산담당자에게 문의하시오
  				</div>
  			</div>
  		</div>
  		<div class="card-footer">
  			<a href="/board/list.do" class="btn btn-primary">일반 게시판으로 가기</a>
  		</div>
  		
	</div>
</div>
</body>
</html>