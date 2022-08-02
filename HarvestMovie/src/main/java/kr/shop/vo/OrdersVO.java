package kr.shop.vo;

import java.sql.Date;

public class OrdersVO {
	private int ord_num;
	private int mem_num;
	private int pd_num;
	private Date ord_regdate;
	private int ord_quantity;
	
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getPd_num() {
		return pd_num;
	}
	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}
	public Date getOrd_regdate() {
		return ord_regdate;
	}
	public void setOrd_regdate(Date ord_regdate) {
		this.ord_regdate = ord_regdate;
	}
	public int getOrd_quantity() {
		return ord_quantity;
	}
	public void setOrd_quantity(int ord_quantity) {
		this.ord_quantity = ord_quantity;
	}
	
	
}
