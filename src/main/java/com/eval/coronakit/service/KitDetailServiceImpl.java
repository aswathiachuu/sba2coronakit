package com.eval.coronakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eval.coronakit.dao.KitDetailRepository;
import com.eval.coronakit.entity.KitDetail;

@Service
public class KitDetailServiceImpl implements KitDetailService {

	@Autowired
	KitDetailRepository repository;
	
	@Override
	@Transactional
	public KitDetail addKitItem(KitDetail kitItem) {
		repository.save(kitItem);
		return kitItem;
	}

	@Override
	public KitDetail getKitItemById(int itemId) {
		// TODO Auto-generated method stub
		return repository.getOne(itemId);
	}

	@Override
	public List<KitDetail> getAllKitItemsOfAKit(int kitId) {
		return repository.findAllKitDetailById(kitId);
	}

}
