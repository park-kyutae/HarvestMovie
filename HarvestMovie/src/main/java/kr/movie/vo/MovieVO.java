package kr.movie.vo;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

public class MovieVO {
	//info
	private int mv_num;
	private String mv_title;
	//detail
	private String mv_genre;
	private String mv_runningtime;
	private int mv_limit_age;
	private String mv_location;
	private String mv_summary;
	private String mv_main_pic;
	private Date mv_launch_date;
	private String mv_poster;
	//영화 평점
	private float mv_rating;
	//영화 스태프
	private HashMap<Integer, List<String>> mv_staff_info = new HashMap<>();
	//영화 트레일러
	private List<String> mv_trailer;
	//영화 사진
	private List<String> mv_pic;
	//영화 보고싶어요
	private boolean mv_will_watch_flag;

	public float getAvg_rating() {
		return avg_rating;
	}

	public void setAvg_rating(float avg_rating) {
		this.avg_rating = avg_rating;
	}

	private float avg_rating;



	public int getMv_num() {
		return mv_num;
	}

	public void setMv_num(int mv_num) {
		this.mv_num = mv_num;
	}

	public String getMv_title() {
		return mv_title;
	}

	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}

	public String getMv_genre() {
		return mv_genre;
	}

	public void setMv_genre(String mv_genre) {
		this.mv_genre = mv_genre;
	}

	public String getMv_runningtime() {
		return mv_runningtime;
	}

	public void setMv_runningtime(String mv_runningtime) {
		this.mv_runningtime = mv_runningtime;
	}

	public int getMv_limit_age() {
		return mv_limit_age;
	}

	public void setMv_limit_age(int mv_limit_age) {
		this.mv_limit_age = mv_limit_age;
	}

	public String getMv_location() {
		return mv_location;
	}

	public void setMv_location(String mv_location) {
		this.mv_location = mv_location;
	}

	public String getMv_summary() {
		return mv_summary;
	}

	public void setMv_summary(String mv_summary) {
		this.mv_summary = mv_summary;
	}

	public String getMv_main_pic() {
		return mv_main_pic;
	}

	public void setMv_main_pic(String mv_main_pic) {
		this.mv_main_pic = mv_main_pic;
	}

	public Date getMv_launch_date() {
		return mv_launch_date;
	}

	public void setMv_launch_date(Date mv_launch_date) {
		this.mv_launch_date = mv_launch_date;
	}

	public String getMv_poster() {
		return mv_poster;
	}

	public void setMv_poster(String mv_poster) {
		this.mv_poster = mv_poster;
	}

	public float getMv_rating() {
		return mv_rating;
	}

	public void setMv_rating(float mv_rating) {
		this.mv_rating = mv_rating;
	}


	public HashMap<Integer, List<String>> getMv_staff_info() {
		return mv_staff_info;
	}

	public void setMv_staff_info(HashMap<Integer, List<String>> mv_staff_info) {
		this.mv_staff_info = mv_staff_info;
	}

	public List<String> getMv_trailer() {
		return mv_trailer;
	}

	public void setMv_trailer(List<String> mv_trailer) {
		this.mv_trailer = mv_trailer;
	}

	public List<String> getMv_pic() {
		return mv_pic;
	}

	public void setMv_pic(List<String> mv_pic) {
		this.mv_pic = mv_pic;
	}

	public boolean isMv_will_watch_flag() {
		return mv_will_watch_flag;
	}

	public void setMv_will_watch_flag(boolean mv_will_watch_flag) {
		this.mv_will_watch_flag = mv_will_watch_flag;
	}
}
