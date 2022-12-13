CREATE TABLE promos (
  code_promo         varchar2(8) UNIQUE, 
  debut_promo        date, 
  fin_promo          date, 
  id_annonce varchar2(8) NOT NULL);