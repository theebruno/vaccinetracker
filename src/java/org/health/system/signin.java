/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.health.system;

import java.io.IOException;
import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;
  
public class signin extends TagSupport{  
private String table;  
private String email;
private String password;
 
public void setTable(String table) {  
    this.table = table;  
}  
public void setEmail(String email) {  
    this.email = email;  
}  
public void setPassword(String password) {  
    this.password = password;  
}  
  

public int doStartTag()throws JspException{  
  String yes="yes";
    JspWriter out=pageContext.getOut(); 
    
    try{   
        UserDatabase db =  new UserDatabase(ConnectionPro.getConnection());
            User user = db.logUser(email, password);
            
            if(user!=null){
        pageContext.setAttribute("logged",yes);
       
        out.println("user is found");
//                HttpSession session = request.getSession();
//                session.setAttribute("logUser", user);
//                response.sendRedirect("welcome.jsp");
            }else{
                out.println("user not found");
            }
            
            out.println("</body>");
            out.println("</html>"); 
       
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  