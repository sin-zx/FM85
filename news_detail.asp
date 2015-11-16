<% Response.Charset="UTF-8" %>  
<!--#include file="conn.asp"-->
<%
id=cint(request.querystring("id"))
Set rs=server.createobject("adodb.recordset")
rs.open"select * from news where id="&id,conn,1,1
if rs.eof and rs.bof then
response.write "<script language='javascript'>alert('文章查找出错！请重试');window.document.location.href='index.asp';</script>"
response.end
end if
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="imgs/favicon.ico">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/content.css">
	<script src="js/jquery.min.js"></script>
	<title>FM850</title>
</head>
<body>
<div class="header">
	<nav class="navbar">
	  <div class="container-fluid">
	    <!-- 导航栏 -->
	    <div class="navbar-header">
	    <!-- 折叠菜单 -->
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="">FM85.0</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav navbar-right">
			<li><a href="index.asp">首页 <span class="sr-only">(current)</span></a></li>
			<li><a href="showlist.asp">节目列表</a></li>
			<li><a href="order.asp">点点传情</a></li>
			<li><a href="aboutUs.asp">电台君们</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
</div>
<hr>
<div class="container-fluid">
	<div class="row-fluid">


	<ol class="breadcrumb">
	  <li><a href="index.asp">主页</a></li>
	  <li class="active">资讯</li>
	  <li class="active"><% =rs("title") %></li>
	</ol>
	
	<div class="c_head">
		<h3 class="c_title"><% =rs("title") %></h3>
		<p class="text-muted">分类：<% =rs("class") %> &nbsp;&nbsp;<% =rs("addtime") %> </p>
	</div>
	<div class="c_main">
		<% =rs("content") %>
	</div>

	</div>
</div>


<footer>
    <p>©2015 深圳大学广播电台 | by z.x</p>
</footer>

    <script src="js/bootstrap.min.js"></script>


</body>
</html>