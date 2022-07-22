package kr.shop.vo;

import java.sql.Date;

public class ProductVO {
	private int pd_num;
	private String pd_name;
	private int pd_price;
	private int pd_quantity;
	private String pd_content;
	private String pd_photo;
	private Date pd_regdate;
	
	private int mem_num;

	public int getPd_num() {
		return pd_num;
	}

	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public int getPd_price() {
		return pd_price;
	}

	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}

	public int getPd_quantity() {
		return pd_quantity;
	}

	public void setPd_quantity(int pd_quantity) {
		this.pd_quantity = pd_quantity;
	}

	public String getPd_content() {
		return pd_content;
	}

	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}

	public String getPd_photo() {
		return pd_photo;
	}

	public void setPd_photo(String pd_photo) {
		this.pd_photo = pd_photo;
	}

	public Date getPd_regdate() {
		return pd_regdate;
	}

	public void setPd_regdate(Date pd_regdate) {
		this.pd_regdate = pd_regdate;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	
}
