<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<img src="images/pic9.jpg"><a href="CartController?source=buy&itemid=1">buynow</a>
<img src="images/pic9.jpg"><a href="CartController?source=buy&itemid=2">buynow</a>
<img src="images/pic9.jpg"><a href="CartController?source=buy&itemid=3">buynow</a>
<img src="images/pic9.jpg"><a href="CartController?source=buy&itemid=4">buynow</a>
<% String name= (String)session.getAttribute("email"); %>
<%=name %>

</body>
</html>