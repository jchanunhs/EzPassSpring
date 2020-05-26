<%@page import="java.util.ArrayList"%>
<%@page import="model.Transaction"%>
<%
    Transaction tran = new Transaction((String) session.getAttribute("CID"));
    String before =(String) request.getAttribute("before");
    String after = (String) request.getAttribute("after");
    ArrayList<String> TID_list = tran.getTransactions(before, after, "TransactionID");
    ArrayList<String> TC_list = tran.getTransactions(before, after, "TagCode");
    ArrayList<String> TD_list = tran.getTransactions(before, after, "TransactionDate");
    ArrayList<String> TT_list = tran.getTransactions(before, after, "TransactionTime");
    ArrayList<String> TP_list = tran.getTransactions(before, after, "TollPlaza");
    ArrayList<String> TLN_list = tran.getTransactions(before, after, "TollLaneNumber");
    ArrayList<String> TA_list = tran.getTransactions(before, after, "TollAmount");
%>

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

            <div class = "flexHorizontal">

                <div>
                    <aside>
                        <div class = "flexVertical">
                            <div class = "links">Website Directories</div>
                            <a href='${pageContext.request.contextPath}/Main'>Profile</a>
                            <a href='${pageContext.request.contextPath}/Vehicle'>Vehicle</a>
                            <a href='${pageContext.request.contextPath}/EzTag'>EzTags</a>
                            <a href='${pageContext.request.contextPath}/PayTolls'>Pay Tolls</a>
                            <a href='${pageContext.request.contextPath}/Transactions'class = "active-link">Transactions</a>
                        </div>
                    </aside>
                </div>

                <div id = "space"> </div>

                <main> 
                    <h1 align ="center">Transactions</h1>

                    <form name="Transaction" action="${pageContext.request.contextPath}/TransactionControl" method="post">
                        <label for="CustomerID">Customer ID:</label>
                        <input type="text" name="CustomerID" value="<%=(String) session.getAttribute("CID")%>"readonly><br>
                        <label for="before">Date from:</label>
                        <input type="text" name="before"><br>
                        <label for="after">Date to:</label>
                        <input type="text" name="after"><br>

                        <input type="button" value="View Transaction" onClick="checkInputs()">
                        <input type="reset" value="Reset">

                    </form>
                    <table>
                        <tr>
                            <th>Transaction ID</th>
                            <th>Tag Code</th>
                            <th>Transaction Date</th>
                            <th>Transaction Time</th>
                            <th>Toll Plaza</th>
                            <th>Toll Lane Number</th>
                            <th>Toll Amount</th>
                        </tr>
                        <%
                            for (int i = 0; i < TID_list.size(); i++) {
                        %>
                        <tr>
                            <td><%=TID_list.get(i)%></td>
                            <td><%=TC_list.get(i)%></td>
                            <td><%=TD_list.get(i)%></td>
                            <td><%=TT_list.get(i)%></td>
                            <td><%=TP_list.get(i)%></td>
                            <td><%=TLN_list.get(i)%></td>
                            <td><%=TA_list.get(i)%></td>
                        </tr>

                        <%}%>
                    </table>
                    <div id = "date"> </div>

                </main>

            </div>

            <footer><small><em>
                        <br>Copyright � 2020 EzPassWebApplication</br>
                        <a href = "mailto:jchanunh@student.fdu.edu">jchanunh@student.fdu.edu</a>
                    </em></small></footer>

        </div>

        <script language="JavaScript">

            function checkInputs()
            {
                var Prompts = "";
                before = document.Transaction.before.value;
                after = document.Transaction.after.value;

                if (before == "" || after == "") {
                    window.alert("One or more fields are empty! Please fill out all information!");
                } else {
                    document.Transaction.submit();
                }
            }

        </script>

        <script>
            var d = new Date();
            document.getElementById("date").innerHTML = d;
        </script>       

    </body> 
</html>
