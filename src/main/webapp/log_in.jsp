<%@ page import="DataBase.Cookies" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/login.css">
    <title>Sport club</title>
</head>
<body style="background-image: url(img/8.jpg);">
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
<div class="container">
    <br>
<form action="LoginController" method="post">

    <div class="container1">
        <h1>Log In</h1>
        <p>Please fill in this form to log in an account.</p>
        <hr>
        <label for="uname"><b>Phone</b></label>
        <input type="text" placeholder="Enter Phone Number" name="phone" required>

        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" required>

        <button type="submit">Login</button>
        <label>
            <input type="checkbox" checked="checked" name="remember"> Remember me
        </label>
    </div>

    <div class="container1">
        <button type="button" class="cancelbtn">Cancel</button>
    </div>
</form>
</div>
</body>
</html>
