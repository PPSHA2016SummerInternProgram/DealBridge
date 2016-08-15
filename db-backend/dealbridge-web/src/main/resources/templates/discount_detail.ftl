<!DOCTYPE html>
<html>
   <head>
      <title>优惠详情页面</title>
      <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="/bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="/font-awesome-4.6.3/css/font-awesome.min.css">
 	  <script src="/jquery-2.0.0/jquery.min.js"></script>
 	  <script src="/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
 	   <link rel="stylesheet" type="text/css" href="/css/style.css" />
 	  
 	 

 	 <!--script>
 	 $(document).ready(function(){
 			setInterval(function(){
 				
 				$.get("/api/share/shared_times/${discount.discountId?c}",function(data,status){
 				$("#shareTime").html('分享量：'+data);
 				});
 			}, 3000);
 		});
 	 </script-->
 	 
	<script>
        $(document).ready(function(){
      		
 			 
            $(".share-box").click(function(){
            	console.log("进入分享选择框");
            	
            	var userId=${userId};
                var discountId = ${discount.discountId?c};
               
                $.post("/api/share", {user_id:userId, discount_id:discountId}, function(data, status, xhr){
                        if (status == "success") {
                                alert("successfully shared");
                                console.log("成功分享");
                        } else {
                                alert("failed to share");
                                 console.log("分享失败");
                        }
                })
            });
        });
   </script>
   
   	

 	
 	 
 	 
 	<style>
 	
 	.dingbu
 	{
 		padding-top:10px;
 		color:#181818;
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
 	font-family:Microsoft YaHei;
 			padding-left:10px;
 	font-size:14px;
 	color:#323232;
 	line-height:35px;
 	background-color:#f2f2f2;
 	border-bottom:1px solid #e2e2e2;
 	font-weight:700;
 	display:block;
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

   .detail
   {
  font-size:14px;
  color:#191919;
  padding:15px 10px 20px 10px;
 
  font-family:Microspft YaHei;
   
   }
   

 
 	
 	body
 	{
 	background-color:rgb(248,248,248);
 	margin:0px;
 	}
 	
 	.favorite
 	{
 	padding-top:5px;
 	position:absolute;
 	right:20px;
 	font-size:20px;
 	}
 	.heart-color
 	{
 	color:#ff5d1d;
 	}
 	#discount-title
 	{
 	
 	color:#000000;
 	padding-left:10px;
 	font-size:19px;
 	}
 	.content
 	{
 	position:absolute;
 	top:250px;
 	}
 	.shuxian
 	{
 	
 	float:right;
 	margin-right:60px;
 	height:30px;
 	background-color:rgb(220,220,220);
 	width:1px;
 	}
 	
 	.jump_box
 	{
 	display:none;
 	position:absolute;
 	margin:auto;
 	height:100px;
 	width:150px;
 	opacity:0.8;
 	background-color:rgb(50,50,50);
 	font-size:18px;
 	border-radius:5px;
 	text-align:center;
 	color:#ffffff;
 	left:120px;
 	padding-top:10px;
 	}
 	.pic
 	{
 	height:180px;
 	width:100%;
 	
 	padding-top:45px;
 	text-align:center;
 	}
 	.pic img
 	{
 	
 
 	height:180px;
 	width:100%;
 	margin:0px auto;
 	
 	
 
 	}
 
 	</style>
 	</head>
 	<body style="position:relative;">
	
	<div class="dingbu  navbar navbar-fixed-top" style="color:#333;background-color:rgb(248,248,248); "><i onclick="backFunction()" class="fa fa-angle-left fa-2x" aria-hidden="true" style="padding-left:10px;margin-top:-5px;"></i><span style="position:absolute;left:50px;">优惠详情</span><i class="fa fa-share-alt fa-1.5x share-btn " aria-hidden="true" style="position:absolute;right:20px;font-size:21px;color:#ccc;"></i></div>
	
	<div class="pic"><img src=${discount.img} ></img></div>

 
 
<div class="content">
<div id="discount-title" >【${discount.bankName}】${discount.summary}<p class="shuxian"></p><#if favoriteId??><i class="fa fa-heart favorite heart-color" data-dis="show" aria-hidden="true" ><#else><i class="fa fa-heart-o favorite" data-dis aria-hidden="true" ></#if></i></div>
<div class="detail">使用${discount.bankName}信用卡，${discount.description}</div>


<div class="twotag" style="height:38px;">
<div style="font-size:13px;color:rgb(130,130,130);padding-left:10px;float:right; padding-right:150px;">  <span>        点击量：<b>${discount.clickRate}</b></span></div>
<div style="font-size:13px;color:rgb(130,130,130);padding-left:10px;float:right; padding-right:100px;"><span >分享量：<b>${shareTime}</b></span> </div>
</div>
<!--弹出添加收藏成功-->
<div class="jump_box">
添加收藏成功！
<i class="fa fa-heart favorite heart-color" aria-hidden="true" style="position:absolute;left:25px;top:40px;"></i>
</div>
<div>
	<div class="cuxian" style="float:none;" >活动详情</div>
 	
 	<div><p style="padding-top:10px;padding-left:10px;font-family:Microsoft YaHei;color:orange;margin-bottom:5px;">适用地区：</p>
 	<p style="padding-left:10px;font-family:Microsoft YaHei;"><#if discount.area??>${discount.area}<#else>不限</#if></p>
 	
 	<div><p style="padding-top:10px;padding-left:10px;font-family:Microsoft YaHei;color:orange;margin-bottom:5px;">使用时间：</p>
 	<p style="padding-left:10px;font-family:Microsoft YaHei;"><#if discount.begintime??>${discount.begintime?date}<#else>不限</#if>至<#if discount.endtime??>${discount.endtime?date}<#else>不限</#if></p>
 	
 	<#if discount.discountUsage??>
 	<div><p style="padding-top:10px;padding-left:10px;font-family:Microsoft YaHei;color:orange;margin-bottom:5px;">使用规则：</p>
 	</#if>

</div>
</div>




 	<!-- 分享 -->
 	<div id="footer" style="border-radius: 0px;position:fixed;bottom: 0;z-index: 100;width: 100%; display:none;" class="footerbar">
<ul class="ui-navbar">
<li class="ui-block" style="width:100%;"> <a class="ui-btn-up-a share-btn">
<span class="ui-btn-inner" id="share">分享好友</span>
</a>
</li>
</ul>
</div>

<div class="share_box shar_box_center">
	<a href="http://service.weibo.com/share/share.php?title=微范名片&url=http://www.huayunkj.com" target="_blank">
		<img src="/img/sinaminiblog.png" />
		<br/><span>新浪微博</span>
	</a>
	<a href="http://share.v.t.qq.com/index.php?c=share&a=index&title=微范名片&url=http://www.huayunkj.com" target="_blank">
		<img src="/img/qqmb.png" />
		<br/><span>腾讯微博</span>
	</a>
	<a href="http://widget.renren.com/dialog/share/?resourceUrl=http://www.huayunkj.com&title=微范名片" target="_blank">
		<img src="/img/renren.png" />
		<br/><span>人人网</span>
	</a>
	<a href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http://www.huayunkj.com&title=微范名片" target="_blank">
		<img src="/img/qzone.png" />
		<br/><span>QQ空间</span>
	</a>
<div class="share-cancel-btn btn btn-block">取消</div>
</div>
<!--js必须要在此位置-->
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/share.js"></script>
<script>
$('[data-dis]').on('click', chooseFunction)
function chooseFunction()
{
	//$('#dis').toggleClass("fa fa-check-circle");
	var dis = $(this).attr('data-dis');
	if(dis === 'show'){
	
		$(this).attr('data-dis', 'hide')
		$(this).addClass("fa-heart-o");
		$(this).removeClass("fa-heart");
		var discountId=${discount.discountId?c};
		var userId=${userId};
				$.ajax({
					type: "POST",
					
					url:"/api/deleteFavorite",
					data:{userId:userId,discountId:discountId},
					traditional: true,
					success:function(){
						console.log("删除收藏成功");
						
						$(".jump_box").html('删除收藏成功！<i class="fa fa-heart-o favorite heart-color" aria-hidden="true" style="position:absolute;left:25px;top:40px;"></i>');
						$(".jump_box").show();
						setTimeout(function(){$(".jump_box").hide();},800);//2秒后执行该方法
					//	$(".jump_box").animate({bottom: "0px;",height:"60px",width:"100px"}, "1");
					//	$(".jump_box").animate({bottom: "0px;",height:"0px",width:"0px"}, "0");
					},
					
					error: function() {
						console.log("删除收藏失败");
						$(".jump_box").html("删除收藏失败");
						$(".jump_box").show();
						$(".jump_box").animate({bottom: "0px;",height:"-=30px",width:"-=50px"}, "slow");
						$(".jump_box").animate({bottom: "0px;",height:"0px",width:"0px"}, "1");
					},
				});
			
	}else{
		$(this).attr('data-dis', 'show')
		$(this).removeClass("fa-heart-o");
		$(this).addClass("fa-heart");
		$(this).addClass("heart-color");
		var userId=${userId};
		var discountId=${discount.discountId?c};
		console.log(discountId);
		console.log(userId);
			
	       		$.ajax({
					type: "POST",
					
					url:"/api/addFavorite",
					data:{userId:userId,discountId:discountId},
					traditional: true,
					success:function(){
						console.log("成功添加收藏");
						
						$(".jump_box").html('添加收藏成功！<i class="fa fa-heart favorite heart-color" aria-hidden="true" style="position:absolute;left:25px;top:40px;"></i>');
						$(".jump_box").show();
						setTimeout(function(){$(".jump_box").hide();},800);//2秒后执行该方法
						
					//	$(".jump_box").animate({bottom: "0px;",height:"100px",width:"150px"}, "0");
					//	$(".jump_box").animate({bottom: "0px;",height:"60px",width:"100px"}, "1");
					//	$(".jump_box").animate({bottom: "0px;",height:"0px",width:"0px"}, "0");
				
					},
					
					error: function() {
						console.log("添加收藏失败");
						$(".jump_box").html('添加收藏失败！');
						$(".jump_box").show();
						setTimeout(function(){$(".jump_box").hide();},800);//2秒后执行该方法
					},
				});
	}
	
}
</script>
 <script>
 	function backFunction() {
  		window.location.replace("/home/北京/${userId}");  <!-- go to previous page and reload the page -->
  	}

 	 </script>

 	</body>
 	</html>