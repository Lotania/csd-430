<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%-- Inner Java class to hold data--%>
<%!
    public static class Point {
        private String point1;
        private String point2;

        public Point(String point1, String point2) {
            this.point1 = point1;
            this.point2 = point2;
        }

        public String getPoint1() { return point1; }
        public String getPoint2() { return point2; }
    }
%>

<%
    // Using JSP Scriptlet to generate dynamic data
    List<Point> pointList = new ArrayList<>();
    pointList.add(new Point("Name", "Colorado"));
    pointList.add(new Point("Nickname", "The Centennnial State"));
    pointList.add(new Point("Admitted to the Union", "August 1, 1876"));
    pointList.add(new Point("Population", "6,012,561"));
    pointList.add(new Point("Landmarks", "Red Rocks Ampitheatre, Great Sand Dunes, Garden of the Gods"));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dynamic Table with JSP</title>
    <!-- Link the external CSS -->
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>

<h2>Info About Colorado</h2>
<p>I had so much fun visiting Red Rocks, getting lost in Convergence Station, and having a taste of the Rockies.</p>

<table class="data-table">
    <thead>
    <tr>
        <th>Topic</th>
        <th>Info</th>
    </tr>
    </thead>
    <tbody>
    <%
        // Iterating through the Java List using a scriptlet
        for (Point point : pointList) {
    %>
    <tr>
        <td><%= point.getPoint1() %></td>
        <td><%= point.getPoint2() %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>