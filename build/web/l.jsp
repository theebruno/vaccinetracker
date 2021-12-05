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
        <h1>${param.email} has been created successfully  ${param.logged} </h1>
       <Vaccination:login table="user" email="${param.email}" password="${param.password}"/>
        <%
         // New location to be redirected

//         String site = new String("viewvaccine.jsp");
//         response.setStatus(response.SC_MOVED_TEMPORARILY);
//         response.setHeader("Location", site); 
      %>
      
    </body>
</html>
