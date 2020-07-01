<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <title>Ez Pass Web Application</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/content.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="Jason Chan">
        <meta name="description" content="Web implementation of the EzPassApplication">
        <link href="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script>
            $(function () {
                $("#accordion").accordion();
            });
        </script> 
    </head>
    <body>
        <div id="wrapper">
            <header>Ez Pass Web Application</header>

            <div id ="content-wrapper">
                
                <nav>
                    <div id = "navtitle">Website Directories</div>
                    <a href = "${pageContext.request.contextPath}/index">Login</a>
                    <a href = "${pageContext.request.contextPath}/SignUp">Sign Up</a>
                    <a href = "${pageContext.request.contextPath}/faq" id = "active-link">FAQ</a>
                </nav>

                <main> 
                    <h1 align ="center">Frequently Asked Questions</h1>
                    <div id = "accordion">
                        <h2>Why should I get an Ez Pass</h2>
                        <div>Having an Ez Pass makes it more convenient when paying tolls. It makes it faster to pay tolls and if you're doing carpool, it reduces the toll price as well!<br>

                            <div class="imgcontainer">
                                <img src="${pageContext.request.contextPath}/resources/images/ezpassonly.jpg" alt="EzOnlyLogo" class="imgoverlay">
                                <div class="overlay">Make your toll experience easier!</div>
                            </div>
                        </div>
                        <h2>How does this work?</h2>
                        <div>
                            <h3>Steps on how to use the Ez Pass</h3>
                            <ol>
                                <li>Sign up for your account by clicking on the SignUp link in the side bar or <a href = "${pageContext.request.contextPath}/SignUp">click here.</a></li>
                                <li>Login to your account and create your profile.</li>
                                <li>Add your Ez Tag and link a vehicle to that Ez Tag</li>
                                <li>You're all set! Now you can pay tolls using your Ez Pass. <br>
                                    Note: Make sure you remember to recharge your account when the balance is low.</li>
                            </ol>
                        </div>
                        <h2>Question: Why can't I delete my Ez Tag</h2>
                        <div>If the Ez Tag is linked to a vehicle, you must remove the vehicle associated with the tag first before the tag can be deleted. Also, Ez Tags that were used in the past to pay tolls can't be deleted.</div>
                        <h2>Question: Where can I view my account recharge transactions?</h2>
                        <div>You can view those transactions by going to the profile webpage and clicking <a href='${pageContext.request.contextPath}/Recharge'>Recharge Account</a></div>
                        <h2>Question: How can I change my address?</h2>
                        <div>You can call help desk and request a change of address.</div>
                        <h2>What happens if my account balance is low or in the negatives</h2>
                        <div>If your account balance is insufficient, a bill will be sent to your address to pay for the tolls.</div>

                    </div>           
                    <div id = "date"> </div>

                </main>
            </div>

            <footer><small><em>
                        Copyright © 2020 EzPassWebApplication<br>
                        <a href = "mailto:jchanunh@student.fdu.edu">jchanunh@student.fdu.edu</a>
                    </em></small></footer>

        </div>

        <script>
            var d = new Date();
            document.getElementById("date").innerHTML = d;
        </script>
    </body> 
</html>