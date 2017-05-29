package kokofarm.basic.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

//이미지 파일의 확장자를 가지고있는 판단해주는 역할의 클래스
public class MediaUtils {
	
	private static Map<String, MediaType> mediaMap;
	
	static{
		
		mediaMap = new HashMap<String, MediaType>();		
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type){
		
		return mediaMap.get(type.toUpperCase());
	}
}



