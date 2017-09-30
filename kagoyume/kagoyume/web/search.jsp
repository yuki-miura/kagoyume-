<%@page import="java.util.ArrayList"
        import="kagoyume.ProductBeans"
        import="kagoyume.Helper" %> 

<%
    Helper h = Helper.getInstance();
    ArrayList<ProductBeans> pl = (ArrayList<ProductBeans>) session.getAttribute("productList");
    String log = (String) session.getAttribute("logchk");
    String tra = pl.get(0).getTotalResultsAvailable();
    Integer count = (Integer) session.getAttribute("count");
    Integer addCount = count + 20;
    Integer minusCount = count - 20;
    int pageCount = 1 + count / 20;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>検索結果一覧</title>
        <jsp:include page="/bootstrap.jsp" />
    </head>
    <body style="padding: 5px"> 
        <div class="container-fluid">
            <div class="row"><br>
                <div class="col-lg-12 text-right"><%=h.login(log)%></div>
            </div>
            <div class="row">
                <ul class="list-unstyled text-center col-lg-12">
                    <li><h1><strong>SearchResult</strong></h1></li>
                    <li>Keyword:${searchWord}</li>
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
            <div class="row">
                <div class="col-lg-4 text-right">
                    <form action="Search">
                        <button type="submit" class="btn btn-default">Previous</button>
                        <input type="hidden" name="count" value="<%=minusCount%>">
                    </form>
                </div>
                <div class="col-lg-4 text-center">
                    <ur class="pagination"> 
                        <%if (count != 0) {%>
                        <li><a href="" onclick="document.ok.submit();return false;"><%=pageCount - 1%></a>
                            <form action="Search" method="post" name="ok">
                                <jsp:include page="/ac.jsp" />
                                <input type="hidden" name="count" value="<%=minusCount%>">
                            </form></li>
                            <%}%>
                        <li><a href="" onclick="document.ok1.submit();return false;"><%=pageCount%></a>
                            <form action="Search" method="post" name="ok1">
                                <jsp:include page="/ac.jsp" />
                                <input type="hidden" name="count" value="<%=count%>">
                            </form></li>
                        <li><a href="" onclick="document.ok2.submit();return false;"><%=pageCount + 1%></a>
                            <form action="Search" method="post" name="ok2">
                                <jsp:include page="/ac.jsp" />
                                <input type="hidden" name="count" value="<%=addCount%>">
                            </form></li>
                    </ur>
                </div>
                <div class="col-lg-4 text-left">
                    <form action="Search">
                        <button type="submit" class="btn btn-default">Next</button>
                        <input type="hidden" name="count" value="<%=addCount%>">
                    </form>
                </div>
            </div>
            <br>
            <%=h.home()%>
        </div>
    </body>
</html>
