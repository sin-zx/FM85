<% c_class = "active" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="imgs/favicon.ico">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/script.js"></script>
  <title><%=title%></title>
</head>
<body>

<div class="header">
  <nav class="navbar">
    <div class="container-fluid">
      <!-- 导航栏 -->
      <div class="navbar-header">
      <!-- 折叠菜单 -->
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <!-- <a class="navbar-brand" href="">FM85.0</a> -->
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <li class=<%=a_class %> ><a href="index.asp">首页</a></li>
          <li class=<%=b_class %>><a href="showlist.asp">节目列表</a></li>
          <li class=<%=c_class %>><a href="order.asp">点点传情</a></li>
          <li class=<%=d_class %>><a href="aboutUs.asp">电台君们</a></li>
          <li><a href="admin/">管理员登陆</a></li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
</div>
    
<div class="container-fluid order_body">
  <div class="row-fluid">
      <div class="intro">
          <br><br>
          <h2 class="titleword">世界上有许多花</h2>
          <h2 class="titleword">只要你说话就会聆听</h2>
          <h2 class="titleword">世界上有许多树</h2>
          <h2 class="titleword">只要你说话就会给自己听</h2>
          <h2 class="titleword">当一个发现的午后</h2>
          <h2 class="titleword">是滴是滴</h2>
          <h2 class="titleword">别让蜘蛛网在墙角张扬</h2>
          <h2 class="titleword">也别让手机冷在一旁</h2>
          <h2 class="titleword">让这份祝福穿过世界的中心</h2>
          <h2 class="titleword">送给你最牵挂的那个人</h2>
      </div>
      <div class="order">
        <a data-toggle="modal" data-target="#orderModal" class="btn btn-lg btn-default">点歌</a>
      </div>

<!--#include file="footer.asp"-->



<!-- Modal点歌表单模态框 -->
<div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel2">点歌频道</h4>
      </div>
      <div class="modal-body">
        <!-- 表单 -->
        <form>
          <h3 id="addFail" hidden></h3> <!-- 错误提示信息 -->
          <h3 id="addSuccess" hidden></h3>  <!-- 成功提示信息 -->
          <div class="form-group">
            <label for="fromWho">您的称呼</label>
            <input type="text" class="form-control" id="fromWho" placeholder="必填">
          </div>
          <div class="form-group">
            <label for="toWho">对方称呼</label>
            <input type="text" class="form-control" id="toWho" placeholder="必填">
          </div>
          <div class="form-group">
            <label for="songname">点歌曲目</label>
            <input type="text" class="form-control" id="songname" placeholder="" value="随便来一首">
          </div>
          <div class="form-group">
            <label for="fromInfo">您的学院and年级</label>
            <input type="text" class="form-control"  id="fromInfo" placeholder="">
          </div>
          <div class="form-group">
            <label for="toInfo">对方学院and年级</label>
            <input type="text" class="form-control" id="toInfo" placeholder="">
          </div>
          
          <div class="form-group">
            <label for="wish">寄语</label>
            <textarea  class="form-control" id="wish" rows="3" placeholder="必填"></textarea>
          </div>
  
          <!-- <button class="btn btn-default" id="btnSub" onclick="return checkForm();">提交</button> -->
          <a id="btnSub" class="btn btn-default" onclick="return checkForm();">提交</a>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- Modal end -->