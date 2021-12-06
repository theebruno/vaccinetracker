/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.health.health;

import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
  
public class addhealthcentre extends TagSupport{  
private String name;
private String email;
private String table;
private String location;  
private int patients;
public void setName(String name) {  
    this.name = name;  
}  
public void setLocation(String location) {  
    this.location = location;  
} 
public void setPatients(int patients) {  
    this.patients = patients;  
}
  
public void setTable(String table) {  
    this.table = table;  
} 
public void setEmail(String email) {  
    this.email = email;  
} 
public int doStartTag()throws JspException{  
    int status=0;  
    JspWriter out=pageContext.getOut();  
    try{   
        Class.forName("com.mysql.cj.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");  
        PreparedStatement ps=con.prepareStatement(  
"insert into centres(name,location,patients,doses,email) values(?,?,?,?,?)");  
        ps.setString(1,name);  
        ps.setString(2,location);  
        ps.setInt(3,patients);  
        ps.setInt(4,0); 
         ps.setString(5,email);  
        status=ps.executeUpdate();  
//        con.close();  
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  