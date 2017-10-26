<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>    
<%
String Subid=request.getParameter("id");


                                String str="select * from tbl_subcategory where cat_id='"+Subid+"'";
                                ResultSet rs=obj.select(str);
                                
                                %>
                                <option value="sel"> --select--</option>
                                
                                <%
                                while(rs.next())
                                    {
                                %>
                            
                           
                               <option value="<%= rs.getString("subcat_id")%>"> <%=rs.getString("subcat_name")%>
                                    
                                </option> 
                                <%
                                    }
                                %>
