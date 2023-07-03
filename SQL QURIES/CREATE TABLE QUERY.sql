CREATE TABLE sales (
  OBJECTID INTEGER PRIMARY KEY,
  NAME VARCHAR,
  StatePIN VARCHAR,
  legal_description VARCHAR,
  property_addr VARCHAR,
  cert_land_value DECIMAL,
  cert_improvement_value DECIMAL,
  cert_total_value DECIMAL,
  owner1 VARCHAR,
  owner2 VARCHAR,
  owner_street VARCHAR,
  owner_city VARCHAR,
  owner_state VARCHAR,
  owner_zip VARCHAR,
  grade VARCHAR,
  year_built DATE,
  condition VARCHAR,
  property_class DECIMAL,
  nbhd DECIMAL,
  SoldPrice DECIMAL,
  ConveyanceDate DATE,
  legal_ac DECIMAL,
  SpecialCircumstances2 VARCHAR,
  Shape_Area DECIMAL
);