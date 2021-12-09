<%@ page import="DataBase.Cookies" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%
    if(Cookies.getCookieByName(request,"user") == null) response.sendRedirect(request.getContextPath()+"/RegistrationTest.jsp");
%>
<h1>Hello it`s me</h1>

</body>
</html>