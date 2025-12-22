<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Submitted Information</title>
    <style>
        a{
            background-color: darkgreen;
            border-radius: 10px;
            padding: 0.5rem;
            text-decoration: none;
            color: white;
            font-family: Verdana, Geneva, sans-serif;
            font-weight: bold;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td{
            padding: 10px;
        }
        td {
            max-width: 400px;
            word-wrap: break-word;
            overflow: hidden;
        }
    </style>
</head>
<body>
<%
    // Retrieve the parameters from the request object
    String fullname = request.getParameter("fullname");
    String jobs = request.getParameter("jobs");
    String textexp = request.getParameter("textexp");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String bday = request.getParameter("bday");
%>
<h1>REVIEW YOUR SUBMISSION</h1><br><br><br>
<p>Your application is pending submission.</p>
<p>Please review the information provided before submitting:</p>
<table>
    <tr>
        <th>Name</th>
        <td><%= fullname %></td>
    </tr>
    <tr>
        <th>Birthday</th>
        <td><%= bday %></td>
    </tr>
    <tr>
        <th>Position</th>
        <td><%= jobs %></td>
    </tr>
    <tr>
        <th>Summary</th>
        <td><%= textexp %></td>
    </tr>
    <tr>
        <th>Email</th>
        <td><%= email %></td>
    </tr>
    <tr>
        <th>Phone Number</th>
        <td><%= phone %></td>
    </tr>
</table>

<p>Click SUMBIT when you are ready.</p>
<figure>
    <figcaption><a href="thanks.jsp">SUBMIT</a></figcaption>
</figure>

</body>
</html>