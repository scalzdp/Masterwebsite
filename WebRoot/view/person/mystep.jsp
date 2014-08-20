<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.bip.vo.EvaluationOfHistoryVO" %>
<%@ page import="com.bip.source.ResourceMessage" %>
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
	.top{
        	width:1000px;
        	hight:5%;
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
    border-left: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;
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
     height: 70%;
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
    width: 180px;
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
.tr-th td {
    text-align: left;
}
.tr-th span {
    display: inline-block;
    float: left;
    height: 24px;
    line-height: 23px;
    margin-right: 10px;
    overflow-x: hidden;
    overflow-y: hidden;
    vertical-align: middle;
}
.tr-th {
    background-attachment: scroll;
    background-clip: border-box;
    background-color: #f9f9f9;
    background-image: none;
    background-origin: padding-box;
    background-position: 0 0;
    background-repeat: repeat;
    background-size: auto auto;
}
.tr-th span.tcol4 {
    color: #666666;
    float: right;
    width: 170px;
}
.tr-th td, .tr-split td {
    padding-bottom: 4px;
    padding-top: 4px;
}


	</style>
  </head>
  
  <body>
  <div class="top">&nbsp; 
  	<a href="javascript:void(0);" onclick="returnback()">
		<img src="Img/returnback.jpg"/>
	</a>
  </div>
    <div class="history w main">
	    <div class="m m5">
		    <div class="mt">
		    	<ul class="taborder">
		    		<li class="">
		    			<div class="tyies-t">
		    				<strong class="ftx-04">全部记录</strong>
		    				<s></s>
							<b></b>
		    			</div>
		    		</li>
		    	</ul>
		    </div>
		    <div class="mc">
			    <div class="tb-void">
			    <%List<EvaluationOfHistoryVO> vos = (List<EvaluationOfHistoryVO>)request.getAttribute(ResourceMessage.EVALUATION_HISTORY); %>
			    	<table  width="100%" border="0" cellspacing="0" cellpadding="0">
				    	<tr class="tr-th">
							<th width="286">浏览信息</th>
							<th width="180">介绍</th>
							<th width="100">
								<select class="sele" name="" id="orderState">
									<option selected="" value="4096">全部分数</option>
									<option value="5">满分评价</option>
									<option value="4">4分评价</option>
									<option value="3">3分评价</option>
									<option value="2">2分评价</option>
									<option value="1">1分评价</option>
									<option value="0">0分评价</option>
									<option value="-1">-1分评价</option>
									<option value="-2">-2分评价</option>
									<option value="-3">-3分评价</option>
									<option value="-4">-4分评价</option>
									<option value="-5">-5分评价</option>
								</select>
							</th>
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
						<th width="128">操作</th>
						</tr>
						<%for(EvaluationOfHistoryVO vo:vos){ %>
							<tr class="tr-td">
					   			<td>
					   				<div class="img-list">
					   					<a class="img-box"  target="_blank" >
					   						<img width="50" height="50" src="/Img<%=vo.getPath() %>" title="<%=vo.getMemo()%>">
					   					</a>
					   				</div>
					   			</td>
					   			<td>
					   				<div class="message"><%=vo.getMemo() %></div>
					   			</td>
					   			<td>
					   				<div class="message">5.0</div>
					   			</td>
					   			<td>
					   				<span class="ftx-03"><%=vo.getDateTime() %></span>
					   			</td>
					   			<td class="order-doi">
					   				<a onclick="cancelOrder(<%=vo.getEvaluationId() %>);" href="javascript:void(0);">删除评价</a>
					   			</td>
					   		</tr>
						<%} %>
				   		
			    	</table>
		    	</div>
	    	</div>
	    </div>
    </div>
   
  </body>
</html>
