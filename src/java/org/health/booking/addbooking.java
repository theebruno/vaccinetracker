/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.health.booking;

import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;
  
public class addbooking extends TagSupport{  
private String provider;
private String table;
private String centre;
private String vaccine;  
private String date;
public void setProvider(String provider) {  
    this.provider = provider;  
} 
public void setTable(String table) {  
    this.table = table;  
} 
public void setCentre(String centre) {  
    this.centre = centre;  
} 
public void setVaccine(String vaccine) {  
    this.vaccine = vaccine;  
}
  
public void setDate(String date) {  
    this.date = date;  
} 
public int doStartTag()throws JspException{  
    int status=0;  
    JspWriter out=pageContext.getOut();  
    try{   
        Class.forName("com.mysql.cj.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");  
        PreparedStatement ps=con.prepareStatement(  
       "insert into booking(recipient,date,vaccine,centre) values(?,?,?,?)");  
        ps.setString(1,provider);  
        ps.setString(2,date);  
        ps.setString(3,vaccine);  
        ps.setString(4,centre); 
     
        status=ps.executeUpdate();  
        out.println("You have booked succesfully");
//        con.close();  
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  