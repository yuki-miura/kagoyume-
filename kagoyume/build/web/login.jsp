<%@page import="kagoyume.UserDataBeans"
        import="java.util.ArrayList"
        import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ログインページ</title>
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
                <div class="col-lg-12 text-center"><h1><strong>LoginPage</strong></h1></div>
            </div><br><br><br>
            <form action="Login" method="post" class="form-horizontal">
                <div class="row">
                    <div class="col-lg-5 text-right"><label class="control-label">Name:</label></div>
                    <div class="form-group col-lg-3">
                        <input type="text" name="name" required class="form-control">
                    </div><br><br><br><br>
                </div>
                <div class="row">
                    <div class="col-lg-5 text-right"><label class="control-label">Password:</label></div>
                    <div class="col-lg-3 form-group text-left">
                        <input type="password" name="password" class="form-control"required>
                    </div><br><br><br><br>
                </div>
                <div class="row">
                    <div class="form-group">
                        <button type="submit" class="btn btn-default col-lg-offset-5 ">Login</button>
                        <input type="hidden" name="loginNow" value="start">
                    </div>
                </div>
            </form>
        </div><br><br>
        <form action="Registration">
            <button class="btn btn-default col-lg-offset-7" type="submit">NewMember</button>
            <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
        </form><br><br>
        <%=h.home()%>
    </body>
</html>
