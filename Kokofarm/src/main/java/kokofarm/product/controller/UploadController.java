package kokofarm.product.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kokofarm.basic.util.MediaUtils;
import kokofarm.basic.util.UploadFileUtils;

@Controller
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	//servlet에 bean id 이름 
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/uploadForm", method=RequestMethod.GET)
	public void uploadForm(){
		
	}
	
	@RequestMapping(value="/uploadForm", method=RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model)throws Exception{
		
		logger.info("originalName : "+ file.getOriginalFilename());
		logger.info("size : "+ file.getSize());
		logger.info("contentType : "+ file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
		
	}
	
	private String uploadFile(String originalName, byte[] fileData)throws Exception{
		UUID uuid = UUID.randomUUID();
		
		String saveName = uuid.toString() + "_"+ originalName;
		
		File target = new File(uploadPath, saveName);
		
		FileCopyUtils.copy(fileData, target);
		
		return saveName;
		
	}
	
	@RequestMapping(value="/uploadAjax", method= RequestMethod.GET)
	public void upload(){
		
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method= RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String>uploadAjax(MultipartFile file)throws Exception{
	
		logger.info("originalName : "+ file.getOriginalFilename());
		logger.info("size : "+ file.getSize());
		logger.info("contentType : "+ file.getContentType());
		
		
		
		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
		
	}

	//파일전송기능 - 파일 이름 입력시 원하는 파일 전송
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("File Name: " + fileName);
		
		try {
			
			//파일이름에서 확장자 구하기
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			//확장자별 타입 만들어주기
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			//실제 업로드파일 읽어드리기
			in = new FileInputStream(uploadPath+fileName);
			
			//확장자가 존재하면 확장자 붙이기
			if(mType != null){
				headers.setContentType(mType);
			}else{
				
				//이미지 파일이 아닐경우 파일다운로드 창 보여짐
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
									new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\""); 
				
			}
			 
			//실제 파일이 읽어오는 부분
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		
		}finally {
			in.close();
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("delete file : "+ fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){
			
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath +(front+end).replace('/', File.separatorChar)).delete();
			
		}
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
	
	//최종 삭제
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles")
	public ResponseEntity<String> deleteFiles(@RequestParam("files[]") String[] files){
		logger.info("delete files all................"+ files);
		
		//파일이 없을 경우 바로 return
		if(files == null || files.length == 0){
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName: files){
			
			//확장자 자르기
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			//확장자의 파일타입
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null){
				
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
				
			}
			
			new File(uploadPath+ fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}








