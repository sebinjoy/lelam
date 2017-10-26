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
        <title>Lelam::SellerAcceptedDetails</title>
    </head>
    
    
   
    
    
    <body>
        <center>
            <h3>
                Accepted Seller's List
            </h3>
        </center>
       


        <table align="center" border="1">
            <th>Seller Name</th>
            <th>Address</th>
            <th>Place</th>
            <th>E-Mail</th>
            
            
            <%
    
                String did;               
                String sel = "select * from tbl_seller where seller_status=1";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
           
            
            <tr>
                <td>
                    <%=rs.getString("seller_fname")%>
                </td>
                <td>
                    <%=rs.getString("seller_address")%>
                </td>
                <td>
                    <%=rs.getString("seller_localplace")%>
                </td>
                <td>
                    <%=rs.getString("seller_email")%>
                </td>
                
               
            </tr>
            
            
            <%
            
                }
                
            %>
            
            
        </table><br><br>
   </body>
</html>