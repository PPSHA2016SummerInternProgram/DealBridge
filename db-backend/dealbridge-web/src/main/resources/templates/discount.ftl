<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>优惠详情</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="/bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" >
    <script src="/jquery-2.0.0/jquery.min.js"></script>
	<script src="/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
	 	
   <script>
        $(document).ready(function(){
                setInterval(function(){
                        $.get("/api/share/shared_times/${discount.discountId?c}", function(data, status){
                                $("#sharedTimes").html('分享量：<span class="label label-info">' + data + '</span>');
                        });
                }, 3000);
        });
   </script>
	<script>
        $(document).ready(function(){
            $("#shareButton").click(function(){
                var discountId = ${discount.discountId?c};
                $.post("/api/share", {user_id:0, discount_id:discountId}, function(data, status, xhr){
                        if (status == "success") {
                                alert("successfully shared");
                        } else {
                                alert("failed to share");
                        }
                })
            });
        });
   </script>
   
   <style>
			#navbar-back{background-color:#181818;}
			p.navbar{font-family:黑体;font-size:16px;color:#FFFFFF;}
			#icon{color:#FFFFFF;font-size:18px;}
			.head{padding-left:9px;padding-right:9px;}
			#header-text{background-color:rgb(220,220,220);}
			
	</style>
</head>
<body style="background:rgb(248,248,248)">

    <div id="navbar-back" class="navbar-fixed-top" style="width:414px;height:45px">
	
      <div class="container">
        <div class>
		  <a class="navbar-brand center-block"><p class="navbar">优惠详情</p></a>
        </div>
		<div style="height:auto;float:right;">
          <ul class="nav navbar-nav navbar-right">
            <a class="head" href="http://bootswatch.com/help/"><font color="FFFFFF" size="3" face="黑体">首页</font></a>
			<a class="head" id="icon"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span></a>
			<a class="head" id="icon"><span class="glyphicon glyphicon-share" aria-hidden="true"></span></a>
          </ul>
        </div>
      </div>
    </div>



<div class="page-header">
	<br>
  <h1 class="text-center"><font face="黑体">${discount.summary}</font></h1>
</div>

<div class="container">
	<p class="text-center"><font face="黑体">点击量：<span class="label label-info">99</span>  分享量：<span class="label label-info">99</span></font></p>
</div>

<div class="sub-section">
    <img src=${discount.img} class="center-block">
    <p class="text-center">
    <font face="黑体">
	   ${discount.description}
       <br><br>
    </font>
	</p>
</div>

<div class="panel panel-default">
   <div id="header-text" class="panel-heading">
   		<h3 class="panel-title">
		<font color="#191919" size="3" face="黑体">
			活动时间
		</font>
		</h3>
   </div>
   <div class="panel-body">
   	<font size="3" face="黑体">
      <#if discount.beginTime??>${discount.beginTime?date}<#else>不限</#if> 至  <#if discount.endTime??>${discount.endTime?date}<#else>不限</#if>
    </font>
   </div>
   <div id="header-text" class="panel-heading">
   		<h3 class="panel-title">
		<font color="#191919" size="3" face="黑体">
			适用地区
		</font>
		</h3>
   </div>
   <div class="panel-body">
   	<font size="3" face="黑体">
      <#if discount.area??>${discount.area}<#else>不限</#if>
    </font>
   </div>
</div>

<#if discount.discountUsage??>
<div class="panel panel-default">
<div id="header-text" class="page-header">
	<h3 class="panel-title">
		<font color="#191919" size="3" face="黑体">
			活动细则
		</font>
	</h3>
</div>

<div class="sub-section">
  <pre style="background:#FFFFFF;border:#FFFFFF"><font size="3" face="黑体">
    ${discount.discountUsage}
    </font>
  </pre>
</div>
</div>
</#if>

<#if discount.discountUsage??>
<div id="header-text" class="page-header">
	<h3 class="panel-title">
		<font color="#191919" size="3" face="黑体">
			活动详情
		</font>
	</h3>
</div>

<div class="sub-section">
  <pre style="background:#FFFFFF;border:#FFFFFF"><font size="3" face="黑体">
    ${discount.discountDetail}
    </font>
  </pre>
</div>
</#if>



</body>
</html>