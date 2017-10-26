<%-- 
    Document   : SubCategoryDetails
    Created on : Sep 25, 2017, 11:49:39 AM
    Author     : Nabeel NK
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<jsp:useBean class="db.dbConnection" id="obj">
</jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lelam::SubCategoryDetails</title>
    </head>

    
    <%
        
        String subcatid="";
        String subcatname="";
        String category="";
        
        if(request.getParameter("pid")!=null)
        { 
            String sel = "select * from tbl_subcategory where subcat_id='"+request.getParameter("pid")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                subcatid=rs1.getString("subcat_id");
                subcatname=rs1.getString("subcat_name");
                category=rs1.getString("cat_id");
            }
        }
        if(request.getParameter("pname")!=null)
        {
            String delete = "delete from tbl_subcategory where subcat_name='"+request.getParameter("pname")+"' ";
            obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
                Sub Category Details
            </h3>
        </center>
        <form>
            <input type="hidden" name="hid" value="<%=subcatid%>" >
            <table align="center" border="1">                
                <tr>
                    <td>
                        CategoryName
                    </td>
                    <td>
                        <select name="cat">
                            <option>----SELECT----</option>
                            
                                <%
                                    String selects = "select * from tbl_category"; 
                                    ResultSet rs2=obj.select(selects);
                                    while(rs2.next())
                                    {
                                %>
                                        <option value="<%=rs2.getString("cat_id")%>"
                                        <%
                                        if (category.equalsIgnoreCase(rs2.getString("cat_id")))
                                        {
                                        %>
                                            selected="selected" 
                                         <%
                                        }
                                        %> 
                                        >
                                        <%=rs2.getString("cat_name")%>
                                        </option>
                                <%
                                    }
                                %> 
                                
                                
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        SubCategoryName
                    </td>
                    <td>
                        <input type="text" name="txt_subcat" value="<%=subcatname%>" required="">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Submit">                
                        <input type="reset" name="cancel" value="Cancel">
                    </td>
                </tr>
            </table>  <br><br>             
        </form>

                        
<%

    String subcat="";
    String cat_name="";
    
    if(request.getParameter("submit")!=null)
    {       
        subcat=request.getParameter("txt_subcat");  
        cat_name=request.getParameter("cat");
        
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_subcategory set subcat_name='"+subcat+"' where subcat_id='"+request.getParameter("hid")+"'";
            boolean b=obj.insert(update);
        }
        else
        {
            String insert="insert into tbl_subcategory(subcat_name,cat_id) values('"+subcat+"','"+cat_name+"')";  
            out.println(insert);
            boolean b=obj.insert(insert);
        }       
        response.sendRedirect("SubCategoryDetails.jsp"); 
    }  
    
%> 


        <table align="center" border="1">
            <tr>               
                <td>
                    Category
                </td>
                <td>
                    SubCategory
                </td>
            </tr>
           
            
            <%    
    
                String sel = "select * from tbl_category c,tbl_subcategory s where c.cat_id=s.cat_id";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
            
            
            <tr>
                <td>
                    <%=rs.getString("cat_name")%>
                </td>
                <td>
                    <%=rs.getString("subcat_name")%>
                </td>
                <td>
                    <a href="SubCategoryDetails.jsp?pid=<%=rs.getString("subcat_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>
                </td> 
                <td>
                    <a href="SubCategoryDetails.jsp?pname=<%=rs.getString("subcat_name")%>"><img src="Icon/Delete.png" width="40" height="30"></a>
                </td>
            </tr>
            
            
            <%
            
                }
                
            %>
            
            
        </table><br><br>
        <center>
            <a href="HomePage.jsp">Home</a> 
        </center>
    </body>
</html>