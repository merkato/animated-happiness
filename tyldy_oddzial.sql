create table slmn.tyldy_linie as
WITH oddzial AS (
         SELECT aop.id, 
                aop.wkb_geometry, 
                fa.arodes_int_num, 
                fa.adress_forest AS adroddz
           FROM slmn.a_oddz_pol aop JOIN silp.f_arodes fa ON aop.nr_wew::double precision = fa.arodes_int_num::double precision), 
     linia AS (
         SELECT atrybut.id_atryb, 
                atrybut.id_lin, 
                atrybut.nr_wew, 
                linie.wkb_geometry,
                linie.kod_ob, 
                linie.szer, 
                arody.adress_forest AS adres_lesny
           FROM slmn.a_line_a atrybut,            
                slmn.a_line_lin linie,
                silp.f_arodes arody
          WHERE atrybut.id_lin = linie.id_lin AND atrybut.nr_wew::double precision = arody.arodes_int_num::double precision)
SELECT row_number() OVER () AS _qgisid,
    linia.id_atryb,    linia.id_lin AS id_obiekt,
    linia.kod_ob,    linia.szer,
    st_intersection(linia.wkb_geometry, oddzial.wkb_geometry) AS geometry,
    linia.nr_wew, linia.adres_lesny AS adreslesny
  FROM oddzial, linia
  WHERE "left"(oddzial.adroddz::text, 14) = "left"(linia.adres_lesny::text, 14)
  AND st_isempty(st_intersection(linia.wkb_geometry, oddzial.wkb_geometry)) <> true;
 
create table slmn.tyldy_kom as
WITH oddzial AS (
         SELECT aop.id, 
                aop.wkb_geometry, 
                fa.arodes_int_num, 
                fa.adress_forest AS adroddz
           FROM slmn.a_oddz_pol aop JOIN silp.f_arodes fa ON aop.nr_wew::double precision = fa.arodes_int_num::double precision), 
     linia AS (
         SELECT atrybut.id_atryb, 
                atrybut.id_kom, 
                atrybut.nr_wew, 
                linie.wkb_geometry,
                linie.kod_ob, 
                linie.szer, 
                arody.adress_forest AS adres_lesny
           FROM slmn.a_kom_a atrybut,            
                slmn.a_kom_lin linie,
                silp.f_arodes arody
          WHERE atrybut.id_kom = linie.id_kom AND atrybut.nr_wew::double precision = arody.arodes_int_num::double precision)
SELECT row_number() OVER () AS _qgisid,
    linia.id_atryb,    linia.id_kom AS id_obiekt,
    linia.kod_ob,    linia.szer,
    st_intersection(linia.wkb_geometry, oddzial.wkb_geometry) AS geometry,
    linia.nr_wew, linia.adres_lesny AS adreslesny
  FROM oddzial, linia
  WHERE "left"(oddzial.adroddz::text, 14) = "left"(linia.adres_lesny::text, 14)
  AND st_isempty(st_intersection(linia.wkb_geometry, oddzial.wkb_geometry)) <> true;

 create table slmn.tyldy_ciek as
WITH oddzial AS (
         SELECT aop.id, 
                aop.wkb_geometry, 
                fa.arodes_int_num, 
                fa.adress_forest AS adroddz
           FROM slmn.a_oddz_pol aop JOIN silp.f_arodes fa ON aop.nr_wew::double precision = fa.arodes_int_num::double precision), 
     linia AS (
         SELECT atrybut.id_atryb, 
                atrybut.id_wody, 
                atrybut.nr_wew, 
                linie.wkb_geometry,
                linie.kod_ob, 
                linie.szer, 
                arody.adress_forest AS adres_lesny
           FROM slmn.a_ciek_a atrybut,            
                slmn.a_ciek_lin linie,
                silp.f_arodes arody
          WHERE atrybut.id_wody = linie.id_wody AND atrybut.nr_wew::double precision = arody.arodes_int_num::double precision)
SELECT row_number() OVER () AS _qgisid,
    linia.id_atryb,    linia.id_wody AS id_obiekt,
    linia.kod_ob,    linia.szer,
    st_intersection(linia.wkb_geometry, oddzial.wkb_geometry) AS geometry,
    linia.nr_wew, linia.adres_lesny AS adreslesny
  FROM oddzial, linia
  WHERE "left"(oddzial.adroddz::text, 14) = "left"(linia.adres_lesny::text, 14)
  AND st_isempty(st_intersection(linia.wkb_geometry, oddzial.wkb_geometry)) <> true 