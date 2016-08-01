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
			#header-text{background-color:rgb(220,220,220);}
			p.summary{font-family:黑体;font-size:15px;color:#000000;}
			p.description{font-family:黑体;font-size:12px;color:#9A9090;}
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
							'" class="img-thumbnail top_pic"></td><td width="60%">' + 
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
		</script>
		
	</head>
	
	<body>
		
		<div id="header-text" class="panel-heading">
			<h3 class="panel-title">
			<font color="#191919" size="3" face="黑体">
				搜索结果
			</font>
			</h3>
		</div>
		
		<table id="result-content">
		</table>
		
		<div id="loading-panel" style="display:none">
			<p class="text-center">正在加载...</p>
		</div>

	</body>

</html>