<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>DealBridge Home Page</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css">
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<style>
			#header-text{background-color:#1ABC9C;}	
		</style>
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
		  <img src="/img/home_sample.jpg" class="img-circle" alt="美食" style="
				width: 100%;
			">
		  <p>美食</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="/img/home_sample.jpg" class="img-circle" alt="电影" style="
				width: 100%;
			">
		  <p>电影</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="/img/home_sample.jpg" class="img-circle" alt="酒店" style="
				width: 100%;
			">
		  <p>酒店</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="/img/home_sample.jpg" class="img-circle" alt="火锅" style="
				width: 100%;
			">
		  <p>火锅</p>
		</div>


		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="/img/home_sample.jpg" class="img-circle" alt="丽人" style="
				width: 100%;
			">
		  <p>丽人</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="/img/home_sample.jpg" class="img-circle" alt="KTV" style="
				width: 100%;
			">
		  <p>KTV</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="/img/home_sample.jpg" class="img-circle" alt="外卖" style="
				width: 100%;
			">
		  <p>外卖</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="/img/home_sample.jpg" class="img-circle" alt="旅游" style="
				width: 100%;
			">
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
	          <li data-target="#myCarousel" data-slide-to="${hot_index}" <#if hot_index == 0>class="active"</#if>></li>
	      </#list>
	   </ol>   
	   <!-- 轮播（Carousel）项目 -->
	   <div class="carousel-inner">
	      <#list hots as hot>
	      	 <div class=<#if hot_index == 0>"item active"<#else>"item"</#if>>
			 	<img src="${hot.img}" class="center-block" style="width:100%;height:200px;">
			 	<div class="carousel-caption"><font color="black">${hot.summary}</font></div>
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
	
	<div id="recommend-content">
		<div class="test-center">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<img src="/img/home_sample.jpg" style="width:100%;">
			</div>
			<div class="col-xs-8 col-sm-8 col-md-8 col-lg-4">
				<p>浙江温州最大皮革厂 江南皮革厂倒闭了
	王八蛋王八蛋黄鹤老板 吃喝嫖赌吃喝嫖赌
	欠下了欠下了3.5个亿 带着他的小姨子跑了
	我们没有没有没有办法办法 拿着钱包抵工资工资
	原价都是100多200多300多的钱包 统统20块
	20块20块统统20块 统统统统统统20块</p>
			</div>
		</div>
		
		<div class="text-center">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<img src="/img/home_sample.jpg" style="width:100%;">
			</div>
			<div class="col-xs-8 col-sm-8 col-md-8 col-lg-4">
				<p>浙江温州最大皮革厂 江南皮革厂倒闭了
	王八蛋王八蛋黄鹤老板 吃喝嫖赌吃喝嫖赌
	欠下了欠下了3.5个亿 带着他的小姨子跑了
	我们没有没有没有办法办法 拿着钱包抵工资工资
	原价都是100多200多300多的钱包 统统20块
	20块20块统统20块 统统统统统统20块</p>
			</div>
		</div>
	</div>
	
	<div>
		<p class="text-center">加载更多</p>
	</div>
	
</body>
</html>