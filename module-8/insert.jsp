<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Processing Registration</title>
</head>
<body>
<%
    // retrieve the parameters sent from index.jsp
    String movie_name = request.getParameter("movie_name");
    String production_companies = request.getParameter("production_companies");

    String runtime_minutes = request.getParameter("runtime_minutes");
    int runtime = Integer.parseInt(runtime_minutes);

    String budget_USD = request.getParameter("budget_USD");
    int budget = Integer.parseInt(budget_USD);

    String box_office_USD = request.getParameter("box_office_USD");
    long boxBigInt = Long.parseLong(box_office_USD);

    String release_date = request.getParameter("release_date");

    //connection parameters
    String dbUrl = "jdbc:mysql://localhost:3306/CSD430";
    String dbUser = "student1";
    String dbPassword = "pass";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        LocalDate releaseDate = LocalDate.parse(release_date);
        java.sql.Date sqlDate = java.sql.Date.valueOf(releaseDate);
        Class.forName("com.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Create the SQL insert query
        String sql = "INSERT INTO anthony_movies_data (movie_name, production_company, runtime_minutes, budget_USD, box_office_USD, release_date) VALUES (?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        // Bind the user variables safely to the query placeholders
        pstmt.setString(1, movie_name);
        pstmt.setString(2, production_companies);
        pstmt.setInt(3, runtime);
        pstmt.setInt(4, budget);
        pstmt.setLong(5, boxBigInt);
        pstmt.setDate(6, sqlDate);

        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            out.println("<h3>Data successfully saved to the database!</h3>");
        } else {
            out.println("<h3>Failed to insert data. Please try again.</h3>");
        }

    } catch (Exception e) {
        out.println("<h3>An error occurred: " + e.getMessage() + "</h3>");
    } finally {
        if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
        if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
    }
%>
<br>
<a href="index.jsp">Back to Original Page</a>
</body>
</html>
