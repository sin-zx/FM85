<!--#include file="conn.asp"-->
<!--#include file="function.asp"-->
<!DOCTYPE html>
<head>
    <title>深大土木力学实验室</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.slideBox.js" type="text/javascript"></script>

<script>
jQuery(function($){
	$('#slidebox').slideBox();
});
</script>

</head>
<body>   
<div class="container">
		<!--#include file="head.asp"-->  		<!--引入头部文件-->
		<!--#include file="slidebox.asp"--> 	<!--图片轮播-->
			
		

		<div class="content">												<!--资讯列表-->
			<div class="content1">
				<div class="thead">
				<h1 class="tl">&nbsp;学术动态 <small><a class="more" href="info.asp?funo=1">| More..</a></small></h1>
				
				</div>
				<div class="titleimg"><img src="imgs/list1.jpg"/></div>
				<ul class="list">
				
				<% Set rs=conn.Execute("select top 6 *from News where BigClassName='资讯' and SmallClassName='学术动态'order by id desc")
					
					dim i
					for i=0 to 5
					%>

					<li>
						<a class="ntitle" href="content.asp?id=<% =rs("id")%> "><% =trimtit(rs("title"),15)%></a>
						<span class="ntime"><% =rs("infotime")%></span>
					</li>
					<%
					rs.movenext
					next
					rs.close
					%>
				</ul>
				
			</div>
			<div class="content2">
				<div class="thead">
				<h1 class="tl">&nbsp; 实验室相关<small><a class="more" href="info.asp?funo=2">| More..</a></small></h1>
				</div>
				<div class="titleimg"><img src="imgs/list2.jpg"/></div>
				<ul class="list">
					<% Set rs=conn.Execute("select top 6 *from News where BigClassName='资讯' and SmallClassName='实验室相关'order by id desc")
					
					
					for i=0 to 5
					%>
					

					<li>
						<a class="ntitle" href="content.asp?id=<% =rs("id")%>"><% =trimtit(rs("title"),15)%></a>
						<span class="ntime"><% =rs("infotime")%></span>
					</li>
					
					
					<%
					rs.movenext
					next
					rs.close
					%>
				</ul>
			</div>
		</div>
		
<!--#include file="footer.asp"-->
		
</div>
</body>
</html>	