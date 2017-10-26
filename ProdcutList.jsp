 <%-- 
    Document   : ProdcutList
    Created on : Oct 9, 2017, 3:04:31 PM
    Author     : Nabeel NK
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj">
</jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewproduct</title>
        <style>
            
            html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 22%;
  margin-bottom: 16px;
  padding: 0 8px;
  margin-left: 10px;

  
}
.columnImage
{
    width: 80%;
    //border-radius: 50%;
    border: solid;
    border-color: #FFFFFF;
    margin-left:20px;
    margin-right: 20px;
    height:  50%;
    margin-top: 10px;
    cursor: pointer;
    
}

@media (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 #363636;
 // border-radius: 20px;
 // border: solid;
 // border-color: #363636;
  height: 400px;
  background: #f5f5f5;
}
.card:hover
{
  box-shadow: 0 4px 8px 0 #363636;  
  background: #FFFFFF;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: solid;
  border-radius: 10px;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;

  width: 100%;
}

.button:hover {
  background-color: #555;
}
            
        </style>
            
    </head>
    <body>
        <h1>Product</h1>
        <label>Select Category</label>  
        <select onchange="getProduct(this.value)" >
            <option>--select--</option>
        <%
        ResultSet RsSelCategory=obj.select("select * from tbl_category");
        while(RsSelCategory.next())
        {
            
        
        %>
        
        
        <option value="<%=RsSelCategory.getString("cat_id")%>"><%=RsSelCategory.getString("cat_name")%></option>
        
        <%
            }
        
     %>
        
        </select>
     <form id="rsultform" style="width: 1200px">
         
     </form>
     
      <script src="jquery.min.js" type="text/javascript"></script>
        
        <script>
            function getProduct(v) 
    {
        
   //  alert(v);  
    $.ajax({url: "Ajax-GetProduct.jsp?id="+v, success: function(result){
          //  alert(result);
        $("#rsultform").html(result);
    }});

        
        
    }
            </script>
     
    </body>
</html>
