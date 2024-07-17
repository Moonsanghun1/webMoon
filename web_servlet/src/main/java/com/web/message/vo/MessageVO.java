package com.web.message.vo;

import lombok.Data;

@Data
public class MessageVO {
	//private 변수
	private Long no;
	private String content;
	private String senderId;
	private String senderName;
	private String sendDate;
	private String senderPhoto;
	private String accepterId;
	private String accepterName;
	private String acceptDate;
	private String accepterPhoto;
	private int allUser; // 0 - 개인, 1 - 전체 메세지


}
