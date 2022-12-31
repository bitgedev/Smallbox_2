package vo;

import java.sql.Date;
import java.sql.Time;

public class SeatStatusBean {

	/*
	 seat_status_idx INT PRIMARY KEY, 
		theater_title VARCHAR(50) NOT NULL, 
		theater_date DATE, 
		theater_time TIME,
		reserved_fst VARCHAR(50) DEFAULT '0, 0, 0, 0, 0, 0, 0, 0', 
		reserved_snd VARCHAR(50) DEFAULT '0, 0, 0, 0, 0, 0, 0, 0', 
		reserved_trd VARCHAR(50) DEFAULT '0, 0, 0, 0, 0, 0, 0, 0', 
		reserved_fth VARCHAR(50) DEFAULT '0, 0, 0, 0, 0, 0, 0, 0'
); 
	 */
	private int seat_status_idx;
	private String theater_title;
	private Date theater_date;
	private Time theater_time;
	private String reserved_fst;
	private String reserved_snd;
	private String reserved_trd;
	private String reserved_fth;
	
	public int getSeat_status_idx() {
		return seat_status_idx;
	}
	public void setSeat_status_idx(int seat_status_idx) {
		this.seat_status_idx = seat_status_idx;
	}
	public String getTheater_title() {
		return theater_title;
	}
	public void setTheater_title(String theater_title) {
		this.theater_title = theater_title;
	}
	public Date getTheater_date() {
		return theater_date;
	}
	public void setTheater_date(Date theater_date) {
		this.theater_date = theater_date;
	}
	public Time getTheater_time() {
		return theater_time;
	}
	public void setTheater_time(Time theater_time) {
		this.theater_time = theater_time;
	}
	public String getReserved_fst() {
		return reserved_fst;
	}
	public void setReserved_fst(String reserved_fst) {
		this.reserved_fst = reserved_fst;
	}
	public String getReserved_snd() {
		return reserved_snd;
	}
	public void setReserved_snd(String reserved_snd) {
		this.reserved_snd = reserved_snd;
	}
	public String getReserved_trd() {
		return reserved_trd;
	}
	public void setReserved_trd(String reserved_trd) {
		this.reserved_trd = reserved_trd;
	}
	public String getReserved_fth() {
		return reserved_fth;
	}
	public void setReserved_fth(String reserved_fth) {
		this.reserved_fth = reserved_fth;
	}
	@Override
	public String toString() {
		return "SeatStatusBean [seat_status_idx=" + seat_status_idx + ", theater_title=" + theater_title
				+ ", theater_date=" + theater_date + ", theater_time=" + theater_time + ", reserved_fst=" + reserved_fst
				+ ", reserved_snd=" + reserved_snd + ", reserved_trd=" + reserved_trd + ", reserved_fth=" + reserved_fth
				+ "]";
	}
	
	
}
