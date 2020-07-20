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
                    <a href = "${pageContext.request.contextPath}/Admin/UpdateCustomerProfile" id = "active-link">Update Profile</a>
                    <a href = "${pageContext.request.contextPath}/Admin/UpdateCustomerEzTag">Update Tag</a>
                    <a href = "${pageContext.request.contextPath}/Admin/DeleteAccount">Delete account</a>
                    <a href = "${pageContext.request.contextPath}/Admin/Finish">Finish Updates</a>
                    <a href = "${pageContext.request.contextPath}/Logout">Logout</a>                 
                </nav>
                <main> 
                    <h1 align ="center">Update Customer Profile</h1>
                    <form name="UpdateProfile" action="${pageContext.request.contextPath}/UpdateProfileControl" method="post">
                        <label for="CustomerID">Customer ID:</label>
                        <input type="text" name="CustomerID" value="<%=(String) session.getAttribute("AdminCIDInput")%>"readonly><br>
                        <label for="Street">Street:</label>
                        <input type="text" name="Street"><br>
                        <label for="City">City:</label>
                        <input type="text" name="City"><br>
                        <label for="State">State:</label>
                        <input type="text" name="State"><br>                                  
                        <label for="Zip">Zip:</label>
                        <input type="text" name="Zip"><br>
                        <label for="Phone">Phone:</label>
                        <input type="text" name="Phone"><br>
                        <label for="Email">Email:</label>
                        <input type="text" name="Email"><br>  
                        <input type="button" value="Update Profile" onClick="checkInputs()">
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
                Street = document.UpdateProfile.Street.value;
                City = document.UpdateProfile.City.value;
                State = document.UpdateProfile.State.value;
                Zip = document.UpdateProfile.Zip.value;
                Phone = document.UpdateProfile.Phone.value;
                Email = document.UpdateProfile.Email.value;

                if (Phone != "" && Email == "" && Street == "" && City == "" && State == "" && Zip == "") { //update phone
                    document.UpdateProfile.submit();
                } else if (Phone == "" && Email != "" && Street == "" && City == "" && State == "" && Zip == "") { //update email
                    document.UpdateProfile.submit();
                } else if (Phone != "" && Email != "" && Street == "" && City == "" && State == "" && Zip == "") { //update phone and email
                    document.UpdateProfile.submit();
                } else if (Street != "" && City != "" && State != "" && Zip != "" && Phone == "" && Email == "") { //update address
                    document.UpdateProfile.submit();
                } else if (Street != "" && City != "" && State != "" && Zip != "" && Phone != "" && Email == "") { //update address and phone
                    document.UpdateProfile.submit();
                } else if (Street != "" && City != "" && State != "" && Zip != "" && Phone == "" && Email != "") { //update address and email
                    document.UpdateProfile.submit();
                } else if (Street != "" && City != "" && State != "" && Zip != "" && Phone != "" && Email != "") { //update address phone and email
                    document.UpdateProfile.submit();
                } else {
                    window.alert("Please either fill out the address, phone or email that the customer wants to change.");
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
