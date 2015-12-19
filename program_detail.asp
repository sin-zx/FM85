<% Response.Charset="UTF-8" %>  
<!--#include file="conn.asp"-->
<%
id=cint(request.querystring("id"))
Set rs=server.createobject("adodb.recordset")
rs.open"select * from programs where id="&id,conn,1,1
if rs.eof and rs.bof then
response.write "<script language='javascript'>alert('查找出错！请重试');window.document.location.href='index.asp';</script>"
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
	  <li><a href="showlist.asp">节目列表</a></li>
	  <li class="active"><% =rs("title") %></li>
	</ol>
	<div class="c_head">
		<h3 class="c_title"><% =rs("title") %></h3>
		<p class="text-muted">分类：<% =rs("class") %> &nbsp;&nbsp;<% =rs("addtime") %> </p>
	</div>
	<div class="c_main">
		<%
			dim classD
			If rs("class")="每日节目" Then 
				classD=1 
			Else 
				classD=2
			End If
		%>
		<% if rs("filename")<>"empty" then %>
		<h4>下载文件：<a href='down.asp?filename=<% =rs("filename") %>&class=<% =classD %>'><% =rs("localname") %></a></h4>
		<% end if %>
		<h4>在线收听/观看地址:<a href='<% =rs("url") %>' target="_blank">点我</a></h4>
		<br>
		<h4>简介：</h4>
		<div class="c_detail"> <% =rs("content") %> </div>
	</div>

<!--#include file="footer.asp"-->