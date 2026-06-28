<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Submitted Data</title>
</head>
<body>
<h2>Submitted Information</h2>
<!-- ${param.nameAttribute} automatically reads the form field -->
<p><strong>Username:</strong> ${param.username}</p>
<p><strong>Birthday:</strong> ${param.birthday}</p>
<p><strong>Email:</strong> ${param.email}</p>
<p><strong>Your Message:</strong> ${param.message}</p>
<p><strong>Your Choice:</strong> ${param.email}</p>

<p><a href="index.jsp">Back to Form</a></p><!-- returm to index to resubmit -->
</body>
</html>
