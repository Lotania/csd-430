<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // retrieve the parameters sent from index.jsp
    String id = request.getParameter("id");

    String movie_name = request.getParameter("movie_name");
    String production_companies = request.getParameter("production_companies");

    String runtime_minutes = request.getParameter("runtime_minutes");
    int runtime = Integer.parseInt(runtime_minutes);

    String budget_USD = request.getParameter("budget_USD");
    int budget = Integer.parseInt(budget_USD);

    String box_office_USD = request.getParameter("box_office_USD");
    long boxBigInt = Long.parseLong(box_office_USD);

    String release_date = request.getParameter("release_date");

    if (id != null && !id.trim().isEmpty()) {
        try {
            LocalDate releaseDate = LocalDate.parse(release_date);
            java.sql.Date sqlDate = java.sql.Date.valueOf(releaseDate);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

            String sql = "UPDATE anthony_movies_data SET movie_name = ?, production_company = ?, runtime_minutes = ?, budget_USD = ?, box_office_USD = ?, release_date = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, movie_name);
            ps.setString(2, production_companies);
            ps.setInt(3, runtime);
            ps.setInt(4, budget);
            ps.setLong(5, boxBigInt);
            ps.setDate(6, sqlDate);
            ps.setInt(7, Integer.parseInt(id));

            int rows = ps.executeUpdate();
            if (rows > 0) {
                out.println("Row updated successfully!");
            } else {
                out.println("No matching ID found.");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>

<br>
<a href="index.jsp">Back to Original Page</a>
</body>
</html>