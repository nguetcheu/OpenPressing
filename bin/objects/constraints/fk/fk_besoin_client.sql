ALTER TABLE BesoinClients ADD CONSTRAINT FKBesoinClie745482 FOREIGN KEY (id_adress) REFERENCES Adresses (id_adress);
ALTER TABLE BesoinClients ADD CONSTRAINT FKBesoinClie114471 FOREIGN KEY (id_adress2) REFERENCES Adresses (id_adress);
ALTER TABLE BesoinClients ADD CONSTRAINT FKBesoinClie347501 FOREIGN KEY (id_client) REFERENCES Clients (id_client);
ALTER TABLE BesoinClients ADD CONSTRAINT FKBesoinClie417405 FOREIGN KEY (id_pressing) REFERENCES Pressings (id_pressing);
ALTER TABLE BesoinClients ADD CONSTRAINT FKBesoinClie289937 FOREIGN KEY (id_utilisateur) REFERENCES utlisateurs (id_utilisateur);