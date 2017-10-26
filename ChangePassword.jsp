<%-- 
    Document   : ChangePassword
    Created on : Oct 3, 2017, 10:32:47 AM
    Author     : Nabeel NK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sellerchangepassword</title>
    </head>
    <body>
        
        
        
        <%

  
    String password="";
    
    if(request.getParameter("submit")!=null)
    {       
        password=request.getParameter("txtnewpass");  
        String s = "update tbl_login set login_password='"+ password+"' where login_username='"+request.getParameter("hid")+"' ";
    }
    %>
    
        <h1 align="center">Change password</h1>
        <table align="center">
            <form>
                <tr><td>Current Password</td><td><input type="text" name="txtpass"></td></tr>
                <tr><td>New Password</td><td><input type="text" name="txtnewpass"></td></tr>
                <tr><td>Re-Enter Password</td><td><input type="text" name="txtrepass"></td></tr>
                 <tr><td><input type="submit" name="submit" value="submit"></td>
                <td><input type="reset" name="Cancel" value="Cancel"></tr>
            </form>
    </body>
</html>
