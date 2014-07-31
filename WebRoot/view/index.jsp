<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.bip.vo.UserVO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>周围发生了什么</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">

		#img-display
		{
		width: 100%;overflow: hidden;margin:0;float:left;position:relative; top:2px;
		}
		#map-display{width: 100%;height: 50%; position:relative; left:10px; float:right;overflow: hidden;margin:0;}
		body
        {
            font-family: Arial, Verdana, 宋体;
            margin: 0;
            padding: 0;
            font-size: 13px;
            color: #120C0D;
        }
        div, img, ul, ol, li, dl, dt, dd
        {
            margin: 0;
            padding: 0;
            border: 0;
        }
        
         .clearfix
        {
            zoom: 1;
        }
        .clearfix:after
        {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
        * html .clearfix
        {
            height: 1%;
        }
        ul, li
        {
            list-style: none;
        }
        .clr
        {
            clear: both;
        }
        a
        {
            color: #120C0D;
            text-decoration: none;
        }
        .j_box
        {
        	position: relative;
            width: 996px;
            height: 220px;
            border: 2px solid #C91521;
            padding: 0;
            z-index: 2;
            top:30%;
        }
        .j_boxcontent
        {
        	float: left;
            position: relative;
            z-index: 1;
            padding: 0 31px;
            margin: 0;
            width: 93%;
            height: 220px;
            overflow: hidden;
            _display: inline;
        }
        .j_boxcontent .pre, .j_boxcontent .next
        {
            display: block;
            position: absolute;
            float: left;
            z-index: 2;
            top: 0px;
            width: 31px;
            height: 200px;
            margin-left:5px;
            background: url(http://x.jd.com/picture/i2.jpg) no-repeat;
            line-height: 500px;
            overflow: hidden;
        }
        .j_boxcontent .pre
        {
            left: 0;
            background: url(Img/IndexPic/images/left.png) center #e4e3e3 no-repeat;
        }
        .j_boxcontent .next
        {
            right: 0;
            background: url(Img/IndexPic/images/right.png) center #e4e3e3 no-repeat;
        }
        .clearfix
        {
            zoom: 1;
        }
        .clearfix:after
        {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
        * html .clearfix
        {
            height: 1%;
        }
        .j_skulist
        {
            width: 800px;
            float: left;
            overflow: hidden;
            position: absolute;
            left: 35px;
            top: 1px;
        }
        .j_skulist a{display:block;}
        .j_skulist a:hover{background:#FFFDEE;}
         .j_skulist .j_skulist_inner
        {
            width: 32777px;
        }
        .j_skulist ul
        {
            float: left;
            
        }
        .j_skulist li
        {
            float: left;
            width: 190px;
            overflow: hidden;
            margin: 0 10px 0 0;
        }
        


        .j_skulist .p_img img {
            width: 188px;
            height: 188px;
        }

        .j_skulist .p_img .p_img_tag {
            position: absolute;
            right: -15px;
            top: 0;
            display: inline-block;
            padding: 1px 2px;
            background: #FF6600;
            color: #fff;
            height: 15px;
            vertical-align: top;
            font-size: 14px;
            font-weight: bold;
        }

        .j_skulist .p_price {
            height: 21px;
            line-height: 21px;
            float: left;
            margin: 6px 0 0 9px;
            color: #E4393C;
        }

        .j_skulist .p_price .tag_content {
            margin: 0 0 0 2px;
            font-size: 25px;
            font-weight: bold;
        }

        .j_skulist .p_promo {
            height: 16px;
            width: 132px;
            line-height: 12px;
            float: left;
            margin: 3px 0 0 0;
            color: #e4393c;
            font-size: 12px;
            overflow: hidden;
        }

        .j_skulist .p_promo div {
            margin: 1px 0 0 0;
            width: 100%;
            overflow: hidden;
            height: 14px;
        }

        .j_skulist .p_promo .tag_title {
            color: #fff;
            background: #e4393c;
            padding: 1px 2px;
            line-height: 12px;
            margin-right: 5px;
            display: inline-block;
        }

        .j_skulist .p_promo .tag_content {
            color: #e4393c;
        }

        #cont .p_promo img {
            float: left;
            border: 1px solid #ddd;
            margin-right: 3px;
            width: 15px;
            height: 15px;
        }

        .j_skulist .p_name {
            width: 148px;
            line-height: 16px;
            height: 32px;
            overflow: hidden;
            float: left;
            margin: 2px 0 0 2px;
            font-style: normal;
        }
        #head-line{
        	width:1000px;
        	hight:5%;
        	margin:0 auto;
        }
        #body-context{
        	width:1000px;
        	hight:95%;
        	margin:0 auto;
        }
        
	</style>
	<link rel="stylesheet" href="css/citySelector.css" type="text/css"></link>
	<style>
	
            #allmap {width: 100%;height: 100%;overflow: hidden;margin:0;float:left;}
	</style>
	<script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
	var page=0;
	var row=4;
	//初始化数据
	function initData(){
		ajaxPost(0,4,0,0,"");
	}
	//停止向上
	function StopUp(){
		
	}
	//向上一页
	function GoUp(){
		
		if(page>=0){
			var max=get_Max_leaf();
			var city = test.input.value;
			if(city=="城市名"){
				city="";
			}
			ajaxPost(page,row,max,0,city);
			page=page-1;
		}
	}
	//停止向下
	function StopDown(){
		
	}
	//向下一页
	function GoDown(){
		page=page+1;
		var min=get_Min_leaf();
		var city = test.input.value;
		if(city=="城市名"){
			city="";
		}
		ajaxPost(page,row,min,1,city);
	}
	//ajax请求翻页数据
	function ajaxPost(page,row,id,type,city){
		$.ajax({
			type:"post",
			url:"./getMessage",
			dataType:"json",
			data:{pages:page,rows:row,currentMax:id,SlidingDirection:type,City:city},
			success:function(data){
				if(!$.isEmptyObject(data)){
					//TODO:创建新的li节点数据，然后把新创建的li节点拼接到ul下面。成功之后把原有显示的li节点移除。
					
					var tmp = create_new_li(data);
					
					remove_old_li();
					append_new_li(tmp);
				}else{
					if(type==1){
						page--;
					}
				}
				//如果请求回来的data为空同样不进行
			}
		});
	}
	//创建新的节点
	function create_new_li(data){
		var cc = [];
		for(var l in data){
		    //将所有的节点创建放入cc中
		    var img='test.jpg';
			cc.push('<li onclick=select(this) title='+data[l].latitude+','+data[l].longitude+'><a href="javascript:void(0);" title="'+data[l].description+'">');
			cc.push('<div class="p_img"><sub class="p_img_tag" id="zk_564004" style="display:none">'+data[l].realactivityID+'</sub>');
			if(data[l].picturevos.length!=0){
				cc.push('<img src="/Img/'+data[l].picturevos[0].picMaxPath+'">');
			}else{
				cc.push('<img src="Img/'+img+'">');
			}
			cc.push('</div>');
			cc.push('<div class="p_price">');
   			cc.push('<a href="./Details/'+data[l].realactivityID+'" title="'+data[l].description+'" target=_blank><<详细</a>');
			cc.push('</div>');
			cc.push('</a></li>');
		}
		return cc.join('');
	}
	
	
	//移除老的节点
	function remove_old_li(){
		//选中ul下面的说有li节点
		//移除ul下面的所有li节点
		//var ul = document.getElementById("list1");
		$("#list1").find("li").remove(); 
	}
	//添加新的节点
	function append_new_li(data){
		//将创建的新的li的list附加到ul节点上面
		$("#list1").append(data);
	}
	
    </script>
    <style>
    .loginPic{
   		float :left ;
   		margin-left:1cm;
    	background: url(Img/IndexPic/images/login.jpg) left no-repeat;
        width:40px;
        height:16px;
        display:block;
        overflow:hidden;
    }
    .history{
    	float:left;
    	margin-left:1cm;
    	background:url(Img/step.jpg) left no-repeat;
    	width:40px;
    	height:16px;
    	display:block;
    	overflow:hidden;
    }
    .customer-name{
    	float:left;
    }
    .login{
    	float:left;
    }
    .search_city{
    	margin-left:1cm;
    	float:left;
    }
    
    .cityinput{
            width: 170px;
			height: 20px;
			margin: 2px 0 2px 5px;
			padding: 2px 3px;
			border: solid 1px #CCC;
			background: white url(http://csdnimg.cn/www/images/ico_sear_top.gif) no-repeat 150px 2px;
			color: #999;
			line-height: 14px;
			vertical-align: middle;
            }
            .title{
            	background-image:url(Img/IndexPic/images/title.jpg) left no-repeat;
            	width:1000px;
        		height:50px;
        		display:block;
            }
            .space{
            	float :left ;
            	width:500px;
        		height:20px;
            }
    </style>
  </head>
  
  <body onload="initData()">
  	<div id="head-line">
  		<div class="login">
  		<a class="loginPic"  href="javascript:void(0);"></a>
  		<%UserVO loginvo = (UserVO)request.getAttribute("costomer_session_key"); %>
  		<%if (loginvo==null){ %>
  			<a href="javascript:void(0);" class="theme-login">登录</a>
  		<%} else{ %>
  			<a href="javascript:void(0);" class="customer-name"><%=loginvo.getName() %></a>
  			<a href="mystep" class="history" onclick="gotoHistory()" title="我的脚印"></a>
  		<%} %>
  		</div>
  		<div class="space"></div>
  		<div class="search_city">
	  		<input type="text" class="cityinput" id="citySelect" value="城市名">
	    	<script type="text/javascript" src="js/citySelector.js"></script>
	    	<script type="text/javascript">
	    		var test=new Vcity.CitySelector({input:'citySelect'});
			</script>
		</div>
		<div class="title"><img src="Img/IndexPic/images/title.jpg"></div>
  	</div>
  	<div id="body-context">
  		<div><img src="Img/IndexPic/images/LatestPromotions.jpg"></div>
    	<div id="img-display" >
    		<div class="j_box">
			    <div class="j_boxcontent">
			        <a href="javascript:void(0);" class="pre" onmouseup="StopUp()" onmousedown="GoUp()" onmouseout="StopUp()"></a>
			        <div class="j_skulist" id="cont">
			            <div class="j_skulist_inner">
			                <ul class="clearfix" id="list1">
						        <li>
						            <a href="http://x.jd.com/dsp/nc?ext=Y2xpY2sudW5pb24uamQuY29tL0pkQ2xpY2svP3VuaW9uSWQ9NTIwMDYmc2l0ZWlkPTMyOF80NCZ0bz1odHRwOi8vaXRlbS5qZC5jb20vNTYzOTg5Lmh0bWw=&amp;log=Vcdh5a7Fmwyz8lVa4hNm5oddGhRkR/sTdKQa9kkseKtg3A16Wf3wYz7D8Y8BNoxM/PyXhRmKxJQd/WvrmJAjWJkVk3XwmE4d7Z+/uRhQWc/CL7kTVZsj9IYDiygwDCh1KUNdxenE8bLW+9gobL0Oat2l6EPXWafGC+5Cxhdn7GSWbYOZGp8L0yahDEAiYiC2CQT190I+s4LrvOWdPdb3FQ==&amp;v=2" target="_blank" title="朗能（lonon） NB5B1023  10A  惠美五孔插座10只装（雅白色）test">
						                <div class="p_img">
						                    <sub class="p_img_tag" id="zk_563989" style="display:none"></sub>
						                    <img src="http://img11.360buyimg.com/n1/g12/M00/0E/1F/rBEQYVNlp6kIAAAAAAMOVVqbS1YAAFc6wHdXHMAAw5t088.jpg">
						                </div>
						            </a>
						        </li>
						        <li>
						            <a href="http://x.jd.com/dsp/nc?ext=Y2xpY2sudW5pb24uamQuY29tL0pkQ2xpY2svP3VuaW9uSWQ9NTIwMDYmc2l0ZWlkPTMyOF80NCZ0bz1odHRwOi8vaXRlbS5qZC5jb20vNTY0MDA0Lmh0bWw=&amp;log=Vcdh5a7Fmwyz8lVa4hNm5oddGhRkR/sTdKQa9kkseKtg3A16Wf3wYz7D8Y8BNoxM/PyXhRmKxJQd/WvrmJAjWJkVk3XwmE4d7Z+/uRhQWc/CL7kTVZsj9IYDiygwDCh1W87vdDgF0VFgdym7+8PIcxjvYgR+ejGDrqrWk+fEqQTC4jnlQHhQUM6na5JuGBuYKPSentekwcOBmb5h8hPomg==&amp;v=2" target="_blank" title="朗能（lonon） NB5B163  16A  惠美16A三极插座（雅白色）">
						                <div class="p_img">
						                    <sub class="p_img_tag" id="zk_564004" style="display:none"></sub>
						                    <img src="http://img11.360buyimg.com/n1/g15/M03/1B/0F/rBEhWFNlqNAIAAAAAAKiDUiyQ-8AAM0bwO5wMwAAqIl488.jpg">
						                </div>
					
						            </a>
						        </li>
						        <li>
						            <a href="http://x.jd.com/dsp/nc?ext=Y2xpY2sudW5pb24uamQuY29tL0pkQ2xpY2svP3VuaW9uSWQ9NTIwMDYmc2l0ZWlkPTMyOF80NCZ0bz1odHRwOi8vaXRlbS5qZC5jb20vNTYzOTkxLmh0bWw=&amp;log=Vcdh5a7Fmwyz8lVa4hNm5oddGhRkR/sTdKQa9kkseKtg3A16Wf3wYz7D8Y8BNoxM/PyXhRmKxJQd/WvrmJAjWJkVk3XwmE4d7Z+/uRhQWc/CL7kTVZsj9IYDiygwDCh1UIU9rA4l3jZp5LRnAkNWH0yAuqI3Aiz7LJfBLWrScqhVABhUuc5dcNl9IUwvtkwHrap/vvGnpwMgmTaYlqCd0w==&amp;v=2" target="_blank" title="朗能（lonon） NB5B1Q/2Y  16A  惠美单联双控开关（雅白色）">
						                <div class="p_img">
						                    <sub class="p_img_tag" id="zk_563991" style="display:none"></sub>
						                    <img src="http://img11.360buyimg.com/n1/g13/M0A/00/0F/rBEhUlNlqCgIAAAAAAPHtef7PrMAAMy-AKEAr4AA8fN678.jpg">
						                </div>
						            </a>
						        </li>
						        <li>
						            <a href="http://x.jd.com/dsp/nc?ext=Y2xpY2sudW5pb24uamQuY29tL0pkQ2xpY2svP3VuaW9uSWQ9NTIwMDYmc2l0ZWlkPTMyOF80NCZ0bz1odHRwOi8vaXRlbS5qZC5jb20vNTYzOTkxLmh0bWw=&amp;log=Vcdh5a7Fmwyz8lVa4hNm5oddGhRkR/sTdKQa9kkseKtg3A16Wf3wYz7D8Y8BNoxM/PyXhRmKxJQd/WvrmJAjWJkVk3XwmE4d7Z+/uRhQWc/CL7kTVZsj9IYDiygwDCh1UIU9rA4l3jZp5LRnAkNWH0yAuqI3Aiz7LJfBLWrScqhVABhUuc5dcNl9IUwvtkwHrap/vvGnpwMgmTaYlqCd0w==&amp;v=2" target="_blank" title="朗能（lonon） NB5B1Q/2Y  16A  惠美单联双控开关（雅白色）">
						                <div class="p_img">
						                    <sub class="p_img_tag" id="zk_563992" style="display:none"></sub>
						                    <img src="http://img11.360buyimg.com/n1/g13/M0A/00/0F/rBEhUlNlqCgIAAAAAAPHtef7PrMAAMy-AKEAr4AA8fN678.jpg">
						                </div>
						            </a>
						        </li>
						        
						    </ul>
						</div>
			        </div>
			        <a onmouseup="StopDown()" class="next" onmousedown="GoDown()" onmouseout="StopDown()" href="javascript:void(0);"></a>
			    </div>
			</div>
    	</div>
    	<div id="map-display">
    		hello right
    		<div id="allmap"></div>
    		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x2MhgDZIHVXhQwWLGhc98Qar"></script>
    		<script type="text/javascript">
    		
    		//刷新地图然后界面显示
			function locationPoint(lat,lng,message){
				var ZoomLevel =15;
				var iscreatr=false;
				//---------------------------------------------基础示例---------------------------------------------
				var map = new BMap.Map("allmap",{minZoom:12,maxZoom:20});            // 创建Map实例
				map.centerAndZoom(new BMap.Point(lng,lat),ZoomLevel);  //初始化时，即可设置中心点和地图缩放级别。
				//map.centerAndZoom("成都",13);                     // 初始化地图,设置中心点坐标和地图级别。
				map.enableScrollWheelZoom(true);//鼠标滑动轮子可以滚动
				addMark(lat,lng,message,map);
			}
			
			//选中相应的图片
			function select(eve){
				var tmp = eve.title.split(',');
				//var test = eve.innerHTML;
				var message = eve.childNodes[0].title;
				locationPoint(tmp[0],tmp[1],message);
				get_Min_leaf();
			}
			
			//地图上面标注
			function addMark(lat,lng,message,map){
				var point = new BMap.Point(lng,lat);//默认
				 var marker = new BMap.Marker(point);  
				 // 创建标注对象并添加到地图  
				 var marker = new BMap.Marker(point);
				 var label = new BMap.Label(message,{offset:new BMap.Size(20,-10)});
		 		 marker.setLabel(label);
				 map.addOverlay(marker); 
			}
			
			function get_Max_leaf(){
				var max=0;
				try{
					var tem = $(".p_img_tag");//[0].innerHTML;
					for(var i=0;i<tem.length;i++){
						var t =parseInt(tem[i].innerHTML);
						if(t>max){
							max=t;
						}
					}
				}
				catch(e){
				
				}
				return max;
			}
			
			
			function get_Min_leaf(){
				var min=88888888;
				try{
					var tem = $(".p_img_tag");//[0].innerHTML;
					for(var i=0;i<tem.length;i++){
						var t =parseInt(tem[i].innerHTML);
						if(t<min){
							min=t;
						}
					}
				}
				catch(e){
				
				}
				return min;
			}
		
    		</script>
    	</div>
    </div>
    <link rel="stylesheet" href="css/popLogin.css" media="all">
    <script>
	jQuery(document).ready(function($) {
		$('.theme-login').click(function(){
			$('.theme-popover-mask').fadeIn(100);
			$('.theme-popover').slideDown(200);
		})
		$('.theme-poptit .close').click(function(){
			$('.theme-popover-mask').fadeOut(100);
			$('.theme-popover').slideUp(200);
		})
	
	})
	</script>
	<div class="theme-popover">
	     <div class="theme-poptit">
	          <a href="javascript:;" title="关闭" class="close">×</a>
	          <h3>登录 是一种态度</h3>
	     </div>
	     <div class="theme-popbod dform">
	           <form class="theme-signin" name="loginform" action="clogin" method="post">
	                <ol>
	                     <li><h4>请登录！</h4></li>
	                     <li><strong>用户名：</strong><input class="ipt" placeholder="登录邮箱" type="text" name="userEmail" value="" size="20" /></li>
	                     <li><strong>密码：</strong><input class="ipt" placeholder="输入密码" type="password" name="password" value="" size="20" /></li>
	                     <li><input class="btn btn-primary" type="submit" name="submit" value=" 登 录 " />&nbsp;<a href="register" target="_self"> 注 册 </a></li>
	                </ol>
	           </form>
	     </div>
	</div>
	<div class="theme-popover-mask"></div>
  </body>
</html>
