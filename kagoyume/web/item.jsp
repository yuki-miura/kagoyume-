<%@page   import="kagoyume.Helper"
          import="java.util.ArrayList"
          import="kagoyume.ProductBeans"
          %>
<%
    Helper h = Helper.getInstance();
    ProductBeans pb = (ProductBeans) session.getAttribute("productDetail");
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品詳細ページ</title>
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
                <div class="col-lg-12 text-center"><h1><strong>Item</strong></h1></div>
                <div class="col-lg-12">
                    <table class="table">
                        <tr>
                            <th>Image</th>
                            <th>Spec</th>
                        </tr>
                        <tr>
                            <td><img src="<%= pb.getImage()%>"></td>
                            <th><%= pb.getDescription()%></th>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-12">
                    <table class="table">
                        <tr>
                            <th style="width:550px">Name</th>
                        </tr>
                        <tr> 
                            <td><%= pb.getName()%></td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-12">
                    <table class="table">
                        <tr>
                            <th>Price</th>
                            <th>HeadLine</th>
                            <th>Rate</th>
                            <th>Condition</th>
                            <th>Shipping</th>
                        </tr>
                        <tr>
                            <td><%= pb.getDefaultPrice()%></td>
                            <td><%= pb.getHeadline()%></td>
                            <td><%= pb.getRate()%></td>
                            <td><%= pb.getCondition()%></td>
                            <td><%= pb.getShippingName()%></td>
                        </tr>
                    </table>
                </div><br>
                <form action="Add" class="form-group">
                    <button type="submit" class="btn btn-default active">AddToCart</button>
                    <input type="hidden" name="ac" value="<%=session.getAttribute("ac")%>">
                </form><br>
                <%=h.home()%>
            </div>
        </div>
    </body>
</html>
