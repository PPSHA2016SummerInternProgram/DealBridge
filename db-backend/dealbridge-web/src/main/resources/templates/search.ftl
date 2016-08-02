<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>DealBridge Search Page</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css">
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		
		<style>
			#navbar{background: darkgray;}
			#navbar-header{text-align: center;margin-top: 10px;}
			#navbar-a{float: right;margin-top: -30px;margin-right: 20px;}
			#search-icon{position: absolute;top: 10px;left: 10px;}
			#search-input{padding-left: 30px;}
			#hot-keyword-div{margin: 20px;text-align: center;}
			.hot-keyword{border:0.5px solid;}
		</style>
	</head>
	
	<body style="font-family: 黑体;">




	<div>
		<nav id="navbar" class="navbar navbar-default">
		  <div class="container-fluid" style="">
			<h3 id="navbar-header">搜索</h3>
			<a id="navbar-a">取消</a>
		  </div>
		</nav>
		
		
		<div>
				<div class="input-group">
				  <span id="search-icon" class="glyphicon glyphicon-search""></span>
				  <input id="search-input" type="text" class="form-control" placeholder="Search for...">
				  <span class="input-group-btn">
					<button class="btn btn-default" type="button">搜索</button>
				  </span>
				</div><!-- /input-group -->
		</div>
		
		<div id="hot-keyword-div">
			<div class="row">
				<div class="col-xs-4 col-sm-4 hot-keyword"><p>关键字</p></div>
				<div class="col-xs-4 col-sm-4 hot-keyword"><p>关键字</p></div>
				<div class="col-xs-4 col-sm-4 hot-keyword"><p>关键字</p></div>
				<div class="col-xs-4 col-sm-4 hot-keyword"><p>关键字</p></div>
				<div class="col-xs-4 col-sm-4 hot-keyword"><p>关键字</p></div>
				<div class="col-xs-4 col-sm-4 hot-keyword"><p>关键字</p></div>
				<div class="col-xs-4 col-sm-4 hot-keyword"><p>关键字</p></div>
				<div class="col-xs-4 col-sm-4 hot-keyword"><p>关键字</p></div>
				<div class="col-xs-4 col-sm-4 hot-keyword"><p>关键字</p></div>
			</div>
		</div>
		
		<div>
			<p>搜索记录</p>
			<ul class="list-group">
			   <li class="list-group-item">锦瑟无端五十弦，一弦一柱思华年。</li>
			   <li class="list-group-item">庄生晓梦迷蝴蝶，望帝春心托杜鹃。</li>
			   <li class="list-group-item">沧海月明珠有泪，蓝田日暖玉生烟。</li>
			   <li class="list-group-item">此情可待成追忆？只是当时已惘然。</li>
			</ul>
			<h4 class="text-center">清除搜索记录</h4>
		</div>
		
	
	</div>
	  
</body>
</html>