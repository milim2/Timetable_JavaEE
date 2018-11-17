package com.example.schoolschedule;

public class SchoolClass {
	
	private String title;
	private int starttime;
	private int endtime;
	private int day;
	
	public SchoolClass(String title, int startTime, int endTime, int day) {
		this.title = title;
		this.starttime = startTime;
		this.endtime = endTime;
		this.day = day;
	}

	public String getTitle() {
		return title;
	}

	public int getStarttime() {
		return starttime;
	}

	public int getEndtime() {
		return endtime;
	}

	public int getDay() {
		return day;
	}
	
	
	
	
	

}
