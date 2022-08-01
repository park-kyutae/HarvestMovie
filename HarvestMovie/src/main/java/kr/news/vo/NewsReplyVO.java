package kr.news.vo;

public class NewsReplyVO {
	private int news_re_num;
	private String news_re_content;
	private String news_re_date;
	private String news_re_modifydate;
	private int news_num;//부모글 번호
	private int mem_num;//회원번호(작성자)
	private String id;//아이디(작성자)
	
	public int getNews_re_num() {
		return news_re_num;
	}
	public void setNews_re_num(int news_re_num) {
		this.news_re_num = news_re_num;
	}
	public String getNews_re_content() {
		return news_re_content;
	}
	public void setNews_re_content(String news_re_content) {
		this.news_re_content = news_re_content;
	}
	public String getNews_re_date() {
		return news_re_date;
	}
	public void setNews_re_date(String news_re_date) {
		this.news_re_date = news_re_date;
	}
	public String getNews_re_modifydate() {
		return news_re_modifydate;
	}
	public void setNews_re_modifydate(String news_re_modifydate) {
		this.news_re_modifydate = news_re_modifydate;
	}
	public int getNews_num() {
		return news_num;
	}
	public void setNews_num(int news_num) {
		this.news_num = news_num;
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
}
