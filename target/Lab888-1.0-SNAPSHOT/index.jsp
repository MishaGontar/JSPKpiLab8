<%@ page import="DataBase.Cookies" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <title>Sport club</title>
</head>

<body style="background-image: url(img/1.jpg);">
<div class="topnav">
    <a href="index.jsp">Home</a>
    <% if (Cookies.getCookieByName(request,"user") != null) {%>
    <a href="trainingController">Trainings</a>
    <a href="info_hall.jsp">Halls</a>
    <form style="display:inline" action="LogOut" method="get">
        <button class="button_log" type="submit">Log Out</button>
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


</body>

</html>