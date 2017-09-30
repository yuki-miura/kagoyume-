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
        <title>登録完了画面</title>
        <jsp:include page="/bootstrap.jsp" />
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
                        <li>Name:${registration.name}</li><br>
                        <li>Password:${registration.pass}</li><br>
                        <li>Email:${registration.email}</li><br>
                        <li>Address:${registration.address}</li><br>
                        <li>以上の内容で登録しました。</li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
    <%=h.home()%>
</html>
