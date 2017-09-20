<%@page import="java.util.ArrayList"
        import="kagoyume.ProductBeans"
        import="kagoyume.ProductDataDTO"
        import="kagoyume.UserDataDTO"
        import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
    ArrayList<ProductDataDTO> buyHistory = (ArrayList) request.getAttribute("buyHistory");
    UserDataDTO udd = (UserDataDTO) session.getAttribute("login");
    ArrayList<ProductBeans> pbl = (ArrayList) request.getAttribute("historyData");
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会員情報-購入履歴</title>
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
                <div class="col-lg-12 text-center"><h1><strong>MyHistory</strong></h1></div>
            </div><br><br>
            <div class="row">
                <%for (ProductBeans value : pbl) {%>
                <div class="col-lg-12" style="width: 1200px; margin-bottom:35px">
                    <table class="table">
                        <tr>
                            <th style="width: 170px">Image</th>
                            <th style="width:500px">Name</th>
                            <th>Price</th>
                            <th style="width: 150px">BuyDate</th>
                            <th>Shipping</th>
                        </tr>
                        <tr>
                            <td><img src="<%= value.getImage()%>"></td>
                            <td><%=value.getName()%></td>
                            <td><%=value.getDefaultPrice()%></td>
                            <%for (ProductDataDTO val : buyHistory) {%>
                            <%if (value.getCode().equals(val.getItemCode())) {%>
                            <td><%= val.getBuyDate()%></td>
                            <td><%= h.exTypenum(val.getType())%></td>
                            <%}%>
                            <%}%>
                        </tr>
                    </table>
                </div>
                <% }%>
            </div>
            TotalPrice:<%=udd.getTotal()%><br><br>
            <%=h.home()%>
        </div>
    </body>
</html>
