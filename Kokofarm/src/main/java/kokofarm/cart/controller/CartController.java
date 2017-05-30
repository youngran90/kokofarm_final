package kokofarm.cart.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kokofarm.cart.service.CartService;

@Controller
@RequestMapping("/views/cart/*")
public class CartController {
	
	@Inject
	private CartService service;

}
