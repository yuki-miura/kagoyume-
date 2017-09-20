package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kagoyume.UserDataBeans;
import kagoyume.Helper;

public final class registration_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    UserDataBeans udb = null;
    boolean reinput = false;
    //modeはregistrationconfirmから戻ってきたときに使用
    if (request.getParameter("mode") != null && request.getParameter("mode").equals("REINPUT")) {
        reinput = true;
        udb = (UserDataBeans) session.getAttribute("udb");
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>会員登録ページ</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"RegistrationConfirm\">\n");
      out.write("            名前<br><input type=\"text\" name=\"name\" value=\"");
 if (reinput) {
                    out.print(udb.getName());
                }
      out.write("\" autofocus><br><br>\n");
      out.write("            パスワード<br><input type=\"password\" name=\"password\" value=\"");
 if (reinput) {
                    out.print(udb.getPassword());
                }
      out.write("\"><br><br>\n");
      out.write("            メールアドレス<br><input type=\"email\" name=\"email\" value=\"");
 if (reinput) {
                    out.print(udb.getEmail());
                }
      out.write("\"><br><br>\n");
      out.write("            住所<br><textarea name=\"address\" rows=5 cols=50 style=\"resize:none\" wrap=\"hard\">");
 if (reinput) {
                    out.print(udb.getAddress());
                }
      out.write("</textarea><br>\n");
      out.write("            <input type=\"submit\" value=\"送信\">\n");
      out.write("        </form>\n");
      out.write("        <br>\n");
      out.write("        ");
      out.print(h.home());
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
