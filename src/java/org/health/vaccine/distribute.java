package org.health.vaccine;  
import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*;  
  
public class distribute extends TagSupport{  
private String id;  
private int newdoses;
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
            out.write("New doses are"+newdoses);
            Connection con1=DriverManager.getConnection(  
                 "jdbc:mysql://localhost:3306/vaccine","root","");
             PreparedStatement pt=con1.prepareStatement("update inventory set doses=? where id=?");   
         pt.setInt(1,newdoses);
         pt.setString(2,id);
        status2 = pt.executeUpdate(); 
                  
        }else{  
            out.write("Id doesn't exist");  
        }  
         
          
        }  
        con.close();  
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY;  
}  
}  