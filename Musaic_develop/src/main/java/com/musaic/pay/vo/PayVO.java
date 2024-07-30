package com.musaic.pay.vo;

import lombok.Data;

@Data
public class PayVO {

	// private 변수
	private Long payNo; //결제 번호
	private String memberId; //회원 아이디
	private String address; //결제 주소
	private String name; //결제 이름
	private String phone; //결제 연락처
	private Long meansPayNo; //결제 수단
	private String status; //상태
	private String cancel; //취소 사유
	private String payToday; //구매한 날짜
	private Long cart_no; //장바구니 번호
	private String memberName; // 구매자 
//--------------(결제 관리)----------------------
	private String cardBank; // 신용카드 은행
	private String cardType; // 신용카드 종류
	private String cardNum; // 신용카드 번호
	private String phonePay; // 전화번호 결제 방법
	private String payTel; // 전화번호
	private String bankType; // 은행 종류
	private String bankNum; // 계좌 번호
	
	//--------------(장바구니 데이터)----------------------	
	private String cartTitle;  //장바구니 제목
	private String cartImage; //장바구니 이미지
	private int albumCnt; //장바구니 수량
	private Long cartPrice; //총 가격
	private Long price; //가격 원가
	private Long goodsNo; //상품 번호 
}
