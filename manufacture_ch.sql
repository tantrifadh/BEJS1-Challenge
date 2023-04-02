CREATE DATABASE manufacture_ch;

--DDL
CREATE TABLE supplier (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name_supplier VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE component (
    component_id BIGSERIAL PRIMARY KEY NOT NULL,
    name_component VARCHAR(100) NOT NULL,
    description VARCHAR(200) NOT NULL
);

CREATE TABLE product (
    product_id BIGSERIAL PRIMARY KEY NOT NULL,
    name_product VARCHAR(100) NOT NULL,
    quatity INT NOT NULL,
    component_id INT NOT NULL,
    FOREIGN KEY (component_id) REFERENCES component(component_id)
);

CREATE TABLE supplier_component (
    suplliercom_id BIGSERIAL PRIMARY KEY NOT NULL,
    component_id INT NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (component_id) REFERENCES component(component_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

--DML
SELECT * FROM supplier;
SELECT * FROM product;
SELECT * FROM component;
SELECT * FROM supplier_component;

INSERT INTO supplier(nama_supplier,address,phone) VALUES
    ('Meat Paradise','Jl. Taman Gusti Putri No.1','0851-5608-2825'),
    ('Heimon Food','Jl. Citarum No.54','085952870168'),
    ('Daging Arzaq','Jl. Gajah Tim. Dalam 2','082116688985'),
    ('Ausapi Pangan Nusantara','Jl. Beruang Dalam Bar. No.29','082138163783');

INSERT INTO component(name_component,description) VALUES
    ('Daging Giling','Daging giling terbaik di Semarang'),
    ('Lidah Sapi', 'Lidah sapi yang dapat digunakan untuk sate'),
    ('Iga Sapi','Iga yang membuat lambungmu bergetar karena enak');

INSERT INTO product(name_product,quantity,component_id) VALUES
    ('Lamb shoulder','90',2),
    ('Shank','20',2),
    ('Brisket bone','5',1),
    ('Tenderloin','100',3),
    ('Tengkleng','50',3);

INSERT INTO supplier_component(component_id,supplier_id) VALUES
    (2,1),
    (3,2),
    (1,3),
    (2,3);

UPDATE component SET name_component = 'Daging Sapi' WHERE name_component = 'Daging Giling';
UPDATE component SET name_component = 'Daging Kambing' WHERE name_component = 'Lidah Sapi';
UPDATE component SET name_component = 'Daging Rusa' WHERE name_component = 'Iga Sapi';
UPDATE component SET description = 'Daging yang diperoleh dari sapi yang biasa dan umum digunakan untuk keperluan konsumsi makanan' WHERE description = 'Daging giling terbaik di Semarang';
UPDATE component SET description = 'Daging kambing adalah daging yang dihasilkan dari kambing' WHERE description = 'Lidah sapi yang dapat digunakan untuk sate';
UPDATE component SET description = 'Daging rusa adalah daging binatang buruan, terutama dari hewan sejenis rusa' WHERE description = 'Iga yang membuat lambungmu bergetar karena enak';

SELECT * FROM component;

DELETE FROM product WHERE name_product = 'Tengkleng';
SELECT * FROM product;