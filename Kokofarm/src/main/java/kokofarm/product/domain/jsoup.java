package kokofarm.product.domain;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.web.servlet.ModelAndView;

public class jsoup {

	public static void main(String[] args)throws IOException {
		Document doc = Jsoup.connect("https://www.kamis.or.kr/customer/trend/economic/economic.do?action=priceInfo&economicno=746").get();
		Elements titles = doc.select(".content");
		ModelAndView model = new ModelAndView();
		for(Element e: titles){
			System.out.println("text : "+e.text());
			System.out.println("html : "+ e.html());
			String text = e.text();
			System.out.println(text);
		}
	}
}
