package com.eval.coronakit.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.ProductService;

@Controller
@Scope("session")
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	ProductService productService;
	
	@GetMapping("/home")
	public String home() {
		return "admin-home";
	}
	
	@GetMapping("/product-entry")
	public String productEntry(Model model) {
		
		model.addAttribute("product", new ProductMaster());
		return "add-new-item";
	}
	
	@PostMapping("/product-save")
	public ModelAndView productSave(@ModelAttribute ProductMaster product, BindingResult result ) {
		
		productService.addNewProduct(product);
		
		
		return new ModelAndView("show-all-item-admin","products",productService.getAllProducts());
	}
	

	@GetMapping("/product-list")
	public ModelAndView productList(Model model) {
		
		
		return new ModelAndView("show-all-item-admin","products",productService.getAllProducts());
	}
	
	@GetMapping("/product-delete/{productId}")
	public ModelAndView productDelete(@PathVariable("productId") int productId) {
		
		productService.deleteProduct(productId);
		
		return new ModelAndView("show-all-item-admin","products",productService.getAllProducts());
		
		
	}
	
}
