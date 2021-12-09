<%@ page import="DataBase.Cookies" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/signup.css">
    <title>Sport club</title>
</head>
<body style="background-image: url(img/7.jpg);">
<div class="topnav">
    <a href="index.jsp">Home</a>
    <% if (Cookies.getCookieByName(request,"user") != null) {%>
    <a href="trainingController">Trainings</a>
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
    <form action="LoginController" style="border: 3px solid #f1f1f1;color: whitesmoke; background-color: rgba(186,186,186,0.5);" method="get">
        <div class="container1">
            <h1>Sign Up</h1>
            <p>Please fill in this form to create an account.</p>
            <hr>

            <label for="email"><b>Email</b></label>
            <input type="email" placeholder="Enter Email" name="email" required>

            <label for="first_name"><b>First Name</b></label>
            <input type="text" placeholder="Enter First Name" name="first_name" required>

            <label for="last_name"><b>Last Name</b></label>
            <input type="text" placeholder="Enter Last Name" name="last_name" required>

            <label for="phone"><b>Phone</b></label>
            <input type="text" placeholder="Enter Phone" name="phone" required>

            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required>

            <label>
                <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
            </label>

            <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

            <div class="clearfix1">
                <button type="button" class="cancelbtn">Cancel</button>
                <button type="submit" class="signupbtn">Sign Up</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
