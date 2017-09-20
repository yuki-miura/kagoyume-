<%@page import="kagoyume.Helper"
        import="java.util.ArrayList"
        import="kagoyume.UserDataBeans"
        import="kagoyume.UserDataDTO" %>
<%
    Helper h = Helper.getInstance();
    UserDataBeans udb = (UserDataBeans) session.getAttribute("udb");
    ArrayList<String> chkList = udb.chkproperties();
    UserDataDTO udd = (UserDataDTO) session.getAttribute("login");
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会員情報‐更新完了画面</title>
        <!-- BootstrapのCSS読み込み -->
        <link href="honoka/css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery読み込み -->
        <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        <!-- BootstrapのJS読み込み -->
        <script src="honoka/js/bootstrap.min.js"></script>
    </head>
    <body style="padding: 5px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-right"><%=h.login(log)%></div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center"><h1><strong>UpdateResult</strong></h1></div>
            </div><br><br>
            <% if (chkList.size() == 0) {%>
            <div class="col-lg-12 text-center">
                <ul class="list-unstyled">
                    <li>Name:<%= udd.getName()%></li><br>
                    <li>Passwoed:<%= udd.getPassword()%></li><br>
                    <li>Email:<%= udd.getEmail()%></li><br>
                    <li>Address:<%= udd.getAddress()%></li><br>
                    <li>以上の内容で更新しました。</li><br>
                </ul>
            </div>
            <% } else {%>
            <div class="col-lg-12 text-center">
                <h1>入力が不完全です</h1>
                <%=h.chkinput(chkList)%>
                <% }%>
            </div>
        </div>
        <%=h.home()%>
    </body>
</html>
