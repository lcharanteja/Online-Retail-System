<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bon Appetit</title>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
<table border="2">
<%

ArrayList<ItemBean> itemList=(ArrayList<ItemBean>)request.getAttribute("itemlist");
for(ItemBean ib:itemList)
{
%>

<tr><td><%=ib.getItemId() %></td>
<td><%=ib.getItemName() %></td>
<td><%=ib.getItemPrice() %></td>
<td><%=ib.getItemQuantity() %></td>
<td><%=ib.getItemFlavor() %></td>
<td><%=ib.getCancellationStatus() %>
<td><a href="<%=request.getContextPath()%>/ItemController?source=viewbyid&&itemid=<%=ib.getItemId()%>">view</a></td></tr>
</tr>
<% 
}
%>

</table>
</body>
</html>