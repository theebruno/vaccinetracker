<%@ taglib uri="/WEB-INF/tlds/m" prefix="Vaccination" %>  
<%@ page import = "java.io.*,java.util.*" %>
<%@page import="org.health.system.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("logUser");
    if(user==null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COVID-19 Certificate</title>
      
    </head>
    <body>
       
<div class="container">
     <style>
            @media print {
               .noprint {
                  visibility: hidden;
               }
            }
        </style>
         <Vaccination:administration table="inventory" email="${param.email}" vaccine="${param.vaccine}" person="${param.person}"  nin="${param.nin}" centre="${param.centre}" date="${param.date}"/>
    	<div class="row">
    		<div class="span4">
                <img src="assets/images/favicon.png" style="height:50px" class="img-rounded logo">
    			<address>
			        <strong>Ministry of Health</strong><br>
                 
			
		    	</address>
    		</div>
    		<div class="span4 well">
    			<table class="invoice-head">
    				<tbody>
    					<tr>
    						<td><strong>Vaccinated By:</strong></td>
    						<td><%= user.getName() %></td>
    					</tr>
    					
    					
    					
    				</tbody>
    			</table>
    		</div>
    	</div>
    	<div class="row">
    		<div class="span8">
    			<h2>Patient Details</h2>
    		</div>
    	</div>
    	<div class="row">
		  	<div class="span8 well invoice-body">
		  		<table class="table table-bordered" border="1">
					<thead>
						<tr>
                          <th>Name</th>
							<th>NIN</th>
                          <th>Health Centre</th>
                           <th>Name of Vaccine</th>
							<th>Date of Next Dose</th>
                                                       
						</tr>
					</thead>
					<tbody>
					<tr>
						<td>${param.person}</td>
                                                <td>${param.nin}</td>
                                                <td>${param.centre}</td>
						<td>${param.vaccine}</td>
						<td>${param.date}</td>
                    
						</tr>
           

					</tbody>
				</table>
		  	</div>
  		</div>
  		<div class="row">
  			<div class="span8 well invoice-thank">
  				<h5 style="text-align:center;">Thank You!</h5>
  			</div>
  		</div>
  		<div class="row">
  	    	<div class="span3">
                <button onclick="window.print()" class="class = "noprint">Print Certificate</button>
  	    	</div>
  	    	
  		</div>
    </div>
        
       
    </body>
</html>
