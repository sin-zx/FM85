<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!DOCTYPE HTML>
<html>
<head>
<script src="../third-party/jquery.min.js"></script>
<script src="../third-party/mathquill/mathquill.min.js"></script>
<link rel="stylesheet" href="../third-party/mathquill/mathquill.css"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
</head>
<body>
<%
	Dim content,title
	title = Request.Form("title")
	content = Request.Form("myEditor")
	Response.Write("<div class='content'>" + title + content + "</div>")
%>
</body>
</html>