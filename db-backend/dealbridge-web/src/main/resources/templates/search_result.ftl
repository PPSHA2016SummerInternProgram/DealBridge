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
			#search-input-div{float:left; width:280px}
			#search-cancel-div{float:left; margin-left: 20px; margin-top: 8px;}
			
			html{font-size:50px;}
			.imgtext{position:absolute;overflow:hidden;width:1rem;height:1rem;z-index:1}
			.banktext{font-size:.24rem;background-color:#06c1ae;color:#fff;padding:.05rem;position:absolute;width:1.3rem;text-align:center;left:-.35rem;top:.1rem;-webkit-transform:rotateZ(-45deg);}
			#result-content .item
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
			.hot-keyword p{margin:0px;padding:10px 10px;}
			.title1{color:rgb(150,150,150);padding-left:20px;}
			
			
			#clear-history-text{padding:2px 20px 10px 20px;float:right;}
			.history-item{padding:5px 20px 5px 20px; border-bottom:1px solid rgb(220,220,220);}
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
					var str = '<tr onclick=location.href="/discount/' + result[i].discountId + '" style="background-color:#ffffff" class="item">' 	
 	  				+'<td width="23%" height=80px style="padding:0px 0px 0px 0px;border-top:0px;"><span class="imgtext"><div class="banktext">'+result[i].bankName+'</div></span><img src="' 
 	  				+ result[i].img + '" width="100%" height="100%"></td><td style="position:relative;border-top:0px;padding-top:0px"><div style="padding:0px 0px 6px 0px; color:#000000; font-size:15px;font-family:Microsoft YaHei;width:200px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">' 
 	  			    + result[i].summary + '</div><div style="color:rgb(150,150,150);position:absolute;top:0px;right:10px;">'+result[i].distance+'km</div><div style="color:#9a9090;font-size:12px;padding-right:10px;'
					+ 'text-overflow: -o-ellipsis-lastline;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;">' 
 	  				+ result[i].description + '</div><div style="position:absolute;bottom:0px; right:10px; font-family:Microsoft YaHei;font-size:12px;color:rgb(150,150,150);">点击量:'+result[i].clickRate+'</div><div style="color:#000000;font-size:10px;position:absolute;bottom:0px;"><i class="fa fa-clock-o" aria-hidden="true" style="color:red;"></i> ';
 	  				if (result[i].beginTime == null)
 	  					str += '活动';
 	  				else
 	  					str += result[i].beginTime;
 	  				str += '至 '; 
 	  				if (result[i].endTime == null)
 	  					str += '不限';
 	  				else
 	  					str += result[i].endTime;
 	  				str += '</div></td></tr>';
 	  				
 	  					$('.imgtext').attr('data-content',result[i].bankName);
 	  				
 	  				$('#result-content').append(str);

						
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
		
		<script>
  			function backFunction() {
  				window.history.back();
  			}
  	  </script>
		
	</head>
	
	<body>
	<div id='home-div'>
       <div class="navbar" style="background-color:#337ab7;margin-bottom:0px;">
	
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
		
		<table class="table table-striped table-hover " style="margin-bottom:0;margin-top:0px;" id="result-content"></table>
	<div id="loading-panel" style="display:none">
		<p class="text-center">正在加载...</p>
	</div>
		
		<div id="loading-panel" style="display:none">
			<p class="text-center">正在加载...</p>
		</div>
	</div>
	
	
	<div id='search-div' style="top:0px; position:absolute; display:none;font-family:Microsoft YaHei">
		<nav id="navbar" class="navbar navbar-default">
			<div>
				<i id='search-hide-button' class="fa fa-angle-left fa-2x" aria-hidden="true" style="padding-right:20px;padding-top:2px;color:rgb(150,150,150);float:left;"></i>
				<div id='search-input-div' class="input-group" style="float:left;">
					  <span id="search-icon" class="glyphicon glyphicon-search""></span>
					  <input id="search-input" type="text" class="form-control" placeholder="搜索银行、类别或商家...">
					
				</div>
				<div id="search-button"  style="float:left;padding:7px 10px">搜索</div>
			</div>
		</nav>
		
		<div><p class="title1">热门搜索</p></div>
		<div id="hot-keyword-div">
			<div class="row">
				<#list hotKeywords as hotKeyword>
					<div class="col-xs-4 col-sm-4 hot-keyword"><p keyword>${hotKeyword}</p></div>
				</#list>
			</div>
		</div>
		
		<div>
			<div id="clear-history-text" onclick="clearSearchHistory(3)"><i class="fa fa-trash-o" aria-hidden="true" style="font-size:18px;color:rgb(150,150,150);"></i></div>
			<p class="title1">搜索记录</p>
			<div id="search-history-list" class="list-group">
				<#list searchHistories as searchHistory>
			   		<p class="history-item" history>${searchHistory}</p>
	 			</#list>
			</div>
			
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