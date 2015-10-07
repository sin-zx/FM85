<!--#include file="adminconn.inc"-->
<%
  if session("aleave")="" then
      response.redirect "adminlogin.asp"
	  response.end
  end if
%>
<%
if request("no")="modi" then
newsid=request("newsid")
title=request("title")
content=request("content")
file=request("SmallClassName")
user=request("user")
ok=request("ok")

set rs=server.createobject("adodb.recordset")
sql="select * from files where id="&newsid
rs.open sql,conn,1,3
rs("title")=title
rs("content")=mcontent
rs("user")=user
rs("BigClassName")=BigClassName
rs("SmallClassName")=SmallClassName
'if ok<>"" then rs("ok") = ok
'if mimageNum<>"" then rs("imageNum") = mimageNum 
'if firstImageName<>"" then rs("firstImageName") = firstImageName
rs.update
rs.close
set rs=nothing
response.write "<script language='javascript'>" & chr(13)
		response.write "alert('修改成功！');" & Chr(13)
		response.write "window.document.location.href='loadlist.asp';"&Chr(13)
		response.write "</script>" & Chr(13)
Response.End
end if%>

<script language = "JavaScript">

function CheckForm()
{
     document.addNEWS.cnWords.value = document.frames.cnEditBox.getHTML(true);     

	if (document.addNEWS.title.value.length == 0) {
		alert("标题没有填写.");
		document.addNEWS.title.focus();
		return false;
	}
		if (document.addNEWS.user.value.length == 0) {
		alert("发布人没有填写");
		document.addNEWS.user.focus();
		return false;
	}
	return true;
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/form.css" type="text/css">
<title>修改下载</title>
</head>

<body leftmargin="0" topmargin="0" bgcolor="#FFFFEE">
<% 
newsid=request("id")
Set rso=Server.CreateObject("ADODB.RecordSet") 
sql="select * from files where  id="&newsid
rso.Open sql,conn,1,1
if rso.eof and rso.bof then
response.Write("没有记录")
else
%>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="2">
  <form name="addNEWS" method="post" action="loadmodi.asp?no=modi" onSubmit="return CheckForm();">
    <tr align="center" bgcolor="#FFFFEE"> 
      <td height="30" colspan="2"><font color="#0000FF"><strong>修改资料</strong></font></td>
    </tr>
    <tr> 
      <td width="20%" height="24" align="right" bgcolor="#FFFFEE"><font color="#FF0000">*</font>标题：</td>
      <td width="80%" valign="top" bgcolor="#FFFFEE">　 
        <input name="title" type="text" class="input" value="<%=rso("title")%>" size="30"></td>
    </tr>
    <tr> 
      <td height="24" align="right" bgcolor="#FFFFEE"><font color="#FF0000">*</font>新闻类别：</td>
      <td valign="top" bgcolor="#FFFFEE">
　 
         
                    <%
	if session("aleave")="check" then
		response.write rso("BigClassName") & "<input name='BigClassName' type='hidden' value='" & rso("BigClassName") & "'>&gt;&gt;"
	else		
        sql = "select * from BigClass"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "请先添加栏目。"
		else
		%>
                    <select name="BigClassName" onChange="changelocation(document.addNEWS.BigClassName.options[document.addNEWS.BigClassName.selectedIndex].value)" size="1">
                      <%
		    do while not rs.eof
			%>
                      <option <% if rs("BigClassName")=rso("BigClassName") then response.Write("selected") end if%> value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
                      <%
		        rs.movenext
    	    loop
		end if
        rs.close
			%>
                    </select> 
                    <%
	end if
	if session("aleave")="check" then
		response.write rso("SmallClassName") & "<input name='SmallClassName' type='hidden' value='" & rso("SmallClassName") & "'>"
	else
	%>
                    <select name="SmallClassName">
                      <option value="" <%if rso("SmallClassName")="" then response.write "selected"%>>不指定小类</option>
                      <%
			sql="select * from SmallClass where BigClassName='" & rso("BigClassName") & "'" 
			rs.open sql,conn,1,1 
			if not(rs.eof and rs.bof) then  
				do while not rs.eof %> 
                      <option <% if rs("SmallClassName")=rso("SmallClassName") then response.Write("selected") end if%> value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
                      <%
			    	rs.movenext
				loop
			end if
	        rs.close
			%>
                    </select> 
                    <%
	end if
	%>      </td>
    </tr>
    <tr> 
      <td align="right" valign="top" bgcolor="#FFFFEE"><font color="#FF0000">*</font>新闻内容：</td>
      <td valign="top" bgcolor="#FFFFEE"> 
        <IFRAME STYLE="border: none" NAME=cnEditBox src="EditBox.asp?newsId=<%=newsId%>" WIDTH=100% HEIGHT=330></IFRAME></td>
    </tr>
    <tr> 
      <td height="24" align="right" bgcolor="#FFFFEE"><font color="#FF0000">*</font>发布人：</td>
      <td valign="top" bgcolor="#FFFFEE">　 
        <input name="user" type="text" class="input" size="30" value="<%=rso("user")%>"></td>
    </tr>
    <tr> 
      <td height="24" align="right" bgcolor="#FFFFEE">是否设为首页图片新闻：</td>
      <td bgcolor="#FFFFEE">　 
        <input type="radio" value="True" <%if rso("ok")=True then Response.Write "checked"%>  name="ok">是 
        <input type="radio" value="False" <%if rso("ok")=False then Response.Write "checked"%> name="ok">
        否 　<font color="#FF0000">选择此项时请注意文章中是否添加有图片 ！</font></td>
    </tr>
    <tr align="center"> 
      <td height="35" colspan="2" bgcolor="#FFFFEE"> 
        <input type="submit" name="Submit" value="提交" class="input">
        <input type="hidden" name="newsId" value="<%=newsId%>">　 
        <input type="reset" name="Submit2" value="重置" class="input"> 
        <!--获取EditBox的内容-->
        <input name=cnWords type=hidden ID="cnWords" value=""> <input name=imageNum type=hidden ID="imageNum" value="<%=mImageNum%>"> 
        <input name=editFirstImageName type=hidden ID="editFirstImageName" value=""> 
        <!--获取EditBox的内容-->
      </td>
    </tr>
  </form>
</table>
<% End If
rso.close
set rso=nothing
 %>
</body>
</html>
