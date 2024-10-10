package com.bufalari.material.dto;

import lombok.Data;

@Data
public class MaterialDTO {
    private Long id;
    private String name;
    private String category;
    private String subcategory;
    private String dimensions;
    private double pricePerUnit;
    private int quantity;
    private String supplier;
    private String location;
}
