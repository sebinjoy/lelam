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
       String buyer_fname=request.getParameter("txtfname");
       String buyer_lname=request.getParameter("txtlname");
        String buyer_address=request.getParameter("txtaddress");
         String buyer_localplace=request.getParameter("txtplace");
         String buyer_email=request.getParameter("txtemail");
          String buyer_username=request.getParameter("txtusername");
          String buyer_password=request.getParameter("txtpwd");
          String buyer_ccnumber=request.getParameter("txtccnumber");
          String place_id=request.getParameter("placeid");
          String District_id=request.getParameter("selDistrict");
           
          
           //String inse="insert into tbl_buyer(buyer_fname,buyer_lname,buyer_address,buyer_localplace,buyer_email,buyer_username,buyer_password,buyer_ccnumber) values('"+buyer_fname+"','"+buyer_lname+"','"+buyer_address+"','"+buyer_localplace+"','"+buyer_email+"','"+buyer_username+"','"+buyer_password+"','"+buyer_ccnumber+"')";          
            boolean b=obj.insert("insert into tbl_buyer(buyer_fname,buyer_lname,buyer_address,place_id,buyer_localplace,buyer_email,buyer_username,buyer_password,buyer_ccnumber)"
                    + " VALUES('"+buyer_fname+"','"+buyer_lname+"','"+buyer_address+"','"+place_id+"','"+buyer_localplace+"','"+buyer_email+"','"+buyer_username+"','"+buyer_password+"','"+buyer_ccnumber+"')" );
            //out.println(inse);
            out.print(true);
        }
            %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Buyer registration</h1>
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
                <tr><td>Credit card Number</td><td><input type="text" name="txtccnumber"></td></tr>
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
