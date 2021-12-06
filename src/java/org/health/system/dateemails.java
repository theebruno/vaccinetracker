/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.health.system;
import java.util.Date;
import java.text.ParseException;   
import java.text.SimpleDateFormat;  
import java.text.*;
import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;

import java.util.Properties;
 
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
//import javax.mail.*;
//import javax.mail.internet.*;
//import javax.activation.*;  
public class dateemails extends TagSupport{  
private String table;  
  
 
public void setTable(String table) {  
    this.table = table;  
}  
  
public int doStartTag()throws JspException{  
    SimpleDateFormat obj = new SimpleDateFormat("yyyy-MM-dd");   
    JspWriter out=pageContext.getOut();  
    try{   
          Date currentDate = new Date();
  SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
  String dateOnly = dateFormat.format(currentDate);
            
        Class.forName("com.mysql.cj.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");   
        PreparedStatement ps=con.prepareStatement("select * from "+table+"");  
    
        ResultSet rs=ps.executeQuery();  
        if(rs!=null){  
           
        if(rs.next()){  
           while(rs.next()) {
               
    Date date1 = obj.parse(dateOnly);   
            Date date2 = obj.parse(rs.getString(6));
             long time_difference = date2.getTime() - date1.getTime(); 
                   long days_difference = (time_difference / (1000*60*60*24)) % 365;  
               if(days_difference>1){
                   
                    Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "25");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("brunomugire@gmail.com", "password");
            }
        };
 
        Session session = Session.getInstance(properties, auth);
 
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
 
        msg.setFrom(new InternetAddress("brunomugire@gmail.com"));
        InternetAddress[] toAddresses = { new InternetAddress(rs.getString(8)) };
        
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        
        msg.setSubject("VACCCINATION REMINDER");
        msg.setSentDate(new Date());
        
        msg.setText("Hey!"+rs.getString(2)+" Please remember to go to "+rs.getString(3)+" tomorrow. ");
       
        // sends the e-mail
        Transport.send(msg);
                  
                   
               }
               

   } 
             
                  
        }else{  
             
        }  
     
        }  
       
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  