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
      <style>
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
  
  		<button class="dropbtn" style="color:#333"><i class="fa fa-bars" aria-hidden="true"></i></button>
        <div class="dropdown-content" >
         <a href="/home">首页</a>
         <a href="#">帮助</a>
         <a href="#">我要反馈</a>
     
      </div>
	 
   </div>
  <a class="navbar-brand" href="#"style="float:right;border:1px;" onclick="deleteFunction()">编辑</a>
  
   <a class="navbar-brand" href="#">收藏夹</a>
   </div>
 	<div style="padding-top:4px;background-color:#ffffff;color:red;font-family:Microsoft YaHei;padding-left:7px;padding-bottom:4px;font-size:5px;text-align:center">全部收藏(${count})
      </div>
	 <div style="padding-top:4px;background-color:#f2eef2;opacity:0.3;filter:alpha(opacity=30);color:#333;padding-left:7px;padding-bottom:4px;font-size:3px;">最近一个月收藏
      </div>
      
</nav>
	
	<!--favorites list-->
	<table class="table table-striped table-hover " id="table1" style="margin-left:-30px;margin-bottom:0;margin-top:100px;" >
 	<tbody >
    <#list favorites as favorite>
    <tr style="background-color:#ffffff" >
      <td width=30px height=120px style="padding:0px 0px 1px 0px;">
      <i class="fa fa-circle-thin" id="dis" data-dis aria-hidden="true" style="font-size:20px;padding:48px 3px 48px 13px;"></i>
      </td>
      <td width="30%" height=120px style="padding:0px 0px 1px 0px">
      	<img src="${favorite.img}" width="100%"height="100%">
      </td>
      <td>
      <div style="padding:6px 0px; color:#000000; font-size:15px;font-family:Microsoft YaHei;">
      	【${favorite.bankName}】${favorite.summary}
      </div >
      <div style="color:#9a9090;font-size:12px;padding-right:10px;height:50px">${favorite.description}</div>
     	    <div style="color:#000000;font-size:10px;">
     	    <i class="fa fa-clock-o" aria-hidden="true" style="color:red;">
     	    </i> 活动时间：<#if favorite.beginTime??>${favorite.beginTime?date}<#else>不限</#if> ~ <#if favorite.endTime??>${favorite.endTime?date}<#else>不限</#if>
     		</div>
     </#list>
      </td>  
    </tr>

  </tbody>
  </table>
	

	
</body>
<script>
$('[data-dis]').on('click', chooseFunction)
function deleteFunction()
{
	
	$('#table1').css('margin-left', "0px");
	$('#table1').css('transition-delay', "0.3s");
	$('#table2').css('margin-left', "0px");
	$('#table2').css('transition-delay', "0.3s");
	$("body").append("")
}
function chooseFunction()
{
	$('#dis').toggleClass("fa fa-check-circle");
	var dis = $(this).attr('data-dis');
	if(dis === 'show'){
		$(this).attr('data-dis', 'hide')
		$(this).addClass("fa-circle-thin");
		$(this).removeClass("fa-check-circle");
	}else{
		$(this).attr('data-dis', 'show')
		$(this).removeClass("fa-circle-thin");
		$(this).addClass("fa-check-circle");
	}
	
}
</script>
</html>