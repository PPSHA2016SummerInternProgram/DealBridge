<!DOCTYPE html>
<html>
   <head>
      <title>个人信息页面</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="/bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="/font-awesome-4.6.3/css/font-awesome.min.css">
 	  <script src="/jquery-2.0.0/jquery.min.js"></script>
 	  <script src="/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
 	  
 	<style>
 	
 	#user-dropdown-button {
 		position: relative;
	    left: 250px;
	    font-size: small;
	    top: -7px;
	    background-color: #181818;
	    border: transparent;
	    font-family:Microsoft YaHei;
 	}
 	
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
 		margin:20px auto 0px;
 	
 	}

   

 	.img
 	{
 	width:32px;
 	height:32px;
 	left:10px;
 	top:25px;
 	position:absolute;
 	
 	}
 	
 	body
 	{
 	background-color:rgb(248,248,248);
 	}
 	
 	a{ color:#333; /*无链接时颜色*/ } 

 	</style>
 	</head>
 	
 	
 	<body>
 
 	<div style="background-color:#181818; ">
      <div class="mycard" style="position:relative;">
        <i onclick="backFunction()" class="fa fa-angle-left fa-2x" aria-hidden="true" style="padding-left:10px;margin-top:-8px;"></i>
        <span style="text-shadow:1px 1px 1px blue;position:absolute;left:150px;top:6px">个人信息</span>
        <button type="button" class="dropdown-toggle" id="user-dropdown-button" data-toggle="dropdown">
           ${ufi.userName}
          <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="user-dropdown-button">
	      <li role="presentation" class="user-li" userId=1>
	         <a role="menuitem"  href="#">yao</a>
	      </li>
	      <li role="presentation" class="user-li" userId=2>
	         <a role="menuitem"  href="#">flemming</a>
	      </li>
	      <li role="presentation" class="user-li" userId=3>
	         <a role="menuitem"  href="#">aby</a>
	      </li>
	      <li role="presentation" class="user-li" userId=4>
	         <a role="menuitem"  href="#">tianshu</a>
	      </li>
   		</ul>
   		
      </div>
 	
 	  <div class="xian">
      </div>
 
 	  <div style="padding-top:30px;;text-align:center;">
 	    <span> <img src="/img/user_pic.jpeg" class="img-circle" alt="Cinque Terre" width="70" height="70"> </span>
 	  </div>
 
 	
 	  <div class="personal" style="color:#cccccc;">
        <tr>
          <td style="font-family:Microsoft YaHei;padding-top:10px; ">${ufi.userName}</td>
        </tr>
        <br>
        <tr >
          <td style="font-size:10px;font-family:Microsoft YaHei;padding-top:10px;">${ufi.email}</td>
        </tr>
 	  </div> 	
      
      <br>
    <div>
  
  <div class="cuxian"></div>
  </div>
  
 </div>
 	 <div class="mycard"style="text-align:left; padding-left:25px;color:rgb(54,53,67);font-size:13px;">我的银行卡</div>
 	<div class="xian"></div>
 	
 	
 	
 	<div class='card-list'>

 	<div class='bank-template' style="display:none;"><div class="bank "><img src="/img/bank/上海银行.png" id="bank-img" class="img"><p style="padding-top:30px;position:absolute;left:50px" class="bankName"></p><p style="padding-top:30px;position:absolute;left:120px;">信用卡</p>
    <p style="padding-top:40px;padding-left:-50px;position:absolute;left:100px;font-size:20px" class="cardNumber"></p></div>
	</div>
	<#list ufi.bankList as bankItem>
	 	<div class="bank" ><img src="${bankItem.bankImg}" class="img" >
	 	<p style="padding-top:30px;position:absolute;left:50px">${bankItem.bankOfficial} 信用卡</p>
	    </div>
	</#list>
</div>



 <div class="bank"><i style="position:absolute;left:15px;top:25px;color:#555"class="fa fa-credit-card fa-2x" aria-hidden="true"></i><p style="padding-top:30px;position:absolute;left:60px">

 <span  class="panel-group" id="accordion2">
 <a id="test2" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2" style="text-decoration:none;" >添加银行卡</a></span></p></div>
    <div id="collapseOne2" class="panel-collapse collapse ">
      <div class="panel-body">
        <form role="form">
 	 		<div class="form-group" style="position:relative;">
     		 <label for="name">添加银行</label>
     		 
  	  		 <select class="form-control" onchange="changeImg()" id="select_id" style="width:80%;">
  	  		 <#list bankList as bl>
  	  		 <option value="${bl.bankImg}">${bl.bankOfficial}</option>
  	  		 </#list>
     		 </select><button type="button" id="queren2"class="btn btn-default" style="float:right;position:absolute;top:25px;right:10px;">确认</button>
		  </div>
		</form>
      </div>
    </div>

<div style="height:150px;">
</div>
<br>
	
 	<table class="table table-bordered " style="background-color:white; border-left-color:white;border-right:none;text-align:center;position:fixed;bottom:0px;margin-bottom:0px;">
  <thead>
  <tbody>
    <tr width="100%" height=50px; >
     
      <td onclick=location.href="/favorite/${userId}"><i class="fa fa-heart fa-2x" aria-hidden="true" style="color:orange;"></i><p style="font-family:Microsoft YaHei;text-align:center">我的收藏</p></td>
      <td><i class="fa fa-eye fa-2x" aria-hidden="true" style="color:orange;"></i><p style="font-family:Microsoft YaHei">我的浏览</p></td>
    </tr>
 

  </tbody>
</table> 
 
 

 <script>
 	$(".user-li").click(function(){
 		var userId = $(this).attr("userId");
 		console.log("switch to user: " + userId);
 		$.ajax({
 			type: "POST",
 			url: "/api/login",
 			data: {"userId": userId},
 			success: function() {
 				location.reload();
 			},
 		});
 	});
 
 
 $(document).ready(function(){
	 $("#queren2").click(function(){
		
			var checkText=$("#select_id").find("option:selected").text();
			console.log(checkText);
		var element = $($('.bank-template').html());
		element.find('.bankName').html(checkText);
		$('.card-list').append(element);
		//给后台发请求添加银行卡
		$.ajax({
 			type: "PUT",
 			url: "/api/userbankcard/${userId}",
 			data: {"bankName": checkText},
 			error: function() {
				console.log("add bank name error");
			},
 		});
		
			 $('#test2').click();
	 });
 });
 

 </script>
 
 <script>
  	function backFunction() {
  		window.history.back();
  	}

 	function changeImg(){
 		var bank = document.getElementById('select_id');
 		var path = bank.value;
 		document.getElementById('bank-img').src = path;
 	}
 	
 </script>
 
 <!--script>
 	function addBankCard(){
 		console.log('333');
 		var bankName2 = $('[bank-name]');
 		console.log(bankName2);
 		$.ajax({
 			type: "PUT",
 			url: "/api/userbankcard/${userId}",
 			data: {"bankName": bankName2},
 			error: function() {
				console.log("add bank name error");
			},
 		});
 	}
 </script-->
 	   
 </body>
 </html>