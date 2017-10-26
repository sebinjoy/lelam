<%-- 
    Document   : BuyerReg
    Created on : Sep 25, 2017, 2:56:01 PM
    Author     : Nabeel NK
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj">
</jsp:useBean>
<!DOCTYPE html>
<%
 if(request.getParameter("submit")!=null)
        { 
       String product_name=request.getParameter("txtname");
       String product_desc=request.getParameter("txtdesc");
        String product_price=request.getParameter("txtprice");
         //String product_image=request.getParameter("txtpic");
         String cat_id=request.getParameter("selcat");
          String seller_id=request.getParameter("selcat");
           String min_bid=request.getParameter("txtminprice");
          
       
          
           
            boolean b=obj.insert("insert into tbl_product(cat_id,seller_id,product_name,product_desc,product_price,min_bid)"
                    + " VALUES('"+cat_id+"','"+seller_id+"','"+product_name+"','"+product_desc+"','"+product_price+"','"+min_bid+"')" );
           if(b)
           {
               response.sendRedirect("UploadProductList.jsp");
           }
        }
            %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
    </head>
    <body>
        <h1 align="center">product</h1>
         <form >
        <table align="center">
           
                
                <tr><td> Category </td> <td><select name="selcat" onchange="getSubCate(this.value)">
                            <option value="sel">----SELECT----</option>
                            
                                <%
                                     String district="";
                                    String selects = "select * from tbl_category"; 
                                    ResultSet rs=obj.select(selects);
                                    while(rs.next())
                                    {
                                %>
                                        <option value="<%=rs.getString("cat_id")%>">
                                        
                                        <%=rs.getString("cat_name")%>
                                        </option>
                                <%
                                    }
                                %> 
                                
                                
                                  </select>
                    </td>  </tr>
                <tr><td>Sub category</td><td>   <select id="SelSubcat" name="placeid"><option>----SELECT----</option>
            </select></td></tr>  
                                
                    </td>  </tr>
                <tr><td>Product Name</td><td><input type="text" name="txtname"></td></tr>
                
                <tr><td>Description</td><td><textarea name="txtdesc"></textarea></td></tr>
                 <tr><td>price</td><td><input type="text" name="txtprice"></td></tr>
                  <tr><td>Minimum Bid price</td><td><input type="text" name="txtminprice"></td></tr>
                 
                  <tr><td><input type="submit" name="submit" value="submit"></td>
                <td><input type="reset" name="Cancel" value="Cancel"></tr>       
            
        </table> 
            </form>                        
                                
                                
     
                                
                                <script src="jquery.min.js" type="text/javascript"></script>
        
        <script>
            function getSubCate(v) 
    {
        
     alert(v);  
    $.ajax({url: "Ajax_subCategory.jsp?id="+v, success: function(result){
           alert(result);
        $("#SelSubcat").html(result);
    }});

        
        
    }
    
            </script>
                                
    </body> 
    
    
    
    
</html>
