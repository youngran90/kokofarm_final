package kokofarm.center.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kokofarm.basic.domain.FileBean;
import kokofarm.center.domain.CenterVO;
import kokofarm.center.service.CenterService;
import kokofarm.member.domain.MemberVO;

@Controller
@RequestMapping("/center/*")
public class CenterController {
	private static final Logger logger = LoggerFactory.getLogger(CenterController.class);
	
	@Inject
	private CenterService service;
	
	@RequestMapping(value="/admin_view", method=RequestMethod.GET)
	public void createGET(CenterVO vo, Model model)throws Exception{
		logger.info("create_GET");
	}
	
	@RequestMapping(value="/admin_view", method=RequestMethod.POST)
	public String createPOST(CenterVO vo, HttpServletRequest request)throws Exception{
		logger.info("create_POST");
		logger.info(vo.toString());
		
		Calendar calendar = Calendar.getInstance();
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
		
		vo.setC_regdate(String.valueOf(year+"-"+month+"-"+day+""+hour+":"+minute+":"+second));
		
		service.create(vo);
		
		return "redirect:/center/customer_view";
	}
	
	//CKEditor//
	@RequestMapping(value="/file_upload", method=RequestMethod.POST)
	public String FileUpload(FileBean fileBean, HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String root_path = session.getServletContext().getRealPath("/");
		String attach_path = "resources/files/c_attach/";
		MultipartFile upload = fileBean.getUpload();
		String filename = "";
		String CKEditorFuncNum = "";
				
				
		if(upload != null){
			filename = "Notice_" + upload.getOriginalFilename();
			logger.info(filename);
			fileBean.setFilename(filename);
			CKEditorFuncNum = fileBean.getCKEditorFuncNum();
			try{
				File file = new File(root_path + attach_path + filename);
				logger.info(root_path+attach_path+filename);
				upload.transferTo(file);
			} catch(IOException e){
				e.printStackTrace();
				}
			}
				
		String file_path = "/"+attach_path+filename;
				
		model.addAttribute("file_path", file_path);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
				
		return "center/admin_view";
				
	}
			
	@RequestMapping(value="/customer_view", method=RequestMethod.GET)
	public void list_notice(HttpServletRequest request, CenterVO vo, 
		MemberVO member, Model model)throws Exception{
		System.out.println("======================center_list_notice======================");
		System.out.println(vo.toString());
		
		model.addAttribute("list_notice", service.list_notice());
		
		
	}
	
	@RequestMapping(value="/customer_view2", method=RequestMethod.GET)
	public void list_faq(HttpServletRequest request, CenterVO vo, 
		MemberVO member, Model model)throws Exception{
		System.out.println("======================center_list_faq======================");
		System.out.println(vo.toString());
	
		model.addAttribute("list_faq", service.list_faq());
		
	}
	
	@RequestMapping(value="/detail_notice", method=RequestMethod.GET)
	public void detail_notice(@RequestParam("cno")int cno, Model model)throws Exception{
		service.update_viewcnt(cno);
		model.addAttribute("detail_notice", service.list_notice());
	}
	
	@RequestMapping(value="/detail_faq", method=RequestMethod.GET)
	public void detail_faq(@RequestParam("cno")int cno, Model model)throws Exception{
		service.update_viewcnt(cno);
		model.addAttribute("detail_faq", service.list_faq());
	}
			
}
