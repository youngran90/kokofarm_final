package kokofarm.product.controller;

import java.util.UUID;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kokofarm.product.domain.ReplyVO;
import kokofarm.product.service.ReplyService;

@Controller
public class ReplyController {

	@Inject
	private ReplyService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class); 
	
	
	@RequestMapping(value = "/Insert_Post",method = RequestMethod.POST)
	@ResponseBody
	   public void Insert_Post(@ModelAttribute("commentForm") ReplyVO reply, Model model) throws Exception {
		logger.info("post----insert--------");
		String uuid = UUID.randomUUID().toString().replace("-", "");
		String reply_no = "r-"+uuid;
		reply.setReply_no(reply_no);
		System.out.println(reply.toString());
		service.Insert_Post(reply);
	}
	
	@RequestMapping(value = "/deleteReply",method = RequestMethod.GET)
	@ResponseBody
	   public void deleteReply(@Param("reply_no") String reply_no , @Param("product_no")String product_no, Model model) throws Exception {
		logger.info("post----delete--------");
		service.delete_Post(reply_no, product_no);
	}
	
	@RequestMapping(value = "/updateReply",method = RequestMethod.GET)
	@ResponseBody
	   public void updateReply(@Param("reply_no") String reply_no , @Param("reply_content") String reply_content, Model model) throws Exception {
		logger.info("post----delete--------");
		ReplyVO reply = new ReplyVO();
		reply.setReply_no(reply_no);
		reply.setReply_content(reply_content);
		service.update_Post(reply);
	}
		
}
