package kr.event.vo;

import java.sql.Date;

public class EventVO {
	private int event_board_num;
	private String event_title;
	private String event_content;
	private int event_hit;
	private Date event_reg_date;
	private Date event_modify_date;
	private String event_filename;
	private String event_ip;
	private int mem_num;
	
	private String id;//회원 아이디
	private String photo;//회원 프로필 사진
	
	public int getEvent_board_num() {
		return event_board_num;
	}
	public void setEvent_board_num(int event_board_num) {
		this.event_board_num = event_board_num;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public int getEvent_hit() {
		return event_hit;
	}
	public void setEvent_hit(int event_hit) {
		this.event_hit = event_hit;
	}
	public Date getEvent_reg_date() {
		return event_reg_date;
	}
	public void setEvent_reg_date(Date event_reg_date) {
		this.event_reg_date = event_reg_date;
	}
	public Date getEvent_modify_date() {
		return event_modify_date;
	}
	public void setEvent_modify_date(Date event_modify_date) {
		this.event_modify_date = event_modify_date;
	}
	public String getEvent_filename() {
		return event_filename;
	}
	public void setEvent_filename(String event_filename) {
		this.event_filename = event_filename;
	}
	public String getEvent_ip() {
		return event_ip;
	}
	public void setEvent_ip(String event_ip) {
		this.event_ip = event_ip;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
