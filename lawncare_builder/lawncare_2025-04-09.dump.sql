----
-- phpLiteAdmin database dump (https://www.phpliteadmin.org/)
-- phpLiteAdmin version: 1.9.9-dev
-- Exported: 8:30pm on April 9, 2025 (UTC)
-- database file: /workspaces/168045752/project/lawncare_builder/lawncare.db
----
BEGIN TRANSACTION;

----
-- Drop tables if they exist
----
DROP TABLE IF EXISTS grasses;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_compatibility;

----
-- Table structure for grasses
----
CREATE TABLE grasses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

----
-- Data dump for grasses, a total of 5 rows
----
INSERT INTO "grasses" ("id","name") VALUES ('1','St. Augustine');
INSERT INTO "grasses" ("id","name") VALUES ('2','Bahia');
INSERT INTO "grasses" ("id","name") VALUES ('3','Bermuda');
INSERT INTO "grasses" ("id","name") VALUES ('4','Zoysia');
INSERT INTO "grasses" ("id","name") VALUES ('5','Centipede');

----
-- Table structure for products
----
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    description TEXT
);

----
-- Data dump for products, a total of 23 rows
----
INSERT INTO "products" ("id","name","category","description") VALUES ('1','Honda HRX217VKA Lawn Mower','Lawn Mower','Self-propelled, variable speed, ideal for thick grass like St. Augustine.');
INSERT INTO "products" ("id","name","category","description") VALUES ('2','Toro Recycler 22 in. Lawn Mower','Lawn Mower','Durable, reliable mower for Bermuda grass with adjustable cutting height.');
INSERT INTO "products" ("id","name","category","description") VALUES ('3','Ryobi 20 in. 40V Lithium-Ion Cordless Lawn Mower','Lawn Mower','Battery-powered mower, ideal for smaller lawns and eco-conscious users.');
INSERT INTO "products" ("id","name","category","description") VALUES ('4','EGO Power+ 21" Cordless Lawn Mower','Lawn Mower','High-performance battery-powered mower, great for Bermuda and Zoysia.');
INSERT INTO "products" ("id","name","category","description") VALUES ('5','Echo SRM-2620 Weedwacker','Weedwacker','Professional-grade trimmer for use in Florida yards.');
INSERT INTO "products" ("id","name","category","description") VALUES ('6','BLACK+DECKER LST300 Weedwacker','Weedwacker','Battery-powered and lightweight, great for smaller yards.');
INSERT INTO "products" ("id","name","category","description") VALUES ('7','Ryobi 40V Lithium-Ion Cordless String Trimmer','Weedwacker','Powerful and eco-friendly, ideal for smaller to medium lawns.');
INSERT INTO "products" ("id","name","category","description") VALUES ('8','EGO Power+ 15" Cordless String Trimmer','Weedwacker','Lightweight and durable, perfect for trimming Zoysia and Bermuda grass.');
INSERT INTO "products" ("id","name","category","description") VALUES ('9','Scotts Turf Builder Lawn Food','Fertilizer','Recommended for St. Augustine, helps build strong roots and lush growth.');
INSERT INTO "products" ("id","name","category","description") VALUES ('10','Miracle-Gro Water Soluble Lawn Food','Fertilizer','Perfect for Bermuda, promotes rapid green-up and healthy grass.');
INSERT INTO "products" ("id","name","category","description") VALUES ('11','Pennington UltraGreen Lawn Fertilizer','Fertilizer','Great for Centipede, provides balanced nutrients for healthy growth.');
INSERT INTO "products" ("id","name","category","description") VALUES ('12','Scott’s Turf Builder for Bahia Grass','Fertilizer','Ideal for Bahia, promotes root development and stronger grass.');
INSERT INTO "products" ("id","name","category","description") VALUES ('13','Scotts Turf Builder for Zoysia Grass','Fertilizer','Specially formulated for Zoysia, helps create lush, thick lawns.');
INSERT INTO "products" ("id","name","category","description") VALUES ('14','Roundup Weed & Grass Killer','Herbicide','Kills weeds without harming Bahia or Zoysia grass.');
INSERT INTO "products" ("id","name","category","description") VALUES ('15','Ortho Weed B Gon Herbicide','Herbicide','Safe for Centipede and Zoysia grass, kills broadleaf weeds.');
INSERT INTO "products" ("id","name","category","description") VALUES ('16','Spectracide Weed Stop','Herbicide','Safe for Bermuda, prevents broadleaf weeds without harming grass.');
INSERT INTO "products" ("id","name","category","description") VALUES ('17','Southern Ag Atrazine Weed Killer','Herbicide','Safe for St. Augustine.');
INSERT INTO "products" ("id","name","category","description") VALUES ('18','Bonide Annual Tree & Shrub Insect Control','Pesticide','Controls pests on lawns and around trees, safe for Zoysia and Centipede.');
INSERT INTO "products" ("id","name","category","description") VALUES ('19','Spectracide Triazicide Insect Killer','Pesticide','Effective for lawn insects, ideal for Bahia grass.');
INSERT INTO "products" ("id","name","category","description") VALUES ('20','Sevin Insect Killer','Pesticide','Safe for St. Augustine and Bermuda, kills lawn pests.');
INSERT INTO "products" ("id","name","category","description") VALUES ('21','Bayer Advanced Complete Insect Killer','Pesticide','Safe for St. Augustine and Bermuda, kills pests on contact.');
INSERT INTO "products" ("id","name","category","description") VALUES ('22','Safer Brand 5118 Insecticidal Soap','Pesticide','Organic option, safe for Zoysia and Centipede, kills soft-bodied insects.');
INSERT INTO "products" ("id","name","category","description") VALUES ('23','Sevin Dust Insect Killer','Pesticide','Good for Bermuda and Zoysia, kills a wide range of pests.');

----
-- Table structure for product_compatibility
----
CREATE TABLE product_compatibility (
    product_id INTEGER,
    grass_id INTEGER,
    FOREIGN KEY(product_id) REFERENCES products(id),
    FOREIGN KEY(grass_id) REFERENCES grasses(id),
    PRIMARY KEY(product_id, grass_id)
);

----
-- Data dump for product_compatibility, a total of 43 rows
----
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('1','1');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('1','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('1','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('2','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('2','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('3','2');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('3','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('4','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('4','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('5','1');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('5','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('5','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('6','1');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('6','2');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('6','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('7','2');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('7','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('7','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('8','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('8','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('9','1');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('10','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('11','5');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('12','2');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('13','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('14','2');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('14','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('14','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('15','5');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('15','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('16','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('17','1');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('18','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('18','5');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('19','2');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('20','1');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('20','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('21','1');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('21','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('22','4');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('22','5');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('23','3');
INSERT INTO "product_compatibility" ("product_id","grass_id") VALUES ('23','4');

----
-- structure for index sqlite_autoindex_grasses_1 on table grasses
----
;

----
-- structure for index sqlite_autoindex_product_compatibility_1 on table product_compatibility
----
;
COMMIT;
