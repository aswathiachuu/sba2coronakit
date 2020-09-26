package com.eval.coronakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eval.coronakit.dao.ProductMasterRepository;
import com.eval.coronakit.entity.ProductMaster;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMasterRepository repository;
	
	@Override
	@Transactional
	public ProductMaster addNewProduct(ProductMaster product) {
		
		
		if(product != null) {
			repository.save(product);
			System.out.println("Prd saved");
		}
	
		return product;
	}

	@Override
	public List<ProductMaster> getAllProducts() {
		return repository.findAll();
	}
	
	
	@Override
	@Transactional
	public boolean deleteProduct(int productId) {
		
		if(!repository.existsById(productId)) {
			return false;
		}
		
		else {
		repository.deleteById(productId);
		return true;
		}
	}

	@Override
	public ProductMaster getProductById(int productId) {
		
		return repository.getOne(productId);
	}

}
