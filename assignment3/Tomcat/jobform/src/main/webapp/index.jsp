<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - JobForm</title>
</head>
<body>

<h1>Job Application Form</h1>

<br/>

<p>ALL FIELDS REQUIRED:</p>

<form action="display.jsp" method="POST">
    <label for="fullname">First and Last name:</label><br>
    <input type="text" id="fullname" name="fullname" required><br><br>
    <label for="bday">Enter your birthday:</label>
    <input type="date" id="bday" name="bday" required/>
    <hr>
    <label for="jobs">Which position are you applying for?</label>
    <select id="jobs" name="jobs">
        <option value="Software Developer">Software Developer</option>
        <option value="Lead Developer">Lead Developer</option>
        <option value="DevOps Technician">DevOps Technician</option>
        <option value="Back-End Developer">Back-End Developer</option>
        <option value="Department Lead">Department Lead</option>
    </select>
    <br><br>
    <label for="textexp">Please give a brief summary of your work experience:</label><br>
    <textarea id="textexp" name="textexp" rows="10" cols="50" required></textarea>
    <br><br>
    <p>How would you line us to contact you?</p><br>
    <label for="email">Email (example@example.ext): </label>
    <input type="email" id="email" name="email" required><br>
    <label for="phone">Phone Number (000-000-0000): </label>
    <input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>

    <br><br><input type="submit" value="SUBMIT">

</form>

</body>
</html>