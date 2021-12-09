<%@ page import="DataBase.Cookies" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/billing.css">
<title>Sport club</title>
</head>
<body style="background-image: url(img/2.png);">
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
    <div class="row">
        <div class="col-75">
            <div class="container1">
                <form action="" method="post">
                    <div class="row">
                        <div class="col-50">
                           <h3>Payment</h3>
                            <label >Accepted Cards</label>
                            <div class="icon-container">
                                <i class="fa fa-cc-visa" style="color:navy;"></i>
                                <i class="fa fa-cc-amex" style="color:blue;"></i>
                                <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                <i class="fa fa-cc-discover" style="color:orange;"></i>
                            </div>
                            <label for="cname">Name on Card</label>
                            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
                            <label for="ccnum">Credit card number</label>
                            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
                            <label for="expmonth">Exp Month</label>
                            <input type="text" id="expmonth" name="expmonth" placeholder="September">

                            <div class="row">
                                <div class="col-50">
                                    <label for="expyear">Exp Year</label>
                                    <input type="text" id="expyear" name="expyear" placeholder="2018">
                                </div>
                                <div class="col-50">
                                    <label for="cvv">CVV</label>
                                    <input type="text" id="cvv" name="cvv" placeholder="352">
                                </div>
                            </div>
                        </div>

                    </div>
                    <label>
                        <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
                    </label>
                    <input type="submit" value="Continue to checkout" class="btn">
                </form>
            </div>
        </div>
        </div>
    </div>
</div>
</body>
</html>
