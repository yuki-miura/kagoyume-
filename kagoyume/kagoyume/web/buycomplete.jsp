<%@page import="kagoyume.Helper"%>
<%
    Helper h = Helper.getInstance();
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>購入-完了画面</title>
        <jsp:include page="/bootstrap.jsp" />
    </head>
    <body style="padding: 5px">
        <div class="container-fluid"><br>
            <div class="row">
                <div class="col-lg-12 text-right">
                    <%=h.login(log)%><br>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center"><h1><strong>Complete</strong></h1></div>
            </div><br><br>
            <div class="row">
                <div class="col-lg-12 text-center"><h1>購入が完了しました</h1></div><br>
            </div><br><br>
            <%=h.home()%>
        </div>
    </body>
</html>
