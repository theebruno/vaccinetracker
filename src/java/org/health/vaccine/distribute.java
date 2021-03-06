package org.health.vaccine;  
import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*; 
public class distribute extends TagSupport{  
private String id;  
private int newdoses;
private int centredoses;
private String table;  
private int doses;
private String centre; 
  
public void setId(String id) {  
    this.id = id;  
}  
public void setTable(String table) {  
    this.table = table;  
}  
public void setDoses(int doses) {  
    this.doses = doses;  
}  
public void setCentre(String centre) {  
    this.centre = centre;  
}  
  
public int doStartTag()throws JspException{  
    JspWriter out=pageContext.getOut();  
    try{   
        Class.forName("com.mysql.cj.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");   
        PreparedStatement ps=con.prepareStatement("select * from "+table+" where id=?");  
        ps.setInt(1,Integer.parseInt(id));  
        ResultSet rs=ps.executeQuery();  
        if(rs!=null){  
       
          
        if(rs.next()){  
           int status2 =0;
               newdoses= rs.getInt(3)-doses;  
         
            Connection con1=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");
             PreparedStatement pt=con1.prepareStatement("update inventory set doses=? where id=?");   
         pt.setInt(1,newdoses);
         pt.setString(2,id);
        status2 = pt.executeUpdate(); 
        
        
        
        
        Connection conte=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");   
        PreparedStatement pste=conte.prepareStatement("select * from centres where id=?");  
        pste.setInt(1,Integer.parseInt(centre));  
        ResultSet rse=pste.executeQuery();  
        if(rse!=null){  
       
          
        if(rse.next()){
           int status3 =0;
               centredoses= rse.getInt(5)+doses;  
               String oneemail=rse.getString(6);
            Connection con1e=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");
             PreparedStatement pte=con1e.prepareStatement("update centres set doses=? where id=?");   
         pte.setInt(1,centredoses);
         pte.setString(2,centre);
        status3 = pte.executeUpdate();   
        
        
        
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
        InternetAddress[] toAddresses = { new InternetAddress(oneemail) };
        
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        
        msg.setSubject("PICK UP VACCINES");
        msg.setSentDate(new java.util.Date());
        
        msg.setText("Please remember to pick up the vaccines");
       
        // sends the e-mail
        Transport.send(msg);
        
        
        
        
        
        }
        
        
        }
        
      
                  
        }else{  
            out.write("Id doesn't exist");  
        }  
         
          
        }  
        con.close();  
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  