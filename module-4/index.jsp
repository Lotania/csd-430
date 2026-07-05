<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>State Information</title>
</head>
<body>
<!-- Instantiate or locate the JavaBean -->
<jsp:useBean id="stateBean" class="com.example.beanform.HelloServlet" scope="request" />

<!-- Set the properties of the JavaBean -->
<jsp:setProperty name="stateBean" property="name" value="Colorado" />
<jsp:setProperty name="stateBean" property="nickname" value="The Centennnial State" />
<jsp:setProperty name="stateBean" property="admitted" value="August 1, 1876" />
<jsp:setProperty name="stateBean" property="population" value="6,012,561" />
<jsp:setProperty name="stateBean" property="landmarks" value="Red Rocks Ampitheatre, Great Sand Dunes, Garden of the Gods" />

<h2>State Information Details</h2>
<!--retrieve the properties of the JavaBean-->
<p>
    <strong>State Name:</strong>${stateBean.name}
</p>
<p>
    <strong>Nickname:</strong> ${stateBean.nickname}
</p>
<p>
    <strong>Admitted to the Union:</strong> ${stateBean.admitted}
</p>
<p>
    <strong>Population:</strong> ${stateBean.population}
</p>
<p>
    <strong>Landmarks:</strong> ${stateBean.landmarks}
</p>
</body>
</html>
