<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>DealBridge Search Page</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="/bootstrap-3.3.6/dist/css/bootstrap.min.css">
		<script src="/jquery-2.0.0/jquery.min.js"></script>
		<script src="/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
		
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
					<button id="search-button" class="btn btn-default" type="button">搜索</button>
				  </span>
				</div><!-- /input-group -->
		</div>
		
		<div id="hot-keyword-div">
			<div class="row">
				<#list hotKeywords as hotKeyword>
					<div class="col-xs-4 col-sm-4 hot-keyword"><p>${hotKeyword}</p></div>
				</#list>
			</div>
		</div>
		
		<div>
			<p>搜索记录</p>
			<ul id="search-history-list" class="list-group">
				<#list searchHistories as searchHistory>
			   		<li class="list-group-item">${searchHistory}</li>
	 			</#list>
			</ul>
			<h4 id="clear-history-text" class="text-center" onclick="clearSearchHistory(3)">清除搜索记录</h4>
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
				insertSearchHistory(3, $("#search-input").val());
				console.log($("#search-input").val());
			});
			
		</script>
		
	  
</body>
</html>