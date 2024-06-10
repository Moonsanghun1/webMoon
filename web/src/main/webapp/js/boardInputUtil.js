/**
 *  게시판 류의 필요한 처리 메소드
 */

// 입력 데이터가 비어 있는 경우의 메소드
// 비어 있으면 true를 리턴한다.
// 결과가 true이면 페이지 이동을 막기 위해서 추후에 return false를 실행해야 한다.
// isEmpty(객체 이름-선택자, 항목이름){}
function isEmpty(objName, name) {
		// 값을 가져와서 좌우 공백을 제거한다.
		let str = $(objName).val().trim();
		// 공백을 제거한 데이터를 입력 객체에 다시 넣는다.
		$(objName).val(str);
		if(str == ""){
			alert(name + "은(는) 필수 입력 항목입니다.");
			$(objName).focus(); // 커서 위치
			return true; // 비어있음(true)을 리턴한다.
		} 
} // end of isEmpty()

// 길이 제한 메소드
function lengthCheck(objName, name, min, max){
	
}