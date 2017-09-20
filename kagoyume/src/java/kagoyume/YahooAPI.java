package kagoyume;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;
import net.arnx.jsonic.JSON;

/**
 *
 * @author guest1Day
 */
public class YahooAPI {

    public static YahooAPI getInstance() {
        return new YahooAPI();
    }

    final String apiID = "dj00aiZpPXZTaWNpQUZpSUVJeSZzPWNvbnN1bWVyc2VjcmV0Jng9ZjQ-";
    final String searchURL = "http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch?";
    final String searchDetailURL = "http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemLookup?";

    public String URLEncode(String word) throws UnsupportedEncodingException {
        String eword = URLEncoder.encode(word, "UTF-8");
        return eword;
    }

    //sw = searchWord / esw = EncodeSearchWord / cid = categoryID / ecid = encodeCategoryID / 
    public ArrayList search(String sw, String cid, String so) throws Exception {
        String esw = URLEncode(sw);
        String ecid = URLEncode(cid);
        String eso = URLEncode(so);
        String URL = searchURL + "appid=" + apiID + "&query=" + esw + "&category_id=" + ecid + "&sort=" + eso;
        URL searchURL = new URL(URL);

        HttpURLConnection con = (HttpURLConnection) searchURL.openConnection();
        con.connect();

        InputStream inStream = con.getInputStream();
        BufferedReader input = new BufferedReader(new InputStreamReader(inStream));

        //pl = productLis
        ArrayList<ProductBeans> pl = new ArrayList<ProductBeans>();

        //Jsonをロード　Map型に変換すると利用できる
        Map root = (Map) JSON.decode(input);
        //ResultSet以下を取得
        Map resultSet = (Map) root.get("ResultSet");
        //0番目以下を取得
        Map zero = (Map) resultSet.get("0");
        //Result以下を取得
        Map result = (Map) zero.get("Result");
        //Result以下の全商品名を表示
        for (Integer i = 0; i < 20; i++) {
            ProductBeans pb = new ProductBeans();
            //1商品を獲得
            Map item = (Map) result.get(i.toString());
            //商品のPrice以下を取得
            Map price = (Map) item.get("Price");
            //商品のImage以下を取得
            Map image = (Map) item.get("Image");
            //商品名をset
            pb.setName((String) item.get("Name"));
            //価格をset
            pb.setPrice((String) price.get("_value"));
            //画像をset
            pb.setImage((String) image.get("Medium"));
            //コードをセット
            pb.setCode((String) item.get("Code"));
            if (pb.getTotalResultsAvailable() != null) {
                continue;
            } else {
                //totalResultAvailableをset
                pb.setTotalResultsAvailable((String) resultSet.get("totalResultsAvailable"));
            }
            pl.add(pb);
        }

        inStream.close();
        input.close();
        con.disconnect();
        return pl;
    }

    //sdw = searchDetailWord / esdw = encodeSearchDetailWord
    public ProductBeans searchDetail(String sdw) throws Exception {
        String esdw = URLEncode(sdw);
        String URL = searchDetailURL + "appid=" + apiID + "&itemcode=" + esdw + "&responsegroup=medium";
        URL searchURL = new URL(URL);

        HttpURLConnection con = (HttpURLConnection) searchURL.openConnection();
        con.connect();

        InputStream inStream = con.getInputStream();
        BufferedReader input = new BufferedReader(new InputStreamReader(inStream));

        ProductBeans pb = new ProductBeans();
        //Jsonをロード、Map型に変換すると利用できる
        Map root = (Map) JSON.decode(input);
        //ResultSet以下を取得
        Map resultSet = (Map) root.get("ResultSet");
        //0番目以下を取得
        Map zero = (Map) resultSet.get("0");
        //Result以下を取得
        Map result = (Map) zero.get("Result");
        //商品を取得
        Map item = (Map) result.get("0");
        //商品のImage以下を取得
        Map image = (Map) item.get("Image");
        //Review以下を取得
        Map review = (Map) item.get("Review");
        //PriceLabel以下を取得
        Map priceLabel = (Map) item.get("PriceLabel");
        //Shipping以下を取得
        Map shipping = (Map) item.get("Shipping");

        //商品名をset
        pb.setName((String) item.get("Name"));
        //商品名コードをset
        pb.setCode((String) item.get("Code"));
        //画像をset
        pb.setImage((String) image.get("Medium"));
        //キャッチコピーをset
        pb.setHeadline((String) item.get("Headline"));
        //概要をset
        pb.setDescription((String) item.get("Description"));
        //状態をset
        pb.setCondition((String) item.get("Condition"));
        //評価をset
        pb.setRate((String) review.get("Rate"));
        //販売価格をset
        pb.setDefaultPrice((String) priceLabel.get("DefaultPrice"));
        //shippingNameをset
        pb.setShippingName((String) shipping.get("Name"));

        con.disconnect();
        inStream.close();
        input.close();

        return pb;
    }

}
