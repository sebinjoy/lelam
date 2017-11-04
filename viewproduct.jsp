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
    String pid=request.getParameter("pid");
    String date="";
    String str="select * from tbl_product where product_id="+pid;
    ResultSet ss=obj.select(str);
  while(ss.next())
  date=ss.getString("enddate");
  
String dateformat[]=date.split("-");
String year=dateformat[0];
String day=dateformat[2];
String month=dateformat[1];
String lastdate="";
String md="";
if(month.equals("1"))
{
    md="Jan";
}
else
if(month.equals("2"))
{
    md="Feb";
}
else
if(month.equals("3"))
{
    md="Mar";
}
else
if(month.equals("4"))
{
    md="Apl";
}
else
if(month.equals("5"))
{
    md="May";
}
else
if(month.equals("6"))
{
    md="Jun";
}
else
if(month.equals("7"))
{
    md="Jul";
}
else
if(month.equals("8"))
{
    md="Aug";
}
else
if(month.equals("9"))
{
    md="Sep";
}
else
if(month.equals("10"))
{
    md="Oct";
}
else
if(month.equals("11"))
{
    md="Nov";
}
else
if(month.equals("12"))
{
    md="Dec";
}
//Jan 5, 2018 15:37:25
lastdate=md+" "+day+", "+year;
out.print(lastdate);












   %>
    
   


<%
    
    
    // String buyer_fname="";
     if(request.getParameter("PlaceBid")!=null)
        { 
        pid=request.getParameter("hiddenpid");
        String buyer=session.getAttribute("uid").toString();
          String amt=request.getParameter("txtbid");
           str="insert into tbl_bidder(product_id,buyer_id,bid_date,bid_price,bid_status)values('"+pid+"','"+buyer+"',curdate(),'"+amt+"','0')";
           boolean b=obj.insert(str);
           if(b)
               out.print("success");
           else
               out.print(str);
        }
            %>



<%
   pid=request.getParameter("pid");
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
        <form>
            <input type="hidden" name="pid" value="<%=pid%>">
            
             <input type="hidden" name="hidden" id="hidate" value="<%=lastdate%>">
            
            
            
            
            


 <script>
// Set the date we're counting down to
var ld=document.getElementById("hidate").value;
var x="15:37:25";
var y=ld+"  "+x;
alert(y);
var countDownDate = new Date(" "+y+" ").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    // Find the distance between now an the count down date
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML = days + "d " + hours + "h "
    + minutes + "m " + seconds + "s ";
    
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "EXPIRED";
    }
}, 1000);
</script>


            
        <h1> </h1>
        <table align="center">
          <% 
              String minb="";
          ResultSet rs=obj.select("select * from tbl_product pp,tbl_category cat,tbl_seller sel where pp.cat_id=cat.cat_id and pp.seller_id=sel.seller_id and pp.product_id='"+pid+"'");
          while(rs.next())
          {
          %>  
          <tr><td colspan="2" align="center">  <img src="../Seller/Product/<%=rs.getString("product_image")%>" style="height:350px; width:350px;" align="center"></td></tr>
            
          <tr><td>Bidd Ends in<div id="demo" style="font-size: 24px"></div></td></tr>
          
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
                           <tr><td><input type="submit" value="PlaceBid" name="PlaceBid"></td></tr>
                       </table>
                   </div>
                           </form>
                           
             <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> view product</title>
        <script>
           
            </script>
        
        
        
        
        <style>
            .Mytable
            {
            border: solid;border-color: blue;border-collapse: collapse;
            }
            .MyTh
            {
                padding-left:20px;
                
            }
            .MyTd
            {
                padding-left:20px;
                border: solid;
            }
            
            
            table#customers {
    font-size:16px;
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    text-align: left;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2}

#customers th {
    padding-top: 11px;
    padding-bottom: 11px;
    background-color: #4CAF50;
    color: white;
}
            
            
            
            
        </style>
    </head>
 
    <body>
        
      <form>
          <table id="customers" >
              
              <tr >
                   <th class="MyTh">
                     Bidder
                  </th>
                 
                  <th class="MyTh">
                      bid date
                  </th>
                  <th class="MyTh">
                      bid_price
                  </th>
                  
                  
                  
                 
              </tr>
              <%
                 rs=obj.select("select * from tbl_bidder b inner join tbl_buyer bu on b.buyer_id=bu.buyer_id where b.product_id="+pid+" order by b.bid_price desc");
            while(rs.next())
                  { 
                  %>
                  <tr class="alt">
                     
                  <td class="MyTd"> <%=rs.getString("buyer_fname")%>  <%=rs.getString("buyer_lname")%>  </td>
                     
                      <td class="MyTd"><%=rs.getString("bid_date")%></td>
                      <td class="MyTd"><%=rs.getString("bid_price")%></td>
                      
                  </tr>
                  <%
                  }
                  %>
              
          </table>
      </form>                   
    </body>
</html>    
                           
                           
                   
    </body>
</html>
