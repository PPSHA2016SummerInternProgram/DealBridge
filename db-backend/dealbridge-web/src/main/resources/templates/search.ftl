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
			#navbar{background:#F0F0F0; padding:15px}
			#search-icon{position: absolute;top: 10px;left: 10px;}
			#search-input{padding-left: 30px; opacity:0.5}
			#hot-keyword-div{margin: 20px; text-align: center; padding-left:20px; padding-right: 20px;}
			.hot-keyword{border:1px solid #F0F0F0;}
		</style>
		

	</head>
	
	<body style="font-family: 黑体;">




	<div>
		<nav id="navbar" class="navbar navbar-default" style="">
				<div class="input-group">
				  <span id="search-icon" class="glyphicon glyphicon-search""></span>
				  <input id="search-input" type="text" class="form-control" placeholder="Search for...">
				  <span class="input-group-btn">
					<button id="search-button" class="btn btn-default" type="button">搜索</button>
				  </span>
				</div><!-- /input-group -->
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