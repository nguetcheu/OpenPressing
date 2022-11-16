CREATE SEQUENCE seq_Personnes;
CREATE SEQUENCE seq_Personnes_physique;
CREATE SEQUENCE seq_Pressings;
CREATE SEQUENCE seq_Types_services;
CREATE SEQUENCE seq_Utilisateurs;
CREATE SEQUENCE seq_Annonces;
CREATE SEQUENCE seq_Services;
CREATE SEQUENCE seq_Besoins_client;
CREATE SEQUENCE seq_Type_Linges;
CREATE TABLE Chats (
  PressingsId_Pressings    number(10) NOT NULL, 
  Besoins_clientId_besoins number(10));
CREATE TABLE Privilèges (
  RôlePressingsId_Pressings      number(10), 
  RôleUtilisateursId_utilisateur number(10));
CREATE TABLE Client (
  UtilisateursId_utilisateur number(10));
CREATE TABLE Personnes (
  Id_personne number(10) NOT NULL, 
  Noms        varchar2(255) NOT NULL, 
  Prénoms     varchar2(255) NOT NULL, 
  PRIMARY KEY (Id_personne));
CREATE TABLE "Personnes physique" (
  UtilisateursId_utilisateur number(10), 
  PersonnesId_personne       number(10), 
  Id_personnes_physique      number(10) NOT NULL, 
  Genre                      varchar2(255) NOT NULL, 
  PRIMARY KEY (Id_personnes_physique));
CREATE TABLE Pressings (
  Id_Pressings               number(10) NOT NULL, 
  Nom_Pressing               varchar2(255) NOT NULL, 
  UtilisateursId_utilisateur number(10) NOT NULL, 
  PRIMARY KEY (Id_Pressings));
CREATE TABLE Types_services (
  Id_Type number(10) NOT NULL, 
  Nom     varchar2(255) NOT NULL, 
  PRIMARY KEY (Id_Type));
CREATE TABLE Utilisateurs (
  PressingsId_Pressings number(10) NOT NULL, 
  Id_utilisateur        number(10) NOT NULL, 
  Noms                  varchar2(255) NOT NULL, 
  Prénoms               varchar2(255) NOT NULL, 
  Sexe                  varchar2(255) NOT NULL, 
  PRIMARY KEY (Id_utilisateur));
CREATE TABLE Annonces (
  PressingsId_Pressings      number(10) NOT NULL, 
  Id_annonces                number(10) NOT NULL, 
  Durée                      varchar2(255) NOT NULL, 
  Description                varchar2(255) NOT NULL, 
  UtilisateursId_utilisateur number(10) NOT NULL, 
  PRIMARY KEY (Id_annonces));
CREATE TABLE Adresse (
  Id_Adresse               double precision NOT NULL, 
  Longitude                double precision NOT NULL, 
  Lattitude                double precision NOT NULL, 
  Besoins_clientId_besoins number(10), 
  PRIMARY KEY (Id_Adresse));
CREATE TABLE Offres (
  ServicesId_Services number(10), 
  Id_Offres           varchar2(255) NOT NULL, 
  Intitulé            varchar2(255) NOT NULL, 
  Description         varchar2(255) NOT NULL, 
  Type_LingesId_types number(10), 
  PRIMARY KEY (Id_Offres));
CREATE TABLE Services (
  Types_servicesId_Pressing number(10), 
  PressingsId_Pressings     number(10) NOT NULL, 
  Id_Services               number(10) NOT NULL, 
  Nom                       varchar2(255) NOT NULL, 
  Description               varchar2(255) NOT NULL, 
  PRIMARY KEY (Id_Services));
CREATE TABLE Prix (
  OffresId_Offres varchar2(255), 
  Prix_offre      double precision NOT NULL, 
  Prix_total      double precision NOT NULL);
CREATE TABLE Linges_clients (
  Type_LingesId_types number(10));
CREATE TABLE Attributs (
  Types_servicesId_Pressing number(10));
CREATE TABLE Besoins_client (
  PressingsId_Pressings      number(10) NOT NULL, 
  Type_LingesId_types        number(10), 
  AdresseId_Adresse          double precision, 
  AdresseId_Adresse2         double precision, 
  UtilisateursId_utilisateur number(10), 
  Id_besoins                 number(10) NOT NULL, 
  Date_debut_besoins         varchar2(255) NOT NULL, 
  Date_fin_session           varchar2(255) NOT NULL, 
  Description                varchar2(255) NOT NULL, 
  PRIMARY KEY (Id_besoins));
CREATE TABLE Rôle (
  PressingsIds               number(10) NOT NULL, 
  UtilisateursId_utilisateur number(10) NOT NULL, 
  PRIMARY KEY (PressingsIds, 
  UtilisateursId_utilisateur));
CREATE TABLE Promo (
  OffresId_Offres     varchar2(255) NOT NULL, 
  AnnoncesId_annonces number(10) NOT NULL, 
  PRIMARY KEY (OffresId_Offres, 
  AnnoncesId_annonces));
CREATE TABLE Valeurs_attributs (
  OffresId_Offres varchar2(255) NOT NULL, 
  PRIMARY KEY (OffresId_Offres));
CREATE TABLE Type_Linges (
  Id_types number(10) NOT NULL, 
  Couleur  varchar2(255) NOT NULL, 
  Texture  varchar2(255) NOT NULL, 
  Matière  varchar2(255) NOT NULL, 
  PRIMARY KEY (Id_types));
ALTER TABLE Chats ADD CONSTRAINT FKChats25042 FOREIGN KEY (PressingsId_Pressings) REFERENCES Pressings (Id_Pressings);
ALTER TABLE Client ADD CONSTRAINT FKClient853690 FOREIGN KEY (UtilisateursId_utilisateur) REFERENCES Utilisateurs (Id_utilisateur);
ALTER TABLE "Personnes physique" ADD CONSTRAINT "FKPersonnes 524252" FOREIGN KEY (UtilisateursId_utilisateur) REFERENCES Utilisateurs (Id_utilisateur);
ALTER TABLE Personnes ADD CONSTRAINT FKPersonnes324729 FOREIGN KEY () REFERENCES Client ();
ALTER TABLE "Personnes physique" ADD CONSTRAINT "FKPersonnes 257427" FOREIGN KEY (PersonnesId_personne) REFERENCES Personnes (Id_personne);
ALTER TABLE Annonces ADD CONSTRAINT FKAnnonces292070 FOREIGN KEY (PressingsId_Pressings) REFERENCES Pressings (Id_Pressings);
ALTER TABLE Besoins_client ADD CONSTRAINT FKBesoins_cl745780 FOREIGN KEY (PressingsId_Pressings) REFERENCES Pressings (Id_Pressings);
ALTER TABLE Privilèges ADD CONSTRAINT FKPrivilèges438055 FOREIGN KEY (RôlePressingsId_Pressings, RôleUtilisateursId_utilisateur) REFERENCES Rôle (PressingsIds, UtilisateursId_utilisateur);
ALTER TABLE Rôle ADD CONSTRAINT FKRôle951846 FOREIGN KEY (PressingsIds) REFERENCES Pressings (Id_Pressings);
ALTER TABLE Rôle ADD CONSTRAINT FKRôle589559 FOREIGN KEY (UtilisateursId_utilisateur) REFERENCES Utilisateurs (Id_utilisateur);
ALTER TABLE Besoins_client ADD CONSTRAINT FKBesoins_cl919931 FOREIGN KEY (UtilisateursId_utilisateur) REFERENCES Utilisateurs (Id_utilisateur);
ALTER TABLE Attributs ADD CONSTRAINT FKAttributs356857 FOREIGN KEY (Types_servicesId_Pressing) REFERENCES Types_services (Id_Type);
ALTER TABLE Services ADD CONSTRAINT FKServices758675 FOREIGN KEY (PressingsId_Pressings) REFERENCES Pressings (Id_Pressings);
ALTER TABLE Services ADD CONSTRAINT FKServices843599 FOREIGN KEY (Types_servicesId_Pressing) REFERENCES Types_services (Id_Type);
ALTER TABLE Offres ADD CONSTRAINT FKOffres170156 FOREIGN KEY (ServicesId_Services) REFERENCES Services (Id_Services);
ALTER TABLE Promo ADD CONSTRAINT FKPromo578451 FOREIGN KEY (OffresId_Offres) REFERENCES Offres (Id_Offres);
ALTER TABLE Promo ADD CONSTRAINT FKPromo204044 FOREIGN KEY (AnnoncesId_annonces) REFERENCES Annonces (Id_annonces);
ALTER TABLE Valeurs_attributs ADD CONSTRAINT FKValeurs_at730163 FOREIGN KEY () REFERENCES Attributs ();
ALTER TABLE Valeurs_attributs ADD CONSTRAINT FKValeurs_at134816 FOREIGN KEY (OffresId_Offres) REFERENCES Offres (Id_Offres);
ALTER TABLE Besoins_client ADD CONSTRAINT FKBesoins_cl476411 FOREIGN KEY (AdresseId_Adresse) REFERENCES Adresse (Id_Adresse);
ALTER TABLE Besoins_client ADD CONSTRAINT FKBesoins_cl450768 FOREIGN KEY (AdresseId_Adresse2) REFERENCES Adresse (Id_Adresse);
ALTER TABLE Offres ADD CONSTRAINT FKOffres477312 FOREIGN KEY (Type_LingesId_types) REFERENCES Type_Linges (Id_types);
ALTER TABLE Prix ADD CONSTRAINT FKPrix686570 FOREIGN KEY (OffresId_Offres) REFERENCES Offres (Id_Offres);
ALTER TABLE Linges_clients ADD CONSTRAINT FKLinges_cli928320 FOREIGN KEY (Type_LingesId_types) REFERENCES Type_Linges (Id_types);
ALTER TABLE Chats ADD CONSTRAINT FKChats378136 FOREIGN KEY (Besoins_clientId_besoins) REFERENCES Besoins_client (Id_besoins);
ALTER TABLE Besoins_client ADD CONSTRAINT FKBesoins_cl182799 FOREIGN KEY (Type_LingesId_types) REFERENCES Type_Linges (Id_types);
ALTER TABLE Adresse ADD CONSTRAINT FKAdresse932083 FOREIGN KEY (Besoins_clientId_besoins) REFERENCES Besoins_client (Id_besoins);
ALTER TABLE Annonces ADD CONSTRAINT FKAnnonces505369 FOREIGN KEY (UtilisateursId_utilisateur) REFERENCES Utilisateurs (Id_utilisateur);
ALTER TABLE Pressings ADD CONSTRAINT FKPressings470042 FOREIGN KEY (UtilisateursId_utilisateur) REFERENCES Utilisateurs (Id_utilisateur);
