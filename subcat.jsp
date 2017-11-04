<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.dbConnection"></jsp:useBean>
     <option value="">--select--</option>
        <%
            String id=request.getParameter("id");
        ResultSet RsSelCategory=obj.select("select * from tbl_subcategory where cat_id="+id);
        while(RsSelCategory.next())
        {
            
        
        %>
        
        
        <option value="<%=RsSelCategory.getString("subcat_id")%>"><%=RsSelCategory.getString("subcat_name")%></option>
        
        <%
            }
        
     %>
