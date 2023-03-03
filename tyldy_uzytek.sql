create table slmn.tylda_ciek_uzytek as 
with uzytek as (select aup.id, aup.nadlesn, aup.nr_dzialki, aup.nr_kont, aup.wkb_geometry  
       from slmn.a_uzyt_pol aup, silp.f_parcel_land_use fplu
       where aup.nr_dzialki = fplu.parcel_int_num 
       and aup.nr_kont = fplu.shape_nr 
       and fplu.area_use_cd ='Ls')
select concat(tc.nr_wew, '_',uzytek.nr_dzialki, '_',uzytek.nr_kont) as klucz,
       tc.kod_ob,
       tc.szer,
       tc.adreslesny,
       tc.id_atryb,
       tc.id_obiekt,
       st_intersection(uzytek.wkb_geometry, tc.geometry) as geometria,
       st_length(st_intersection(uzytek.wkb_geometry, tc.geometry)) as dlugosc,
       (st_length(st_intersection(uzytek.wkb_geometry, tc.geometry)) * tc.szer::double precision) as pow_geometryczna
from slmn.tyldy_ciek tc, uzytek where st_isempty(st_intersection(uzytek.wkb_geometry, tc.geometry)) <> true 

create table slmn.tylda_kom_uzytek as 
with uzytek as (select aup.id, aup.nadlesn, aup.nr_dzialki, aup.nr_kont, aup.wkb_geometry  
       from slmn.a_uzyt_pol aup, silp.f_parcel_land_use fplu
       where aup.nr_dzialki = fplu.parcel_int_num 
       and aup.nr_kont = fplu.shape_nr 
       and fplu.area_use_cd ='Ls')
select concat(tc.nr_wew, '_',uzytek.nr_dzialki, '_',uzytek.nr_kont) as klucz,
       tc.kod_ob,
       tc.szer,
       tc.adreslesny,
       tc.id_atryb,
       tc.id_obiekt,
       st_intersection(uzytek.wkb_geometry, tc.geometry) as geometria,
       st_length(st_intersection(uzytek.wkb_geometry, tc.geometry)) as dlugosc,
       (st_length(st_intersection(uzytek.wkb_geometry, tc.geometry)) * tc.szer::double precision) as pow_geometryczna
from slmn.tyldy_kom tc, uzytek where st_isempty(st_intersection(uzytek.wkb_geometry, tc.geometry)) <> true

create table slmn.tylda_linie_uzytek as 
with uzytek as (select aup.id, aup.nadlesn, aup.nr_dzialki, aup.nr_kont, aup.wkb_geometry  
       from slmn.a_uzyt_pol aup, silp.f_parcel_land_use fplu
       where aup.nr_dzialki = fplu.parcel_int_num 
       and aup.nr_kont = fplu.shape_nr 
       and fplu.area_use_cd ='Ls')
select concat(tc.nr_wew, '_',uzytek.nr_dzialki, '_',uzytek.nr_kont) as klucz,
       tc.kod_ob,
       tc.szer,
       tc.adreslesny,
       tc.id_atryb,
       tc.id_obiekt,
       st_intersection(uzytek.wkb_geometry, tc.geometry) as geometria,
       st_length(st_intersection(uzytek.wkb_geometry, tc.geometry)) as dlugosc,
       (st_length(st_intersection(uzytek.wkb_geometry, tc.geometry)) * tc.szer::double precision) as pow_geometryczna
from slmn.tyldy_linie tc, uzytek where st_isempty(st_intersection(uzytek.wkb_geometry, tc.geometry)) <> true 