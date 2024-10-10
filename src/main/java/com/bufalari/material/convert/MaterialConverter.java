package com.bufalari.material.convert;

import com.bufalari.material.dto.MaterialDTO;
import com.bufalari.material.entity.Products;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MaterialConverter {

    public MaterialDTO entityToDTO(Products products) {
        MaterialDTO dto = new MaterialDTO();
        dto.setId(products.getId());
        dto.setName(products.getName());
        dto.setCategory(products.getCategory().getName());
        dto.setSubcategory(products.getSubcategory().getName());
        dto.setPricePerUnit(products.getPricePerUnit());
        dto.setQuantity(products.getQuantity());
        dto.setSupplier(products.getSupplier());
        dto.setLocation(products.getLocation());
        dto.setDimensions(products.getDimensions());
        return dto;
    }

    public Products dtoToEntity(MaterialDTO materialDTO) {
        Products entity = new Products();
        entity.setName(materialDTO.getName());
        entity.setPricePerUnit(materialDTO.getPricePerUnit());
        entity.setQuantity(materialDTO.getQuantity());
        entity.setSupplier(materialDTO.getSupplier());
        entity.setLocation(materialDTO.getLocation());
        entity.setDimensions(materialDTO.getDimensions());
        return entity;
    }
}
