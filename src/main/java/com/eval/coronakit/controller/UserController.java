package com.eval.coronakit.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eval.coronakit.entity.CoronaKit;
import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.service.CoronaKitService;
import com.eval.coronakit.service.KitDetailService;
import com.eval.coronakit.service.ProductService;

@Controller
@Scope("session")
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CoronaKitService coronaKitService;
	
	@Autowired
	KitDetailService kitDetailService;
	
	List<KitDetail> cart = new ArrayList<KitDetail>();
	//int kitId=0;

	
	@RequestMapping("/home")
	public String home() {
		return "user-home";
	}
	
	@RequestMapping("/show-kit")
	public ModelAndView showKit(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("show-cart");
		mv.addObject("cart",cart);
		int sum=0;
		if(cart!=null) {
		for(KitDetail n:cart) {
			//Calculate Total Value
			sum += n.getAmount();
		}
		}
		mv.addObject("sum",sum);
		
		return mv;
	}

	@RequestMapping("/show-list")
	public ModelAndView showList(Model model) {
		return new ModelAndView("show-all-item-user","products",productService.getAllProducts());
	}
	
	@RequestMapping("/add-to-cart/{productId}")
	public ModelAndView showKit(@PathVariable("productId") int productId) {
		
		int sum=0;
			
			KitDetail cartItem = new KitDetail();
			
			//cartItem.setId(++kitId);
			cartItem.setProductId(productId);
			
			int existingQty=0;
			
			for(KitDetail i:cart) {
				if(productId == i.getProductId()) {
					existingQty = i.getQuantity();
				}
			}
			
			//quantity logic
			if(cart.removeIf(n -> (n.getProductId()==productId))) {
				cartItem.setQuantity(existingQty+1);
			}
			else {
			cartItem.setQuantity(1);
			}
			cartItem.setAmount(cartItem.getQuantity()*(int) productService.getProductById(productId).getCost());
			
			if(!cart.contains(cartItem)) {
			cart.add(cartItem);
			}
			else
			{	
				cart.remove(cartItem);
				cartItem.setQuantity(2);
				cart.add(cartItem);
			}
		//calculate cart total
			
			for(KitDetail n:cart) {
				//Calculate Total Value
				sum += n.getAmount();
			}
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("sum",sum);
		mv.setViewName("show-cart");
		mv.addObject("cart",cart);
		
		return mv;
	}
	
	@RequestMapping("/checkout")
	public ModelAndView checkout(Model model) {
		
		ModelAndView mv = new ModelAndView();
		model.addAttribute("coronakit", new CoronaKit());
		//calculate cart total
		int sum=0;
		for(KitDetail n:cart) {
			//Calculate Total Value
			sum += n.getAmount();
		}
		mv.addObject("sum",sum);
		mv.setViewName("checkout-address");
		mv.addObject("cart",cart);
		return mv;
				//new ModelAndView("checkout-address","cart",cart);
	}
	
	@RequestMapping(value = "/finalize")
	public ModelAndView finalizeOrder(@RequestParam("address") String address,Model model) {
		
		int sum = 0;
		
		//Calculate sum
		for(KitDetail n:cart) {
			sum += n.getAmount();
		}
		
		//Persist CoronaKit
		CoronaKit ck = new CoronaKit();
		ck.setDeliveryAddress(address);
		ck.setOrderDate(LocalDate.now().toString());
		ck.setTotalAmount(sum);
		coronaKitService.saveKit(ck);
		
		int ckid = ck.getId();
		//Persist KitDetails
				for(KitDetail n:cart) {
					n.setCoronaKitId(ckid);
					kitDetailService.addKitItem(n);
				
		
				}
		
		//Display Summary to User
		ModelAndView mv = new ModelAndView();
		mv.setViewName("show-summary");
		mv.addObject("ck",ck);
		List<KitDetail> finalCart = new ArrayList<KitDetail>(); 
		finalCart = cart.stream().collect(Collectors.toList());
		
		cart.clear();
		
		mv.addObject("cart",finalCart);
		return mv;
		
		
	}
	
	@RequestMapping("/delete/{itemId}")
	public ModelAndView deleteItem(@PathVariable("itemId") int itemId) {
		
		cart.removeIf(n -> (n.getProductId()==itemId));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("show-cart");
		mv.addObject("cart",cart);
		return mv;
	}
}
