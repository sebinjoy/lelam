<%-- 
    Document   : viewproduct
    Created on : Oct 23, 2017, 11:13:49 AM
    Author     : Nabeel NK
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj">
</jsp:useBean>


<%
    
    
    // String buyer_fname="";
     if(request.getParameter("submit")!=null)
        { 
                String product_id=request.getParameter("hiddenpid");

            
       // product_name=request.getParameter("");  
       // buyer_fname=request.getParameter("");
        
        
        
        String bid_price=request.getParameter("txtbid");
        
         ResultSet rsss=obj.select("select * from tbl_product pp,tbl_category cat,tbl_seller sel where pp.cat_id=cat.cat_id and pp.seller_id=sel.seller_id and pp.product_id='"+product_id+"'");
          while(rsss.next())
          {
        
           
          
                    
      // boolean b=obj.insert("insert into tbl_bidder(product_id,buyer_id,bid_date,bid_price,)"
                 //   + " VALUES('"+product_name+"','"+buyer_fname+"',CURDATE(),'"+bid_price+"')" );
            
        }
        }
            %>



<%
    String pid=request.getParameter("pid");
    String maxbid="";
    String s1="select count(*) as count from tbl_bidder where product_id="+pid;
    ResultSet r=obj.select(s1);
    if (r.next())
    {
       if(r.getString("count").equals("0"))
       {
           
           String str1="select product_price as max from tbl_product where product_id="+pid+"";  
            ResultSet r1=obj.select(str1);
             if (r1.next())
            {
                maxbid=r1.getString("max");
        
             }
               }
       else
       {
            String s2="select max(bid_price) as max from tbl_bidder where product_id="+pid+"";
    ResultSet r2=obj.select(s2);
    if (r2.next())
    {
       maxbid=r2.getString("max");
       }
           
       }
    }          
            
            

    %>

<!DOCTYPE html>
<html>
    <head>
        <script src="jquery.min.js" type="text/javascript"></script>
        <script>
            function hi()
            {
           $('#d').hide();
       }
         function sh()
            {
           $('#d').show();
       }
       function inc(x)
       {
         var a=document.getElementById('bids').value; 
         document.getElementById('bids').value=parseInt(a)+parseInt(x);
       }
            </script>
        <title>viewproduct</title>
    </head>
    <body onload="hi()">
        <h1> </h1>
        <table align="center">
          <% 
              String minb="";
          ResultSet rs=obj.select("select * from tbl_product pp,tbl_category cat,tbl_seller sel where pp.cat_id=cat.cat_id and pp.seller_id=sel.seller_id and pp.product_id='"+pid+"'");
          while(rs.next())
          {
          %>  
          <tr><td colspan="2" align="center">  <img src="../Seller/Product/<%=rs.getString("product_image")%>" style="height:350px; width:350px;" align="center"></td></tr>
            <tr><td>Product Name</td><td><%=rs.getString("product_name")%></td></tr>
             <tr><td>Product Description</td><td><%=rs.getString("product_desc")%></td></tr>
              <tr><td>Product Price</td><td><%=rs.getString("product_price")%></td></tr
              <tr>
              <tr> <td colspan="2" align="center"><input type="Button" name="Bid Now" value="Bid Now" onclick="sh();"></td></tr>
                                  <input type="hidden" value="<%=rs.getString("product_id")%>" name="hiddenpid">

        </table>
                   <%
                       minb=rs.getString("min_bid");
                   }
                   %>
   
                   <div id="d">
                       <table align="center">
                          
                           <tr><td>Bid Amount  <input type="text" id="bids" name="txtbid" value="<%=maxbid%>"></td>
                               <td><input type="button" value="+" onclick="inc(<%=minb%>)"></td></tr>
                           <tr><td><input type="submit" value="Place Bid" name="Place Bid"></td></tr>
                       </table>
                   </div>
                   
    </body>
</html>
