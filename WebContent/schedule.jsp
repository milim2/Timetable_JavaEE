<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="ScheduleServlet" method="post">
	
		Course name: <input type="text" name="title" size="35"><br>
		
		Course time: 
		Sun <input type="checkbox" name="day" value="sun">
		Mon <input type="checkbox" name="day" value="mon">
		Tue <input type="checkbox" name="day" value="tue">
		Wed <input type="checkbox" name="day" value="wed">
		Thu <input type="checkbox" name="day" value="thu">
		Fri <input type="checkbox" name="day" value="fri">
		Sat <input type="checkbox" name="day" value="sat">
		<br>
		<select name="starttime">
			<option value="8">8:00am</option>
			<option value="9">9:00am</option>
			<option value="10">10:00am</option>
			<option value="11">11:00am</option>
			<option value="12">12:00pm</option>
			<option value="13">1:00pm</option>
			<option value="14">2:00pm</option>
			<option value="15">3:00pm</option>
			<option value="16">4:00pm</option>
			<option value="17">5:00pm</option>
			<option value="18">6:00pm</option>
			<option value="19">7:00pm</option>
			<option value="20">8:00pm</option>
			<option value="21">9:00pm</option>
		</select>
		
		<select name="endtime">			
			<option value="9">9:00am</option>
			<option value="10">10:00am</option>
			<option value="11">11:00am</option>
			<option value="12">12:00pm</option>
			<option value="13">1:00pm</option>
			<option value="14">2:00pm</option>
			<option value="15">3:00pm</option>
			<option value="16">4:00pm</option>
			<option value="17">5:00pm</option>
			<option value="18">6:00pm</option>
			<option value="19">7:00pm</option>
			<option value="20">8:00pm</option>
			<option value="21">9:00pm</option>
			<option value="22">10:00am</option>
		</select>
		
		<br><br>
		<input type="submit" name="Submit" value="Add Course">	
		
		<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<th align="center" valign="middle" width="80"></th> 
			<th align="center" valign="middle" width="100">Sunday</th> 
			<th align="center" valign="middle" width="80">Monday</th> 
			<th align="center" valign="middle" width="80">Tuesday</th> 
			<th align="center" valign="middle" width="80">Wednesday</th> 
			<th align="center" valign="middle" width="80">Thursday</th> 
			<th align="center" valign="middle" width="80">Friday</th> 
			<th align="center" valign="middle" width="80">Saturday</th> 
		</tr>
		
		<!--  Outer loop over Class Start Time -->
		<c:forEach begin="8" end="21" step="1" var="time">
			<tr>
			<td align="center" valign="middle" width="80">
			<!--  Display hours on left hand side column -->
				<c:choose>
					<c:when test="${time == 12 }">
					<c:out value="${time }" />:00pm
					</c:when>
					<c:when test="${time > 12 }">
					<c:out value="${time - 12 }" />:00pm
					</c:when>
					<c:otherwise>
						<c:out value="${time }" />:00am
					</c:otherwise>
				</c:choose>
			</td>
			<!--  Inner loop over days of the week -->
			<c:forEach begin="0" end="6" step="1" var="day">
			
			<td align="center" valign="middle" width="100">
			
			<!-- SCHEDULE LOOP : for every class of the schedule  -->
			
			<c:forEach items="${schoolschedule.classes }" var="clazz">
			<c:if test="${clazz.starttime <= time
								&& clazz.endtime > time 
								&& clazz.day == day}">
				<c:out value="${clazz.title }" />
			</c:if>
			
			</c:forEach>
			</td>
		</c:forEach>
		</tr>
		</c:forEach>	
	</tbody>
	</table>		
	</form>



</body>
</html>