<%@page import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>error</title>
        <jsp:include page="/bootstrap.jsp" />
    </head>
    <body style="padding: 5px">
        <div class="container-fluid">
            <div class="row"><br><br>
                <div class="col-lg-12 text-center"><h1><strong>ErrorPage</strong></h1><br><br></div>
                <div class="col-lg-12 text-center">エラーが発生しました。以下の項目を確認してください。<br></div>
                <div class="col-lg-12 text-center">${error}<br><br><br><br><br></div>
                    <%session.invalidate();%>
                    <%=h.home()%>
            </div>
        </div>
    </body>
</html>
