<%-- 
    Document   : login
    Created on : Sep 23, 2017, 10:00:12 AM
    Author     : student35
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>

             <%
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                   String status="";
       
 if(request.getParameter("submit")!=null)
        { 
       String username=request.getParameter("uname");
       String password=request.getParameter("pwd");
     
       ResultSet rs=obj.select("select * from tbl_login where login_username='"+username+"' and login_password='"+password+"'");
      ResultSet rs1=obj.select("select * from tbl_buyer where buyer_username='"+username+"' and buyer_password='"+password+"'");
      ResultSet rs2=obj.select("select * from tbl_seller where seller_username='"+username+"' and seller_password='"+password+"' and seller_status=1");
     
       
       if(rs.next())
       {
           response.sendRedirect("../Admin/HomePage.jsp");
       }
       else if(rs1.next())
       {
           session.setAttribute("uid",rs1.getString("buyer_id"));
           response.sendRedirect("../Buyer/HomePage.jsp");
       }
       else if(rs2.next())
       {
           session.setAttribute("uid",rs2.getString("seller_id"));
           response.sendRedirect("../Seller/HomePage.jsp");
       }
       else
       {
           status="invalid username/password";
       }
        }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
    </head>
    <body>
     
        <form>
            <table align="center">
                <tr><td colspan="2" align="center">  <h1 align="center">Login</h1></td></tr>
            <tr><td>USERNAME:<input type="text" name="uname" value=""></td>
            <tr><td>PASSWORD:<input type="password" name="pwd" ></td></tr>
   
       <tr><td colspn="2" align="center">
               <input type="submit" name="submit" value="submit">
           </td>
       </tr>
       <tr><td colspan="2" align="center" style="color: red;"><%=status%></td></tr>
 </table>
      </form>
    </body>
</html>
