package kokofarm.main.controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Pattern;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kokofarm.basic.domain.PageMaker;
import kokofarm.basic.domain.SearchCriteria;
import kokofarm.main.service.MainRegService;
import kokofarm.product.domain.ProductVO;

@Controller
public class MainController {

	@Inject
	private MainRegService service;
	
	@RequestMapping(value="/main/listProd_add", method = RequestMethod.GET)
	public void mainProReg(@ModelAttribute("cri")SearchCriteria cri, @Param("ca1")String ca1,
			@Param("ca2")String ca2,@Param("ca3")String ca3,
			Model model) throws Exception{
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("ca1", ca1);
		map.put("ca1", ca2);
		map.put("ca1", ca3);
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		
		int total = service.listSearchCount(cri);
		pagemaker.setTotalCount(total);
		model.addAttribute("pageMaker",pagemaker);
		
		List<ProductVO> list = service.list_ProService(map);
		model.addAttribute("list",service.listSearchCriteria(cri));
	}
	
	@RequestMapping(value = "/main/product_add", method = RequestMethod.GET)
	public void mainAdd(Model model) throws Exception{
		
		Map<String, String> map = new HashMap<String,String>();
		
		
		model.addAttribute("list", service.list_ProService(map));
	
	}
	
	/*@ResponseBody
	@RequestMapping(value="/reg_slider", method=RequestMethod.POST)
	public ResponseEntity<Map<String, String>> reg_slider(@RequestParam("slider_no")String sNo,
										@RequestParam("product_no")String pNo,Model model,HttpSession session) throws Exception{
				
		ProductVO vo = service.proD_Info(pNo);
	
		String src =vo.getProduct_mainimage();
		Map<String, String> map = new HashMap<String,String>();
		map.put("sNo",sNo);
		map.put("src", src);
		model.addAttribute("map",map);
		session.setAttribute("map", map);
		
		ResponseEntity<Map<String, String>> entity = null;
		
		try {
			entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, String>>(map,HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}*/
	
}
	

