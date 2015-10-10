<%
Function trimtit(str,n)
if len(str)>n then
	trimtit=left(str,n)&"...."
else
	trimtit=str
end if
end Function

%>