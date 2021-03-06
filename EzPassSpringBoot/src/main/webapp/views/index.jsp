<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
    <head>
        <title>Ez Pass Web Application</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/content.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="Jason Chan">
        <meta name="description" content="Web implementation of the EzPassApplication">
    </head>
    <body>
        <div id="wrapper">
            <header>Ez Pass Web Application</header>
            <div id ="content-wrapper">
                <nav>
                    <div id = "navtitle">Website Directories</div>
                    <a href = "${pageContext.request.contextPath}/index" id = "active-link">Login</a>
                    <a href = "${pageContext.request.contextPath}/signup">Sign Up</a>
                    <a href = "${pageContext.request.contextPath}/faq">FAQ</a>
                </nav>
                <main> 
                    <h1 align ="center">Sign In</h1>
                    <form name="SignIn" action="${pageContext.request.contextPath}/index" method ="post"> 
                        <label for="Username">Username: </label>
                        <input type="text" name="Username"><br>
                        <label for="Password">Password: </label>
                        <input type="password" name="Password"><br>
                        <input type="button" value="Login" onClick="checkInputs()">
                        <input type="reset" value="Reset">
                    </form>
                    <c:if test="${not empty message}">
                    <div id="message">${message}</div>    
                    </c:if>
                    <div id = "date"> </div>
                </main>
            </div>
            <footer><small><em>
                        Copyright � 2020 EzPassWebApplication<br>
                        <a href = "mailto:jchanunh@student.fdu.edu">jchanunh@student.fdu.edu</a>
                    </em></small></footer>
        </div>
        <script>
            function checkInputs()
            {
                var Prompts = "";
                Username = document.SignIn.Username.value;
                Password = document.SignIn.Password.value;

                if (Username == "" || Password == "") {
                    if (Username == "")
                        Prompts += "Please enter your username!\n";
                    if (Password == "")
                        Prompts += "Please enter your password!\n";
                    if (Prompts != "")
                        window.alert(Prompts);
                } else {
                    document.SignIn.submit();
                }
            }
            
            clock();
            setInterval(clock, 1000);
            function clock() {
                var d = new Date();
                var dateString = d.toLocaleDateString();
                var timeString = d.toLocaleTimeString();
                var clockString = "Date and Time: " + dateString + " at " + timeString;
                document.getElementById("date").innerHTML = clockString;
            }
        </script>
    </body> 
</html>