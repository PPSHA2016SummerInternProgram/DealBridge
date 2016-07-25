<!DOCTYPE html>
<html>
	<head>
	   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Home Page</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=0"-->
		<!--meta http-equiv="X-UA-Compatible" content="IE=edge"-->
		<meta name="Keywords" content="上海美食,上海餐厅,团购,上海优惠券,大众点评网">
		<meta name="Description" content="根据合理的商区、地标和详细的商户分类系统，为你提供上海的餐饮美食、婚庆、住宿酒店、美容美发等消费场所，并通过海量亲身消费者的点评聚合，以各种评分、星级的标准让你选择。">
		<link rel="stylesheet" href="./Bootswatch_ Yeti_files/bootstrap.css" media="screen">
		<link rel="stylesheet" href="./Bootswatch_ Yeti_files/custom.min.css">
		<link rel="stylesheet" href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css">
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<style>
			<!--#navbar-back{background-color:#34495E;}-->
			p.navbar{font-family:黑体;font-size:16px;color:#FFFFFF;}
			#icon{color:#FFFFFF;font-size:16px;}
			.head{padding-left:9px;padding-right:9px;}
			#header-text{background-color:#1ABC9C;}
			
			#type{color:#0A87C1;font-size:16px;text-align:center;}
			#top_title{font-family:黑体;font-size:16px;color:#000000;}
			.top_pic{padding:10px 7px 7px 7px;border:none;background-color:#F2EEF2;}
			
		</style>
	</head>
	<body cz-shortcut-listen="true" style="padding-top: 60px;">
	
	<!--Navgation Bar-->
    <div id="navbar-back" class="navbar-fixed-top" style="height:50px">
	
      <div class="container" style="padding-top:15px;height:30px;">
        <div style="height:auto;float:left;">
		  <a class="city" href="http://m.dianping.com/citylist" onclick="_hip.push(['mv', {module:'2_city_tab',action:'click'}]);"><p class="navbar">上海</p></a>
		</div>
		
		<div style="height:auto;float:right;position: relative;">
  <span class="glyphicon glyphicon-search" aria-hidden="true" style="
    position: absolute;
    left: 8px;
    top: 3.5px;
"></span>
          <!--ul class="nav navbar-nav navbar-right"-->
			<font face="黑体">
				<input type="text" placeholder="输入银行、城市" style="border-radius:20px;border:none;width: 200px;padding-left: 30px;transition: 0.3s ease-out;">
			</font>
			<a class="head" id="icon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
          <!--/ul-->
        </div>
      </div>
    </div>
	


	


	<div class="row text-center">
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="sample.jpg" class="img-circle" alt="美食" style="
				width: 100%;
			">
		  <p>美食</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="sample.jpg" class="img-circle" alt="美食" style="
				width: 100%;
			">
		  <p>美食</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="sample.jpg" class="img-circle" alt="美食" style="
				width: 100%;
			">
		  <p>美食</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="sample.jpg" class="img-circle" alt="美食" style="
				width: 100%;
			">
		  <p>美食</p>
		</div>


		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="sample.jpg" class="img-circle" alt="美食" style="
				width: 100%;
			">
		  <p>美食</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="sample.jpg" class="img-circle" alt="美食" style="
				width: 100%;
			">
		  <p>美食</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="sample.jpg" class="img-circle" alt="美食" style="
				width: 100%;
			">
		  <p>美食</p>
		</div>
		<div class="col-xs-3 col-sm-2 col-md-2" style="border-width: 0;">
		  <img src="sample.jpg" class="img-circle" alt="美食" style="
				width: 100%;
			">
		  <p>美食</p>
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
		  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		  <li data-target="#myCarousel" data-slide-to="1"></li>
		  <li data-target="#myCarousel" data-slide-to="2"></li>
	   </ol>   
	   <!-- 轮播（Carousel）项目 -->
	   <div class="carousel-inner">
		  <div class="item active">
			 <img src="sample.jpg" class="center-block" alt="First slide">
			 <div class="carousel-caption">江南皮革厂倒闭了</div>
		  </div>
		  <div class="item">
			 <img src="sample.jpg" class="center-block" alt="Second slide">
			 <div class="carousel-caption">原价99的皮包</div>
		  </div>
		  <div class="item">
			 <img src="sample.jpg" class="center-block" alt="Third slide">
			 <div class="carousel-caption">现在通通只要9块9</div>
		  </div>
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
				<img src="sample.jpg" style="width:100%;">
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
				<img src="sample.jpg" style="width:100%;">
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