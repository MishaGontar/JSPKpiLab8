<%@ page import="DataBase.Cookies" %><%--
  Created by IntelliJ IDEA.
  User: Bohdan
  Date: 09.12.2021
  Time: 6:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/trains.css">
    <title>Sport club</title>
</head>
<body style="background-image: url(img/4.png);">
<div class="topnav">
    <a href="index.jsp">Home</a>
    <% if (Cookies.getCookieByName(request,"user") != null) {%>

    <a href="trainings.jsp">Trainings</a>
    <a href="info_hall.jsp">Halls</a>
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

<div style="margin: 20px 0 ;">
<div class="container">
    <form method="post">
    <table class="trainings_table">
        <tr class="tr" style="color: white;">
            <th class="th">Name</th>
            <th class="th">Hall</th>
            <th class="th">Trainer</th>
            <th class="th">Date</th>
            <th class="th">Duration</th>
            <th class="th">Quantity</th>
            <th class="th">Price</th>
            <th class="th">Select</th>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
        <input type="submit" name="Buy" class="button_trainings" value="Buy">
    </form>
</div>
</div>
</body>
</html>
