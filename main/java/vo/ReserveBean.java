package vo;

import java.sql.Date;
import java.sql.Time;

public class ReserveBean {
	private int res_num;
	private Date res_date;
	private Time res_time;
	private String res_seat;
	private String movie_title;
	private String member_id;
	private int theater_idx;
	private int res_pay_type;
	private int res_pay;
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public Time getRes_time() {
		return res_time;
	}
	public void setRes_time(Time res_time) {
		this.res_time = res_time;
	}
	public String getRes_seat() {
		return res_seat;
	}
	public void setRes_seat(String res_seat) {
		this.res_seat = res_seat;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getTheater_idx() {
		return theater_idx;
	}
	public void setTheater_idx(int theater_idx) {
		this.theater_idx = theater_idx;
	}
	public int getRes_pay_type() {
		return res_pay_type;
	}
	public void setRes_pay_type(int res_pay_type) {
		this.res_pay_type = res_pay_type;
	}
	public int getRes_pay() {
		return res_pay;
	}
	public void setRes_pay(int res_pay) {
		this.res_pay = res_pay;
	}
	@Override
	public String toString() {
		return "ReserveBean [res_num=" + res_num + ", res_date=" + res_date + ", res_time=" + res_time + ", res_seat="
				+ res_seat + ", movie_title=" + movie_title + ", member_id=" + member_id + ", theater_idx="
				+ theater_idx + ", res_pay_type=" + res_pay_type + ", res_pay=" + res_pay + "]";
	}
	
}
