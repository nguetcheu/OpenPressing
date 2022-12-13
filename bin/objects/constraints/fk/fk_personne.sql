ALTER TABLE Personnes ADD CONSTRAINT FKPersonne303937 FOREIGN KEY (id_PersonnePhysique) REFERENCES PersonnePhysique(id_PersonnePhysique);
ALTER TABLE Personnes ADD CONSTRAINT FKPersonne828107 FOREIGN KEY (id_client) REFERENCES Clients (id_client);
ALTER TABLE Personnes ADD CONSTRAINT FKPersonne430126 FOREIGN KEY (id_adress) REFERENCES Adresses (id_adress);