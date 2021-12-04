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
        <h1>${param.name} has been created successfully</h1>
        <Vaccination:insertvaccine table="inventory" doses="${param.doses}" vstatus="${param.vstatus}" name="${param.name}"/>
        <%
         // New location to be redirected

         String site = new String("viewvaccine.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
      %>
    </body>
</html>
