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
                    <a href = "${pageContext.request.contextPath}/index" >Login</a>
                    <a href = "${pageContext.request.contextPath}/signup" id = "active-link">Sign Up</a>
                    <a href = "${pageContext.request.contextPath}/faq">FAQ</a>
                </nav>
                <main> 
                    <h1 align ="center">Sign Up</h1>
                    <form name="SignUp" action="${pageContext.request.contextPath}/signup" method ="post"> 
                        <label for="Username">Username: </label>
                        <input type="text" name="Username"><br>
                        <label for="Password">Password: </label>
                        <input type="password" name="Password"><br>
                        <label for="Password1">Re-enter Password: </label>
                        <input type="password" name="Password1"><br>
                        <input type="button" value="Create Account" onClick="checkInputs()">
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
                Username = document.SignUp.Username.value;
                Password = document.SignUp.Password.value;
                Password1 = document.SignUp.Password1.value;
                if (Username == "" || Password == "" || Password1 == "") {
                    if (Username == "")
                        Prompts += "Please enter your username!\n";
                    if (Password == "")
                        Prompts += "Please enter your password!\n";
                    if (Password1 == "")
                        Prompts += "Please re-enter your password!\n";
                    if (Prompts != "")
                        window.alert(Prompts);
                } else if (Password != Password1) {
                    window.alert("Please enter the same password!");
                } else {
                    document.SignUp.submit();
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

