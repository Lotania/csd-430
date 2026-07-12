<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, com.example.dataselect.Moovee" %>

<%
    // Database connection details
    String dbUrl = "jdbc:mysql://localhost:3306/CSD430";
    String dbUser = "student1";
    String dbPass = "pass";

    // Get the selected record ID from the dropdown form
    String selectedIdStr = request.getParameter("recordId");
    Moovee selectedRecord = null;

    ArrayList<Integer> availableIds = new ArrayList<>();

    Class.forName("com.mysql.cj.jdbc.Driver");
    try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {

        // Fetch all available IDs to the drop-down menu
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT id, movie_name, production_company, runtime_minutes, budget_USD, box_office_USD, release_date FROM anthony_movies_data")) {
            while (rs.next()) {
                availableIds.add(rs.getInt("id"));
            }
        }

        // fetch the specific record into the JavaBean for that id
        if (selectedIdStr != null && !selectedIdStr.trim().isEmpty()) {
            String sql = "SELECT id, movie_name, production_company, runtime_minutes, budget_USD, box_office_USD, release_date FROM anthony_movies_data WHERE id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                //use prepared statement for faster and ? queries
                pstmt.setInt(1, Integer.parseInt(selectedIdStr));
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        selectedRecord = new Moovee();
                        selectedRecord.setId(rs.getInt("id"));
                        selectedRecord.setMovieName(rs.getString("movie_name"));
                        selectedRecord.setProductionCompany(rs.getString("production_company"));
                        selectedRecord.setRuntimeMinutes(rs.getInt("runtime_minutes"));
                        selectedRecord.setBudgetUSD(rs.getInt("budget_USD"));
                        selectedRecord.setBoxOfficeUSD(rs.getLong("box_office_USD"));
                        selectedRecord.setReleaseDate(rs.getDate("release_date"));
                    }
                }
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Database Record Viewer</title>
    <!-- present the data in an easy-to-read format -->
    <style>
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>

<h2>Select a Movie</h2>

<!-- Dropdown Form -->
<form method="GET" action="">
    <label for="recordId">Choose an ID:</label>
    <select name="recordId" id="recordId" onchange="this.form.submit()">
        <option value="">-- Select --</option>
        <% for (Integer id : availableIds) {
            String selected = (selectedIdStr != null && selectedIdStr.equals(String.valueOf(id))) ? "selected" : "";
        %>
        <option value="<%= id %>" <%= selected %>><%= id %></option>
        <% } %>
    </select>
</form>

<hr>

<!-- HTML Table for displaying the selected record -->
<% if (selectedRecord != null) { %>
<h2>Details for Number <%= selectedRecord.getId() %></h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Production Companies</th>
        <th>Runtime (min.)</th>
        <th>Budget (USD)</th>
        <th>Box Office (USD)</th>
        <th>Release Date</th>
    </tr>
    <tr>
        <td><%= selectedRecord.getId() %></td>
        <td><%= selectedRecord.getMovieName() %></td>
        <td><%= selectedRecord.getProductionCompany() %></td>
        <td><%= selectedRecord.getRuntimeMinutes() %></td>
        <td><%= selectedRecord.getBudgetUSD() %></td>
        <td><%= selectedRecord.getBoxOfficeUSD() %></td>
        <td><%= selectedRecord.getReleaseDate() %></td>
    </tr>
</table>
<% } else if (selectedIdStr != null) { %>
<p style="color:red;">No record found for ID: <%= selectedIdStr %></p>
<% } %>

</body>
</html>
