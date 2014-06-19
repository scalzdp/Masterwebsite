<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'testCitySelect.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <title>无标题页</title>
	 <link rel="stylesheet" href="css/citySelector.css" type="text/css"></link>
	 
	  <style type="text/css">
        .cityinput{
            border-width: 1px;
            border-style: solid;
            border-color: #666 #ccc #ccc #666;
            height: 24px;
            line-height: 24px;
            width: 175px;
            font-size: 12px;
            padding-left: 2px;
            background: url(Img/select.png) no-repeat 150px 5px;
            }
    </style>
    </head>
    <body>
    	<input type="text" class="cityinput" id="citySelect" value="城市名">
    	<script type="text/javascript" src="js/citySelector.js"></script>
    	<script type="text/javascript">
    		var test=new Vcity.CitySelector({input:'citySelect'});
		</script>
		
    </body>
</html>