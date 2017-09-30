<%@page import="java.net.URLDecoder"
        import="kagoyume.Helper"%>
<!--機能や挑戦することとして挙げるならば
1　クッキーでログイン情報を保持する
    ログアウトページの実装　ここを経由させることでクッキーを反映させる
2　DB未接続時にエラーをキャッチする
    現状どのページでキャッチするのかわかっていない（nullで対処）
3　カート管理の判断条件をuserIDにする（現在はNameでユニークではない）
4　dogetやdopostに直接書き込む
-->
<%
    Helper h = Helper.getInstance();
    //ログイン成功で表示を変化させるために使う変数。ほとんどのページで使用
    if (session.getAttribute("logchk") == null) {
        session.setAttribute("logchk", "");
    }
    String log = (String) session.getAttribute("logchk");
    //lp = lastPage　ログイン前最終ページの記録
    session.setAttribute("lp", "top.jsp");
    //ログイン判断で使う変数の初期値を設定。Login.Javaで主に使用
    if (session.getAttribute("loginchk") == null || String.valueOf(session.getAttribute("loginchk")).equals("notyet")) {
        session.setAttribute("loginchk", "");
    }
    //アクセスチェック用の変数を生成
    session.setAttribute("ac", (int) (Math.random() * 1000));

    Integer count = 0;
    session.setAttribute("count", count);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TOP Page</title>
        <jsp:include page="/bootstrap.jsp" />
    </head>
    <body style="padding: 5px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-right"><%=h.login(log)%></div><br>
                <div class="text-center col-lg-12"><h1><strong>かごゆめ</strong></h1></div>
                <br><br><br><br>
                <p class="text-center">
                    商品を買い物籠に好きなだけ詰められる夢のようなサイト。<br>略して「かごゆめ」。<br>
                    実際には購入できない買い物を心行くまでお楽しみください。<br><br><br>
                </p>
                <form action="Search" method="get" class="form-horizontal">
                    <label class="control-label col-lg-2">Keyword:</label>
                    <div class="form-group col-lg-10">
                        <input type="search" class="form-control" name="search" required placeholder="入力してください"><br>
                    </div>
                    <label class="control-label col-lg-2">Category:</label>
                    <div class="form-group col-lg-10">
                        <select class="form-control" name="category">
                            <option value="1" selected>すべてのカテゴリー</option>
                            <option value="13457">ファッション</option>
                            <option value="2498">食品</option>
                            <option value="10002">本、雑誌、コミック</option>
                            <option value="2511">ゲーム、おもちゃ</option>
                            <option value="2502">パソコン、周辺機器</option>
                            <option value="2504">ＡＶ機器、カメラ</option>
                            <option value="2505">家電</option>
                            <option value="2506">家具、インテリア</option>
                            <option value="2512">スポーツ</option>
                            <option value="2517">ＤＶＤ、映像ソフト</option>
                            <option value="2513">レジャー、アウトドア</option>
                            <option value="2508">キッチン、生活雑貨、日用品</option>
                            <option value="2516">ＣＤ、音楽ソフト</option>
                            <option value="2510">楽器、趣味、学習</option>
                            <option value="2500">ダイエット、健康</option>
                            <option value="2501">コスメ、香水</option>
                            <option value="2514">自転車、車、バイク用品</option>
                            <option value="2503">DIY、工具、文具</option>
                            <option value="2509">ペット用品、生き物</option>
                            <option value="2507">花、ガーデニング</option>
                            <option value="2497">ベビー、キッズ、マタニティ</option>
                        </select><br>
                    </div>
                    <label class="control-label col-lg-2">Sort:</label>
                    <div class="form-group col-lg-10">
                        <select class="form-control" name="sort">
                            <option value="-score" selected>おすすめ順</option>
                            <option value="-sold">売れ筋順</option>
                            <option value="+price">価格安い順</option>
                            <option value="-price">価格高い順</option>
                        </select><br>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-default col-lg-offset-2 col-lg-2">Search</button>
                    </div>
                    <jsp:include page="/ac.jsp" />
                    <input type="hidden" name="count" value="<%=count%>">
                </form>
            </div><br><br><br><br>
            <div class="row">
                <div class="col-lg-12 text-right">
                    <jsp:include page="/copyright.jsp" />
                </div>
            </div>
        </div>
    </body>
</html>
