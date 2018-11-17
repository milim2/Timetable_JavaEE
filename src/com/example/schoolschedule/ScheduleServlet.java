package com.example.schoolschedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScheduleServlet extends HttpServlet {

	private String title;
	private int starttime;
	private int endtime;
	private String[] days; // 1course offered multiple DAYS
	
	private SchoolSchedule schedule;	
	private SchoolClass clazz; // class is JAVA reserved word
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		
		title = req.getParameter("title");
		starttime =  Integer.parseInt(req.getParameter("starttime"));
		endtime = Integer.parseInt(req.getParameter("endtime"));
		days =  req.getParameterValues("day"); // multiple days
		
		
		schedule = (SchoolSchedule)req.getSession(true)
										.getAttribute("schoolschedule");
		// IF NO SCHEDULE exists ---> CREATE A NEW SCHEDULE
		if(schedule == null) {
			schedule = new SchoolSchedule();
		}
		
		
		// FOR ALL DAYS OF THE WEEK + DAYS OF CLASSES of the SCHEDULE
		if(days != null) {
			for (int i=0; i < days.length; i++) {
				
				String dayString = days[i]; //individual days
				int day;
				
				if(dayString.equalsIgnoreCase("SUN")) day = 0;
				else if(dayString.equalsIgnoreCase("MON")) day = 1;
				else if(dayString.equalsIgnoreCase("TUE")) day = 2;
				else if(dayString.equalsIgnoreCase("WED")) day = 3;
				else if(dayString.equalsIgnoreCase("THU")) day = 4;
				else if(dayString.equalsIgnoreCase("FRI")) day = 5;
				else day =  6;
				
				
				clazz = new SchoolClass(title, starttime, endtime,day);
				schedule.addClass(clazz);
			}
		}
		
		
		// STUDENT/USER can CHANGE HIS SCHEDULE
		req.getSession().setAttribute("schoolschedule", schedule);
		RequestDispatcher rd = req.getRequestDispatcher("schedule.jsp");
		rd.forward(req, resp);
				
	}	

}
