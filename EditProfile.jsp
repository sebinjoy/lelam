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
       String seller_fname=request.getParameter("txtfname");
       String seller_lname=request.getParameter("txtlname");
        String seller_address=request.getParameter("txtaddress");
         String seller_localplace=request.getParameter("txtplace");
         String seller_email=request.getParameter("txtemail");
          String seller_username=request.getParameter("txtusername");
          String seller_password=request.getParameter("txtpwd");
          
          String place_id=request.getParameter("placeid");
          
           
          
           //String inse="insert into tbl_buyer(seller_fname,seller_lname,seller_address,seller_localplace,seller_email,seller_username,seller_password,seller_ccnumber) values('"+seller_fname+"','"+seller_lname+"','"+seller_address+"','"+seller_localplace+"','"+seller_email+"','"+seller_username+"','"+seller_password+"','"+seller_ccnumber+"')";          
            boolean b=obj.insert("update into tbl_seller(seller_fname,seller_lname,seller_address,place_id,seller_localplace,seller_email,seller_username,seller_password)"
                    + " VALUES('"+seller_fname+"','"+seller_lname+"','"+seller_address+"','"+place_id+"','"+seller_localplace+"','"+seller_email+"','"+seller_username+"','"+seller_password+"')" );
            //out.println(inse);
        }
            %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Seller Registration</h1>
        <table align="center">
            <form>
                <tr><td>First Name</td><td><input type="text" name="txtfname"></td></tr>
                <tr><td>Last Name</td><td><input type="text" name="txtlname"></td></tr>
                <tr><td>Address</td><td><textarea name="txtaddress"></textarea></td></tr>
                <tr><td> District </td> <td><select name="selDistrict" onchange="getPlace(this.value)">
                            <option value="sel">----SELECT----</option>
                            
                                <%
                                     String district="";
                                    String selects = "select * from tbl_district"; 
                                    ResultSet rs=obj.select(selects);
                                    while(rs.next())
                                    {
                                %>
                                        <option value="<%=rs.getString("district_id")%>"
                                        <%
                                        if (district.equalsIgnoreCase(rs.getString("district_id")))
                                        {
                                        %>
                                            selected="selected" 
                                         <%
                                        }
                                        %> 
                                        >
                                        <%=rs.getString("district_name")%>
                                        </option>
                                <%
                                    }
                                %> 
                                </select>
                    </td>  </tr>
                <tr><td>place</td><td>   <select id="placeSel" name="placeid">    <option>----SELECT----</option>
            </select></td></tr>            
                        

                <tr><td>Local Place</td><td><input type="text" name="txtplace"></td></tr>
                <tr><td>Email</td><td><input type="text" name="txtemail"></td></tr>
                <tr><td>User Name</td><td><input type="text" name="txtusername"></td></tr>
                <tr><td>Password</td><td><input type="text" name="txtpwd"></td></tr>
                <tr><td>Re Enter-Password</td><td><input type="text" name="txtpwd"></td></tr>
                
                <tr><td><input type="submit" name="submit" value="submit"></td>
                <td><input type="reset" name="Cancel" value="Cancel"></tr>
            </form>
            
        </table>
                              <script src="jquery.min.js" type="text/javascript"></script>
        
        <script>
            function getPlace(v) 
    {
        
     alert(v);  
    $.ajax({url: "Ajax_place.jsp?id="+v, success: function(result){
            //alert(result);
        $("#placeSel").html(result);
    }});

        
        
    }
            </script>
        
    </body>
    
      
</html>
