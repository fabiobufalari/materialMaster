package com.bufalari.material.repository;

import com.bufalari.material.entity.Products;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MaterialRepository extends JpaRepository<Products, Long> {
}
