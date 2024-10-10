package com.bufalari.material.service;

import com.bufalari.material.dto.MaterialDTO;
import com.bufalari.material.entity.Products;
import com.bufalari.material.exception.MaterialNotFoundException;
import com.bufalari.material.repository.MaterialRepository;
import com.bufalari.material.convert.MaterialConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MaterialService {

    private final MaterialRepository materialRepository;
    private final MaterialConverter materialConverter;

    public List<MaterialDTO> getAllMaterials() {
        return materialRepository.findAll()
                .stream()
                .map(materialConverter::entityToDTO)
                .collect(Collectors.toList());
    }

    public MaterialDTO createMaterial(MaterialDTO materialDTO) {
        if (materialDTO.getName() == null || materialDTO.getName().isEmpty()) {
            throw new IllegalArgumentException("Material name cannot be null or empty.");
        }
        Products material = materialConverter.dtoToEntity(materialDTO);
        Products savedMaterial = materialRepository.save(material);
        return materialConverter.entityToDTO(savedMaterial);
    }

    public MaterialDTO updateMaterial(Long id, MaterialDTO materialDTO) {
        Products material = materialRepository.findById(id)
                .orElseThrow(() -> new MaterialNotFoundException("Material not found with ID: " + id));
        material.setName(materialDTO.getName());
        material.setPricePerUnit(materialDTO.getPricePerUnit());
        material.setQuantity(materialDTO.getQuantity());
        material.setSupplier(materialDTO.getSupplier());
        material.setLocation(materialDTO.getLocation());
        material.setDimensions(materialDTO.getDimensions());
        materialRepository.save(material);
        return materialConverter.entityToDTO(material);
    }

    public void deleteMaterial(Long id) {
        if (!materialRepository.existsById(id)) {
            throw new MaterialNotFoundException("Material not found with ID: " + id);
        }
        materialRepository.deleteById(id);
    }
}
