<!DOCTYPE html>
<html>
   <head>
      <title>个人信息页面</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="./bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="./font-awesome-4.6.3/css/font-awesome.min.css">
 	  <script src="./jquery-2.0.0/jquery.min.js"></script>
 	  <script src="./bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
 	  
 	<style>
 	
 	.mycard
 	{
 		padding-top:10px;
 		color:#ffffff;
 		font-family:Microsoft YaHei;
 		font-size:16px;
 	
 		width:100%;
 		height:35px;
 	
 	}
 	.xian
 	{
 		width="100%";
 		height:1px;
 		background-color:#cccccc;
 	}
	 	.cuxian
 	{
 		width="100%";
 		height:10px;
 		background-color:#cccccc;
 	}
 	.personal
 	{
 		
 		
 		border-radius:4px;
 		text-align:center;
 		width:80%;
 		margin:auto;
 		height:25px;
 	}
 	
 	 	.shoucang
 	{
 		
 		background-color:white;
 		border-radius:4px;
 		text-align:center;
 		width:90%;
 		margin:auto;
 		height:40px;
 	}
 	
 	.bank
 	{
 		background-color:white;
 	
 		border-radius:4px;
 		color：white;
 		width:90%;
 		margin:auto;
 		height:80px;
 		position: relative;
 	
 	}

   

 	.img
 	{
 	width:32px;
 	height:32px;
 	left:10px;
 	top:5px;
 	position:absolute;
 	
 	}
 	
 	body
 	{
 	background-color:rgb(248,248,248);
 	}
 	</style>
 	</head>
 	
 	
 	<body>
 
 	<div style="background-color:#181818;">
  <div class="mycard" style="position:relative;"><i class="fa fa-angle-left fa-2x" aria-hidden="true" style="padding-left:10px;margin-top:-8px;"></i><span style="text-shadow:1px 1px 1px blue;position:absolute;left:173px;">个人信息</span></div>
 	<div class="xian"></div>
 
 	<div style="padding-top:30px;;text-align:center;"><span> <img src="./img/1.jpeg" class="img-circle" alt="Cinque Terre" width="70" height="70"> </span></div>
 
 	
 	<div class="personal" style="color:#cccccc;">
   <tr>
        <!--   <td ><i class="fa fa-user" aria-hidden="true"style="color:#cccccc"></i></td>-->
         <td style="font-family:Microsoft YaHei;padding-top:10px; ">姚莹</td>
      </tr>
      <br>
      <tr >
        <!--  <td><i class="fa fa-envelope" aria-hidden="true"style="color:#cccccc"></i></td>-->
         <td style="font-size:8px;font-family:Microsoft YaHei;padding-top:10px;">sa515064@mail.ustc.edu.cn</td>
      </tr>
 	</div> 	
<br>
  <div>
  <div class="cuxian"></div>
  </div>
  
 </div>
 	 <div class="mycard"style="text-align:left; padding-left:25px;color:rgb(54,53,67);font-size:12px;">我的银行卡<span  class="panel-group" id="accordion"><a id="test" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" ><i class="fa fa-plus" id="add" data-dis aria-hidden="true"style="float:right;padding-right:20px"></i></a></span></div>
 	<div class="xian"></div>
 	
    <div id="collapseOne" class="panel-collapse collapse ">
      <div class="panel-body">
        <form role="form">
 	 		<div class="form-group" style="position:relative;">
     		 <label for="name">添加银行</label>
  	  		 <select class="form-control" style="width:80%;">
        	 <option>招商银行</option>
       		 <option>中国建设银行</option>
        	 <option>平安银行</option>
       	 	 <option>光大银行</option>
        	 <option>中国农业银行</option>
     		 </select><button type="button" id="queren"class="btn btn-default" style="float:right;position:absolute;top:25px;right:10px;">确认</button>
		  </div>
		</form>
      </div>
    </div>
    
    <br>
 	<div class="bank"><img src="./img/zhaoshang.png" class="img"><p style="padding-top:5px;position:absolute;left:50px">招商银行</p><p style="padding-top:20px;position:absolute;left:50px;font-size:12px">信用卡</p>
    <p style="padding-top:40px;padding-left:-50px;position:absolute;left:100px;font-size:20px">**** **** **** 6975</p></div>
 <br>
 <div class="bank"><img src="./img/zhaoshang.png" class="img"><p style="padding-top:5px;position:absolute;left:50px">招商银行</p><p style="padding-top:20px;position:absolute;left:50px;font-size:12px">信用卡</p></div>









<br>
	
 	<table class="table table-bordered " style="background-color:white; border-left-color:white;border-right:none;text-align:center">
  <thead>
  <tbody>
    <tr width="100%" height=50px; >
     
      <td><i class="fa fa-heart fa-2x" aria-hidden="true" style="color:orange;"></i><p style="font-family:Microsoft YaHei;text-align:center">我的收藏</p></td>
      <td><i class="fa fa-eye fa-2x" aria-hidden="true" style="color:orange;"></i><p style="font-family:Microsoft YaHei">我的浏览</p></td>
    </tr>
 

  </tbody>
</table> 
 
 

 <script>
 $(document).ready(function(){
	 $("#queren").click(function(){
		 $('#test').click()
	 });
 });
 

 </script>
 	 
 	
 	</body>
 </html>