ALTER TABLE BesoinClient_TypeLinge ADD CONSTRAINT FKBesoinClie354441 FOREIGN KEY (id_type_linge) REFERENCES TypeLinges (id_type_linge);
ALTER TABLE BesoinClient_TypeLinge ADD CONSTRAINT FKBesoinClie823554 FOREIGN KEY (id_besoin_client) REFERENCES BesoinClients (id_besoin_client);

