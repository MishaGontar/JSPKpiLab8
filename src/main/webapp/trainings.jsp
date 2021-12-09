<%@ page import="DataBase.Cookies" %>
<%@ page import="Models.UserModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/trains.css">
    <title>Sport club</title>
</head>
<%
 String phone = Cookies.getCookieByName(request,"user").getValue();
 UserModel u = UserModel.getUserByPhone(phone);
%>
<body style="background-image: url(img/4.png);">
<div class="topnav">
    <a href="index.jsp" >Home</a>
    <% if (Cookies.getCookieByName(request,"user") != null) {%>

    <a href="trainingController">Trainings</a>
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

<div style="margin: 20px 0 ;">
<div class="container">
    <table class="trainings_table">
        <tr class="tr" style="color: white;">
            <th class="th">Name</th>
            <th class="th">Hall</th>
            <th class="th">Trainer</th>
            <th class="th">Date</th>
            <th class="th">Duration</th>
            <th class="th">Quantity</th>
            <th class="th">Price</th>
            <% if (u.getRole()<=2){%>
            <th class="th">Delete</th>
            <%}%>
            <th class="th">Buy</th>
        </tr>
        <c:forEach var="par" items="${lesson}">
          <form action="" method="post">
            <tr class="tr" style="color: white;">
                <td>${par.id}</td>
                <td>${par.hall_id}</td>
                <td>${par.trainer_id}</td>
                <td>${par.dateOfLesson}</td>
                <td>${par.duration}</td>
                <td>${par.quantity}</td>
                <td>${par.id}</td>
                <td>
                <% if (u.getRole()<=2){%>
                <form action="" method="post">
                    <button class="button_del" type="submit" action="delete">Delete</button>
                </form>
                <%}%></td>
                <td>
                    <input hidden value="${par.id}" name ="lesson">
                    <button type="submit" class="button_trainings">Buy</button></td>
            </tr>

            </form>
        </c:forEach>
    </table>
</div>
</div>
</body>
</html>
