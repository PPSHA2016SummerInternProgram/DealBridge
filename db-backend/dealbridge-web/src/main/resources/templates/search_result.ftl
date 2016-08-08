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
			#search-icon{position: absolute;top: 10px; left: 80px;}
			#search-input{padding-left: 30px; opacity:0.5; width: 250px; left: 70px;}
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
				$('#search-input').click(function(){
					location.href = "/search";
				});
			});
		</script>
		
	</head>
	
	<body>
		<nav id="navbar" class="navbar navbar-default" style="">
			<div style="height:auto;float:left;">
			  <a href="/home/3"><p style="margin-top:7px; margin-left: 10px;">首页</p></a>
			</div>
		
			<div class="input-group">
				<span id="search-icon" class="glyphicon glyphicon-search""></span>
				<input id="search-input" type="text" class="form-control" placeholder="Search for...">
			</div><!-- /input-group -->
		</nav>
    	
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

	</body>

</html>