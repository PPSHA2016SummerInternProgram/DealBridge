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

 	 <script>
 	 $(document).ready(function(){
 			setInterval(function(){
 				$.get("/api/share/shared_times/${discount.discountId?c}",function(data,status){
 				$("#shareTime").html('分享量：'+data);
 				});
 			}, 3000);
 		});
 	 </script>
 	 
 	<script>
        $(document).ready(function(){
            $(".share-btn").click(function(){
                var discountId = ${discount.discountId?c};
                $.post("/api/share", {user_id:0, discount_id:discountId}, function(data, status, xhr){
                        if (status == "success") {
                                alert("successfully shared");
                        } else {
                                alert("failed to share");
                        }
                })
            });
        });
   </script>
   
   	<script>
        $(document).ready(function(){
       		$('[data-dis]').click(function(){
       			var discountId=${discount.discountId?c};
       			$.post("api/favorite",{user_id:0,discount_id:discountId},function(data,status,xhr){
       				if(status=="success"){
       					alert("successfully favorite");
       				}else
       				{
       					alert("fail to favorite");
       					
       				}
       			})
       		});
        });
   </script>

 	 <script>
 		 function backFunction()
 		 {
 			 window.history.back();
 		 }
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
  color:rgb(130,130,130);
  padding:10px 10px 20px 10px;
  
  font-family:Microspft YaHei;
   
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
 	color:orange;
 	}
 	
 	</style>
 	</head>
 	</body>
<div class="div1">	
<div class="dingbu" style="position:fixed;color:#333"><i onclick="backFunction()" class="fa fa-angle-left fa-2x" aria-hidden="true" style="padding-left:10px;margin-top:-5px;"></i><span style="position:absolute;left:50px;">优惠详情</span><i class="fa fa-share-alt fa-1.5x share-btn " aria-hidden="true" style="position:absolute;right:20px;font-size:22px;"></i></div>
 	<div><img src=${discount.img} width="100%" height=225 style="position:absolute;top:45px;"></img></div>
 </div>
 
 
 <div class="div2">	
<div class="cuxian" style="padding-top:275px;">${discount.summary}<i class="fa fa-heart-o favorite" data-dis aria-hidden="true" ></i></div>
<div class="detail">
${discount.description}
</div>

</div>


</div class="div3">
<div style="font-size:13px;color:rgb(130,130,130);padding-left:10px;"><span >分享量：<b>${shareTime}</b></span> <span>点赞数：<b>${discount.clickRate}</b></span></div>
<br>

 	<div class="cuxian" >活动详情</div>
 
 	

 	
 	<div><p style="padding-top:10px;padding-left:10px;font-family:Microsoft YaHei;color:orange;margin-bottom:5px;">适用地区：</p>
 	<p style="padding-left:10px;font-family:Microsoft YaHei;"><#if discount.area??>${discount.area}<#else>不限</#if></p>
 	
 	<div><p style="padding-top:10px;padding-left:10px;font-family:Microsoft YaHei;color:orange;margin-bottom:5px;">使用时间：</p>
 	<p style="padding-left:10px;font-family:Microsoft YaHei;"><#if discount.begintime??>${discount.begintime?date}<#else>不限</#if>至<#if discount.endtime??>${discount.endtime?date}<#else>不限</#if></p>
 	
 	<#if discount.discountUsage??>
 	<div><p style="padding-top:10px;padding-left:10px;font-family:Microsoft YaHei;color:orange;margin-bottom:5px;">使用规则：</p>
 	</#if>
 
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
	}else{
		$(this).attr('data-dis', 'show')
		$(this).removeClass("fa-heart-o");
		$(this).addClass("fa-heart");
		$(this).addClass("heart-color");
		var discountId=${discount.discountId?c};
       		
	}
	
}
</script>

 	</body>
 	</html>