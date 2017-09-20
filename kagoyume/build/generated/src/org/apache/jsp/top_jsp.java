package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.URLDecoder;
import kagoyume.Helper;

public final class top_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');

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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>TOP Page</title>\n");
      out.write("        <!-- BootstrapのCSS読み込み -->\n");
      out.write("        <link href=\"honoka/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- jQuery読み込み -->\n");
      out.write("        <script src=\"//code.jquery.com/jquery-1.11.2.min.js\"></script>\n");
      out.write("        <!-- BootstrapのJS読み込み -->\n");
      out.write("        <script src=\"honoka/js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body style=\"padding: 5px\">\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-12 text-right\">");
      out.print(h.login(log));
      out.write("</div><br>\n");
      out.write("                <div class=\"text-center col-lg-12\"><h1><strong>かごゆめ</strong></h1></div>\n");
      out.write("                <br><br><br><br>\n");
      out.write("                <p class=\"text-center\">\n");
      out.write("                    商品を買い物籠に好きなだけ詰められる夢のようなサイト。<br>略して「かごゆめ」。<br>\n");
      out.write("                    実際には購入できない買い物を心行くまでお楽しみください。<br><br><br>\n");
      out.write("                </p>\n");
      out.write("                <form action=\"Search\" method=\"get\" class=\"form-horizontal\">\n");
      out.write("                    <label class=\"control-label col-lg-2\">Keyword:</label>\n");
      out.write("                    <div class=\"form-group col-lg-10\">\n");
      out.write("                        <input type=\"search\" class=\"form-control\" name=\"search\" required placeholder=\"入力してください\"><br>\n");
      out.write("                    </div>\n");
      out.write("                    <label class=\"control-label col-lg-2\">Category:</label>\n");
      out.write("                    <div class=\"form-group col-lg-10\">\n");
      out.write("                        <select class=\"form-control\" name=\"category\">\n");
      out.write("                            <option value=\"1\" selected>すべてのカテゴリー</option>\n");
      out.write("                            <option value=\"13457\">ファッション</option>\n");
      out.write("                            <option value=\"2498\">食品</option>\n");
      out.write("                            <option value=\"10002\">本、雑誌、コミック</option>\n");
      out.write("                            <option value=\"2511\">ゲーム、おもちゃ</option>\n");
      out.write("                            <option value=\"2502\">パソコン、周辺機器</option>\n");
      out.write("                            <option value=\"2504\">ＡＶ機器、カメラ</option>\n");
      out.write("                            <option value=\"2505\">家電</option>\n");
      out.write("                            <option value=\"2506\">家具、インテリア</option>\n");
      out.write("                            <option value=\"2512\">スポーツ</option>\n");
      out.write("                            <option value=\"2517\">ＤＶＤ、映像ソフト</option>\n");
      out.write("                            <option value=\"2513\">レジャー、アウトドア</option>\n");
      out.write("                            <option value=\"2508\">キッチン、生活雑貨、日用品</option>\n");
      out.write("                            <option value=\"2516\">ＣＤ、音楽ソフト</option>\n");
      out.write("                            <option value=\"2510\">楽器、趣味、学習</option>\n");
      out.write("                            <option value=\"2500\">ダイエット、健康</option>\n");
      out.write("                            <option value=\"2501\">コスメ、香水</option>\n");
      out.write("                            <option value=\"2514\">自転車、車、バイク用品</option>\n");
      out.write("                            <option value=\"2503\">DIY、工具、文具</option>\n");
      out.write("                            <option value=\"2509\">ペット用品、生き物</option>\n");
      out.write("                            <option value=\"2507\">花、ガーデニング</option>\n");
      out.write("                            <option value=\"2497\">ベビー、キッズ、マタニティ</option>\n");
      out.write("                        </select><br>\n");
      out.write("                    </div>\n");
      out.write("                    <label class=\"control-label col-lg-2\">Sort:</label>\n");
      out.write("                    <div class=\"form-group col-lg-10\">\n");
      out.write("                        <select class=\"form-control\" name=\"sort\">\n");
      out.write("                            <option value=\"-score\" selected>おすすめ順</option>\n");
      out.write("                            <option value=\"-sold\">売れ筋順</option>\n");
      out.write("                            <option value=\"+price\">価格安い順</option>\n");
      out.write("                            <option value=\"-price\">価格高い順</option>\n");
      out.write("                        </select><br>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-default col-lg-offset-2 col-lg-2\">Search</button>\n");
      out.write("                    </div>\n");
      out.write("                    <input type=\"hidden\"name=\"ac\" value=\"");
      out.print(session.getAttribute("ac"));
      out.write("\">\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
