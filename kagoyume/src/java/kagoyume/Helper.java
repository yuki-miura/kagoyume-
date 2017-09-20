package kagoyume;

import java.util.ArrayList;

/**
 * 画面系の処理や表示を簡略化するためのヘルパークラス。定数なども保存されます
 *
 * @author guest1Day
 */
public class Helper {

    //トップへのリンクを定数として設定
    private final String homeURL = "top.jsp";

    private final String loginURL = "Login";

    private final String cartURL = "Cart";

    private final String myURL = "Mydata";

    public static Helper getInstance() {
        return new Helper();
    }

    //トップへのリンクを返却
    public String home() {
        return "<a href=\"" + homeURL + "\">ReturnTop</a>";
    }

    //ログインページへのリンクを返却
    public String login(String logchk) {
        if (logchk.equals("")) {
            return "<a href=\"" + loginURL + "\">Login</a>";
        }
        return "Welcome<a href=\"" + myURL + "\">\"" + logchk + "\"</a>！" + "<br>" + "<a href=\"" + cartURL + "\">Cart</a>" + "<br>"
                + "<a href=\"" + loginURL + "\">Logout</a>";
    }

    /**
     * 会員登録において入力されたデータのうち未入力項目がある場合、チェックリストに従いどの項目が 未入力なのかのhtml文を返却する
     *
     * @param chkList　UserDataBeansで生成されるリスト。未入力要素の名前が格納されている
     * @return 未入力の項目に対応する文字列
     */
    public String chkinput(ArrayList<String> chkList) {
        String output = "";
        for (String val : chkList) {
            if (val.equals("name")) {
                output += "名前";
            }
            if (val.equals("password")) {
                output += "パスワード";
            }
            if (val.equals("email")) {
                output += "メールアドレス";
            }
            if (val.equals("address")) {
                output += "住所";
            }
            output += "が未記入です<br>";
        }
        return output;
    }

    public String exTypenum(int i) {
        switch (i) {
            case 1:
                return "代引き";
            case 2:
                return "コンビニ受け取り";
            case 3:
                return "その他";
        }
        return "";
    }
}
