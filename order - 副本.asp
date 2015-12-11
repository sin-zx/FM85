<% 
  title="点歌频道" 
  c_class="active"
%> 
<!--#include file="header.asp"-->

<!-- 这里背景图适应有问题。将主体包裹在container-fluid容器里 背景图（order_body）无法呈现100%宽度 -->
<div class="container-fluid order_body">

      <div class="intro">
          <br><br>
          <h2 class="titleword">we will write something here</h2>
          <h2 class="titleword">we will write something here</h2>
          <h2 class="titleword">we will write something here</h2>
          <h2 class="titleword">we will write something here</h2>
          <h2 class="titleword">we will write something here</h2>
          <h2 class="titleword">we will write something here</h2>
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