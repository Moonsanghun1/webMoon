/**
 *  main에서 사용되는 js
 */

 $(function(){
	$(".dataRow").click(function(){
		let no = $(this).find(".no").text();
		console.log("no= " + no)
		// 어떤 모듈을 클릭했는지 알아내 보자.
		if($(this).hasClass("board")){
			//alert("일반 게시판 클릭")
			location = "/board/view.do?no=" + no + "&inc=1";
		}else if($(this).hasClass("image")){
			//alert("이미지 게시판 클릭")
			location = "/image/view.do?no=" + no;
			
		}else if($(this).hasClass("notice")){
			//alert("공지사항 게시판 클릭")
			location = "/notice/view.do?no=" + no;
		}
	});
 });