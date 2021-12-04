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
  
public class name extends TagSupport{  
private String table;  
  
 
public void setTable(String table) {  
    this.table = table;  
}  
  
public int doStartTag()throws JspException{  
    JspWriter out=pageContext.getOut();  
    try{   
        Class.forName("com.mysql.cj.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");   
        PreparedStatement ps=con.prepareStatement("select * from "+table+"");  
       
        ResultSet rs=ps.executeQuery();  
        if(rs!=null){  
          
        if(rs.next()){  
           while(rs.next()) {
   
    out.println("<option value=\"jj\">"+rs.getString(2) + "</option>");
    ;
 

   } 
             
                  
        }else{  
            out.write("No records found!");  
        }  
     
          
        }  
       
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  