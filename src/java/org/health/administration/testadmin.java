package org.health.administration;  
import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;
  
public class testadmin extends TagSupport{  
private String vaccine;  
private int newdoses;
private String table;  
private String nin;
private String person;
private String centre; 
private String date;  
private String email;  
public void setVaccine(String vaccine) {  
    this.vaccine = vaccine;  
} 
public void setTable(String table) {  
    this.table = table;  
}  
 
public void setCentre(String centre) {  
    this.centre = centre;  
}  
public void setNin(String nin) {  
    this.nin = nin;  
} 
public void setPerson(String person) {  
    this.person = person;  
} 
public void setDate(String date) {  
    this.date = date;  
} 
public void setEmail(String email) {  
    this.email = email;  
} 
 
  
public int doStartTag()throws JspException{  
    JspWriter out=pageContext.getOut();  
    try{   
        Class.forName("com.mysql.cj.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");   
        PreparedStatement ps=con.prepareStatement("select * from "+table+" where name=?");  
        ps.setString(1,vaccine);  
        ResultSet rs=ps.executeQuery();  
        if(rs!=null){  
       
          
        if(rs.next()){  
           int status2 =0;
               newdoses= rs.getInt(3)-1;  
            out.write("New doses are"+newdoses);
            Connection con1=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");
             PreparedStatement pt=con1.prepareStatement("update inventory set doses=? where name=?");   
         pt.setInt(1,newdoses);
         pt.setString(2,vaccine);
        status2 = pt.executeUpdate(); 
        
        int statusone=0;
        Connection cone=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");  
        PreparedStatement pse=cone.prepareStatement(  
"insert into vaccinated(person,centre,vaccine,seconddate,nin,email) values(?,?,?,?,?,?)");  
        pse.setString(1,person);  
        pse.setString(2,centre);  
         pse.setString(3,vaccine); 
        
         pse.setString(4,date);
         pse.setString(5,nin); 
         pse.setString(6,email); 
     
        statusone=pse.executeUpdate();    
        
                  
        }else{  
            out.write("Id doesn't exist");  
        }  
         
          
        }  
        con.close();  
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  