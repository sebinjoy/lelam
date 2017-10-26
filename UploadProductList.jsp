<%-- 
    Document   : UploadProductList
    Created on : Oct 9, 2017, 2:38:04 PM
    Author     : Nabeel NK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="FileUploadAction.jsp"  enctype="multipart/form-data" method="post">
            
            <input type="file" name="fileup">
            <input type="submit" name="sub" value="Submit">
            
        </form>
    </body>
</html>
