<%@page import="kagoyume.ProductBeans"
        import="java.util.ArrayList"
        import="kagoyume.Helper" %>
<%
    Helper h = Helper.getInstance();
    String log = (String) session.getAttribute("logchk");
    ArrayList<ProductBeans> pdl = (ArrayList) session.getAttribute(log);
    int totalPrice = 0;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>カートページ</title>
        <jsp:include page="/bootstrap.jsp" />
    </head>
    <body style="padding: 5px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-right"><%=h.login(log)%></div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center"><h1><strong>Cart</strong></h1></div>
            </div><br><br>
            <% if (pdl != null && pdl.size() != 0) {%>
            <% for (ProductBeans value : pdl) {%>
            <div class="row">
                <div class="col-lg-2">
                    <table class="table">
                        <tr>
                            <th>Image</th>
                        </tr>
                        <tr>
                            <td><img src="<%= value.getImage()%>"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-7">
                    <ul class="list-unstyled">
                        <li>Name:<td><a href="Item?code=<%= value.getCode()%>"><%= value.getName()%></a></li><br><br>
                        <li>Price:<%= value.getDefaultPrice()%></li><br><br>
                        <li>
                            <form action="Cart" method="post">
                                <button class="btn btn-default" type="submit">Delete</button>
                                <input type="hidden" name="code" value="<%=value.getCode()%>">
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
            <%
                totalPrice += Integer.parseInt(value.getDefaultPrice());
                session.setAttribute("totalPrice", totalPrice);
            %><br>
            <% }%>
            <% } else { %>
            <div class="row">
                <div class="col-lg-offset-2 col-lg-10 text-left">
                    <strong>Empty</strong>
                </div>
            </div>
            <% }%><br>
            <div class="row">
                <div class="col-lg-offset-2 col-lg-10 text-left">
                    <ul class="list-unstyled">
                        <li>TotalPrice:<%=totalPrice%></li><br>
                        <li>
                            <form action="BuyConfirm" >
                                <button type="submit" class="btn btn-default">Buy</button>
                                <jsp:include page="/ac.jsp" />
                            </form>
                        </li>
                    </ul>
                </div>
            </div><br><br>
            <%=h.home()%>
        </div>
    </body>
</html>
