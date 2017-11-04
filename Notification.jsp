<%-- 
    Document   : Notification
    Created on : Nov 2, 2017, 2:21:05 PM
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
        <title>JSP Page</title>
    </head>
    <body><form id="NotificationForm">
        <h1>Notification</h1>
        <table>
            <%
                String buyer_id=session.getAttribute("uid").toString();
                ResultSet rsnotification=obj.select("select * from tbl_bidder bid,tbl_product pp,tbl_seller sel where bid.bid_status='1' and bid.product_id=pp.product_id and pp.seller_id=sel.seller_id and bid.buyer_id='"+buyer_id+"' ");
                while(rsnotification.next())
                {
                %>
                <tr><td><%=rsnotification.getString("seller_fname")+" "+rsnotification.getString("seller_lname")%>
                        Accept Your Bid For The Product <i><%=rsnotification.getString("product_name")%></i> with Rupees=<%=rsnotification.getString("bid_price")%>/-
                         <span><input type="button" value="Paymet "> <input type="button" value="Cancel"></span>
                    </td></tr>
                <%
                    }
%>
        </table>
    </form>
         <script src="jquery.min.js" type="text/javascript"></script>
        
        <script>
            function SetAccept(v,h) 
    {
        
     alert(v); 
     alert(h);
    $.ajax({url: "Ajax_ProductAccept.jsp?pid="+v+"&bid="+h+"", success: function(result){
           alert(result);
     $("#NotificationForm").html(result);
    }});

        
        
    }
    
            </script>
    </body>
</html>
