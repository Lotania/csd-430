<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Database Record</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>Database Record</h1>

<ul>
    <li><a href="index.jsp">Main</a></li>
    <li><a href="indexinsert.jsp">Add</a></li>
    <li><a class="active" href="indexdelete.jsp">Delete</a></li>
    <li><a href="indexupdate.jsp">Update</a></li>
</ul>

<h2>Delete Movie Form</h2>
<!-- This page lets you view the entire table and choose which record to delete -->
<p>This is the current contents of table:</p>
<hr>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Production Companies</th>
        <th>Runtime (min.)</th>
        <th>Budget (USD)</th>
        <th>Box Office (USD)</th>
        <th>Release Date</th>
    </tr>
    </thead>
    <tbody>
    <%
        // Define connection parameters
        String url = "jdbc:mysql://localhost:3306/CSD430";
        String username = "student1";
        String password = "pass";

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);

            String sql = "SELECT id, movie_name, production_company, runtime_minutes, budget_USD, box_office_USD, release_date FROM anthony_movies_data";
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {//loop through the entire table
                long long_USD = rs.getLong("box_office_USD");
                Date date_val = rs.getDate("release_date");
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("movie_name") %></td>
        <td><%= rs.getString("production_company") %></td>
        <td><%= rs.getInt("runtime_minutes") %></td>
        <td><%= rs.getInt("budget_USD") %></td>
        <td><%= long_USD %></td>
        <td><%= date_val %></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            // Always close database resources in the finally block
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
    %>
    </tbody>
</table>
<!-- this button deletes your chosen record -->
<hr>
<form action="delete.jsp" method="post">
    <label for="userId">Enter User ID to Delete:</label>
    <input type="text" id="userId" name="userId" required>
    <button type="submit">Delete Record</button>
</form>
</body>
</html>
