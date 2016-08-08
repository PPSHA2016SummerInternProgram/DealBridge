<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Search Result</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    <link href="/bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link href="/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" >
	     
	 	<script src="/jquery-2.0.0/jquery.min.js"></script>
	 	<script src="/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
		
		<style>
		
			#header-text{background-color:rgb(248,248,248);}
			p.summary{padding-left:0px;margin-top:-20px;font-family:Microsoft YaHei;font-size:16px;color:#000000;}
			p.description{padding-left:0px;padding-right:20px;margin-top:0px;font-family:Microsoft YaHei;font-size:12px;color:#9A9090;}
			.imgset{
			  border: none;
			  width:90%;
			  height:130px;
			}
			
			
			#navbar{background:#F0F0F0; padding:15px}
			#search-icon-main{position: absolute;top: 10px; left: 80px;}
			#search-input-main{padding-left: 30px; opacity:0.5; width: 250px; left: 70px; disabled: true}
			
			
			#search-icon{position: absolute;top: 10px;left: 10px;}
			#search-input{padding-left: 30px; opacity:0.5; disabled: true}
			#hot-keyword-div{margin: 20px; text-align: center; padding-left:20px; padding-right: 20px;}
			.hot-keyword{border:1px solid #F0F0F0;}
			#search-input-div{float:left; width:320px}
			#search-cancel-div{float:left; margin-left: 20px; margin-top: 8px;}
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
			function appendDiscount(start, rows) {
				$.getJSON("/api/search", {query:'${query}', start:start, rows:rows}, function(result){
					for (i in result) {
						console.log(result[i]);
						$('#result-content').append('<tr><td width="40%"><img src="' + 
							result[i].img + 
							'" class="img-thumbnail top_pic imgset" ></td><td width="60%">' + 
							'<p class="summary">' + 
							result[i].summary +
							'</p>' +
							'<p class="description">'+result[i].description + '</p>'+
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
			
			$(document).ready(function(){
				$('#search-input-main').click(function(){
					$('#home-div').hide();
					$('#search-div').show();
				});
			});
			
			$(document).ready(function(){
				$('#search-hide-button').click(function(){
					$('#home-div').show();
					$('#search-div').hide();
				});
			});
		</script>
		
	</head>
	
	<body>
	<div id='home-div'>
       <div class="navbar" style="background-color:#181818;">
	
		  <div class="container" style="padding-top:15px;height:30px;">
        
			<div style="height:auto;float:left;">
			    <a href="/home"><p style="font-family:黑体;font-size:16px;color:#FFFFFF;">首页</p></a>
			</div>
			
			<div style="height:auto;float:right;position: relative;">
				<span class="glyphicon glyphicon-search" aria-hidden="true" style="
					position: absolute;
					left: 8px;
					top: 3.5px;
					">
				</span>
				<font face="黑体">
					<input id="search-input-main" type="text" placeholder="输入关键字搜索" style="border-radius:20px;border:none;width: 200px;padding-left: 30px;transition: 0.3s ease-out;">
				</font>
			</div>
		
		  </div>
	  
   	    </div>
    	
		<div id="header-text" class="panel-heading">
			<font color="#191919" size="3" face="黑体">
				搜索结果
			</font>
		</div>
		
		<table id="result-content">
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
			<p>搜索记录</p>
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
			
		</script>

	</body>

</html>