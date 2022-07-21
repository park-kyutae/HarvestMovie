package kr.news.vo;

import java.sql.Date;

public class NewsVO {
	private int news_num;
	private String news_title;
	private String news_content;
	private int news_hit;
	private Date news_date;
	private Date news_modifydate;
	private String news_photo;
	private int news_like;
	private int mem_num;
	
	
	private String id;//회원 아이디 읽어올 예정
	private String mem_photo;//회원 프로필 사진 읽어올 예정
	
	public int getNews_num() {
		return news_num;
	}
	public void setNews_num(int news_num) {
		this.news_num = news_num;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public int getNews_hit() {
		return news_hit;
	}
	public void setNews_hit(int news_hit) {
		this.news_hit = news_hit;
	}
	public Date getNews_date() {
		return news_date;
	}
	public void setNews_date(Date news_date) {
		this.news_date = news_date;
	}
	public Date getNews_modifydate() {
		return news_modifydate;
	}
	public void setNews_modifydate(Date news_modifydate) {
		this.news_modifydate = news_modifydate;
	}
	public String getNews_photo() {
		return news_photo;
	}
	public void setNews_photo(String news_photo) {
		this.news_photo = news_photo;
	}
	public int getNews_like() {
		return news_like;
	}
	public void setNews_like(int news_like) {
		this.news_like = news_like;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}
	
	
}
