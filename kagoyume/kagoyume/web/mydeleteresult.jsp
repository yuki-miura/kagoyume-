<%@page  import="kagoyume.Helper"%>
<%
    Helper h = Helper.getInstance();
    String log = "";
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会員情報‐削除完了画面</title>
        <jsp:include page="/bootstrap.jsp" />
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-right"><%=h.login(log)%></div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center"><h1><strong>DeleteResult</strong></h1></div>
            </div><br><br>
            <div class="col-lg-12 text-center">
                <Strong>DeleteComplete</strong><br>
            </div>
        </div><br>
        <%=h.home()%>
    </body>
</html>
