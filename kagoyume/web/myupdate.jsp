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
        <title>会員情報‐更新画面</title>
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
                <div class="col-lg-12 text-center"><h1><strong>Update</strong></h1></div>
            </div><br><br>
            <div class="row">
                <div class="form-horizontal text-center">
                    <form action="MyUpdateResult" method="POST">
                        <label class="control-label col-lg-5">Name:</label>
                        <div class="form-group col-lg-4">
                            <input type="text" class="form-control" name="name" value="<%= udd.getName()%>" required>
                        </div><br>
                        <label class="control-label col-lg-5">Password:</label>
                        <div class="form-group col-lg-4">
                            <input type="password" class="form-control" name="password" value="<%= udd.getPassword()%>" required>
                        </div><br>
                        <label class="control-label col-lg-5">Email:</label>
                        <div class="form-group col-lg-4">
                            <input type="email" class="form-control" name="email" value="<%= udd.getEmail()%>" required>
                        </div><br>
                        <label class="control-label col-lg-5">Address:</label>
                        <div class="form-group col-lg-4">
                            <textarea name="address" class="form-control" rows=3 cols=50 style="resize:none" wrap="hard" required><%=udd.getAddress()%></textarea>
                        </div><br>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default col-lg-offset-5">Update</button>
                            <input type="hidden" name="id" value="<%=udd.getUserID()%>">
                            <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%=h.home()%>
    </body>
</html>
