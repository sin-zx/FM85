<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="imgs/favicon.ico">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/script.js"></script>
  <title><%=title%></title>
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
			<li class=<%=a_class %> ><a href="index.asp">首页</a></li>
			<li class=<%=b_class %>><a href="showlist.asp">节目列表</a></li>
			<li class=<%=c_class %>><a href="order.asp">点点传情</a></li>
			<li class=<%=d_class %>><a href="aboutUs.asp">电台君们</a></li>
			<li><a href="admin/">管理员登陆</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
</div>

<div class="container-fluid">
  	<div class="row-fluid">