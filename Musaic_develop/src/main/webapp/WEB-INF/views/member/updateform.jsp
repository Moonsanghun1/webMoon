<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE FORM</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script>
  $( function() {
	  $( "#datepicker" ).datepicker({
		  minDate: "-150Y", maxDate: "0D", dateFormat:"yy/mm/dd", 
			changeMonth: true, changeYear: true,
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
	    });
	  
	  
	  $("#name").keyup(function(){
		  let name=$(this).val();
		  let reg=/^[가-힣]*$/;
		  if(name.length<2){
			  //길이 조건 미충족
			  $("#checkname").removeClass("alert-success").addClass("alert-danger");
			  $("#checkname").text("이름은 2자 이상 필수 입력해야 합니다.");
		  }else{
			  //길이 조건 충족시 한글 여부 판단
			  if(!reg.test(name)){
				  $("#checkname").removeClass("alert-success").addClass("alert-danger");
				  $("#checkname").text("한글 이름만 입력 가능합니다.");
			  }
			  else{
				  $("#checkname").removeClass("alert-danger").addClass("alert-success");
				  $("#checkname").text("올바른 입력값입니다.");
			  }
		  }
	  });
	  
	  $("#email1, #email2").on("keyup change", function(){
		  let email1=$(this).val();
		  let email2=$("#email2").val();
		  let email=email1+email2;
		  
		  console.log("email: "+email);
		  if(email.length<4){
			  //길이 조건 미충족
			  $("#checkemail").removeClass("alert-success").addClass("alert-danger");
			  $("#checkemail").text("이메일은 4자 이상 필수 입력해야 합니다.");
		  }else{
			  $("#checkemail").load("/ajax/emailCheck.do?email="+email, function(result){
				  if(result.indexOf("이미")>-1){ //중복 이메일인 경우
					  $("#checkemail").removeClass("alert-success").addClass("alert-danger");
				  }else{ //중복 이메일이 아닌 경우
					  $("#checkemail").removeClass("alert-danger").addClass("alert-success");
				  }
			  });
			  //길이 조건 충족시 중복 확인
			  $("#checkemail").removeClass("alert-danger").addClass("alert-success");
			  $("#checkemail").text("올바른 입력값입니다.");
		  }
	  });
	  
	  $("#changepw").click(function(){
		  let id=$("#id").val();
		  location="pwform.do?id="+id;
	  });
	  
	  $("#adrsbtn").click(function(){
		 let adrs1=$(".adrs1").val(); 
		 let adrs2=$(".adrs2").val();
		 let address=adrs1+" "+adrs2;
		 
		 $("#adrs_input").val(address);
	  });
	  
	  $(".modalbtn").click(function(){
		 $("#myModal").find("input").val(""); 
	  });
  });
</script>
<style>
.form-group{
padding-top:6px;
padding-bottom:5px;
}
#teldiv>input{
width:20%;
display:inline;
}
#addressdiv>input{
width:70%;
display:inline;
}
</style>

</head>

<body>
<br>
	<div class="container">
		<h2 style="margin-left:45%"><i class="fa fa-pencil-square-o" style="font-size:30px"></i> 회원정보 수정 </h2>
		<br><br>
		<form action="update.do" method="post">
		<input type="hidden" name="id" value="${vo.id }">
		    <div class="form-group">
		      <label for="id">ID:</label>
		      <input class="form-control" value="${vo.id }" id="id" disabled>
		    </div>
		    <hr>
		    <div class="form-group">
		      <label for="pw">비밀번호:</label>
		      <button type="button" class="btn btn-secondary" id="changepw">비밀번호 변경</button>
		    </div>
			<hr>
		    <div class="form-group">
		      <label for="name">성명:</label>
		      <input class="form-control" value="${vo.name }" name="name" id="name"
		      required autocomplete="off" maxlength="30" pattern="^[가-힣]{3,10}$">
		    </div>
		    <c:if test="${!empty vo.name}">
		    <div id="checkname" class="alert alert-success">
					<i class="fa fa-check"></i> 올바른 입력입니다.
			</div>
			</c:if>
			<hr>
		    <div class="form-group">
		      <label for="birth">생일:</label>
		      <input id="datepicker" name="birth" value="${vo.birth }" autocomplete="off" required>
		    </div>
		    <hr>
		    <div class="form-group">
		      <label for="gender">성별:</label>
		      <div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="gender" value="남성" ${vo.gender.equals('남성')?'checked':'' }>남성
				  </label>
			  </div>
			  <div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="gender" value="여성" ${vo.gender.equals('여성')?'checked':'' }>여성
				  </label>
			  </div>
		    </div>
		    <hr>
		    <div class="form-group">
		      <label for="tel">연락처:</label><br>
		      <div id="teldiv">
			      <input class="form-control" name="tel" autocomplete="off" pattern="^[0-9]{3, 3}$" value="${vo.tel.substring(0, 3) }"> -
			      <input class="form-control" name="tel" autocomplete="off" pattern="^[0-9]{4, 4}$" value="${vo.tel.substring(3, 7) }"> -
			      <input class="form-control" name="tel" autocomplete="off" pattern="^[0-9]{4, 4}$" value="${vo.tel.substring(7) }">
		      </div>
		    </div>
		    <hr>
		    <div class="form-group">
		      <label for="email">email:</label><br>
		      <input class="form-control" name="email" required style="width:50%;display:inline"
		      autocomplete="off" pattern="^[a-zA-Z0-9]{4,50}$" id="email1" value="${vo.email.substring(0, (vo.email.indexOf('@'))) }"
		      >
		      <select class="form-control" name="email" id="email2" style="width:40%;display:inline">
		      	<option value="@musaic.com" ${vo.email.endsWith('@musaic.com')?'selected':''}>@musaic.com</option>
		      	<option value="@naver.com" ${vo.email.endsWith('@naver.com')?'selected':''}>@naver.com</option>
		      	<option value="@nate.com" ${vo.email.endsWith('@nate.com')?'selected':''}>@nate.com</option>
		      	<option value="@gmail.com" ${vo.email.endsWith('@gmail.com')?'selected':''}>@gmail.com</option>
		      </select>
		    </div>
		    <c:if test="${!empty vo.email}">
		    <div id="checkemail" class="alert alert-success">
				<i class="fa fa-check"></i> 올바른 입력입니다.
			</div>
			</c:if>
		    <hr>
		    <div class="form-group">
		      <label for="address">주소:</label><br>
		      <input class="form-control" value="${vo.address }"
		      data-toggle="modal" data-target="#myModal" name="address"
		      style="width:60%;display:inline" id="adrs_input">
		    </div>
		    <br>
		    <div class="float-right">
			    <button class="btn btn-primary">적용</button>
			    <button class="btn btn-secondary" type="reset">초기화</button>
			    <button class="btn btn-danger" onclick="history.back()">취소</button>
		    </div>
		    <br>
	    </form>
	</div>


  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">주소 변경</h4>
          <button type="button" class="close modalbtn" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="form-group" id="addressdiv">
		      <input class="form-control" id="sample6_postcode" placeholder="우편번호">
			  <button type="button" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()">우편번호 찾기</button><br>
			  <input class="form-control adrs1" name="address" id="sample6_address" placeholder="주소"><br>
			  <input class="form-control adrs2" name="address" id="sample6_detailAddress" placeholder="상세주소">
			  <input class="form-control" id="sample6_extraAddress" placeholder="참고항목">
		  </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button class="btn btn-primary modalbtn" id="adrsbtn" data-dismiss="modal">적용</button>
          <button type="button" class="btn btn-secondary modalbtn" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</body>
</html>