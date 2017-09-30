<%@page   import="kagoyume.Helper"%>
<%
    Helper h = Helper.getInstance();
    String log = (String) session.getAttribute("logchk");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品詳細ページ</title>
        <jsp:include page="/bootstrap.jsp" />
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
                            <td><img src="${productDetail.image}"></td>
                            <th>${productDetail.description}</th>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-12">
                    <table class="table">
                        <tr>
                            <th style="width:550px">Name</th>
                        </tr>
                        <tr> 
                            <td>${productDetail.name}</td>
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
                            <td>${productDetail.defaultPrice}</td>
                            <td>${productDetail.headline}</td>
                            <td>${productDetail.rate}</td>
                            <td>${productDetail.condition}</td>
                            <td>${productDetail.shippingName}</td>
                        </tr>
                    </table>
                </div><br>
                <form action="Add" class="form-group" method="post">
                    <button type="submit" class="btn btn-default active">AddToCart</button>
                    <jsp:include page="/ac.jsp" />
                </form><br>
                <%=h.home()%>
            </div>
        </div>
    </body>
</html>
