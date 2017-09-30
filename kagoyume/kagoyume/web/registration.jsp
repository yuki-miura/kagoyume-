<%@page import="kagoyume.UserDataBeans"
        import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
    UserDataBeans udb = null;
    boolean reinput = false;
    //modeはregistrationconfirmから戻ってきたときに使用
    if (request.getParameter("mode") != null && request.getParameter("mode").equals("REINPUT")) {
        reinput = true;
        udb = (UserDataBeans) session.getAttribute("udb");
    }
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会員登録ページ</title>
        <jsp:include page="/bootstrap.jsp" />
    </head>
    <body style="padding: 5px">
        <div class="container-fluid">
            <div class="row"><br>
                <div class="col-lg-12 text-right"><%=h.login(log)%></div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center"><h1><strong>Regitration</strong></h1></div>
            </div><br><br>
            <form action="RegistrationConfirm" class="form-horizontal" method="post">
                <div class="row">
                    <label class="control-label col-lg-5">Name:</label>
                    <div class="form-group col-lg-4">
                        <input type="text" class="form-control" name="name" value="<% if (reinput) {
                                out.print(udb.getName());
                            }%>" autofocus><br>
                    </div>
                </div>
                <div class="row">
                    <label class="control-label col-lg-5">Password:</label>
                    <div class="form-group col-lg-4">
                        <input type="password" class="form-control" name="password" value="<% if (reinput) {
                                out.print(udb.getPassword());
                            }%>"><br>
                    </div>
                </div>
                <div class="row">
                    <label class="control-label col-lg-5">Email:</label>
                    <div class="form-group col-lg-4">
                        <input type="email" class="form-control" name="email" value="<% if (reinput) {
                                out.print(udb.getEmail());
                            }%>"><br>
                    </div>
                </div>
                <div class="row">
                    <label class="control-label col-lg-5">Address:</label>
                    <div class="form-group col-lg-4">
                        <textarea name="address" class="form-control" rows=3 cols=50 style="resize:none" wrap="hard"><% if (reinput) {
                                out.print(udb.getAddress());
                            }%></textarea><br>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-default col-lg-offset-5">Send</button>
                    <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
                </div>
            </form>
        </div>
    </div>
    <br>
    <%=h.home()%>
</body>
</html>
