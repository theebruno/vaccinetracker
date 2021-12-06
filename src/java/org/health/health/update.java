package org.health.health;  
import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*; 
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;

public class update extends TagSupport{  
private String id;  
private String name;
private String location;
private String table;  
private int patients;
private int doses;
private String email;
  
public void setId(String id) {  
    this.id = id;  
}  
public void setTable(String table) {  
    this.table = table;  
}  
public void setPatients(int patients) {  
    this.patients = patients;  
} 

public void setName(String name) {  
    this.name = name;  
} 
public void setLocation(String location) {  
    this.location = location;  
}  
public void setEmail(String email) {  
    this.email = email;  
}  
  
public int doStartTag()throws JspException{  
    JspWriter out=pageContext.getOut();  
    try{  int status=0; 
         Class.forName("com.mysql.cj.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccine","root","");   
        PreparedStatement pte=con.prepareStatement("update centres set name=?, location=?,  patients=? , email=? where id=?");   
         pte.setString(1,name);
         pte.setString(2,location);
          pte.setInt(3,patients);
           
            pte.setString(4,email);
            pte.setString(5,id);
        status = pte.executeUpdate();   
        out.write("yes");
        //column name  
        
         
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  