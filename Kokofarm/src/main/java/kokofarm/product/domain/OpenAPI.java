package kokofarm.product.domain;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
 
public class OpenAPI {
 
	   public static void main(String[] args) {
	        try{

	            //OpenAPI call하는 URL
	            String urlstr = "http://www.kamis.or.kr/service/price/xml.do?action=dailyPriceByCategoryList&p_product_cls_code=02&p_country_code=1101&p_regday=2015-10-01&p_convert_kg_yn=N&p_item_category_code=200&p_cert_key=11b8b641-7c0f-4303-a422-7af6301b8ab4&p_cert_id=222&p_returntype=json";
	            URL url = new URL(urlstr);
	            BufferedReader bf;
	            String line;
	            String result="";

	            //날씨 정보를 받아온다.
	            bf = new BufferedReader(new InputStreamReader(url.openStream()));

	            //버퍼에 있는 정보를 문자열로 변환.
	            while((line=bf.readLine())!=null){
	                result=result.concat(line);
	                System.out.println(line);
	            }

	            //문자열을 JSON으로 파싱
	            JSONParser jsonParser = new JSONParser();
	            JSONObject data = (JSONObject) jsonParser.parse(result);

	            //지역 출력
	            System.out.println("이름 : " + data.get("data"));

	            //날씨 출력
	            
	            

	            bf.close();
	        }catch(Exception e){
	            System.out.println(e.getMessage());
	        }
	    }
}