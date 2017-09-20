<%@page import="kagoyume.Helper"
        import="kagoyume.UserDataBeans"%>
<%
    Helper h = Helper.getInstance();
    UserDataBeans udb = (UserDataBeans) session.getAttribute("registration");
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登録完了画面</title>
        <!-- BootstrapのCSS読み込み -->
        <link href="honoka/css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery読み込み -->
        <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        <!-- BootstrapのJS読み込み -->
        <script src="honoka/js/bootstrap.min.js"></script>
    </head>
    <body style="padding: 5px">
        <div class="container-fluid">
            <div class="row"><br>
                <div class="col-lg-12 text-right"><%=h.login(log)%></div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1><strong>Complete</strong></h1>
                </div>
            </div><br><br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <ul class="list-unstyled">
                        <li>名前:<%= udb.getName()%></li><br>
                        <li>パスワード:<%= udb.getPassword()%></li><br>
                        <li>メールアドレス:<%= udb.getEmail()%></li><br>
                        <li>住所:<%= udb.getAddress()%></li><br>
                        <li>以上の内容で登録しました。</li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
    <%=h.home()%>
</html>
