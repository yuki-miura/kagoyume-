package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kagoyume.UserDataDTO;
import kagoyume.Helper;

public final class mydelete_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    UserDataDTO udd = (UserDataDTO) session.getAttribute("login");
    String log = (String) session.getAttribute("logchk");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <!-- BootstrapのCSS読み込み -->\n");
      out.write("        <link href=\"honoka/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- jQuery読み込み -->\n");
      out.write("        <script src=\"//code.jquery.com/jquery-1.11.2.min.js\"></script>\n");
      out.write("        <!-- BootstrapのJS読み込み -->\n");
      out.write("        <script src=\"honoka/js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <title>会員情報‐削除画面</title>\n");
      out.write("    </head>\n");
      out.write("<body style=\"padding: 5px\">\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-12 text-right\">");
      out.print(h.login(log));
      out.write("</div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-12 text-center\"><h1><strong>Delete</strong></h1></div>\n");
      out.write("        </div><br><br>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-12 text-center\">\n");
      out.write("                <ul class=\"list-unstyled\">\n");
      out.write("                    <li>Name:");
      out.print( udd.getName());
      out.write("</li><br>\n");
      out.write("                    <li>Password:");
      out.print( udd.getPassword());
      out.write("</li><br>\n");
      out.write("                    <li>Email:");
      out.print( udd.getEmail());
      out.write("</li><br>\n");
      out.write("                    <li>Address:");
      out.print(udd.getAddress());
      out.write("</li><br>\n");
      out.write("                    <li>このユーザーをマジで削除しますか？</li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-12 text-center\">\n");
      out.write("                <form action=\"MyDeleteResult\" method=\"POST\">\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-default\" style=\"width: 50px\">Yes</button>\n");
      out.write("                    <input type=\"hidden\" name=\"id\" value=\"");
      out.print(udd.getUserID());
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"ac\" value=\"");
      out.print(session.getAttribute("ac"));
      out.write("\">\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div><br>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-12 text-center\">\n");
      out.write("                <form action=\"top\">\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-default\" style=\"width: 50px\">No</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.print(h.home());
      out.write("\n");
      out.write("</body>\n");
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
