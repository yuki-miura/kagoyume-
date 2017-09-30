<%@page import="java.util.ArrayList"
        import="kagoyume.UserDataBeans"
        import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
    UserDataBeans udb = (UserDataBeans) session.getAttribute("udb");
    ArrayList<String> chkList = udb.chkproperties();
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登録確認画面</title>
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
                <div class="col-lg-12 text-center"><h1><strong>Confirm</strong></h1></div>
            </div><br><br><br>
            <% if (chkList.size() == 0) {%>
            <div class="col-lg-12 text-center">
                <ul class="list-unstyled">
                    <li>Name:${udb.name}</li><br>
                    <li>Password:${udb.password}</li><br>
                    <li>Email:${udb.email}</li><br>
                    <li>Address:${udb.address}</li><br><br><br>
                    <li>上記の内容で登録いたします。よろしいですか？</li>
                    <form action="RegistrationComplete" method="POST" class="form-group">
                        <li><button type="submit" class="btn btn-default">Yes</button></li>
                            <jsp:include page="/ac.jsp" />
                    </form>
                </ul>
            </div>
        </div>
        <% } else {%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1><strong>入力が不完全です</strong></h1>
                </div>
            </div><br><br>
            <div class="row"> 
                <div class="col-lg-12 text-center">
                    <%=h.chkinput(chkList)%>
                </div>
            </div>
        </div>
    </div>
    <% }%><br><br>
    <form action="Registration" method="POST" class="form-group">
        <button type="submit" class="btn btn-default col-lg-offset-7">Back Registration</button>
        <input type="hidden" name="mode" value="REINPUT">
        <jsp:include page="/ac.jsp" />
    </form>
    <%=h.home()%>
</body>
</html>
