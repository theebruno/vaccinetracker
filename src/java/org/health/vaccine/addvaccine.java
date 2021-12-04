/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.health.vaccine;

import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;
  
public class addvaccine extends TagSupport{  
private String name;
private int doses;
private String vstatus;  
private String table;
public void setName(String name) {  
    this.name = name;  
}  
public void setDoses(int doses) {  
    this.doses = doses;  
} 
public void setVstatus(String vstatus) {  
    this.vstatus = vstatus;  
}
  
public void setTable(String table) {  
    this.table = table;  
} 
public int doStartTag()throws JspException{  
    int status=0;  
    JspWriter out=pageContext.getOut();  
    try{   
        Class.forName("com.mysql.cj.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");  
        PreparedStatement ps=con.prepareStatement(  
"insert into inventory(name,doses,status) values(?,?,?)");  
        ps.setString(1,name);  
        ps.setInt(2,doses);  
        ps.setString(3,vstatus);  
     
        status=ps.executeUpdate();  
//        con.close();  
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  