package kagoyume;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * ページで入出力されるユーザー情報を持ちまわるJavaBeans。DTOと違い画面表示系への結びつきが強い。
 *
 * @author guest1Day
 */
public class UserDataBeans implements Serializable {

    private String name;
    private String password;
    private String email;
    private String address;
    private int total;

    UserDataBeans() {
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        if (!(name == null)) {
            this.name = name;
        } else {
            this.name = "";
        }
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        if (!(password == null)) {
            this.password = password;
        } else {
            this.password = "";
        }
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        if (!(email == null)) {
            this.email = email;
        } else {
            this.email = "";
        }
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        if (!(address == null)) {
            this.address = address;
        } else {
            this.address = "";
        }

    }
    
    public int getTotal(){
        return this.total;
    }
    
    public void setTotal(int total){
        this.total = total;
    }

    public ArrayList<String> chkproperties() {
        ArrayList<String> chkList = new ArrayList<String>();
        if (this.name.equals("")) {
            chkList.add("name");
        }
        if (this.password.equals("")) {
            chkList.add("password");
        }
        if (this.email.equals("")) {
            chkList.add("email");
        }

        if (this.address.equals("")) {
            chkList.add("address");
        }

        return chkList;
    }
    
    public ArrayList<String> loginChkproperties() {
        ArrayList<String> chkList = new ArrayList<String>();
        if (this.name.equals("")) {
            chkList.add("name");
        }
        if (this.password.equals("")) {
            chkList.add("password");
        }

        return chkList;
    }
    
    public void UD2DTOMapping(UserDataDTO udd) {
        udd.setName(this.name);
        udd.setPassword(this.password);
        udd.setEmail(this.email);
        udd.setAddress(this.address);
    }
}
