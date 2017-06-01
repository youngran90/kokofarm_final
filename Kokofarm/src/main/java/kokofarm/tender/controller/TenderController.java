package kokofarm.tender.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kokofarm.tender.domain.TenderVO;
import kokofarm.tender.service.TenderService;

@Controller
@RequestMapping("/tender/*")
public class TenderController {
	private static final Logger logger = LoggerFactory.getLogger(TenderController.class);
		
		@Inject
		private TenderService service;
		
		@RequestMapping(value="tendertest")
		public void tenderform(TenderVO tender, Model model) throws Exception{
			service.insertTender(tender);
			System.out.println("성공");
		}

}
