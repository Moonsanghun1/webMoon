package com.musaic.music.vo;

import java.util.Date; // Date 타입을 사용하기 위해 추가

import lombok.Data;

@Data
public class MusicVO {
    private Long musicNo;
    private Long albumNo; // 앨범 번호 추가
    private String musicTitle;
    private String musicFile;
    private String musicStatus;
    private String songWriter;
    private String lyricist;
    private String singer;
    private String lyric;
    private Long hit;
    private Date release_Date; // 앨범 발매일 추가
    private String genre; // 앨범 장르 추가
    private String image; // 앨범 이미지 추가
    private String id;
}
