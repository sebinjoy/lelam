<%-- 
    Document   : CategoryDetails
    Created on : Sep 25, 2017, 10:40:36 AM
    Author     : Nabeel NK
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <jsp:useBean class="db.dbConnection" id="obj">
</jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lelam::CategoryDetails</title>
    </head>
    
    
    <%
        
        String cat_id="";
        String cat_name="";
        
        if(request.getParameter("id")!=null)
        { 
            String sel = "select * from tbl_category where cat_id='"+request.getParameter("id")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                cat_id=rs1.getString("cat_id");
                cat_name=rs1.getString("cat_name");
            }
        }
        if(request.getParameter("dname")!=null)
        {
            String delete = "delete from tbl_category where cat_name='"+request.getParameter("dname")+"' ";
            obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
                Category Details
            </h3>
        </center>
        <form>
            <table align="center" border="1">
                <input type="hidden" name="hid" value="<%=cat_id%>">
                <tr>
                    <td>
                        Category Name
                    </td>
                    <td>
                        <input type="text" name="txt_category" value="<%=cat_name%>" required="">
                    </td>
                </tr>
              
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Submit">                
                        <input type="reset" name="cancel" value="Cancel">
                    </td>
                </tr>
            </table>  <br><br>             
        </form>


<%

    String category="";
    
    if(request.getParameter("submit")!=null)
    {       
        category=request.getParameter("txt_category");  
        
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_category set cat_name='"+category+"' where cat_id='"+request.getParameter("hid")+"' ";
            boolean b=obj.insert(update);
        }
        else
        {
            String inse="insert into tbl_category(cat_name) values('"+category+"')";          
            boolean b=obj.insert(inse);
            
        }       
       // response.sendRedirect("District.jsp"); 
    } 
    
%>


        <table align="center" border="1">
            <th>Category</th>
            
            
            <%
    
                String did;               
                String sel = "select * from tbl_category";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
           
            
            <tr>
                <td>
                    <%=rs.getString("cat_name")%>
                </td>
                <td>
                    <a href="CategoryDetails.jsp?id=<%=rs.getString("cat_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>                   
                </td> 
                <td>
                    <a href="CategoryDetails.jsp?dname=<%=rs.getString("cat_name")%>"><img src="Icon/Delete.png" width="40" height="25"></a>
                </td>
            </tr>
            
            
            <%
            
                }
                
            %>
            
            
        </table><br><br>
   </body>
</html>