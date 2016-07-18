<!DOCTYPE html>
<html>
<head>
   <title>优惠详情</title>
   <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Home</a>
    </div>


	<div class="collapse navbar-collapse">
	  <button type="button" class="btn btn-default navbar-btn navbar-right"><span class="glyphicon glyphicon-share" aria-hidden="true"></span></button>
	  <button type="button" class="btn btn-default navbar-btn navbar-right"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span></button>
	</div>
	
  </div>
</nav>



<div class="page-header">
  <br><br>
  <h1>${discount.summary}</h1>
</div>


<div class="sub-section">
    <img src=${discount.img} class="center-block">
    <p class="text-center">
	   ${discount.description}
       <br><br>
	</p>
</div>

<div class="panel panel-default">
   <div class="panel-heading">
       <p>活动时间</p>
   </div>
   <div class="panel-body">
      <#if discount.beginTime??>${discount.beginTime?date}<#else>不限</#if> 至  <#if discount.endTime??>${discount.endTime?date}<#else>不限</#if>
   </div>
   
   <div class="panel-heading">
       <p>适用地区</p>
   </div>
   <div class="panel-body">
      <#if discount.are??>${discount.area}<#else>不限</#if>
   </div>
</div>

<#if discount.discountDetail??>
	<div class="page-header">
	  <h2>活动细节</h2>
	</div>
	<div class="sub-section">
	  <pre>
	    ${discount.discountDetail}
	  </pre>
	</div>
</#if>

<#if discount.discountUsage??>
	<div class="page-header">
	  <h2>活动用法</h2>
	</div>
	<div class="sub-section">
	  <pre>
	    ${discount.discountUsage}
	  </pre>
	</div>
</#if>


<p class="text-center">点击量：<span class="label label-info">99</span>  分享量：<span class="label label-info">99</span></p>


</body>
</html>