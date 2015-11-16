<% Response.Charset="UTF-8" %>  
<!--#include file="conn.asp"-->
<%
fromWho = request.form("fromWho") 
toWho = request.form("toWho")
songname = request.form("songname")
fromInfo = request.form("fromInfo")
toInfo = request.form("toInfo")
wish = request.form("wish")
if fromInfo="" then fromInfo="无" end if
if toInfo="" then toInfo="无" end if
'fromWho = 1
'toWho = 2
'songname = 3
'fromInfo = 4
'toInfo = 5
'wish = 6

set rs=server.createobject("adodb.recordset")
sql="select * from orders where id is null"
rs.open sql,conn,1,3
rs.addnew

'注：当变量为空时会插入失败
rs("fromWho")=fromWho
rs("toWho")=toWho
rs("songname")=songname
rs("fromInfo")=fromInfo
rs("toInfo")=toInfo
rs("wish")=wish
rs.update
rs.close
set rs=nothing
conn.close  
set conn=nothing
response.Write("ok")

%>