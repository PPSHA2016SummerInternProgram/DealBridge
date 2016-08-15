<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Recommended Discount</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    <link href="/bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link href="/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" >
	     
	 	<script src="/jquery-2.0.0/jquery.min.js"></script>
	 	<script src="/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
		
		<style>
			#header-text{background-color:rgb(220,220,220);}
			p.summary{font-family:黑体;font-size:15px;color:#000000;}
			p.description{font-family:黑体;font-size:12px;color:#9A9090;}
			p.clickrate{font-family:黑体;font-size:10px;color:#9A9090;}	
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
				$.getJSON("/api/recommend", {startIndex:startIndex, limitNumber:limitNumber}, function(result){
					for (i in result) {
						console.log(result[i]);
						$('#recommend-content').append('<tr onclick=location.href="/discount' + result[i].discountId + '"><td width="40%"><img src="' + 
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
		
		<script>
  			function backFunction() {
  				window.history.back();
  			}
  	  </script>
	</head>
	
	<body style="padding-top: 50px;">
			<!--Navgation Bar-->
		    <div class="navbar-fixed-top" style="height:50px;background-color:#181818;">
			
				<div class="container" style="padding-top:15px;height:30px;">
		        
					<div style="height:auto;float:left;">
					 
					   <i onclick="backFunction()" class="fa fa-angle-left fa-2x" aria-hidden="true" style="padding-left:0px;margin-top:-4px;color:#F0F0F0"></i>
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
	</body>

</html>