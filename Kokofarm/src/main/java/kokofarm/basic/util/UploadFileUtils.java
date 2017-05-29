package kokofarm.basic.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

  private static final Logger logger = 
      LoggerFactory.getLogger(UploadFileUtils.class);

//  public static String uploadFile(String uploadPath, 
//      String originalName, 
//      byte[] fileData)throws Exception{
//    
//    return null;
//  }
//  

	//실제 파일 업로드 처리 메소드
  public static String uploadFile(String uploadPath, 
                              String originalName, 
                              byte[] fileData)throws Exception{
    
    UUID uid = UUID.randomUUID();
    
	//저장파일 이름
    String savedName = uid.toString() +"_"+originalName;
    
	//원본파일 저장 경로
    String savedPath = calcPath(uploadPath);
    
    File target = new File(uploadPath +savedPath,savedName);
    
	//원본파일 저장부분
    FileCopyUtils.copy(fileData, target);
    
    String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
    
    String uploadedFileName = null;
    
	//이미지 파일인지 판단하는 클래스에서 이미지가 아닐 경우 null을 리턴한다. 일반파일 업로드 처리
    if(MediaUtils.getMediaType(formatName) != null){
      uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
    }else{
      uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
    }
    
    return uploadedFileName;
    
  }
  
  private static  String makeIcon(String uploadPath, 
      String path, 
      String fileName)throws Exception{

		//썸네일 결과처리
    String iconName = 
        uploadPath + path + File.separator+ fileName;
    
    return iconName.substring(
        uploadPath.length()).replace(File.separatorChar, '/');
  }
  
//썸네일 이미지 생성
  private static  String makeThumbnail(
              String uploadPath, 
              String path, 
              String fileName)throws Exception{
     
	//사용된 기본경로와 년월일 돌더 현제 업로드된 파일의 이름
    BufferedImage sourceImg = 
        ImageIO.read(new File(uploadPath + path, fileName));
    
  //썸네일 이미지 높이 지정
    BufferedImage destImg = 
        Scalr.resize(sourceImg, 
            Scalr.Method.AUTOMATIC, 
            Scalr.Mode.FIT_TO_HEIGHT,100);
    
  //썸네일 앞에 s_를 넣어줌
    String thumbnailName = 
        uploadPath + path + File.separator +"s_"+ fileName;
    
    File newFile = new File(thumbnailName);
    String formatName = 
        fileName.substring(fileName.lastIndexOf(".")+1);
    
    
    ImageIO.write(destImg, formatName.toUpperCase(), newFile);
    
	//문자열을 return하는 이유는 원도우 경로에서 \가 인식하지 않음으로 다시 치환해준다.
    return thumbnailName.substring(
        uploadPath.length()).replace(File.separatorChar, '/');
  } 
  
  	//파일의 날짜구하기
  private static String calcPath(String uploadPath){
    
    Calendar cal = Calendar.getInstance();
    
    String yearPath = File.separator+cal.get(Calendar.YEAR);
    
    String monthPath = yearPath + 
        File.separator + 
        new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);

    String datePath = monthPath + 
        File.separator + 
        new DecimalFormat("00").format(cal.get(Calendar.DATE));
    
    makeDir(uploadPath, yearPath,monthPath,datePath);
    
    logger.info(datePath);
    
    return datePath;
  }
  
	//파일 업로드 폴더생성
  private static void makeDir(String uploadPath, String... paths){
		
	  //저장된 파일이 이미지파일이 아닐경우
    if(new File(paths[paths.length-1]).exists()){
      return;
    }
    
  //저장된 파일이 이미지일 경우
    for (String path : paths) {
      
      File dirPath = new File(uploadPath + path);
      
      if(! dirPath.exists() ){
        dirPath.mkdir();
      } 
    }
  }
  
  
}
