DROP TABLE IF EXISTS grasses;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_compatibility;

CREATE TABLE grasses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    description TEXT
);

CREATE TABLE product_compatibility (
    product_id INTEGER,
    grass_id INTEGER,
    FOREIGN KEY(product_id) REFERENCES products(id),
    FOREIGN KEY(grass_id) REFERENCES grasses(id),
    PRIMARY KEY(product_id, grass_id)
);

-- Insert grass types
INSERT INTO grasses (name) VALUES
('St. Augustine'),
('Bahia'),
('Bermuda'),
('Zoysia'),
('Centipede');

-- Insert products (with links removed)
INSERT INTO products (name, category, description) VALUES
-- Lawn Mowers
('Honda HRX217VKA Lawn Mower', 'Lawn Mower', 'Self-propelled, variable speed, ideal for thick grass like St. Augustine.'),
('Toro Recycler 22 in. Lawn Mower', 'Lawn Mower', 'Durable, reliable mower for Bermuda grass with adjustable cutting height.'),
('Ryobi 20 in. 40V Lithium-Ion Cordless Lawn Mower', 'Lawn Mower', 'Battery-powered mower, ideal for smaller lawns and eco-conscious users.'),
('EGO Power+ 21" Cordless Lawn Mower', 'Lawn Mower', 'High-performance battery-powered mower, great for Bermuda and Zoysia.'),
-- Weedwackers
('Echo SRM-2620 Weedwacker', 'Weedwacker', 'Professional-grade trimmer for use in Florida yards.'),
('BLACK+DECKER LST300 Weedwacker', 'Weedwacker', 'Battery-powered and lightweight, great for smaller yards.'),
('Ryobi 40V Lithium-Ion Cordless String Trimmer', 'Weedwacker', 'Powerful and eco-friendly, ideal for smaller to medium lawns.'),
('EGO Power+ 15" Cordless String Trimmer', 'Weedwacker', 'Lightweight and durable, perfect for trimming Zoysia and Bermuda grass.'),
-- Fertilizers
('Scotts Turf Builder Lawn Food', 'Fertilizer', 'Recommended for St. Augustine, helps build strong roots and lush growth.'),
('Miracle-Gro Water Soluble Lawn Food', 'Fertilizer', 'Perfect for Bermuda, promotes rapid green-up and healthy grass.'),
('Pennington UltraGreen Lawn Fertilizer', 'Fertilizer', 'Great for Centipede, provides balanced nutrients for healthy growth.'),
('Scott’s Turf Builder for Bahia Grass', 'Fertilizer', 'Ideal for Bahia, promotes root development and stronger grass.'),
('Scotts Turf Builder for Zoysia Grass', 'Fertilizer', 'Specially formulated for Zoysia, helps create lush, thick lawns.'),
-- Herbicides
('Roundup Weed & Grass Killer', 'Herbicide', 'Kills weeds without harming Bahia or Zoysia grass.'),
('Ortho Weed B Gon Herbicide', 'Herbicide', 'Safe for Centipede and Zoysia grass, kills broadleaf weeds.'),
('Spectracide Weed Stop', 'Herbicide', 'Safe for Bermuda, prevents broadleaf weeds without harming grass.'),
('Southern Ag 2,4-D Amine Weed Killer', 'Herbicide', 'Safe for St. Augustine, kills broadleaf weeds without harming grass.'),
-- Pesticides
('Bonide Annual Tree & Shrub Insect Control', 'Pesticide', 'Controls pests on lawns and around trees, safe for Zoysia and Centipede.'),
('Spectracide Triazicide Insect Killer', 'Pesticide', 'Effective for lawn insects, ideal for Bahia grass.'),
('Sevin Insect Killer', 'Pesticide', 'Safe for St. Augustine and Bermuda, kills lawn pests.'),
('Bayer Advanced Complete Insect Killer', 'Pesticide', 'Safe for St. Augustine and Bermuda, kills pests on contact.'),
('Safer Brand 5118 Insecticidal Soap', 'Pesticide', 'Organic option, safe for Zoysia and Centipede, kills soft-bodied insects.'),
('Sevin Dust Insect Killer', 'Pesticide', 'Good for Bermuda and Zoysia, kills a wide range of pests.')
;

-- Compatibility: mapping products to grass types
-- Lawn Mowers
INSERT INTO product_compatibility (product_id, grass_id) VALUES
(1, 1), (1, 3), (1, 4),  -- Honda HRX217VKA for St. Augustine, Bermuda, Zoysia
(2, 3), (2, 4),  -- Toro Recycler for Bermuda and Zoysia
(3, 2), (3, 4),  -- Ryobi 40V for Bahia, Zoysia
(4, 3), (4, 4),  -- EGO Power+ for Bermuda and Zoysia

-- Weedwackers
(5, 1), (5, 3), (5, 4),  -- Echo SRM-2620 for St. Augustine, Bermuda, Zoysia
(6, 1), (6, 2), (6, 4),  -- BLACK+DECKER LST300 for St. Augustine, Bahia, Zoysia
(7, 2), (7, 3), (7, 4),  -- Ryobi 40V Weedwacker for Bahia, Bermuda, Zoysia
(8, 3), (8, 4),  -- EGO Power+ Weedwacker for Bermuda and Zoysia

-- Fertilizers
(9, 1),  -- Scotts Turf Builder for St. Augustine
(10, 3),  -- Miracle-Gro for Bermuda
(11, 5),  -- Pennington for Centipede
(12, 2),  -- Scott’s Turf Builder for Bahia
(13, 4),  -- Scotts Turf Builder for Zoysia

-- Herbicides
(14, 2), (14, 3), (14, 4),  -- Roundup for Bahia, Bermuda, Zoysia
(15, 5), (15, 4),  -- Ortho Weed B Gon for Centipede, Zoysia
(16, 3),  -- Spectracide for Bermuda
(17, 1),  -- Southern Ag 2,4-D for St. Augustine

-- Pesticides
(18, 4), (18, 5),  -- Bonide for Zoysia, Centipede
(19, 2),  -- Spectracide for Bahia
(20, 1), (20, 3),  -- Sevin for St. Augustine, Bermuda
(21, 1), (21, 3),  -- Bayer Advanced for St. Augustine, Bermuda
(22, 4), (22, 5),  -- Safer Brand for Zoysia, Centipede
(23, 3), (23, 4);  -- Sevin Dust for Bermuda, Zoysia
