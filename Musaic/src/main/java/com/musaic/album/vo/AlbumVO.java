package com.musaic.album.vo;

import lombok.Data;

@Data
public class AlbumVO {
	private Long albumNo; // 앨범 번호
	private Long musicNo; // 음원 번호
	private String title; // 앨범 제목
	private String release_date; // 발매일
	private String artist; // 아티스트
	private String price; // 앨범 가격
	private String genre; // 장르
	private String info; // 앨범 정보(설명)
	private String image; // 앨범 커버
	private String status; // 앨범 상태
	
}
