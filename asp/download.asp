<!--#include file="conn.asp"-->
<%
id=cint(request.querystring("id"))
Set rs=server.createobject("adodb.recordset")
rs.open"select *from files where id="&id,conn,1,1
%>

<!DOCTYPE html>
<html>
<head>	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><% =rs("title") %></title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/content.css">
	<link href="css/bootstrap.css" rel="stylesheet">	
</head>

<body>


<div class="container">
	<!--#include file="head.asp"-->  		<!--引入头部文件-->

<div id="main">
	<div class="nav1">
	当前位置：<a href="index.asp">首页</a>
	<span> > <a href="files.asp">文件下载</a></span>
	</div>
	<h1 class="ctitle"><% =rs("title") %></h1>
	
	<p class="c-user">
		发布者：<% =rs("user") %>&nbsp &nbsp &nbsp  
		<span>[<% =rs("loadtime")%>]</span>
	</p>
	<br/><br/>
	<p><% =rs("content") %>&nbsp&nbsp</p>
	<br/><br/><br/><br/>
	<p>
		<span>点此下载：</span>
		<% dim file1
		file1 =rs("filename")
		 %>
		<a href="downloadFile.asp?Filename=<% =file1 %>"><% =rs("localname")%></a>
	</p>
	</div>
</div>
<!--#include file="footer.asp"-->
</body>
</html>