<%@ page import="DataBase.Cookies" %>
<%@ page import="java.util.Objects" %>
<%@ page import="static Models.UserModel.getUserByPhone" %>
<%@ page import="Models.UserModel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% getUserByPhone(String.valueOf((Objects.requireNonNull(Cookies.getCookieByName(request, "user"))).getValue()));%>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/user.css">
    <title>Sport club</title>
</head>
<body style="background-image: url(img/5.png);">
<div class="topnav">
    <a href="index.jsp">Home</a>
    <% if (Cookies.getCookieByName(request,"user") != null) {%>
    <a href="trainings.jsp">Trainings</a>
    <a href="info_hall.jsp">Halls</a>
    <a href="user.jsp">User</a>
    <form style="display:inline" action="LogOut">
        <button class="button_log" type="submit" action="LogOut">Log Out</button>
    </form>
    <%} else {%>
    <a href="log_in.jsp">Log In</a>
    <a href="sign_up.jsp">Sign Up</a>
    <% }; %>
    <div id="google_translate_element" style="float:right"></div>

    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
        }
    </script>

    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</div>
<div class="container">
    <div class="info-container">
    <h2>Name: <%= UserModel.getFName()+" "+UserModel.getLName() %></h2>
        <h3>Phone: <%=UserModel.getPhone() %></h3>
        <h3>Email: <%=UserModel.getEmail() %></h3>
        <h3>Info: <%=UserModel.getInfo() %></h3>
    </div>
</div>
</body>
</html>
