<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Ez Pass Web Application</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/content.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
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
                    <a href='${pageContext.request.contextPath}/Profile'id = "active-link">Profile</a>
                    <a href='${pageContext.request.contextPath}/Vehicle'>Vehicle</a>
                    <a href='${pageContext.request.contextPath}/EzTag'>EzTags</a>
                    <a href='${pageContext.request.contextPath}/PayTolls'>Pay Tolls</a>
                    <a href='${pageContext.request.contextPath}/Transactions'>Transactions</a>   
                </nav>
                <main> 
                    <h1 align ="center">Change Password</h1>
                    <form name="ChangePassword" action="${pageContext.request.contextPath}/ChangePasswordControl" method="post"> 
                        <label for="Username">Username: </label>
                        <input type="text" name="Username" value="<%=(String) session.getAttribute("Username")%>" readonly><br>
                        <label for="Old">Old Password: </label>
                        <input type="password" name="Old"><br>
                        <label for="New">New Password: </label>
                        <input type="password" name="New"><br>
                        <label for="New1">New Password(re-enter): </label>
                        <input type="password" name="New1"><br>
                        <input type="button" value="Change Password" onClick="checkInputs()">
                        <input type="reset" value="Reset">
                    </form>
                    <% if (request.getAttribute("message") != null) {%>
                    <div id="message"><%=request.getAttribute("message")%></div>    
                    <%}%>
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
                Old = document.ChangePassword.Old.value;
                New = document.ChangePassword.New.value;
                New1 = document.ChangePassword.New1.value;
                if (Old == "" || New == "" || New1 == "") {
                    window.alert("One or more fields are empty! Please fill out all information!");
                } else if (New != New1) {
                    window.alert("Error: Unmatched new password!");
                } else {
                    document.ChangePassword.submit();
                }
            }

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


