CREATE TABLE Annonces (
  id_annonce               varchar2(8) NOT NULL, 
  image                    raw(100), 
  date_debut               timestamp(0), 
  date_fin                 timestamp(0), 
  id_pressing     varchar2(8) NOT NULL, 
  id_utilisateur varchar2(8) NOT NULL 
  );