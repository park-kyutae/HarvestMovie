package kr.movie.review.vo;

public class ReviewVO {
    private int review_num;
    private int mv_num;
    private int user_num;
    private String review_message;
    private String mem_name;

    public String getMem_name() {
        return mem_name;
    }

    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    }

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

    public int getUser_num() {
        return user_num;
    }

    public void setUser_num(int user_num) {
        this.user_num = user_num;
    }


    public String getReview_message() {
        return review_message;
    }

    public void setReview_message(String review_message) {
        this.review_message = review_message;
    }
}
