CREATE TABLE Pressings (
   id_pressing varchar2(8) NOT NULL, 
  nom         varchar2(30), 
  email       varchar2(25), 
  telephone   varchar2(25), 
  h_ouverture timestamp(7), 
  h_fermeture timestamp(7) 
);