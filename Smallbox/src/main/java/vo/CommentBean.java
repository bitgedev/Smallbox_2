package vo;

import java.sql.Date;

public class CommentBean {

/*
CREATE TABLE comment (
comment_idx INT PRIMARY KEY, 
movie_idx INT, 
member_id VARCHAR(20), 
comment_star INT, 
comment_content VARCHAR(2000), 
comment_date DATE
);*/	
	
	private int comment_idx;
	private int movie_idx;
	private String member_id;
	private int comment_star;
	private String comment_content;
	private Date comment_date;
	
	
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	public int getMovie_idx() {
		return movie_idx;
	}
	public void setMovie_idx(int movie_idx) {
		this.movie_idx = movie_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getComment_star() {
		return comment_star;
	}
	public void setComment_star(int comment_star) {
		this.comment_star = comment_star;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	
	@Override
	public String toString() {
		return "CommentBean [comment_idx=" + comment_idx + ", movie_idx=" + movie_idx + ", member_id=" + member_id
				+ ", comment_star=" + comment_star + ", comment_content=" + comment_content + ", comment_date="
				+ comment_date + "]";
	}
	
	
}
