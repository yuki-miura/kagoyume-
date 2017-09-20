package kagoyume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author guest1Day
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UserDataDTO loginData = (UserDataDTO) session.getAttribute("login");
        String loginchk = (String) session.getAttribute("loginchk");
        String chk = "";
        if (request.getParameter("loginNow") != null) {
            chk = request.getParameter("loginNow");
        }
        try {
            //初めてログインページに訪れた場合入力フォームへ
            if ((loginchk.equals("") && !(loginchk.equals("ok"))) || (!(chk.equals("start"))) && loginData == null) {
                session.setAttribute("loginchk", "notyet");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else if (loginData == null && chk.equals("start")) {

                UserDataBeans udb = new UserDataBeans();
                udb.setName(request.getParameter("name"));
                udb.setPassword(request.getParameter("password"));

                UserDataDTO doLogin = new UserDataDTO();
                udb.UD2DTOMapping(doLogin);

                doLogin = UserDataDAO.getInstance().login(doLogin);

                if (doLogin.getUserID() != 0 && doLogin.getDeleteFlag() != 1) {
                    session.setAttribute("login", doLogin);
                    session.setAttribute("logchk", doLogin.getName());
                    session.setAttribute("loginchk", "ok");
                    String a = (String) String.valueOf(session.getAttribute("ac"));
                    request.setAttribute("ac", a);
                    request.getRequestDispatcher((String) session.getAttribute("lp")).forward(request, response);
                } else {
                    request.setAttribute("error", "ログインに失敗しました");
                    request.getRequestDispatcher("/error.jsp").forward(request, response);

                }
            //ログアウト処理    
            } else {
                session.removeAttribute("logchk");
                session.removeAttribute("loginchk");
                session.removeAttribute("login");
                session.removeAttribute("udb");
                session.removeAttribute("registration");
                session.removeAttribute("pdl");
                session.removeAttribute("code");
                session.removeAttribute("sort");
                session.removeAttribute("searchWord");
                session.removeAttribute("productList");
                session.removeAttribute("productDetail");
                session.removeAttribute("categoryId");
                request.getRequestDispatcher("/top.jsp").forward(request, response);
            }
        } catch (Exception e) {
            //何らかの理由で失敗したらエラーページにエラー文を渡して表示。想定は不正なアクセスとDBエラー
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
