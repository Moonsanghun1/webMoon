package com.web.board.vo;

public class BoardVO {
	private Long no;
	private String title;
	private String content;
	private String writer;
	private String writeDate;
	private Long hit;
	private Long pw;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	public Long getPw() {
		return pw;
	}
	public void setPw(Long pw) {
		this.pw = pw;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", writeDate="
				+ writeDate + ", hit=" + hit + ", pw=" + pw + "]";
	}
	
}
