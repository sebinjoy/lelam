
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
     //request.getParameter("userid");
            String field_name="";
            FileItem f_item=null;
            String file_name="";
            File savedFile=null;
            String fn="";
            String e= "";
            
            //String usid=session.getAttribute("loginIdU").toString();
          //  String famid=session.getAttribute("loginIdF").toString();

            String field[] = new String[30];
            String value[]=new String[30];
            //String famid=session.getAttribute("loginNameF").toString();
            
//checking if request cotains multipart data
            boolean isMultipart=ServletFileUpload.isMultipartContent(request);
out.println(isMultipart);
            if(isMultipart)
            {
                FileItemFactory factory=new DiskFileItemFactory();
                ServletFileUpload upload=new ServletFileUpload(factory);

//declaring a list of form fields
                
                List items_list=null;

//assigning fields to list 'items_list'
                try
                {
                    items_list=upload.parseRequest(request);
                }
                catch(FileUploadException ex)
                {
                    out.println(ex);
                }

//declaring iterator
                Iterator itr=items_list.iterator();
                int k=0;
//iterating through the list 'items_list'
                while(itr.hasNext())
                {
//typecasting next element in items_list as fileitem
                    f_item=(FileItem)itr.next();

//checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
                    if(f_item.isFormField())
                    {
          
//getting fieldname and value
                        field[k]=f_item.getFieldName();
                        value[k]=f_item.getString();
                        System.out.println(k+" "+field[k]+" "+value[k]);
                        k++;
                    }
                    else
                    {
//f_item=(FileItem)itr.next();
           
                        file_name=f_item.getName();
                        field_name=f_item.getFieldName();
//System.out.println("file "+file_name);
//if(file_name!=null && !file_name.equals("")){
           
                       
                        {
                            System.out.println(field_name);
                            String ext=file_name.substring(file_name.lastIndexOf("."));
//setting path to store image
                            File proj_path=new File(config.getServletContext().getRealPath("/"));
                            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Seller\\Product\\";
                            Random r=new Random();
                            int r_num=r.nextInt(1111)+999;
                            fn="IMG_"+r_num+ext;
                            System.out.println(fn);
//creating a file object
                            savedFile=new File(file_path+fn);
                            try
                            {
//writing the file object
                                f_item.write(savedFile);               
                
                            }
                            catch(Exception ex)
                            {
                                out.println(ex);
                            }
                        }
//}
   
                    }
           
                }
       
/*  //Strinh str1="insert into tbl_user ()";
String ins="";
if(value[4].equals("")){
ins="insert into tbl_subject(syllabus,subject_name,dept_id,course_id,semester_id) values('"+fn+"','"+value[0]+"','"+value[1]+"','"+value[2]+"','"+value[3]+"')";
}
else if(fn!=null&& !fn.equals("")){
ins="update tbl_subject set subject_name='"+value[0]+"',dept_id='"+value[1]+"',course_id='"+value[2]+"',semester_id='"+value[3]+"',syllabus='"+fn+"' where subject_id='"+value[4]+"'";
}
else{
ins="update tbl_subject set subject_name='"+value[0]+"',dept_id='"+value[1]+"',course_id='"+value[2]+"',semester_id='"+value[3]+"' where subject_id='"+value[4]+"'";
}
*/
 
// Main m = new Main();
// m.writeBlob(1, savedFile+"");
                
String id="";
String insq="select ifnull(max(product_id),1) as product_id from tbl_product";
System.out.println(insq);
ResultSet rs=obj.select(insq);
       if(rs.next())
       {
        id=rs.getString("product_id");
       }


                boolean b1=obj.insert("update tbl_product set product_image='"+fn+"' where product_id='"+id+"' ");
                    if(b1==true)
                    {
                  out.print("success");
                    } 
                }
          

                    %>