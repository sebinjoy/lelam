<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>    
<%
String did=request.getParameter("id");

                                String str="select * from tbl_place where district_id="+did;
                                ResultSet rs=obj.select(str);
                                %>
                                <option value="sel"> --select--</option>
                                
                                <%
                                while(rs.next())
                                    {
                                %>
                            
                           
                               <option value="<%= rs.getString("place_id")%>"> <%=rs.getString("place_name")%>
                                    
                                </option> 
                                <%
                                    }
                                %>
