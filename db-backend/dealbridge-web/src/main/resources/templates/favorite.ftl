<!DOCTYPE html>
<html>
   <head>
      <title>User Favorite Page</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- import Bootstrap -->
      <link href="/bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="/font-awesome-4.6.3/css/font-awesome.min.css">
 	  <script src="/jquery-2.0.0/jquery.min.js"></script>
 	  <script src="/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
 	  
 	  <script>
		var startIndex = 6;
		$(window).scroll(function() {
			if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
				if($('#loading-panel').is(":visible") == false){
					$('#loading-panel').show();
					window.setTimeout(function(){
						appendFavorite(${userId}, startIndex, 6);
						startIndex += 6;
					}, 1000);
				}
			}
		});
	  </script>
	  
 	  <script>
 	  	function appendFavorite(userId, startIndex, limitNum){
 	  		$.getJSON("/api/favorite", {userId:userId, startIndex:startIndex, limitNum:limitNum}, function(result){
 	  			for (i in result) {
 	  				console.log(result[i]);
 	  				var str = '<tr favorite-id="' + result[i].favoriteId + '" style="background-color:#ffffff"><td width=30px height=120px style="padding:0px 0px 1px 0px;">' + 
 	  				'<i class="fa fa-circle-thin" id="dis" data-dis aria-hidden="true" style="font-size:20px;padding:48px 3px 48px 13px;"></i></td>' + 
 	  				'<td width="30%" height=120px style="padding:0px 0px 1px 0px"><img src="' 
 	  				+ result[i].img + '" width="100%" height="100%"></td><td onclick=location.href="/discount/${userId}/' + result[i].discountId + '"><div style="padding:6px 0px; color:#000000; font-size:15px;font-family:Microsoft YaHei;">【' 
 	  				+ result[i].bankName + '】' 
 	  				+ result[i].summary + '</div><div style="color:#9a9090;font-size:12px;padding-right:10px;height:50px">' 
 	  				+ result[i].description + '</div><div style="color:#000000;font-size:10px;"><i class="fa fa-clock-o" aria-hidden="true" style="color:red;"></i> 活动时间：';
 	  				if (result[i].startTime == null)
 	  					str += '不限';
 	  				else
 	  					str += result[i].startTime;
 	  				str += ' 至 '; 
 	  				if (result[i].endTime == null)
 	  					str += '不限';
 	  				else
 	  					str += result[i].endTime;
 	  				str += '</div></td></tr>';
 	  				$('#favorite-load').append(str);
 	  			}
 	  			$('#loading-panel').hide();
 	  		});
 	  	}
 	  	
 	  </script>
 	  
 	  <script>
 	  	$(document).ready(function(){
 	  		$('#loading-panel').show();
 	  		appendFavorite(${userId}, 0, 6);
 	  	});
 	  </script>
 	  
 	  <script>
  			function backFunction() {
  				window.history.back();
  			}
  	  </script>
 	  
 	 
      <style>
		.divcss5-x5{ padding-bottom:5px; border-bottom:1px solid red} 
		.divcss5-x10{ padding-bottom:10px; border-bottom:1px solid #000} 
		.dropbtn {
		    background-color: rgb(248,248,248);
		    color: white;
		    padding: 16px;
		    font-size: 16px;
		    border: none;
		    cursor: pointer;
		}

		.dropdown {
		    position: relative;
		    display: inline-block;
		}
		
		.dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		    right:2px;
		}
		
		.dropdown-content a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		}
		
		.dropdown-content a:hover {background-color: #f1f1f1}
		
		.dropdown:hover .dropdown-content {
		    display: block;
		}
		
		.dropdown:hover .dropbtn {
		    background-color: #ccc;
		}
		</style>
      
 	</head>
   
	<body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation" >
   <div class="navbar-header" >
   <div class="dropdown" style="float:right;">
  
  		<button class="dropbtn" style="color:#333">
  		<i class="fa fa-bars" aria-hidden="true">
  		</i></button>
        <div class="dropdown-content" >
         <a href="/home/${userId}">首页</a>
         <a href="#">帮助</a>
         <a href="#">我要反馈</a> 
     
      </div>
	 
   </div >
      <a class="navbar-brand" id="edit" style="float:right;border:1px;">编辑</a>
  	  <a class="navbar-brand" style="float:right;right=100px;border:1px;">收藏夹</a>
  <i onclick="backFunction()" class="fa fa-angle-left fa-2x" aria-hidden="true" style="padding-left:10px;margin-top:10px;"></i>

   </div>
 	<div id="favNum" style="padding-top:4px;background-color:#ffffff;color:red;font-family:Microsoft YaHei;padding-left:7px;padding-bottom:4px;font-size:5px;text-align:center">全部收藏(${count})
      </div>
	 <div style="padding-top:4px;background-color:#f2eef2;opacity:0.3;filter:alpha(opacity=30);color:#333;padding-left:7px;padding-bottom:4px;font-size:3px;">最近一个月收藏
      </div>
      
</nav>
	
	<!--favorites list-->
	<table class="table table-striped table-hover " style="transition:0.3s ease-out;margin-left:-30px;margin-bottom:0;margin-top:100px;" id="favorite-load">
	</table>
	
	<div id="loading-panel" style="display:none">
		<p class="text-center">正在加载...</p>
	</div>
	

	
</body>
 <script>
 		$('#edit').on('click', deleteFunction);
		function deleteFunction()
		{
			var text = $(this).text();
			if(text==='编辑')
			{
			
			$('#favorite-load').css('margin-left', "0px");
		
			$('#table2').css('margin-left', "0px");
			
			$('#edit').html('<span class="divcss5-x5">删除</span>');
		
			console.log(text)
			}
			if(text==='删除')
				{
				$('#edit').html('<span class="divcss5-x5">编辑</span>');
				console.log('finish')
				$('#favorite-load').css('margin-left', "-30px");
		
				$('#table2').css('margin-left', "-30px");
				
				var items = $('[data-dis]');
				var favIds=[];
				for (var i = 0; i<items.length; i++)
					{
					var item = items[i];
					if($(item).attr('data-dis')==='show')
						{
						$(item).closest('tr').hide();
						favIds.push($(item).closest('tr').attr('favorite-id'));
						console.log('favorite-id');
						}
					
					}
				$.ajax({
					type: "POST",
					
					url:"/api/favorite",
					data:{favIds: favIds},
					traditional: true,
					error: function() {
						console.log("delete favorite discount error");
					},
				});
				
				updateFavoriteNum();
			}
			
		}
 		
		$('table').on('click', '[data-dis]', chooseFunction);

		function chooseFunction()
		{
			console.log($(this));
			var dis = $(this).attr('data-dis');
			if(dis === 'show'){
				$(this).attr('data-dis', 'hide')
				$(this).addClass("fa-circle-thin");
				$(this).removeClass("fa-check-circle");
			}else{
				$(this).attr('data-dis', 'show');
				$(this).removeClass("fa-circle-thin");
				$(this).addClass("fa-check-circle");
			}
		}
		
		function updateFavoriteNum() {
			console.log("update favorite num");
			$.ajax({
				type: "GET",
				url: "/api/favorite/${userId}/count",
				success: function(result) {
					$("#favNum").html("全部收藏(" + result + ")");
				}
			});
		
		}
	</script>
</html>