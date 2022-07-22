package kr.movie.review.vo;

public class ReviewVO {
    private int review_num;
    private int mv_num;
    private int mem_num;
    private String mem_id;
    private String review_message;

    public int getReview_num() {
        return review_num;
    }

    public void setReview_num(int review_num) {
        this.review_num = review_num;
    }

    public int getMv_num() {
        return mv_num;
    }

    public void setMv_num(int mv_num) {
        this.mv_num = mv_num;
    }

    public int getMem_num() {
        return mem_num;
    }

    public void setMem_num(int mem_num) {
        this.mem_num = mem_num;
    }

    public String getMem_id() {
        return mem_id;
    }

    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }

    public String getReview_message() {
        return review_message;
    }

    public void setReview_message(String review_message) {
        this.review_message = review_message;
    }
}
