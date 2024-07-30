package com.musaic.cartalbum.vo;

import lombok.Data;

@Data
public class CartAlbumVO {

	    private Long cartNo;
	    private Long albumNo;
	    private Long newalbumCnt;
	    private String memberid; // member
	    private Long albumCnt;
	    private String title;
	    private String image;
	    private String passNo;
	    private Long price;
}