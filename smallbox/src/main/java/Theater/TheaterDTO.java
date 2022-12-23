package Theater;

import java.sql.Date;
import java.sql.Time;

public class TheaterDTO {
	
	private int theater_idx;
	private String theater_title;
	private Date theater_date;
	private Time theater_time;
	private int theater_reserved;
	private int theater_seat;
	
	public int getTheater_idx() {
		return theater_idx;
	}
	public void setTheater_idx(int theater_idx) {
		this.theater_idx = theater_idx;
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
	public int getTheater_reserved() {
		return theater_reserved;
	}
	public void setTheater_reserved(int theater_reserved) {
		this.theater_reserved = theater_reserved;
	}
	public int getTheater_seat() {
		return theater_seat;
	}
	public void setTheater_seat(int theater_seat) {
		this.theater_seat = theater_seat;
	}
	
	@Override
	public String toString() {
		return "TheaterDTO [theater_idx=" + theater_idx + ", theater_title=" + theater_title + ", theater_date="
				+ theater_date + ", theater_time=" + theater_time + ", theater_reserved=" + theater_reserved
				+ ", theater_seat=" + theater_seat + "]";
	}
	
	
}
