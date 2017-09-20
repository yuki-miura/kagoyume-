package kagoyume;

import java.sql.Timestamp;
import java.io.Serializable;

/**
 * 商品情報を持ちまわるJavaBeans データベースのカラムと型に対応させている(DTO)。データの挿入、取り出しどちらにも便利
 *
 * @author guest1Day
 */
public class ProductDataDTO implements Serializable {

    private int buyID;
    private int userID;
    private String itemCode;
    private int type;
    private Timestamp buyDate;

    ProductDataDTO() {
    }

    public int getBuyID() {
        return this.buyID;
    }

    public void setBuyID(int buyID) {
        this.buyID = buyID;
    }

    public int getUserID() {
        return this.userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getItemCode() {
        return this.itemCode;
    }

    public void setItemCode(String itemCode) {
        if (!(itemCode == null)) {
            this.itemCode = itemCode;
        } else {
            this.itemCode = "";
        }
    }

    public int getType() {
        return this.type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Timestamp getBuyDate() {
        return this.buyDate;
    }

    public void setBuyDate(Timestamp buyDate) {
        this.buyDate = buyDate;
    }

}
