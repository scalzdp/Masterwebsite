<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的脚步</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
	function returnback(){
		history.back();
	}
	</script>
	<style>
	.history{
        	width:1000px;
        	hight:95%;
        	margin:0 auto;
	}
	.tr-td td {
	    padding-top: 10px;
	    vertical-align: top;
	}
    .tb-void .mc {
    overflow: visible;
}
.mc {
    line-height: 25px;
    padding: 10px 20px;
}
.m {
    padding-top: 10px;
    text-align: center;
}
.m5{
    padding: 10px 15px;
    float: left;
    color: #666666;
}
.m5 .mc {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: -moz-use-text-color #e6e6e6 #e6e6e6;
    border-image: none;
    border-right: 1px solid #e6e6e6;
    border-style: none solid solid;
    border-width: medium 1px 1px;
}
 .w {
    background: none repeat scroll 0 0 #f7f7f7;
    height: 30px;
}
.w {
    margin: 0 auto;
    width: 990px;
}
.main {
    color: #333333;
    float: left
    margin-bottom: 10px;
     height: 100em;
    overflow: hidden;
}
.tb-void td {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: #e6e6e6;
    border-image: none;
    border-style: solid;
    border-width: 1px 0 0 1px;
    padding: 5px 4px;
    text-align: center;
}
.img-list {
    overflow: hidden;
    width: 280px;
}
.img-list .img-box {
    border: 1px solid #e1e1e1;
    float: left;
    margin-bottom: 4px;
    margin-right: 4px;
}
.img-list .img-box:hover {
    border-color: #edd28b;
}
.img-list .tuan-img-box {
    height: 50px;
    width: 50px;
}
.img-box:hover {
    border-color: #edd28b;
}
.message{
    overflow: hidden;
    width: 80px;
    word-break: break-all;
    word-wrap: break-word;
}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {
    color: #999999;
}
.taborder li {
    float: left;
    position: relative;
    z-index: 2;
}
.taborder .tyies-t {
    background: url("http://misc.360buyimg.com/jd2008/skin/df/i/tab01.png") repeat scroll 0 -32px rgba(0, 0, 0, 0);
    height: 31px;
    line-height: 31px;
    padding-left: 15px;
    padding-right: 47px;
    position: relative;
    z-index: 3;
}
	</style>
  </head>
  
  <body>
  <a href="javascript:void(0);" onclick="returnback()">回主页</a>
    <div class="history w main">
	    <div class="m m5">
		    <div class="mt">
		    	<ul class="taborder">
		    		<li class="">
		    			<div class="tyies-t">
		    				<strong class="ftx-04">全部订单</strong>
		    				<s></s>
							<b></b>
		    			</div>
		    		</li>
		    	</ul>
		    </div>
		    <div class="mc">
			    <div class="tb-void">
			    	<table  width="100%" border="0" cellspacing="0" cellpadding="0">
			    	<tr>
	<th width="286">订单信息</th>
	<th width="80">收货人</th>
	<th width="110">应付金额</th>
	<th width="100">
		<select class="sele" name="" id="submitDate">
			<option selected="" value="0">全部时间</option>
			<option value="1">最近三个月</option>
			<option value="2">今年内</option>
			<option value="9">2013年</option>
			<option value="8">2012年</option>
			<option value="3">2011年</option>
			<option value="4">2010年</option>
			<option value="5">2009年</option>
			<option value="6">2008年</option>
			<option value="7">2008年以前</option>
		</select>
	</th>
	<th width="100">
		<select class="sele" name="" id="orderState">
			<option selected="" value="4096">全部状态</option>
			<option value="1">等待付款</option>
			<option value="32">等待自提</option>
			<option value="128">等待收货</option>
			<!-- <option value="0">处理中</option> -->
			<!--<option value="2048">有效</option> -->
			
			<option value="1024">已完成</option>
			<option value="-1">已取消</option>
		</select>
	</th>
	<th width="128">操作</th>
	</tr>
			    		<tr class="tr-td">
			    			<td>
			    				图片
			    				<div class="img-list">
			    					<a class="img-box"  target="_blank" >
			    						<img>
			    					</a>
			    				</div>
			    			</td>
			    			<td>
			    				介绍
			    				<div class="message"></div>
			    			</td>
			    			<td>
			    				综合评分
			    				<div class="message"></div>
			    			</td>
			    			<td>
			    				浏览时间
			    				<span class="ftx-03">2014-07-07 <br> 18:49:35</span>
			    			</td>
			    			<td class="order-doi">
			    				浏览操作
			    			</td>
			    		</tr>
			    	</table>
		    	</div>
	    	</div>
	    </div>
    </div>
  </body>
</html>
