<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>DealBridge Home Page</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/css/homepage.css">
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<style>
			#header-text{background-color:#1ABC9C;}		
		</style>
		
		<script>
			var startIndex = 5;
			$(window).scroll(function() {
				if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
					if($('#loading-panel').is(":visible") == false){
						$('#loading-panel').show();
						window.setTimeout(function(){
							appendDiscount(startIndex, 5);
							startIndex += 5;
						}, 1000);
					}
				}
			});
		</script>
			
		<script>
			function appendDiscount(startIndex, limitNumber) {
				$.getJSON("/api/recommend/2", {startIndex:startIndex, limitNumber:limitNumber}, function(result){
					for (i in result) {
						console.log(result[i]);
						$('#recommend-content').append('<tr><td width="40%"><img src="' + 
							result[i].img + 
							'" class="img-thumbnail top_pic"></td><td width="60%">' + 
							'<h4>' + 
							result[i].summary +
							'</h4>' +
							result[i].description + 
							'</td></tr>');
					}
					$('#loading-panel').hide();
				});
			}
			
		</script>
		
		<script>
			$(document).ready(function(){
				$('#loading-panel').show();
				appendDiscount(0, 5);
			});
		</script>
		
	</head>
	
	<body style="padding-top: 60px;">
	
	<!--Navgation Bar-->
    <div class="navbar-fixed-top" style="height:50px;background-color:#34495E;">
	
		<div class="container" style="padding-top:15px;height:30px;">
        
			<div style="height:auto;float:left;">
			  <a href="http://m.dianping.com/citylist"><p style="font-family:黑体;font-size:16px;color:#FFFFFF;">上海</p></a>
			</div>
			
			<div style="height:auto;float:right;position: relative;">
				<span class="glyphicon glyphicon-search" aria-hidden="true" style="
					position: absolute;
					left: 8px;
					top: 3.5px;
					">
				</span>
				<font face="黑体">
					<input type="text" placeholder="输入银行、城市" style="border-radius:20px;border:none;width: 200px;padding-left: 30px;transition: 0.3s ease-out;">
				</font>
				<a style="padding-left:9px;padding-right:9px;color:#FFFFFF;font-size:16px;"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
			</div>
		
		</div>
	  
    </div>
	


	


	<div class="row text-center">
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <i class="fa fa-cutlery fa-2x" aria-hidden="true"></i>
		  <p>美食</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <i class="fa fa-film fa-2x" aria-hidden="true"></i>
		  <p>电影</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <i class="fa fa-bed fa-2x" aria-hidden="true"></i>
		  <p>酒店</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
          <i class="fa fa-book fa-2x" aria-hidden="true"></i>
		  <p>阅读</p>
		</div>


		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
          <i class="fa fa-bus fa-2x" aria-hidden="true"></i>
		  <p>交通</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
          <i class="fa fa-bicycle fa-2x" aria-hidden="true"></i>
		  <p>健身</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
          <i class="fa fa-glass fa-2x" aria-hidden="true"></i>
		  <p>饮品</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
          <i class="fa fa-plane fa-2x" aria-hidden="true"></i>
		  <p>旅游</p>
		</div>
	</div>
	
	<!--Hot Discount-->
	<div id="header-text" class="panel-heading">
		<h3 class="panel-title">
		<font color="#FFFFFF" size="4" face="黑体">
			当前热门
		</font>
		</h3>
	</div>
	
	<div id="myCarousel" class="carousel slide">
	   <!-- 轮播（Carousel）指标 -->
	   <ol class="carousel-indicators">
	      <#list hots as hot>
	          <li data-target="#myCarousel" href="../discount/0" data-slide-to="${hot_index}" <#if hot_index == 0>class="active"</#if>>
	          </li>
	      </#list>
	   </ol>   
	   <!-- 轮播（Carousel）项目 -->
	   <div class="carousel-inner">
	      <#list hots as hot>
	      	 <div class=<#if hot_index == 0>"item active"<#else>"item"</#if>>
			 	<a href="http://localhost:9000/discount/${hot.discountId}"><img src="${hot.img}" class="center-block" style="width:100%;height:200px;"></a>
			 	<div class="carousel-bg"></div>
			 	<div class="carousel-caption"><font color="#FFFFFF" face="黑体">${hot.summary}</font></div>
		  	 </div>
	      </#list>
	   </div>
	   <!-- 轮播（Carousel）导航 -->
	   <a class="carousel-control left" href="#myCarousel" 
		  data-slide="prev">&lsaquo;</a>
	   <a class="carousel-control right" href="#myCarousel" 
		  data-slide="next">&rsaquo;</a>
	</div> 
	
	
	
	<!--Recommend-->
	<div id="header-text" class="panel-heading">
		<h3 class="panel-title">
		<font color="#FFFFFF" size="4" face="黑体">
			向您推荐
		</font>
		</h3>
	</div>
	
	<table id="recommend-content">
	</table>
	
	<div id="loading-panel" style="display:none">
		<p class="text-center">正在加载...</p>
	</div>
	
</body>
</html>