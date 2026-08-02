package com.example.dataselect;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/execute-sql")
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database configurations (Change according to your DB)
    private static final String DB_URL = "jdbc:mysql://localhost:3306/CSD430";
    private static final String DB_USER = "student1";
    private static final String DB_PASSWORD = "pass";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = null;
        Statement stmt = null;

        try {
            // 1. Load the JDBC Driver (Example for MySQL)
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            stmt = conn.createStatement();

            // 2. Read the SQL file from the classpath (src/main/resources/script.sql)
            InputStream is = getClass().getClassLoader().getResourceAsStream("Anthony_Create_Table.sql");
            if (is == null) {
                throw new IOException("SQL file 'script.sql' not found in classpath.");
            }

            BufferedReader reader = new BufferedReader(new InputStreamReader(is));
            StringBuilder sb = new StringBuilder();
            String line;

            // 3. Parse and execute the SQL file
            while ((line = reader.readLine()) != null) {
                // Skip comments and empty lines
                if (line.trim().startsWith("--") || line.trim().startsWith("//") || line.trim().isEmpty()) {
                    continue;
                }
                sb.append(line);

                // If the line ends with a semicolon, execute the statement
                if (line.trim().endsWith(";")) {
                    stmt.execute(sb.toString());
                    sb.setLength(0); // Clear the buffer for the next statement
                }
            }
            reader.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error executing SQL file: " + e.getMessage());
        } finally {
            // Close resources cleanly
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }

        // Return a response with a 5-second delay before redirecting
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head>");
        out.println("<meta http-equiv='refresh' content='3;url=index.jsp'>"); // fallback redirect
        out.println("<script>setTimeout(function() { window.location.href='index.jsp'; }, 5000);</script>");
        out.println("</head><body>");
        out.println("<h3>Table reset successfully! Back to the main page...</h3>");
        out.println("</body></html>");
    }
}