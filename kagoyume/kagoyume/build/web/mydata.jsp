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
        <title>会員情報閲覧画面</title>
        <jsp:include page="/bootstrap.jsp" />
    </head>
    <body style="padding: 5px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-right">
                    <%=h.login(log)%><br>
                </div>
                <div class="col-lg-12 text-center"><h1><strong>MyData</strong></h1></div>
            </div><br><br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <ul class="list-unstyled">
                        <li>Name:<%= udd.getName()%></li><br>
                        <li>Password:<%= udd.getPassword()%></li><br>
                        <li>Emai:<%= udd.getEmail()%></li><br>
                        <li>Address:<%= udd.getAddress()%></li><br>
                        <li>TotalPay:<%= udd.getTotal()%></li><br>
                        <li>RegisteredDate:<%= udd.getNewDate()%></li><br>
                    </ul>
                </div>
            </div><br>
            <div class="row">
                <div class="col-lg-offset-3 col-lg-1">
                    <form action="MyHistory">
                        <button type="submit" class="btn btn-default">MyHistory</button>
                        <input type="hidden" name="userID" value="<%=udd.getUserID()%>">
                        <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
                    </form>
                </div>
                <div class="col-lg-offset-1 col-lg-1">
                    <form action="MyUpdate" method="POST">
                        <button type="submit" class="btn btn-default">Update</button>
                        <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
                    </form>
                </div>
                <div class="col-lg-offset-1 col-lg-1">
                    <form action="MyDelete" method="POST">
                        <button type="submit" class="btn btn-default">Delete</button>
                        <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
                    </form>
                </div>
            </div>
            <%=h.home()%>
        </div>
    </body>
</html>
