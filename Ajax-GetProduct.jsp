
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>    
<%
String did=request.getParameter("id");
String ProductId="";
String catId=request.getParameter("cid");

                                String str="select * from tbl_product p where p.cat_id ="+catId+" and p.sub_id="+did;
                                ResultSet rs=obj.select(str);
                              
                                while(rs.next())
                                    {
                                        ProductId=rs.getString("product_id");
                                %>
  <div class="column">
    <div class="card">
        <img src="../Seller/Product/<%=rs.getString("product_image")%>" class="columnImage">
      <div class="container">
        <h2><%=rs.getString("product_name")%></h2>
        <p class="title"><label>Description  :</label></p>
        <p><label><%=rs.getString("product_desc")%></label> <label style="margin-left:  5px;">Price   :</label><label><%=rs.getString("product_price")%></label></p>
        
       
        <p><a href="viewproduct.jsp?pid=<%=ProductId%>"><input type="button" class="button" name="btn_submit" value="View"> </a></p>
      </div>
    </div>
  </div>
                           
                                <%
                                    }
                                %>
















