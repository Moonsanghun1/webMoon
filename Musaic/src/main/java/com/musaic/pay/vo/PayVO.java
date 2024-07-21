package com.musaic.pay.vo;

import lombok.Data;

@Data
public class PayVO {

	// private 변수
	private Long payNo; //결제 번호
	private String memberId; //회원정보 이건 다시 확인
	private String address; //결제 주소
	private String name; //결제 이름
	private String phone; //결제 연락처
	private String meansPayNo; //결제 수단
	private String status; //상태
	private String cancel; //취소 사유
	private String payToday; //구매한 날짜
	private Long cart_no; //장바구니 번호
//--------------(결제 관리)----------------------
	private String cardType; // 신용카드 종류
	private String cardNum; // 신용카드 번호
	private String payTel; // 전화번호
	private String bankType; // 은행 종류
	private String bankNum; // 계좌 번호
	
}
