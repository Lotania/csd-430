<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration Form</title>
</head>
<body>
<h2>Registration Form</h2>

<form action="display.jsp" method="POST">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>

    <label for="birthday">Enter your birthday:</label>
    <input type="date" id="birthday" name="birthday"><br><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>

    <label for="message">Message:</label><br>
    <textarea id="message" name="message" rows="5" cols="40" placeholder="Type your message here..."></textarea>
    <br><br>

    <fieldset style="border: none;">
        <legend>Are you fine with your current life?</legend>

        <input type="radio" id="yes" name="choice" value="yes">
        <label for="yes">YES</label>

        <input type="radio" id="no" name="choice" value="no">
        <label for="no">NO</label>
    </fieldset>


    <input type="submit" value="Submit">
</form>
</body>
</html>
