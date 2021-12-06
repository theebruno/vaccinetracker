/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.health.health;

import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
  
public class viewhealthcentre extends TagSupport{  
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
        ResultSetMetaData rsmd=rs.getMetaData();  
        int totalcols=rsmd.getColumnCount();  
        //column name  
        out.write("<table  class='table table-striped'> ");  
        out.write(" <thead><tr>");  
        for(int i=1;i<=totalcols;i++){  
            out.write("<th>"+rsmd.getColumnName(i)+"</th>");  
        }  
        out.write("<th>Actions</th>");
        out.write("</tr> </thead>");  
        //column value  
           out.write("<tbody>");   
    
           while(rs.next()) {
    out.println("<tr>");
    out.println("<td>"+rs.getString(1) + "</td>");
    out.println("<td>"+rs.getString(2) + "</td>");
    out.println("<td>"+rs.getString(3) + "</td>");
    out.println("<td>"+rs.getString(4) + "</td>");
     out.println("<td>"+rs.getString(5) + "</td>");
        out.println("<td>"+rs.getString(6) + "</td>");
        out.println("<td><form method=\"post\" action=\"update.jsp\">\n" +
"                      <input type=\"hidden\" name=\"name\" value=\""+rs.getString(2) + "\">\n" +
"                      <input type=\"hidden\" name=\"location\" value=\""+rs.getString(3) + "\">\n" +
"                      <input type=\"hidden\" name=\"patients\" value=\""+rs.getString(4) + "\">\n" +
"                      <input type=\"hidden\" name=\"id\" value=\""+rs.getString(1) + "\">"
        + "<input type=\"hidden\" name=\"email\" value=\""+rs.getString(6) + "\"><button type=\"submit\" class=\"btn btn-social-icon btn-outline-facebook\"><i class=\"mdi mdi-table-edit\"></i></button></form></td>");
    out.println("</tr>");

   } 
              out.write("</tbody>"); 
                  
        
        out.write("</table>");  
          
        }  
       
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  