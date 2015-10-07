<%
dim conn,connstr
on error resume next
connstr="DBQ="+server.mappath("data/ohmygod.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
Set conn=Server.CreateObject("ADODB.CONNECTION")
conn.open connstr
%>


