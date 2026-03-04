<%-- Save as index.jsp in your web application's root directory --%>
<html>
<head>
    <title>JSP UseBean Example</title>
</head>
<body>
<h1>Person Info</h1>
<!-- 1. Instantiate the bean or locate an existing one in the 'session' scope -->
<jsp:useBean id="employee" class="com.example.demo.HelloServlet" scope="session" />

<!-- 2. Set the bean's properties -->
<jsp:setProperty name="employee" property="name" value="John Doe" />
<jsp:setProperty name="employee" property="email" value="John@Doe.deer" />
<jsp:setProperty name="employee" property="salary" value="50000.00" />
<jsp:setProperty name="employee" property="position" value="Store Manager" />
<jsp:setProperty name="employee" property="emp_id" value="16729727" />

<!-- 3. Get and display the bean's properties -->
<p><b>Name:</b> <jsp:getProperty name="employee" property="name" /></p>
<p><b>Email:</b> <jsp:getProperty name="employee" property="email" /></p>
<p><b>Salary:</b> <jsp:getProperty name="employee" property="salary" /></p>
<p><b>Position:</b> <jsp:getProperty name="employee" property="position" /></p>
<p><b>Employee ID:</b> <jsp:getProperty name="employee" property="emp_id" /></p>

</body>
</html>
