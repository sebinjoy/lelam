
                    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose Profile Picture </title>
        <style>
             .MalyaliMarriage_logo
                {
                 padding:10px 15px;
                 }
                 .Propic
                 {
                     width:400px;
                     height: 400px;
                     border: solid #363636;
                     border-radius: 10px;
                     margin-left: 500px;
                     margin-top: 50px;
                 }
                  
  .regHead
  {
                       border-style:2px solid;
                       border-color: #363636;
                       border-radius:10px; 
                       padding: 5px 40px 5px 40px;
                       background-color:#ff0033;
                       
  }
    .registerhead
                       {
                           font-family:sans-serif ;font-size:24px;color:#ffffff;padding:20px 0px 10px 25px;
                      
                       }
                       .PropicCircle
                       {
                           width: 200px;
                           height: 200px;
                           margin-left: 100px;
                           margin-top: 50px;
                           border: solid;
                           border-radius: 100px;
                       }
                       .MySaveBtn
                       {
                           margin-left: 150px;
                           margin-top: 20px;
                           border-radius: 10px;
                           color:#FFFFFF;
                           background-color: #ff0033;
                           width: 100px;
                           height: 30px;
                       }
                       .MySaveBtn:hover
                       {
                            margin-left: 140px;
                           margin-top: 10px;
                           border-radius: 10px;
                           color:#FFFFFF;
                           background-color: #ff0033;
                           width: 120px;
                           height: 35px;
                           
                           box-shadow: #363636 5px 5px;
                           font-size: 20px;
                       }
        </style>
    </head>
    <body >
        <form action="FileUploadAction.jsp" enctype="multipart/form-data" method="post">
       <div style="width: 600px;height: 120px; background-color: #363636;margin-bottom: 10px;margin-left: 400px;border: solid #363636;border-radius: 10px;">
              <div class="MalyaliMarriage_logo" style="float:left;"> 
					

                  <img src="img/HWloggo.png" alt="HappyWedding" title="HappyWedding" width="120" height="100" >

				    </div> 
            <div    style="color:#ff0033; font-size:26px; margin:0px auto;float:left; margin:50px 0px 0px 25px;">Choose For Happy Marriages
         
            </div>
              </div>

           <div class="Propic">
               <br><label class="registerhead"><span class="regHead">Choose Your Profile Pic</span></label> 
               <div class="PropicCircle" >
                   <label for="propicxfile"><img id="proPic" style="width: 200px;height: 200px;border-radius: 100px" src="img/AddPropic.png"></label>
                  
                   <input type="file" name="propicxfile" id="propicxfile" style="display: none" onchange="working()" > 
               </div>
               <button class="MySaveBtn" class="Btn_Save" >Save</button>
         </div>
        </form>
       
  </body>
   <script>
  function working()
  {
      //alert("working");
      var selectImage=document.getElementById(propicxfile);
      var image=document.getElementById(proPic);
      
  }
 
   </script>
   
</html>
