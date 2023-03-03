#!/bin/bash
# Rozkład pociągu zdawczego do składnicy drewna

# Gdzie jest książka pokładowa
for f in *.zip; do unzip "$f" -d "${f%.zip}"; done
#Karta próby
export PGHOST="serwer.pgllp"
export PGPORT="49666"
export PGDATABASE="nazwabazy"
export PGUSER="uzyszkodnik"
export PGCLIENTENCODING=WIN1250

#Wykaz pojazdów kolejowych w składzie pociągu
for i in */
do
    echo $i
    echo "Ewidencja"
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_dzew_pol" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_dzew_pol.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_gran_pkt" -a_srs "EPSG:2180" $i/a_gran_pkt.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_uzyt_pol" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_uzyt_pol.shp
    echo "Podział powierzchniowy"
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_oddz_pol" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_oddz_pol.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_wydz_pol" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_wydz_pol.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_op_oddz_pkt" -a_srs "EPSG:2180" $i/a_op_oddz_pkt.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_op_wydz_pkt" -a_srs "EPSG:2180" $i/a_op_wydz_pkt.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_pnsw_pow" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_pnsw_pow.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_les_pol" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_les_pol.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_les_pkt" -a_srs "EPSG:2180" $i/a_les_pkt.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_nadl_pkt" -a_srs "EPSG:2180" $i/a_nadl_pkt.shp
    echo "Komunikacja"
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_kom_lin" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_kom_lin.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_kom_a" $i/a_kom_a.dbf
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_line_lin" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_line_lin.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_line_a" $i/a_line_a.dbf
    echo "Sytuacja"
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_bud_pol" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_bud_pol.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_ciek_lin" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_ciek_lin.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_ciek_a" $i/a_ciek_a.dbf
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_infra_pow" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_infra_pow.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_infra__pkt" -a_srs "EPSG:2180" $i/a_infra_pkt.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_oprz_pow" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_oprz_pow.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_l_os_lin" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_l_os_lin.shp
    #Ppoz
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_pozar_pow" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_pozar_pow.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_pozar_pkt" -a_srs "EPSG:2180" $i/a_pozar_pkt.shp
    #Ochrona przyrody
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_os_prz_pow" -nlt PROMOTE_TO_MULTI -a_srs "EPSG:2180" $i/a_os_prz_pow.shp
    ogr2ogr -update -append -f PostgreSQL PG:"password=haslo active_schema=slmn" --config PG_USE_COPY YES -nln "a_os_prz_pkt" -a_srs "EPSG:2180" $i/a_os_prz_pkt.shp
done;