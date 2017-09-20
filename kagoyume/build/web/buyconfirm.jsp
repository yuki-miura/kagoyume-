<%@page import="kagoyume.ProductBeans"
        import="java.util.ArrayList"
        import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
    ArrayList<ProductBeans> pdl = (ArrayList) session.getAttribute("pdl");
    int totalPrice = (Integer) session.getAttribute("totalPrice");
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>購入確認</title>
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
                <div class="col-lg-12 text-right">
                    <%=h.login(log)%><br>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center"><h1><strong>Confirm</strong></h1></div>
            </div>
        </div><br><br>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-offset-2 col-lg-10 text-left">
                <% if (pdl != null && pdl.size() != 0) {%>
                <% for (ProductBeans value : pdl) {%>
                    <ul class="list-unstyled"> 
                        <li>Name:<%= value.getName()%></li>
                        <li>Price:<%= value.getDefaultPrice()%></li>
                    </ul><br>
                    <% }%>
                    TotalPrice:<%=totalPrice%>
                </div>
            </div><br>
            <div class="row">
                <div class="col-lg-offset-2 col-lg-10 text-left">
                    <% for (int i = 1; i <= 3; i++) {%>
                    <form action="BuyComplete" method="post">
                        <input type="radio" name="type" value="<%=i%>" required><%=h.exTypenum(i)%><br>
                        <% }%><br>
                        <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                        <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
                        <button type="submit" class="btn btn-default">Buy</button>
                    </form>
                </div><br><br>
            </div>
        </div>
        <% } else { %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-offset-2 col-lg-10 text-left">
                    <strong>Empty</strong>
                </div>
            </div>
        </div><br>
        <% }%><br>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-offset-2 col-lg-10 text-left">
                    <form action="Cart">
                        <button type="submit" class="btn btn-default">BackCart</button>
                    </form>
                </div>
            </div><br><br>
            <%=h.home()%>
        </div>
    </body>
</html>
