<%@page import="java.util.ArrayList"
        import="kagoyume.UserDataBeans"
        import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
    UserDataBeans udb = (UserDataBeans) session.getAttribute("udb");
    ArrayList<String> chkList = udb.chkproperties();
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登録確認画面</title>
        <!-- BootstrapのCSS読み込み -->
        <link href="honoka/css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery読み込み -->
        <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        <!-- BootstrapのJS読み込み -->
        <script src="honoka/js/bootstrap.min.js"></script>
    </head>
    <body style="padding: 5px">
        <div class="container-fluid"><br>
            <div class="row">
                <div class="col-lg-12 text-right">
                    <%=h.login(log)%><br>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center"><h1><strong>Confirm</strong></h1></div>
            </div><br><br><br>
            <% if (chkList.size() == 0) {%>
            <div class="col-lg-12 text-center">
                <ul class="list-unstyled">
                    <li>名前:<%= udb.getName()%></li><br>
                    <li>パスワード:<%= udb.getPassword()%></li><br>
                    <li>メールアドレス:<%= udb.getEmail()%></li><br>
                    <li>住所:<%= udb.getAddress()%></li><br><br><br>
                    <li>上記の内容で登録いたします。よろしいですか？</li>
                    <form action="RegistrationComplete" method="POST" class="form-group">
                        <li><button type="submit" class="btn btn-default">Yes</button></li>
                        <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
                    </form>
                </ul>
            </div>
        </div>
        <% } else {%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1><strong>入力が不完全です</strong></h1>
                </div>
            </div><br><br>
            <div class="row"> 
                <div class="col-lg-12 text-center">
                        <%=h.chkinput(chkList)%>
                </div>
            </div>
        </div>
    </div>
    <% }%><br><br>
    <form action="Registration" method="POST" class="form-group">
        <button type="submit" class="btn btn-default col-lg-offset-7">Back Registration</button>
        <input type="hidden" name="mode" value="REINPUT">
        <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
    </form>
    <%=h.home()%>
</body>
</html>
