<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'messageDetails.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" >
if  ((document.getElementById) && 
window.addEventListener || window.attachEvent){
(function(){
var e_img = new Image();
e_img.src = "Img/eye.gif"; 
var p_img = new Image();
p_img.src = "Img/pupils.gif";
var d = document;
var pix = "px";
var idx = document.images.length;
if (document.getElementById("cont"+idx)) idx++;
var eyeballs = "";
var pupil1 = "";
var pupil2 = "";
d.write('<div id="cont'+idx+'" class="eyestyle" style="height:34px;width:69px">'
+'<div id="eyblls'+idx+'" style="position:relative;width:69px;height:34px"><img src="'+e_img.src+'" alt=""/>'
+'<img id="ppl1'+idx+'" src="'+p_img.src+'" alt="" style="position:absolute;top:10px;left:11px;width:13px;height:13px"/>'
+'<img id="ppl2'+idx+'" src="'+p_img.src+'" alt="" style="position:absolute;top:10px;left:46px;width:13px;height:13px"/>'
+'<\/div><\/div>');
function watchTheMouse(y,x){
var osy = eyeballs.offsetTop;
var osx = eyeballs.offsetLeft;
var c1y = osy + 17;
var c1x = osx + 17;
var c2y = osy + 17;
var c2x = osx + 52;
var dy1 = y - c1y;
var dx1 = x - c1x;
var d1 = Math.sqrt(dy1*dy1 + dx1*dx1);
var dy2 = y - c2y;
var dx2 = x - c2x;
var d2 = Math.sqrt(dy2*dy2 + dx2*dx2);
var ay1 = y - c1y;
var ax1 = x - c1x;
var angle1 = Math.atan2(ay1,ax1)*180/Math.PI;
var ay2 = y - c2y;
var ax2 = x - c2x;
var angle2 = Math.atan2(ay2,ax2)*180/Math.PI;
var dv = 1.7;
var onEyeBall1 = (d1 < 17)?d1/dv:10;
var onEyeBall2 = (d2 < 17)?d2/dv:10;
pupil1.top = c1y-6+onEyeBall1 * Math.sin(angle1*Math.PI/180)-osy+pix;
pupil1.left = c1x-6+onEyeBall1 * Math.cos(angle1*Math.PI/180)-osx+pix;
pupil2.top = c2y-6+onEyeBall2 * Math.sin(angle2*Math.PI/180)-osy+pix;
pupil2.left = c2x-6+onEyeBall2  *Math.cos(angle2*Math.PI/180)-osx+pix;
}
function mouse(e){
var y,x;
if (!e) e = window.event;    
 if (typeof e.pageY == 'number'){
  y = e.pageY;
  x = e.pageX;
 }
 else{
 var ref = document.documentElement||document.body;
 y = e.clientY + ref.scrollTop;
 x = e.clientX + ref.scrollLeft;
}
watchTheMouse(y,x);
}
function init(){
eyeballs = d.getElementById("eyblls"+idx);
pupil1 = d.getElementById("ppl1"+idx).style;
pupil2 = d.getElementById("ppl2"+idx).style;
}
if (window.addEventListener){
 window.addEventListener("load",init,false);
 document.addEventListener("mousemove",mouse,false);
}  
else if (window.attachEvent){
 window.attachEvent("onload",init);
 document.attachEvent("onmousemove",mouse);
} 
})();
}//End.
</script>

<style type="text/css">
body{margin:30px;padding:0;font-size:12px;text-align:center}
div{float:left;line-height:25px;color:red}
.photo{position:relative;width:50px;height:50px;float:left;margin:0 50px;}
.photo span{width:50px;height:50px;display:block;position:absolute;top:0;left:0;background: url(head_bg.png) no-repeat;}
.photo img{border:none;padding:0;}
</style>
  </head>
  
  <body>
    This is my JSP page. <br>
    title>JavaScript切换图片</title>
	<script>
	function showDaTu(src){
	document.getElementById("defaultImg").src=src;
	}
	</script>
	<img src="wall1.jpg" id="defaultImg">
	<br><br><br>
	<img src='Img/wall_s1.jpg' onmouseover="showDaTu('Img/wall1.jpg')">
	<img src='Img/wall_s2.jpg' onmouseover="showDaTu('Img/wall2.jpg')">
	<img src='Img/wall_s3.jpg' onmouseover="showDaTu('Img/wall3.jpg')">
	<img src='Img/wall_s4.jpg' onmouseover="showDaTu('Img/wall4.jpg')">
	<br>因图片较大，请等待图片加载完成……然后鼠标放小图上就会切换了。
	
	<div class="photo">
	<a href="#"><span></span><img src="wall_s3.jpg" alt="image" width="50" height="50" /></a>圆角头像
	</div>
	
	javascript经典效果示例\JavaScript图片特效
  </body>
</html>
