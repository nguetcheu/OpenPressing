ALTER TABLE Offres ADD CONSTRAINT FKOffres60996 FOREIGN KEY (id_service) REFERENCES Services (id_service);
ALTER TABLE Offres ADD CONSTRAINT FKOffres379902 FOREIGN KEY (id_type_linge) REFERENCES TypeLinges (id_type_linge);
