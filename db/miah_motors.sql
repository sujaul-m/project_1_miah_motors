DROP TABLE miah_motors;
DROP TABLE vehicles;
DROP TABLE manufacturers;

CREATE TABLE manufacturers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  contact VARCHAR(255)
);

CREATE TABLE vehicles
(
  id SERIAL8 primary key,
  make VARCHAR(255) not null,
  model VARCHAR(255) not null,
  quantity INT8 not null,
  purchase_price INT8 not null,
  selling_price INT8 not null,
  image TEXT not null
);

CREATE TABLE miah_motors
(
  id SERIAL8 primary key,
  vehicle_id INT8 references vehicles(id),
  manufacturer_id INT8 references manufacturers(id)
);
