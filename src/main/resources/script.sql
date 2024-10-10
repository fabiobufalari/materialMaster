DO $$ DECLARE
    r RECORD;
BEGIN
    -- Desabilitar restrições de chave estrangeira temporariamente
    EXECUTE 'SET session_replication_role = replica';

    -- Loop por todas as tabelas no esquema atual
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP;

    -- Reativar restrições de chave estrangeira
    EXECUTE 'SET session_replication_role = DEFAULT';
END $$;



SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'products';

-- Verifique se a coluna correta é "name" ou outro nome
INSERT INTO categories (name) VALUES
('Wood'),
('Doors'),
('Windows'),
('Nails'),
('Concrete'),
('Bricks'),
('Insulation'),
('Roofing'),
('Siding'),
('Drywall'),
('Paint');
('Lumber'),
('Doors'),
('Windows'),
('Paints'),
('Nails & Screws'),
('Drywall'),
('Tiles'),
('Tools'),
('Adhesives & Sealants'),
('Hardware'),
('Pipes & Fittings'),
('Electrical Supplies'),
('Wires & Cables'),
('Roofing Materials'),
('Lumber'),
('Doors'),
('Windows'),
('Paint'),
('Hardware'),
('Drywall'),
('Tiles'),
('Tools');

-- Inserindo subcategorias
INSERT INTO subcategories (name, category_id) VALUES
('Lumber', 1),
('Plywood', 1),
('Timber', 1),
('Exterior Door', 2),
('Interior Door', 2),
('Garage Door', 2),
('Vinyl Window', 3),
('Wood Window', 3),
('Framing Nails', 4),
('Roofing Nails', 4),
('Finishing Nails', 4),
('Ready Mix', 5),
('Red Brick', 6),
('Concrete Brick', 6),
('Fire Brick', 6),
('Fiberglass', 7),
('Spray Foam', 7),
('Asphalt Shingles', 8),
('Metal Roofing', 8),
('Vinyl Siding', 9),
('Wood Siding', 9),
('Gypsum Board', 10),
('Interior Paint', 11),
('Exterior Paint', 11);
('2x4 Lumber', 1),
('2x6 Lumber', 1),
('Panel Doors', 2),
('Solid Core Doors', 2),
('Double Glazed Windows', 3),
('Sliding Windows', 3),
('Interior Paint', 4),
('Exterior Paint', 4),
('Nails', 5),
('Screws', 5),
('Drywall Sheets', 6),
('Porcelain Tiles', 7),
('Ceramic Tiles', 7),
('Cordless Tools', 8),
('Adhesives', 9),
('Sealants', 9),
('Hinges', 10),
('Latches', 10),
('PVC Pipes', 11),
('Copper Pipes', 11),
('Outlets', 12),
('Switches', 12),
('Copper Wires', 13),
('Aluminum Wires', 13),
('Shingles', 14),
('Metal Roofing', 14),
('2x4 Lumber', 1),
('2x6 Lumber', 1),
('2x8 Lumber', 1),
('Solid Core Door', 2),
('Panel Door', 2),
('Double Glazed Window', 3),
('Sliding Window', 3),
('Interior Paint', 4),
('Exterior Paint', 4),
('Nails', 5),
('Screws', 5),
('Drywall Sheet', 6),
('Marble Tile', 7),
('Cordless Tools', 8);


INSERT INTO products (subcategory_id, price_per_unit, quantity, category_id, dimensions, location, name, supplier)
VALUES
-- Madeiras
(1, 12.99, 100, 1, '2x4 feet', 'Halifax, NS', '2x4 Lumber', 'Home Depot'),
(1, 14.99, 80, 1, '2x6 feet', 'Halifax, NS', '2x6 Lumber', 'Home Depot'),
(1, 16.99, 60, 1, '2x8 feet', 'Halifax, NS', '2x8 Lumber', 'Home Depot'),
(1, 11.99, 120, 1, '2x4 feet', 'Halifax, NS', 'Pine 2x4', 'Lowes'),
(1, 18.99, 90, 1, '2x6 feet', 'Halifax, NS', 'Cedar 2x6', 'Lowes'),
(1, 19.99, 70, 1, '2x8 feet', 'Halifax, NS', 'Spruce 2x8', 'Home Hardware'),

-- Portas
(2, 120.00, 20, 2, '32x80 inches', 'Halifax, NS', 'Solid Core Door', 'Home Depot'),
(2, 150.00, 15, 2, '36x80 inches', 'Halifax, NS', 'Panel Door', 'Home Depot'),
(2, 110.00, 25, 2, '32x80 inches', 'Halifax, NS', 'Flush Door', 'Rona'),
(2, 130.00, 10, 2, '36x80 inches', 'Halifax, NS', 'Hollow Core Door', 'Home Depot'),

-- Janelas
(3, 200.00, 30, 3, '48x48 inches', 'Halifax, NS', 'Double Glazed Window', 'Home Depot'),
(3, 250.00, 25, 3, '60x60 inches', 'Halifax, NS', 'Sliding Window', 'Home Depot'),
(3, 180.00, 40, 3, '48x48 inches', 'Halifax, NS', 'Single Glazed Window', 'Lowes'),
(3, 220.00, 20, 3, '60x60 inches', 'Halifax, NS', 'Casement Window', 'Rona'),

-- Tintas
(4, 40.00, 50, 4, '1 Gallon', 'Halifax, NS', 'Interior Paint', 'Home Depot'),
(4, 45.00, 45, 4, '1 Gallon', 'Halifax, NS', 'Exterior Paint', 'Home Depot'),
(4, 38.00, 55, 4, '1 Gallon', 'Halifax, NS', 'Primer', 'Home Hardware'),
(4, 60.00, 50, 4, '1 Gallon', 'Halifax, NS', 'Gloss Paint', 'Home Depot'),

-- Pregos e Parafusos
(5, 10.00, 500, 5, '2 inches', 'Halifax, NS', 'Nails', 'Home Depot'),
(5, 15.00, 400, 5, '3 inches', 'Halifax, NS', 'Screws', 'Home Depot'),
(5, 12.00, 550, 5, '2.5 inches', 'Halifax, NS', 'Galvanized Nails', 'Lowes'),
(5, 17.00, 420, 5, '3.5 inches', 'Halifax, NS', 'Wood Screws', 'Rona'),

-- Drywall
(6, 25.00, 100, 6, '4x8 feet', 'Halifax, NS', 'Drywall Sheet', 'Home Depot'),
(6, 28.00, 80, 6, '4x10 feet', 'Halifax, NS', 'Drywall Sheet', 'Home Depot'),
(6, 27.00, 110, 6, '4x8 feet', 'Halifax, NS', 'Greenboard Drywall', 'Home Hardware'),
(6, 30.00, 90, 6, '4x10 feet', 'Halifax, NS', 'Blueboard Drywall', 'Lowes'),

-- Piso
(7, 35.00, 100, 7, '12x12 inches', 'Halifax, NS', 'Tile', 'Home Depot'),
(7, 50.00, 60, 7, '24x24 inches', 'Halifax, NS', 'Marble Tile', 'Home Depot'),
(7, 45.00, 110, 7, '12x24 inches', 'Halifax, NS', 'Porcelain Tile', 'Home Hardware'),
(7, 55.00, 70, 7, '18x18 inches', 'Halifax, NS', 'Ceramic Tile', 'Rona'),

-- Ferramentas
(8, 150.00, 10, 8, 'Cordless', 'Halifax, NS', 'Drill', 'Home Depot'),
(8, 80.00, 15, 8, 'Cordless', 'Halifax, NS', 'Screwdriver', 'Home Depot'),
(8, 160.00, 12, 8, 'Cordless', 'Halifax, NS', 'Hammer Drill', 'Lowes'),
(8, 90.00, 18, 8, 'Cordless', 'Halifax, NS', 'Impact Driver', 'Home Depot');
