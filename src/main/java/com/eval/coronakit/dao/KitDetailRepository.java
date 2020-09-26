package com.eval.coronakit.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eval.coronakit.entity.KitDetail;

@Repository
public interface KitDetailRepository extends JpaRepository<KitDetail, Integer>{

	@Query("SELECT i FROM KitDetail i WHERE i.id = kitID")
	List<KitDetail> findAllKitDetailById(int kitID);
}
