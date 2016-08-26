<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>DealBridge Home Page</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    
	    
	    <link href="/bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link href="/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" >
	    <link rel="stylesheet" href="/css/homepage.css">  
	 	<script src="/jquery-2.0.0/jquery.min.js"></script>
	 	<script src="/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
	
		
		<style>
			#header-text{background-color:#ffffff;padding-top:10px;border-bottom:1px solid rgb(220,220,220);}
			#bank-header{background-color:#ffffff;padding-top:20px;border-top:1px solid rgb(248,248,248);height:50px;margin-bottom:10px;}
			.bank-div{width:33%;float:left;background-color:#f3f8ff;margin:auto; text-align:center;padding-top:3px;border:1px solid #ffffff;}
			.bank-div img{width:20%;height:20%;}
			.bank-div p{font-size:12px; color:rgb(150,150,150);}
			#entrance-deader{background-color:#ffffff;padding-top:20px;border-top:1px solid rgb(220,220,220);height:50px;margin-bottom:10px;}
			.entrance-div{width:90%; margin:0 auto; height:120px;text-align:center;margin-bottom:12px;position:relative;}
			.entrance-div img{width:100%; height:100%}
			.entrance-div p{color:white;font-family:Microsoft YaHei;font-size:17px;position:absolute;left:150px;top:50px;font-weight:bold;}
		
			.category{padding:0;padding-top:10px;margin:0;outline:0;background-color:#ffffff;height:160px;border-bottom:1px solid rgb(220,220,220);}

			.type{width:20%;float:left;text-align:center;background-color:#ffffff;padding:10px 0px 10px 0px;}
			.type a img{width:37%;}
			.type a{color:#000000;}
			.type a p{margin:0; font-family:Microsoft YaHei;color:rgb(150,150,150);}
			.discount_img{border:0;}
			.tdimg{width:35%;height:100px;}
			.tdcontent{width:65%;height:100px;padding:0;}
			
			html{font-size:50px;}
			.imgtext{position:absolute;overflow:hidden;width:1rem;height:1rem;z-index:1}
			.banktext{font-size:.24rem;background-color:#06c1ae;color:#fff;padding:.05rem;position:absolute;width:1.3rem;text-align:center;left:-.35rem;top:.1rem;-webkit-transform:rotateZ(-45deg);}
			
			a:link{ decoration:none} /* 鏈闂殑閾炬帴 */ 
			a:visited{decoration:none} /* 宸茶闂殑閾炬帴 */ 
			a:hover{text-decoration:none}/* 榧犳爣鍦ㄩ摼鎺ヤ笂 */ 
			a:active{ text-decoration:none}/* 鐐瑰嚮婵�娲婚摼鎺� */ 
			a{color:rgb(50,50,50);}
			
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
				function appendDiscount(startIndex, limitNumber) {
				$.getJSON("/api/recommendation/${userId}", {startIndex:startIndex, limitNumber:limitNumber, lat:${latitude}, lng:${longitude}, area:"${area}"}, function(result){
					
					for (i in result) {
						console.log(result[i]);
					
					var str = '<tr data-url="/discount/' + result[i].discountId + '" style="background-color:#ffffff" class="item">' 	
 	  				+'<td width="23%" height=80px style="padding:0px 0px 0px 0px;border-top:0px;"><span class="imgtext"><div class="banktext">'+result[i].bankName+'</div></span><img src="' 
 	  				+ result[i].img + '" width="100%" height="100%"></td><td style="position:relative;border-top:0px;padding-top:0px"><div style="padding:0px 0px 6px 0px; color:#000000; font-size:15px;font-family:Microsoft YaHei;width:200px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">' 
 	  			    + result[i].summary + '</div><div style="color:rgb(150,150,150);position:absolute;top:0px;right:10px;">'+result[i].distance.toFixed(2)+'km</div><div style="color:#9a9090;font-size:12px;padding-right:10px;'
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
 	  				
 	  				$('#recommend-content').append(str);

						
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
		
		<style>
			#navbar{background:#F0F0F0; padding:15px}
			#search-icon{position: absolute;top: 10px;left: 10px;}
			#search-input{padding-left: 30px; opacity:0.5; disabled: true}
			#hot-keyword-div{margin: 20px; text-align: center; padding-left:20px; padding-right: 20px;}
			.hot-keyword{border:1px solid #F0F0F0;}
			#search-input-div{float:left; width:78%;}
			#search-cancel-div{float:left; }
			#search-record-header{text-align:center; font-size:16px}
		</style>
		
	</head>
	

	<body>
	
	<div id='home-div'>
	
	<!--Navgation Bar-->
    <div class="navbar navbar-fixed-top" style="background-color:#337ab7; font-family:Microsoft YaHei;">
	
		<div class="container" style="padding-top:15px;height:30px;">
        
			<div style="height:auto;float:left;">
			  <a href="/citylist"><p style="font-family:黑体;font-size:16px;color:#FFFFFF;">${area}</p></a>
			</div>
			
			<div style="height:auto;float:right;position: relative;">
				<span class="glyphicon glyphicon-search" aria-hidden="true" style="
					position: absolute;
					left: 8px;
					top: 3.7px;
					">
				</span>
				
					<input id="search-entry" type="text" placeholder="输入关键字搜索" readonly="readonly" style="border-radius:20px;border:none;width: 200px;padding-left: 30px;transition: 0.3s ease-out;">

				</font>
				<a href="/userInfo" style="padding-left:9px;padding-right:9px;color:#FFFFFF;font-size:16px;position: relative;top: 2.2px;left: 5px;">
				  <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				</a>

			</div>	
		</div> 
    </div>
    
	<div style="padding-top:50px"></div>

 <div class="category">
   
      <div class="type">
      <a href="/recommendation/food">
        <!-- Quesadilla icon by Icons8 -->
		<img class="icon icons8-Quesadilla" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAACx0lEQVRIS8WWQW7aUBCG/7GdqIZFuUHSExROUNi1plKaExS2FSi+QcMJ6gir27gnKJUaq7vCCcoNkpwgdIGRGuypnuFZtjHGhkh5G5D13vtm/pn5bcIzLXomLkqD/xmf6n5wPNN/WXeHBF0aPG/3HIDOFGZLd+3BvvBS4MVb85RV/1bCmHl6hKB77H6dlg2gNBja8pQDugThTQRjNiuufVUGXgocZdo0a4uq/5AAMY90T+vS2JoVCaAwmJtmLX7pvN2bEuh1HCKkr3haqwi8MNgzeqKL/8isPKM/Tsi9jqAovBB4YfQ7TLgO72bcafDPH1k5JYW+h4+Y/xLRy3jT7cq8EDgzO2aTAu2HgMmZ9oz+CISzdTC5su8EL973msz0e53thMF1mR0znKo77MpME3tX9FHFtc+zmm0nWBgGgT6Kw+Srr8RvoC5HsrHi8A3wqgyDqmtfpuG54E3DWGUoOtyrLsdZcK/d5zREY7+RNplcsGf0LBBdJEcmAbekGjLzrDOiISvuMFRLrq3gVVb+LQE1MN8zUEvXNp05Mbq6O3Tm73ofQKgTqClHLi35VrDX7psAvoS1ZXRV+NNHKONd8LSsskcYmCm+2pATsB0sDIPoRIDlZeKVmAUXvRAoy2kYFONO99SGdK+o4RgTDb4pa50JThhG6BmYHbHfEoey4EqgDlhdXkNIu5q7ceXGbol/Iqj4rOfWWBpG3JHy4BtzynxPgdbM+1jYyDhpGHxFoKm0Swn3odYZ+AxCmE20GBMCHNFgWaaR29VpwxBRp6VPX8rgbwrB0X/a413ATKnjhiEuq97YnfWzCwY64WitV1gGwKFAs/b5/kpIHR9+MXcAnRChk5ST70Fk6XPVKfLe3aZABE4YRtbuEvUrIncE3lbHfepXCiw2Ry5zYP1Kg8OBN/qdF546OqR+e4GLHHqKPTs/BJ4CknXHf3kNzC7Vj+d6AAAAAElFTkSuQmCC" width="30" height="30">
		<p>美食</p>
        </a>
      </div>
      
      
      <div class="type">
      <a href="/recommendation/car">
        <!-- Convertible icon by Icons8 -->
		<!-- SUV icon by Icons8 -->
		<img class="icon icons8-SUV" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAB2ElEQVRIS+1WwW3bQBCcIf23OkjyjqVQCPWOU4HVge0OjhUkHZAlSBWEriDKWwosiDbgp0pwvgbIDZbyCSRFwUfAtj66H+92d3aHu3NHHGjxQLg4Ar8b80eqS6o/35rAL3DhyrsUXGaj+MbVXu12qO4vogmByy5B1FYgkyxMrl39asD9hRkT/OXq3LTrAt4AjlKipPjfky/BwzBZV4P359GMxDcR/MlG8bk9s/tl5ZTr7GsyeSn5GvBgET0COBVgmoXxVdN5H3Bwa3pFziWAD+qT+zK8Hyb6vXdtgc/m5twjfz//L61stuMluAL4EZA1iFpVIggIjjc+8uj5+LQcJlpI69oCD+bmJ8gfL1HU5VwgKcHU8+WmmcSbAleTtEmswnhaG6e3qLiNHds/71axTcJOxOGBW8WDEolgTVA7+LRLY22mA1MRmZBMCHyxezqqtTlWjfZyGiuZqzAuz6sC0QW8EPl+N0pmtn+UZv9Extrhrddif7FRMO1EaMWkUTVbhXHPBXjw1xgIY4gs4UFjGIC9qrC0Ape3U04VkC29rlKoiamS5Tlnlt4qxTbxvQ+B0rnAmEDvyUPa1G2Xysu+EQT5CdKmhB5fIC4MvorNkepXodElyMGo/g9TadYf6JjBewAAAABJRU5ErkJggg==" width="30" height="30"><p>洗车</p>
        </a>
      </div>
      

		
	  <div class="type">
      <a href="/recommendation/entertainment">
        <!-- Microphone 2 icon by Icons8 -->
		<!-- Microphone 2 icon by Icons8 -->
		<img class="icon icons8-Microphone-2" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAB5klEQVRIS8WWQU7CUBCG/6HVpGWh3sAbiDeoO1NM8Abi1pTIEfQE1kDcijeAhY078QTgCfQIuGgxahnzSBortjD1QeiqSee9L/+b//1TwpoeWhMXSwOz09x+L3/WwLSrxDAwoonZsx781yxxSwGP3UZ9QrgiYDsD4luhcUl9f5T+pg1WUCbczmsZMw/tyDxIw7XA4yPPYaZHkU+Yr+2g3UxqtcCR2+iCUBOBAVihsZOo1gNXGyyFqjpinFpBqzN9L7JwtjZ0vRERbUn3YObLctC+0AZ/uGeVT5T6Urg2eHzY3E3uZxG4yfH+ZnAz/JdiFRRjOx4w0C8HrVO1iQjOeLKDlvNvV4dVb0igvWk6MToSODO/bWDiJGoLKw6rXodAJ2kzLYJnQQuB5yVUJhxQEdm1IvNiNi7FYElCpeGS67XwHisHT4x4kDMAfhiMJysyjrPUFZ5OysGR/fVIRJW5QwB8V75v1yVKRa6WZHE6BpcCjlzPB9F53mZ5bpXCM3u8aMYy+LkUm8d5fxcS+B+wSqEvMga5ixk9KzLqUhPl7fMLvMjB6ZCXqJpX8wfMRvwyu0D1swRqJrNUF5oZILP91TWR6KiToulfI9gH4dUOTUe3n4UCRIXHKoCiAFlGLwsd9SqBa1f8DTZkAC4PZSc7AAAAAElFTkSuQmCC" width="30" height="30">
		<p>娱乐</p>
        </a>
      </div>
      
       <div class="type">
      <a href="/recommendation/outing">
		  	<!-- Prop Plane icon by Icons8 -->
			<img class="icon icons8-Prop-Plane" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAC8ElEQVRYR+2Wz3HTQBTGvycFroQKMDdmwEae2OckFRAqiNOBVAGhAikVkHRgKsCc42DHhhmOTgWIaybSx6zsFSvH9spxnPHBe5Jmpbe/971/K9jwJRvOhy3gqhHaKrhVcFUFVv1/m4Mbp6DX83cTynsNJikqEFb0O4kDADGAi2EjatscKB1idXCayDGEuyTUgfmhAniA7NoOm94n+NEGWRqw2vW/CUR5/5jrbNAI/UUGSwPWugEfkyyzJQwGe1Gk7SoR9HPqIvhVj/qlAatXfksoXx4LklkOhi3TnimC4/Jlvx7FGeDbnu+5ifTUM8G26+JEbdpglEES34fNcGHol/lucubNoBFmOZ4rWOsGCujFBLIzbESHiwCrP4J9SdEpCwiyT1d8V3g9z3mtIIGvw0Z4VACsdoO2AB/yHCAPfzajjnqfwHgEPSE8iHhG2yilYMFZsg+Rc8flhQmbh5j8PGhGp0UFr3wflPC/IY5AxCbMLEVtCk7a05/Z0WAMQeQ4OFOgGjA1xMlDbOahLfem9xOXdVVxs/6r3XN8xldk39nBYZpI5ogukIKC6sXMw+UgGRNog9KGm02J8UrZEkihUufZVVUtwPF0DRTazHQeLge56teMzWmkw1wAzOZoIpH2ZNUjl/mfwLUAeob/vXXp/a5Ho5mNetKUVYfP2s5TLKWYI5JNkluXrxXcvRw0QZ5STQpPhnvR+cIqnqfSm55feZbI6ZrCfpOSLd1v8z5ozOjSs1iBPk9xRErLyJUHRV/lG4SRUs00YEySfE6XBjQNGbBqonhlgFVDF4ftxEFnbs/UNyayP2hG9YU5uKw0Kmfv7tTFtbjEQQXEvghGemLMs23eZgaNMBPvQQqWhX936R/oyhz/w5Hjom67LIx7/PgusFbAajc4ny4uc86WcXStgLVL/xQin0yQRXN7FvBaASc3GXWJeDWesfdv0TYV1wqoDtfFwx3E86p3EeTaAW0K2fa3gDaFbPtbBW0K2fY3XsF/icJ/OLTfSbcAAAAASUVORK5CYII=" width="30" height="30">
		  	<p>出行</p>
		  </a>
		</div>
		
		
      <div class="type">
      <a href="/recommendation/hotel">
        <!-- Department icon by Icons8 -->
		<img class="icon icons8-Department" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABr0lEQVRoQ+2ZQU7DQAxFvwN7uAEsaNeVygE4QjgBZQM9UmFDb0B6j1bqurDhBnAAYhSkopB2mLHGFgQ5y+aP5z977KlaQs8f6rl/OMBvV9CkAqP7zeiwpisGlwAdA1wRqFpOBwttYDWAtmkCne4zysCrNkwWQIrpUMa1YMQAOaYtYJIApKaZ8QKi6r2o543pg7qYgLkkwkmsB6SVCQLkmF7fDNf7jDYxtWF2AMazzQOAi1Ajto0x8AbQvMl0yHQo418w4AkBR6mVWU2H123tDsD57Il/CvZpmrlCUVSr27MqtnHK+/Hdc4m6LkFUxmCW08E3z0kAFqZDYDEYMQATXWplOqUabU0DQ8yP7c/EAN0FUhO5+u6RdoBtRmPN3s2UVB/aR60CUkNSvQNsMxBqYmlGpXrzCuROl9T1PoX8Hkg9KwGd2RGSNqVUb97EUkNSvQP4PZDZvOZHSMlfNIzZFIrurCRwgH/7ZU4616V68yaWGpLqHSB2kUmHzJ+rgAN0MpA67dR+lehNBaRGrfXiClgbksZ3AGnGtPXRCmhvaB0v6U8+axM58R0gJ3saaz8AZSzuQJQhPkgAAAAASUVORK5CYII=" width="30" height="30">
        <p>酒店</p>
        </a>
      </div>
      
      <div class="type">
      <a href="/recommendation/cards_gifts">
        <!-- Department icon by Icons8 -->
		<!-- Bank Card Back Side icon by Icons8 -->
		<img class="icon icons8-Bank-Card-Back-Side" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABB0lEQVRIS+2WTQ7BUBSFzy0LsAMM2nGJOUsxQkdYgVoBRsXITjAXOm4H2IEF4EqlrYifVNxoE33Dm5fzvXPey72PENOimLhIwT9LPhlR61NHz5zRJlBB0jqDdycFI7uh2YFu6Fi3toUMHTcE5CShgRYDhxNnS7ZR3Hm1EFyeuB2FMbhuZCxF4YSqp3cmdNdNdXgHrliuCULPK65aqujdV8Yu+4b6K0M1kwcGsBCNGqhFciwMvckx3kf9f+D/e9Wp429fefI7V2x3DMK1kYst9vVedK4aCHMx2BOho8Kl4DNwN/7KllMnkEmEvOQBmLFnsLk2tNnDD0QSFEVLdOBHAaaOP0lJZO8FMampH5kWEVEAAAAASUVORK5CYII=" width="30" height="30">
		<p>办卡送礼</p>
        </a>
      </div>
      
      
      <div class="type">
      <a href="/recommendation/fashion">
        <!-- Lipstick icon by Icons8 -->
		<!-- Lipstick icon by Icons8 -->
		<img class="icon icons8-Lipstick" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABbklEQVRIS+2WT07CQBTGv69VQ6sLPIF4AriBZWeqiUewbk2bcAPwBiYlbsUbuNBuwRvgCeQILKQYpTzSmhoh/JkIlRiZ7by833xv3jfziDUtromLpcHv9mUpIosQjUbgN1SF/Bjctz1HgCqIQgITPJmBb2UGFquSD81Bk2RpDJIleCY0a8Wh7d2DOJtaziwVh7bXAnH0P8CxbT6oNwnkpykWoLstUXknuGmrdLaynULb7YA8mJtU0DED/3C14BNPPptX7jRi7KEYChyC5/G++egriVEKihOGKVjkajeo176r6tlujWR1A55315tSz6zOrzdX/DG8GVFRNLQSOwkamkzYiXBIOPE+h7Byff2ZrevuUnfcP3UtETZVHoU0hpSy8VBPDjprLWyuDVil5H+81MeVgujRi4rSNMbo6ftLd3WcLJkoiVsVOAUXKmPuwq5OYYmf9wbjk+XESXKvW+1FSr8sp6IiixhlxauGrw08ArcI4R+C23jTAAAAAElFTkSuQmCC" width="30" height="30"><p>丽人</p>
        </a>
      </div>
         <div class="type">

      <a href="/recommendation/travelling">
        <!-- Earth Element icon by Icons8 -->
		<img class="icon icons8-Earth-Element" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAACIUlEQVRIS+2VQW7TQBSG/+cJ3ZIbkO6QIK2tJmuaE0BPQDgB4xO0nCDDCSgnaG6Au06QLRskdsAN0m1a56Fx4jJj7NhNKnlDVtFM5n3v/+efF0JLH2qJiweB3VB2I08tHqPZB4H7c38K8GUyUNN94Y3B/bl8Q6ArgBeOwOG+yhuBtcWrFD8B6mqlDA6SgRrto7oRWFtMwGsLROzHJ0rlay9C6ToruMmJumzSUC34r8UAM66J0APwTBdPBXvfPRVtHAkB6q2YR9+GKqiDbwUXLL5ZCnYF0BUphVlh5mjZwdnBHa5A5K5hzTKwFWxZbFh7NJMXIDrPQfnd36tkjuKh8raprgS/nMlTh+jLWhiuk+Hk1CzUn/kBEV7lawx81t8JeLtZ+xgPJrIKXgo27wxAZvEPT/0yizwPZe8gpQjAU72+FHyof9Of+xEBx1nDxO+qwlYKPpr7Oq3vM1AhvZbqr3JMTJ/MJ2Y3xItUYKQDWFT+D7jO4mKBshyYNXQAnQ5GxYFjgZtYXASvz2SW6yf2Ox5M9HODGUAGT5OBOjPPWuCmFhfhWiERSSF4bCqrehWbEK7LmHdTluK6gVC2r91IUwo2YbtxBPfyxizFGv4kJXUrWBZTvAtYn8lG6R2p2w6PzZq1I3NXYN259sH2GKzrd8d95g/xUF1Y4WoNnD16wJrHO+qqPLYCgvwvs/07fmx1dfXuFbd2x62B/4erLhz77v8BOeUiLq5XoFMAAAAASUVORK5CYII=" width="30" height="30">
        <p>旅游</p>
        </a>
      </div>
         <div class="type">

      <a href="/recommendation/shopping">
        <!-- Shopping Cart icon by Icons8 -->
		<img class="icon icons8-Shopping-Cart" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAACDklEQVRIS8WWP1LbQBjF3ydpJmXgBMEzWbVRsHvgBPYNYjcgdckJgBOQTg4N5gb2CWLqSES1VNi5gSkzCH3MKogRsvXPEmHb/fPb7+3bt0t4o0ZvxMUzuGcHh1BwkN5IGGnXntVZvsbm0uAzEE7TkIjw7fZEfP/vYIA9x9Q/vyo4vfj+j+CrwrhoE8jA6kHhI+9Y9+S6G81l2Is9jcJFm2C5Vvrocl3dHfsegT61CQ/fabveqLPKrVh2tC03M1+7lj5MCsmtuG25Q9Y66atZGCCtyc24cSxxmD62QnBrcjOOHEvMK4PbkJsZf1xL7GVNWprVTeWOmEe3lj6pDe7ZwVqUVr1iDNy5ptjZNL6wYuNqsaP+vf9NoDWpKsEZ544lzmqDu+NgSkA/nsg4B/DCIEXwUOVVEo+1wPu2P1SIrv4xMXNNMahUZcVBuVL37GAOwoEMdwKGpCCOum3ar2NxU9lcXdufENGXbUDZOY4p1gosjEwV4ZwIH5rCa4ETWPwlatiyqVX4OslOmVwq3fcJtHRMMavKNy59Q2Pqh8SzPGfnS33pG2pEPwmIA4DBE9fUR2Xw9G2QY2sn14s7/ETLPm2bNtEdB/IWvE/6GLx0Tb1T3dXp8GgCrvtIyHNSI5onu8/+IPIkbyx1Yi5FCQfSXO7Jx2nZ+Sb9sbkeaBCqPK1trqqQbceVvsfbLlw27xFpReQfooBjmgAAAABJRU5ErkJggg==" width="30" height="30">
        <p>购物</p>
        </a>
      </div>
      
      <div class="type">
        <a href="/recommendation/dailyservice">
        <!-- Washing Machine icon by Icons8 -->
		<!-- Dog House icon by Icons8 -->
		<img class="icon icons8-Dog-House" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABv0lEQVRIS+3WQU7CQBQG4PdjMaEs5AZyA/EGZWlh4Q2ErakJNxBvgLFxa2+gC1OXcIR6A7xBWbQkCj4zoyVQWtpOSdzQbTPzzXszb+aB/umDisvGoDGvL56Jya+FWh+TkV90nsKwQEN9MQbQEhgze3qotYviheA4GkWpgueG4yiY+jJi0JNK5LngJLTmPjgCnJs3PRU8E05DP81rucfH7qOngu+Ed6FfOBoLuMrLtgqeCmehIGrIvSXyVfBEOC+6OtUK+BZcFFXFN2BVVAVfwWXRoriE94UWwbFvNDcedCwPhDMxQFyD4kYSl4Oo06hkir48eXAEpuUDOMmNMn8QMALY+72j0SLmAQGnSQtMqnNmnkFGx5Vm/c1+yYqUid/1QDPiT6DcrvpiEmUuvoB1PLiwLqv4nm6UU2BaQwC3iStnnumh1kx7d//OylRkL2X8Xd21h9G/3DAx3+uuPdi130HHckC42ivMzBsrTpo8I2NqER/gQ6pFBpQP17xrGcyQLc3WJVDyVGu8PBctUmIdy66xaxnfTD0wmus4iJyos0yrZdn0EfXW/zN4WgE5tVd7EptP9QkoNy6zvS03ffroH3a9O+8oL0UNAAAAAElFTkSuQmCC" width="30" height="30">
		<p>生活</p>
        </a>
      </div>
   </div>

	

	

	
	<!--Bank Entry-->
	<div id="bank-header" class="panel-heading">
		<div style="background-color:#ee5555;height:18px;width:4px;float:left;margin-right:6px;padding-top:2px;"></div>
		<h3 class="panel-title">
		<font color="#191919" size="3" face="黑体">
			精选银行
		</font>
		</h3>
	</div>
	
     <div style="height:80px;"> 

      	<div class="bank-div"><a href="/bankRecommend/光大"><img src="/img/bank_image_transparent/光大.png"><span style="font-size:15px;font-family:Microsoft YaHei;position:relative;padding-left:10px">光大</span><p>首刷送十万积分</p></a></div>
        <div class="bank-div"><a href="/bankRecommend/交行"><img src="/img/bank_image_transparent/交通.png" ><span style="font-size:15px;font-family:Microsoft YaHei;position:relative;padding-left:10px;">交通</span><p>周末美食五折团</p></div>
          <div class="bank-div"><a href="/bankRecommend/农业"><img src="/img/bank_image_transparent/农业.png" ><span style="font-size:15px;font-family:Microsoft YaHei;position:relative;padding-left:10px;">农行</span><p>赢5000航空里程</p></div>

   	 </div>
	
	
	<!--Entrance-->
	<div id="entrance" class="panel-heading">
		<div style="background-color:#ee5555;height:18px;width:4px;float:left;margin-right:6px;padding-top:2px;"></div>
		<h3 class="panel-title">
		<font color="#191919" size="3" face="黑体">
			精选频道
		</font>
		</h3>
	</div>
	<div class="entrance-div"><a href="/nearby/?lat=${latitude}&lng=${longitude}"><img src="/img/homeimg/3.jpeg"></img><p>附近优惠</p></a></div>
	<div class="entrance-div"><a href="/favorite"><img src="/img/homeimg/2.jpeg"></img><p>我的收藏</p></a></div>
	<div class="entrance-div"><a href="/hot"><img src="/img/homeimg/1.jpeg"></img><p>热门优惠</p></img></a></div>
	
	
	
	<!--Recommend-->
	<div id="header-text" class="panel-heading">
		<div style="background-color:#ee5555;height:18px;width:4px;float:left;margin-right:6px;padding-top:2px;"></div>
		<h3 class="panel-title">
		<font color="#191919" size="3" face="黑体">
			猜你喜欢
		</font>
		</h3>
	</div>

		<table class="table table-striped table-hover " style="margin-bottom:0;margin-top:0px;" id="recommend-content"></table>
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
			
			
			$(document).ready(function(){
				$('#search-entry').click(function(){
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
			$('table').on('click', 'tr', fun1=function(){
	 	  	location.href = $(this).attr('data-url');
 	  		});
 	  	
		</script>

	
</body>
</html>