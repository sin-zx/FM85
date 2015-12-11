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

<% 
  title=rs("title")
%> 
<!--#include file="header.asp"-->

<hr>
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

<!--#include file="footer.asp"-->