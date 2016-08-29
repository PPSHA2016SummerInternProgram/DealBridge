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
			#header-text{background-color:#337ab7;}
			p.summary{font-family:黑体;font-size:15px;color:#000000;}
			p.description{font-family:黑体;font-size:12px;color:#9A9090;}

			p.clickrate{font-family:黑体;font-size:10px;color:#9A9090;}
			html{font-size:50px;}
			.imgtext{position:absolute;overflow:hidden;width:1rem;height:1rem;z-index:1}
			.banktext{font-size:.24rem;background-color:#06c1ae;color:#fff;padding:.05rem;position:absolute;width:1.3rem;text-align:center;left:-.35rem;top:.1rem;-webkit-transform:rotateZ(-45deg);}
			

			#recommend-content .item
			{
		    margin-left: 10px;
		    padding: 11px 10px 11px 0;
		    box-sizing: border-box;
		  
		    background-repeat: repeat-x;
		    background-position: 0 bottom;
		    background-size: auto 1px;
		    display: -webkit-box;

		    border-bottom:1px solid #ccc;
			}
			html{font-size:50px;}
			.imgtext{position:absolute;overflow:hidden;width:1rem;height:1rem;z-index:1}
			.banktext{font-size:.24rem;background-color:#06c1ae;color:#fff;padding:.05rem;position:absolute;width:1.3rem;text-align:center;left:-.35rem;top:.1rem;-webkit-transform:rotateZ(-45deg);}

		</style>
		
		
		
		<script>
			var startIndex =10;
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


				$.getJSON("/api/recommend/${bankName}/${userId}", {latitude:${latitude}, longitude:${longitude}, area:'${area}', startIndex:startIndex, limitNumber:limitNumber}, function(result){
					for (i in result) {
						console.log(result[i]);
		
					var str = '<tr data-url="/discount/' + result[i].discountId + '" style="background-color:#ffffff" class="item">' 	
 	  				+'<td width="23%" height=80px style="padding:0px 0px 0px 0px;border-top:0px;"><span class="imgtext"><div class="banktext">'+result[i].bankName+'</div></span><img src="' 
 	  				+ result[i].img + '" width="100%" height="100%"></td><td style="position:relative;border-top:0px;padding-top:0px"><div style="padding:0px 0px 6px 0px; color:#000000; font-size:15px;font-family:Microsoft YaHei;width:80%; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">' 
 	  			    + result[i].summary + '</div><div style="color:rgb(150,150,150);position:absolute;top:0px;right:10px;">';
 	  			    if (result[i].distance <=10000)
 	  			    	str = str + result[i].distance.toFixed(2) + 'km';
 	  			    else
 	  			    	str += '全国';
 	  			    		
 	  			    str = str + '</div><div style="color:#9a9090;font-size:12px;padding-right:10px;'
					+ 'text-overflow: -o-ellipsis-lastline;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;">' 
 	  				+ result[i].description + '</div><div style="position:absolute;bottom:0px; right:10px; font-family:Microsoft YaHei;font-size:12px;color:rgb(150,150,150);">点击量:'+result[i].clickRate+'</div><div style="color:#000000;font-size:10px;position:absolute;bottom:0px;"><i class="fa fa-clock-o" aria-hidden="true" style="color:red;"></i> ';
 	  				if (result[i].startTime == null)
 	  					str += '活动';
 	  				else
 	  					str += result[i].startTime;
 	  				str += '至 '; 
 	  				if (result[i].endTime == null)
 	  					str += '不限';
 	  				else
 	  					str += result[i].endTime;
 	  				str += '</div></td></tr>';
 	  				
 	  					$('.imgtext').attr('data-content',result[i].bankName);
 	  				
 	  				$('#recommend-content').append(str);


						
					}
					$('#loading-panel').hide();
				});
			}
			
		</script>
		
		<script>
			$(document).ready(function(){
				$('#loading-panel').show();
				appendDiscount(0, 10);
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
		    <div class="navbar-fixed-top" style="height:50px;background-color:#337ab7;">
			
				<div class="container" style="padding-top:15px;height:30px;">
		        
					<div style="height:auto;float:left;">
					 
					   <i onclick="backFunction()" class="fa fa-angle-left fa-2x" aria-hidden="true" style="padding-left:0px;margin-top:-4px;color:#F0F0F0"></i>
					  
					</div>
					
					 <span style="color:#ffffff;padding-left:10px;font-family:Microsoft YaHei" id="recommendtype">精选银行</span>
					
				
				</div>
			  
		    </div>
	
	
		<!--Recommend-->
	
		
		<table class="table table-striped table-hover " style="margin-bottom:0;margin-top:0px;" id="recommend-content"></table>
		
		<div id="loading-panel" style="display:none">
			<p class="text-center">正在加载...</p>
		</div>
	</body>
	
	<script>
		$('table').on('click', 'tr', fun1=function(){
 	  	location.href = $(this).attr('data-url');
  		});
  	
	</script>

</html>