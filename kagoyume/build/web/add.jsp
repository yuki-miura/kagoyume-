<%@page import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品追加</title>
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
                <div class="col-lg-12 text-center"><h1><strong>AddToCart</strong></h1></div>
            </div><br><br>
        </div>
        <div class="container-fluid">
            <div class="row"><br><br><br><br><br><br>
                <ul class="list-unstyled text-center col-lg-12">
                    <div><li><a href="Cart">Cart</a></li></div><br>
                    <div><li><a href="search.jsp">SearchResult</a></li></div><br>
                    <div><li><%=h.home()%></li></div>
                </ul>
            </div>
        </div>
    </body>
</html>
