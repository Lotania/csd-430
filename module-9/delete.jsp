<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Delete Result</title>
</head>
<body>
<%
  // 1. Retrieve the user input from the request parameter
  String userIdInput = request.getParameter("userId");

  if (userIdInput != null && !userIdInput.trim().isEmpty()) {
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
      // 2. Load the database driver (Example uses MySQL)
      Class.forName("com.mysql.cj.jdbc.Driver");

      // 3. Establish the database connection
      String url = "jdbc:mysql://localhost:3306/CSD430";
      String username = "student1";
      String password = "pass";
      conn = DriverManager.getConnection(url, username, password);

      // 4. Create the SQL statement using a placeholder (?) to prevent SQL injection
      String sql = "DELETE FROM anthony_movies_data WHERE id = ?";
      pstmt = conn.prepareStatement(sql);

      // 5. Safely parse and bind the user input parameter
      int userId = Integer.parseInt(userIdInput);
      pstmt.setInt(1, userId);

      // 6. Execute the update
      int rowsDeleted = pstmt.executeUpdate();

      // 7. Check if the deletion was successful
      if (rowsDeleted > 0) {
        out.println("<h3><font color='green'>Success: Record with ID " + userId + " was deleted successfully!</font></h3>");
      } else {
        out.println("<h3><font color='red'>Notice: No record found with ID " + userId + ".</font></h3>");
      }

    } catch (NumberFormatException e) {
      out.println("<h3><font color='red'>Error: Please enter a valid numerical ID.</font></h3>");
    } catch (ClassNotFoundException e) {
      out.println("<h3><font color='red'>Error: Database driver missing. " + e.getMessage() + "</font></h3>");
    } catch (SQLException e) {
      out.println("<h3><font color='red'>Database Error: " + e.getMessage() + "</font></h3>");
    } finally {
      // 8. Clean up resources in the finally block
      if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
      if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
    }
  } else {
    out.println("<h3><font color='red'>Error: No ID provided.</font></h3>");
  }
%>
<br>
<a href="index.jsp">Back to Form</a>
</body>
</html>
