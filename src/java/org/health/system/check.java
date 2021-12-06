/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.health.system;

import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;
  
public class check extends TagSupport{  
private String table;  
private String nin;    
 
public void setTable(String table) {  
    this.table = table;  
} 
public void setNin(String nin) {  
    this.nin = nin;  
}
  
public int doStartTag()throws JspException{  
    JspWriter out=pageContext.getOut();  
    try{   
        Class.forName("com.mysql.cj.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");   
        PreparedStatement ps=con.prepareStatement("select * from "+table+" where nin=?");  
       ps.setString(1,nin);
        ResultSet rs=ps.executeQuery();  
        if(rs!=null){  
         
        if(rs.next()){  
           
     
    out.println("<input type=\"text\" value=\""+rs.getString(6)+"\" name=\"email\" class\"form-control form-control-lg\" id=\"exampleInputEmail1\">");

   
             
                  
        }else{  
            out.write("No records found!");  
        }  
        out.write("</table>");  
          
        }  
       
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  