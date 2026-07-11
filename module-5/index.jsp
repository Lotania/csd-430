<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Database Creation List</title>
    <style>
        th, td {
            border: 1px solid black;
            padding: 8px;
        }
    </style>
</head>
<body>

    <h1>Active Movie Records</h1>

    <%
        //connection parameters
        String dbUrl = "jdbc:mysql://localhost:3306/CSD430";
        String dbUser = "student1";
        String dbPassword = "pass";

        // sql is in project folder, find path
        String sqlFilePath = application.getRealPath("/Anthony_Create_Table.sql");

        Connection conn = null;
        Statement stmt = null;
        BufferedReader reader = null;

        try {
            // Load Driver (Change according to your database, e.g., Oracle, PostgreSQL)
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            stmt = conn.createStatement();

            // 3. Read the SQL File
            File file = new File(sqlFilePath);
            if (!file.exists()) {
                out.println("<p style='color:red;'>Error: SQL file not found at " + sqlFilePath + "</p>");
            } else {
                reader = new BufferedReader(new FileReader(file));
                StringBuilder sb = new StringBuilder();
                String line;

                while ((line = reader.readLine()) != null) {
                    // Skip comments and empty lines
                    if (line.trim().startsWith("--") || line.trim().startsWith("/*") || line.trim().isEmpty()) {
                        continue;
                    }
                    sb.append(line);
                    sb.append(" "); // Preserve spaces between lines
                }

                // separate queries by semicolon
                String[] rawQueries = sb.toString().split(";");

                for (String query : rawQueries) {
                    String cleanQuery = query.trim();
                    if (!cleanQuery.isEmpty()) {
                        stmt.addBatch(cleanQuery);
                    }
                }

                out.println("<p style='color:green;'>Uploading all current records from table:</p>");
            }

        } catch (ClassNotFoundException e) {
            out.println("<p style='color:red;'>JDBC Driver Error: " + e.getMessage() + "</p>");
            e.printStackTrace(new PrintWriter(out));
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Database/SQL Error: " + e.getMessage() + "</p>");
            e.printStackTrace(new PrintWriter(out));
        } catch (IOException e) {
            out.println("<p style='color:red;'>File Reading Error: " + e.getMessage() + "</p>");
            e.printStackTrace(new PrintWriter(out));
        } finally {
            // close after creating table
            if (reader != null) try { reader.close(); } catch (IOException e) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    %>

    <table  style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>ID</th>
            <th>Movie Name</th>
            <th>Production Companies</th>
            <th>Run Time (Minutes)</th>
            <th>Budget (USD)</th>
            <th>Box Office (USD)</th>
            <th>Release Date</th>
        </tr>
            <%

        //re-connect to access table
        ResultSet rs = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // query statement execution container
            stmt = conn.createStatement();
            String sql = "SELECT id, movie_name, production_company, runtime_minutes, budget_USD, box_office_USD, release_date FROM anthony_movies_data";
            rs = stmt.executeQuery(sql);

            // while iterating, convert BIGINT to long for java readable
            while(rs.next()) {
                long box_office_long = rs.getLong("box_office_USD");
    %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("movie_name") %></td>
            <td><%= rs.getString("production_company") %></td>
            <td><%= rs.getInt("runtime_minutes") %></td>
            <td><%= rs.getInt("budget_USD") %></td>
            <td><%= box_office_long %></td>
            <td><%= rs.getDate("release_date") %></td>
        </tr>
            <%
            }
        } catch (ClassNotFoundException e) {
            out.println("<p style='color:red;'>Driver Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            // 6. Clean up resources in reverse order to prevent leaks
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>

</body>
</html>
