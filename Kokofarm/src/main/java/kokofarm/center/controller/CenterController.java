package kokofarm.center.controller;

import java.io.File;
import java.io.IOException;
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
		
		UUID uid = UUID.randomUUID();
		String c_group = request.getParameter("c_group");
		vo.setC_group(c_group);
		
		if(c_group.equals("notice")){
			String cno = "Notice-"+uid.toString().replace("-", "");
			vo.setCno(cno);
		}else if(c_group.equals("faq")){
			String cno = "FAQ-"+uid.toString().replace("-", "");
			vo.setCno(cno);
		}
		
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
			public void list(HttpServletRequest request, CenterVO vo, 
					MemberVO member, Model model)throws Exception{
				logger.info("center_list");
				logger.info(vo.toString());
				model.addAttribute("list", service.list());
				
				member.getMember_id();
			}
			
}
