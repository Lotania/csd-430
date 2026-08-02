<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Database Record</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>Database Record</h1>

<ul>
  <li><a href="index.jsp">Main</a></li>
  <li><a class="active" href="indexinsert.jsp">Add</a></li>
  <li><a href="indexdelete.jsp">Delete</a></li>
  <li><a href="indexupdate.jsp">Update</a></li>
</ul>

<h2>Movie Addition Form</h2>
<p>Use this form if you want to add an entry to the movie database.</p>
<!-- The form sends data to insert.jsp using the secure POST method -->
<form action="insert.jsp" method="post">
  <label>Name:</label>
  <input type="text" name="movie_name" required><br><br>

  <label>Production Company(ies):</label>
  <input type="text" name="production_companies" required><br><br>

  <label>Runtime (min):</label>
  <input type="number" name="runtime_minutes" min="1" max="300" required><br><br>

  <label>Budget (USD):</label>
  <input type="number" name="budget_USD" min="1" max="1000000000" required><br><br>

  <label>Box Office (USD):</label>
  <input type="number" name="box_office_USD" min="1" max="1000000000000" required><br><br>

  <label>Release Date:</label>
  <input type="date" name="release_date" required><br><br>

  <input type="submit" value="Submit">
</form>
</body>
</html>
