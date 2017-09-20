<%@page import="java.util.ArrayList"
        import="kagoyume.ProductBeans"
        import="kagoyume.Helper" %> 

<%
    Helper h = Helper.getInstance();
    ArrayList<ProductBeans> pl = (ArrayList<ProductBeans>) session.getAttribute("productList");
    String log = (String) session.getAttribute("logchk");
    String sw = (String) session.getAttribute("searchWord");
    String tra = pl.get(0).getTotalResultsAvailable();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>検索結果一覧</title>
        <!-- BootstrapのCSS読み込み -->
        <link href="honoka/css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery読み込み -->
        <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        <!-- BootstrapのJS読み込み -->
        <script src="honoka/js/bootstrap.min.js"></script>
    </head>
    <body style="padding: 5px"> 
        <div class="container-fluid">
            <div class="row"><br>
                <div class="col-lg-12 text-right"><%=h.login(log)%></div>
            </div>
            <div class="row">
                <ul class="list-unstyled text-center col-lg-12">
                    <li><h1><strong>SearchResult</strong></h1></li>
                    <li>Keyword:<%=sw%></li>
                    <li>HitRecode:<%=tra%></li>
                </ul>
            </div>
            <% for (ProductBeans value : pl) {%>
            <div class="col-lg-6" style="max-height:300px; margin-bottom:35px">
                <table class="table">
                    <tr>
                        <th>Image</th>
                    </tr>
                    <tr>
                        <td><a href="Item?code=<%= value.getCode()%>"><img src="<%= value.getImage()%>"></a></td>
                    </tr>
                    </tr>
                    <th>Name</th>
                    <th style="width: 60px">Price</th>
                    </tr>
                    <tr>
                        <td><a href="Item?code=<%= value.getCode()%>"><%= value.getName()%></a></td>
                        <td><a href="Item?code=<%= value.getCode()%>"><%= value.getPrice()%></a></td>
                    </tr>
                </table>
            </div>
            <% }%>
            <% if (pl.size() == 0 || pl == null) { %>
            該当データがありません。
            <% }%>
            <br>
            <%=h.home()%>
        </div>
    </body>
</html>
