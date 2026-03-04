<%-- Anthony Nguyen, CSD430 -- demonstrate basic javabean capabilities--%>
<html>
<head>
    <title>JSP UseBean Example</title>
</head>
<body>
<h1>Person Info</h1>
<!-- create the bean, with the scope being this one session -->
<jsp:useBean id="employee" class="com.example.demo.HelloServlet" scope="session" />

<!-- Set the bean's properties -->
<jsp:setProperty name="employee" property="name" value="John Doe" />
<jsp:setProperty name="employee" property="email" value="John@Doe.deer" />
<jsp:setProperty name="employee" property="salary" value="50000.00" />
<jsp:setProperty name="employee" property="position" value="Store Manager" />
<jsp:setProperty name="employee" property="emp_id" value="16729727" />

<!-- Get and display the bean's properties -->
<p><b>Name:</b> <jsp:getProperty name="employee" property="name" /></p>
<p><b>Email:</b> <jsp:getProperty name="employee" property="email" /></p>
<p><b>Salary:</b> <jsp:getProperty name="employee" property="salary" /></p>
<p><b>Position:</b> <jsp:getProperty name="employee" property="position" /></p>
<p><b>Employee ID:</b> <jsp:getProperty name="employee" property="emp_id" /></p>

</body>
</html>
