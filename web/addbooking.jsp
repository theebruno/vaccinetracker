<%@ taglib uri="/WEB-INF/tlds/m" prefix="Vaccination" %>  
<%@ page import = "java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${param.provider} ${param.centre} ${param.vaccine} ${param.date}has been created successfully</h1>
       <Vaccination:booking  table="booking" provider="${param.provider}" centre="${param.centre}" vaccine="${param.vaccine}" date="${param.date}"/>
          <%
         // New location to be redirected

         String site = new String("viewbooking.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
      %>
      
    </body>
</html>
