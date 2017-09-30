<%-- 
    Document   : teston
    Created on : 2017/09/26, 20:07:18
    Author     : guest1Day
--%>
<%
//アクセスチェック用の変数を生成
    session.setAttribute("ac", (int) (Math.random() * 1000));
    Integer ac = (Integer) session.getAttribute("ac");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="" onclick="document.ok.submit();return false;">Link</a>
        <form action="Teston" method="post" name="ok">
            <input type="hidden" name="ac" value="<%=ac%>">
        </form>
    </body>
</html>
