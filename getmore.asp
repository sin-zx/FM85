<!--#include file="conn.asp"-->
<!--#include file="function.asp"-->
<%
Set rs1=server.createobject("adodb.recordset")
if request.form("listtype")=1 then
	sql="select * from programs where class='每日节目' order by id desc"
else
	sql="select * from programs where class='荔园观点' order by id desc"
end if

rs1.open sql,conn,1
rs1.PageSize=5
rs1.AbsolutePage=clng(request.form("AbsolutePage")) 	 '查找的页数（每页 条）
if rs1.eof then
	response.write(-1)
	response.end
else

'循环开始
dim i

for i=1 to 5
	response.write("<li><a href='program_detail.asp?id="&rs1("id")&"'>"&trimtit(rs1("title"),30)&"</a></li>")
rs1.movenext 	'(将指针移动到下一条记录)

next	'继续循环

rs1.close
set rs1=nothing
conn.close  
set conn=nothing
end if
%>