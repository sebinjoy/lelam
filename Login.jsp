<%-- 
    Document   : login
    Created on : Sep 23, 2017, 10:00:12 AM
    Author     : student35
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>

             <%
 if(request.getParameter("submit")!=null)
        { 
       String username=request.getParameter("uname");
       String password=request.getParameter("pwd");
       
       
       ResultSet rs=obj.select("select * from tbl_login where login_username='"+username+"' and login_password='"+password+"'");
       if(rs.next())
       {
           response.sendRedirect("../Admin/HomePage.jsp");
       }
       
       
       
       
       
        ResultSet rs1=obj.select("select * from tbl_buyer where buyer_username='"+username+"' and buyer_password='"+password+"'");
       if(rs1.next())
       {
           response.sendRedirect("../Buyer/HomePage.jsp");
       }
       
       
       
       
        ResultSet rs2=obj.select("select * from  where seller_username='"+username+"' and seller_password='"+password+"'");
       if(rs2.next())
       {
           response.sendRedirect("../Seller/HomePage.jsp");
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
     
        <form> <table align="center">
            <h1 align="center">Login</h1>
            <tr><td>USERNAME:</td><td><input type="text" name="uname" value=""></td>
            <tr><td>PASSWORD:</td><td><input type="password" name="pwd" ></td></tr>
    </table>
        <input type="submit" name="submit" value="submit" style="margin-left: 700px;margin-top: 20px">

      </form>
    </body>
</html>
