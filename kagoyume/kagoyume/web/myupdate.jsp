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
        <title>会員情報‐更新画面</title>
         <jsp:include page="/bootstrap.jsp" />
    </head>
    <body style="padding: 5px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-right"><%=h.login(log)%></div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center"><h1><strong>Update</strong></h1></div>
            </div><br><br>
            <div class="row">
                <div class="form-horizontal text-center">
                    <form action="MyUpdateResult" method="POST">
                        <label class="control-label col-lg-5">Name:</label>
                        <div class="form-group col-lg-4">
                            <input type="text" class="form-control" name="name" value="${login.name}" required>
                        </div><br>
                        <label class="control-label col-lg-5">Password:</label>
                        <div class="form-group col-lg-4">
                            <input type="password" class="form-control" name="password" value="${login.password}" required>
                        </div><br>
                        <label class="control-label col-lg-5">Email:</label>
                        <div class="form-group col-lg-4">
                            <input type="email" class="form-control" name="email" value="${login.email}" required>
                        </div><br>
                        <label class="control-label col-lg-5">Address:</label>
                        <div class="form-group col-lg-4">
                            <textarea name="address" class="form-control" rows=3 cols=50 style="resize:none" wrap="hard" required>${login.address}</textarea>
                        </div><br>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default col-lg-offset-5">Update</button>
                            <input type="hidden" name="id" value="${login.userID}">
                            <jsp:include page="/ac.jsp" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%=h.home()%>
    </body>
</html>
