<%@page import="java.util.List, java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Anthony Nguyen, CSD-430 Assignment 2, 12/14/2025
The purpose of this program is to demonstrate
basic JSP Scriptlet capabililties-->
<!DOCTYPE html>
<html>
<head>
    <title>Dynamic HTML Table with JSP Scriptlets</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h2>Some Data About Colorado</h2>

<!-- java scriptlet: use arraylists to store data about Colorado -->
<%
    List<String[]> dataList = new ArrayList<>();
    dataList.add(new String[]{"Denver", "Denver", "729,019", "Union Station"});
    dataList.add(new String[]{"Morrison", "Jefferson", "415", "Red Rocks Ampitheater"});
    dataList.add(new String[]{"Estes Park", "Larimer", "5794", "The Stanley Hotel"});

    String[] headers = {"City", "County", "Population", "Point of Interest"};
%>

<table>
    <thead>
    <tr>
        <!-- java scriptlet: run through header list -->
        <%
            for (String header : headers) {
        %>
        <th><%= header %></th>
        <%
            }
        %>
    </tr>
    </thead>
    <!-- java scriptlet: run through assigned list on each row -->
    <tbody>
    <%
        for (String[] rowData : dataList) {
    %>
    <tr>
        <%
            for (String cellData : rowData) {
        %>
        <td><%= cellData %></td>
        <%
            }
        %>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>