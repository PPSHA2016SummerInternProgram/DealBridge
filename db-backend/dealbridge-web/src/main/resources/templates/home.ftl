<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>DealBridge Home Page</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    
	    <link href="/bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link href="/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" >
	    <link rel="stylesheet" href="/css/homepage.css"> 
	    
	 	<script src="/jquery-2.0.0/jquery.min.js"></script>
	 	<script src="/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
		<script src="/js/hammer.min.js"></script>
		
		<script>
          $(function(){
            var myElement= document.getElementById('myCarousel')
            var hm=new Hammer(myElement);
            hm.on("swipeleft",function(){
                $('#myCarousel').carousel('next')
            })
            hm.on("swiperight",function(){
                $('#myCarousel').carousel('prev')
            })
        })
		</script>
		<style>
			#header-text{background-color:rgb(220,220,220);padding-top:10px;}
			p.summary{font-family:黑体;font-size:15px;color:#000000;}
			p.description{font-family:黑体;font-size:12px;color:#9A9090;}
			p.clickrate{font-family:黑体;font-size:10px;color:#9A9090;}	

			.category{padding:0;margin:0;outline:0;background-color:#ffffff;}
			.type{width:20%;float:left;text-align:center;background-color:#ffffff;}
			a img{width:50%;}
			a{color:#000000;}
			a p{margin:0;}
			
				
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
				$.getJSON("/api/recommend/${userId}", {startIndex:startIndex, limitNumber:limitNumber}, function(result){
					for (i in result) {
						console.log(result[i]);
						$('#recommend-content').append('<tr><td width="40%"><img src="' + result[i].img + 
							'" class="img-thumbnail top_pic" style="border:0px;"></td><td width="100%"style="padding:0;">' + 
							'<a href="/discount/${userId}/' + result[i].discountId + '">'+
							'<p class="summary">' + result[i].summary + '</p>' +
							'<p class="description">' + result[i].description + '</p>'+ 
							'<p class="clickrate">' + '点击量：'+ result[i].clickRate + '</p>'+ '</a>' + 
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
		
		
		<style>
			#navbar{background:#F0F0F0; padding:15px}
			#search-icon{position: absolute;top: 10px;left: 10px;}
			#search-input{padding-left: 30px; opacity:0.5; disabled: true}
			#hot-keyword-div{margin: 20px; text-align: center; padding-left:20px; padding-right: 20px;}
			.hot-keyword{border:1px solid #F0F0F0;}
			#search-input-div{float:left; width:320px}
			#search-cancel-div{float:left; margin-left: 20px; margin-top: 8px;}
			#search-record-header{text-align:center; font-size:16px}
		</style>
		
	</head>
	

	<body>
	
	<div id='home-div'>
	
	<!--Navgation Bar-->
    <div class="navbar" style="background-color:#181818;">
	
		<div class="container" style="padding-top:15px;height:30px;">
        
			<div style="height:auto;float:left;">
			  <a href="/citylist"><p style="font-family:黑体;font-size:16px;color:#FFFFFF;">${area}</p></a>
			</div>
			
			<div style="height:auto;float:right;position: relative;">
				<span class="glyphicon glyphicon-search" aria-hidden="true" style="
					position: absolute;
					left: 8px;
					top: 3.5px;
					">
				</span>
				<font face="黑体">
					<input id="search-input" type="text" placeholder="输入关键字搜索" style="border-radius:20px;border:none;width: 200px;padding-left: 30px;transition: 0.3s ease-out;">
				</font>
				<a href="/userInfo/${userId}" style="padding-left:9px;padding-right:9px;color:#FFFFFF;font-size:16px;"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
			</div>
		
		</div>
	  
    </div>
	



	<div class="category">
	
		<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/Meal.png"></img>
		  	<p>美食</p>
		  </a>
		</div>
			<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/Car.png"></img>
		  	<p>洗车</p>
		  </a>
		</div>
			<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/Movie.png"></img>
		  	<p>电影</p>
		  </a>
		</div>
			<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/Entertaiment.png"></img>
		  	<p>娱乐</p>
		  </a>
		</div>
			<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/House.png"></img>
		  	<p>住房</p>
		  </a>
		</div>
			<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/Hotel.png"></img>
		  	<p>酒店</p>
		  </a>
		</div>
			<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/Beauty.png"></img>
		  	<p>丽人</p>
		  </a>
		</div>
			<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/Beach.png"></img>
		  	<p>旅游</p>
		  </a>
		</div>
			<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/Shop.png"></img>
		  	<p>购物</p>
		  </a>
		</div>
			<div class="type">
		<a href="/recommend/${userId}/food">
		  	<img src="/img/Other.png"></img>
		  	<p>更多</p>
		  </a>
		</div>
	</div>
	
	
	<!--Hot Discount-->
	<div id="header-text" class="panel-heading">
		<h3 class="panel-title">
		<font color="#191919" size="3" face="黑体">
			当前热门
		</font>
		</h3>
	</div>
	
	<div id="myCarousel" class="carousel slide">
	   <!-- 轮播（Carousel）指标 -->
	   <ol class="carousel-indicators">
	      <#list hots as hot>
	          <li data-target="#myCarousel" data-slide-to="${hot_index}" <#if hot_index == 0>class="active"</#if>>
	          </li>
	      </#list>

	   </ol>   
	   <!-- 轮播（Carousel）项目 -->
	   <div class="carousel-inner">
	      <#list hots as hot>
	      	 <div class=<#if hot_index == 0>"item active"<#else>"item"</#if>>
			 	<a href="/discount/${userId}/${hot.discountId?c}"><img src="${hot.img}" class="center-block" style="width:100%;height:200px;border:0px;"></a>
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
		<font color="#191919" size="3" face="黑体">
			向您推荐
		</font>
		</h3>
	</div>
	
	<table id="recommend-content">
	</table>
	
	<div id="loading-panel" style="display:none">
		<p class="text-center">正在加载...</p>
	</div>
	
   </div>
	
	
	<div id='search-div' style="top:0px; position:absolute; display:none">
		<nav id="navbar" class="navbar navbar-default">
			<div>
				<div id='search-input-div' class="input-group" style="float:left;">
					  <span id="search-icon" class="glyphicon glyphicon-search""></span>
					  <input id="search-input" type="text" class="form-control" placeholder="Search for...">
					  <span class="input-group-btn">
						<button id="search-button" class="btn btn-default" type="button">搜索</button>
					  </span>
					  
				</div>
				<div id='search-cancel-div' style="float:left;">
					<p id='search-hide-button'>取消</p>
				</div>
			</div>
		</nav>
		
		<div id="hot-keyword-div">
			<div class="row">
				<#list hotKeywords as hotKeyword>
					<div class="col-xs-4 col-sm-4 hot-keyword"><p keyword>${hotKeyword}</p></div>
				</#list>
			</div>
		</div>
		
		<div>
			<p id='search-record-header'>搜索记录</p>
			<ul id="search-history-list" class="list-group">
				<#list searchHistories as searchHistory>
			   		<li class="list-group-item" history>${searchHistory}</li>
	 			</#list>
			</ul>
			<h5 id="clear-history-text" class="text-center" onclick="clearSearchHistory(3)">清除搜索记录</h5>
		</div>
		
	
	</div>
	
	
	
	  <script>
			function clearSearchHistory(userId) {
				$("#search-history-list").html("");
				$("#clear-history-text").hide();
				$.ajax({
					type: "POST",
					url: "/api/search_history/" + userId,
					error: function() {
						console.log("clear search history error");
					},
				});
			}
			
			function insertSearchHistory(userId, keyword) {
				if (keyword != "") {
					$.ajax({
						type: "PUT",
						url: "/api/search_history/" + userId,
						data: {keyword: keyword}
					});
				}
			}
			
			$("#search-button").click(function(){
				location.href = "/search_result?query=" + $("#search-input").val();
				insertSearchHistory(3, $("#search-input").val());
			});
			
			$("#search-input").keyup(function () {  
                if (event.which == 13){  
                    insertSearchHistory(3, $("#search-input").val());
                    location.href = "/search_result?query=" + $("#search-input").val();  
                }  
            });   
			
			$("#hot-keyword-div").on('click', $("[keyword]"), function(e){
				insertSearchHistory(3, e.target.outerText);
				location.href = "/search_result?query=" + e.target.outerText;
			});
			
			$("#search-history-list").on('click', $("[history]"), function(e){
				insertSearchHistory(3, e.target.outerText);
				location.href = "/search_result?query=" + e.target.outerText;
			});
			
			
			$(document).ready(function(){
				$('#search-input').click(function(){
					$('#home-div').hide(150, 'linear');
					$('#search-div').show(150, 'linear');
				});
			});
			
			$(document).ready(function(){
				$('#search-hide-button').click(function(){
					$('#home-div').show(150, 'linear');
					$('#search-div').hide(150, 'linear');
				});
			});
			
		</script>
	
	
</body>
</html>