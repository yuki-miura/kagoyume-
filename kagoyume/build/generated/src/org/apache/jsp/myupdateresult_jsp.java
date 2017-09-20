package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kagoyume.Helper;
import java.util.ArrayList;
import kagoyume.UserDataBeans;
import kagoyume.UserDataDTO;

public final class myupdateresult_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    UserDataBeans udb = (UserDataBeans) session.getAttribute("udb");
    ArrayList<String> chkList = udb.chkproperties();
    UserDataDTO udd = (UserDataDTO) session.getAttribute("updateData");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>会員情報‐更新完了画面</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 if (chkList.size() == 0) {
      out.write("\n");
      out.write("        <h1>変更結果</h1><br>\n");
      out.write("        名前:");
      out.print( udd.getName());
      out.write("<br>\n");
      out.write("        パスワード:");
      out.print( udd.getPassword());
      out.write("<br>\n");
      out.write("        メールアドレス:");
      out.print( udd.getEmail());
      out.write("<br>\n");
      out.write("        住所:");
      out.print( udd.getAddress());
      out.write("<br>\n");
      out.write("        以上の内容で更新しました。<br>\n");
      out.write("        ");
 } else {
      out.write("\n");
      out.write("        <h1>入力が不完全です</h1>\n");
      out.write("        ");
      out.print(h.chkinput(chkList));
      out.write("\n");
      out.write("        ");
 }
      out.write("\n");
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
