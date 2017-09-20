<%@page import="kagoyume.UserDataDTO"
        import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
    UserDataDTO udd = (UserDataDTO) session.getAttribute("login");
    String log = (String) session.getAttribute("logchk");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- BootstrapのCSS読み込み -->
        <link href="honoka/css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery読み込み -->
        <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        <!-- BootstrapのJS読み込み -->
        <script src="honoka/js/bootstrap.min.js"></script>
    </head>
    <body>
        <title>会員情報‐削除画面</title>
    </head>
<body style="padding: 5px">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 text-right"><%=h.login(log)%></div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center"><h1><strong>Delete</strong></h1></div>
        </div><br><br>
        <div class="row">
            <div class="col-lg-12 text-center">
                <ul class="list-unstyled">
                    <li>Name:<%= udd.getName()%></li><br>
                    <li>Password:<%= udd.getPassword()%></li><br>
                    <li>Email:<%= udd.getEmail()%></li><br>
                    <li>Address:<%=udd.getAddress()%></li><br>
                    <li>このユーザーをマジで削除しますか？</li>
                </ul>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-lg-12 text-center">
                <form action="MyDeleteResult" method="POST">
                    <button type="submit" class="btn btn-default" style="width: 50px">Yes</button>
                    <input type="hidden" name="id" value="<%=udd.getUserID()%>">
                    <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
                </form>
            </div>
        </div><br>
        <div class="row">
            <div class="col-lg-12 text-center">
                <form action="top.jsp">
                    <button type="submit" class="btn btn-default" style="width: 50px">No</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%=h.home()%>
</body>
</html>
