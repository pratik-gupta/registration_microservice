--liquibase formatted sql
--changeset shyam:1 runOnChange:true runAlways:false endDelimiter:# stripComments:false

DROP VIEW IF EXISTS ringgold.vu_ringgold_info;

CREATE OR REPLACE VIEW ringgold.vu_ringgold_info AS
(
select 
t1.ringgold_id,
t1.name,
t1.city,
t1.country,
t1.state,
t1.post_code,
split_part(t1.type, '/', 1) as category,
split_part(t1.type, '/', 2) as legal_subcategory,
t2.url,
left(t3.name, 600) as alt_names,
t6.value as staff_value,
t7.value as size_value,
t8.value  as carnegie_value,
t9.value as rgt_value,
t10.value as sfj_value,
t11.value as bed_value,
t12.value as library_value,
t13.value as school_value,
t14.value as hospital_value
from ringgold.ringgold_institutions t1
LEFT JOIN (select string_agg(url, ', ') as url,ringgold_id from ringgold.ringgold_urls where notes = 'PD' group by ringgold_id) t2  ON t1.ringgold_id=t2.ringgold_id
LEFT JOIN (select string_agg(name, ', ') as name,ringgold_id  from ringgold.ringgold_alt_names where notes in ('TR','AK','AC','FN','AB','TL','LB') GROUP BY ringgold_id) t3 ON t1.ringgold_id=t3.ringgold_id
LEFT JOIN(select value,ringgold_id from ringgold.ringgold_sizes  where size_type='staff') t6 on t1.ringgold_id=t6.ringgold_id
LEFT JOIN(select  value,ringgold_id from ringgold.ringgold_sizes  where size_type='size') t7 on t1.ringgold_id=t7.ringgold_id
LEFT JOIN(select value,ringgold_id from ringgold.ringgold_tiers where tier_type='Carnegie-BASIC2015') t8 on t1.ringgold_id=t8.ringgold_id
LEFT JOIN(select rtm.value,ringgold_id from ringgold.ringgold_tiers rt, ringgold.ringgold_tier_mapping rtm where  tier_type='RGT' and rtm.key =rt.value) t9 on t1.ringgold_id=t9.ringgold_id
LEFT JOIN(select value,ringgold_id from ringgold.ringgold_tiers where  tier_type='SFJ') t10 on t1.ringgold_id=t10.ringgold_id
LEFT JOIN(select  value,ringgold_id from ringgold.ringgold_sizes  where size_type='beds') t11 on t1.ringgold_id=t11.ringgold_id
LEFT JOIN(select  value,ringgold_id from ringgold.ringgold_sizes  where size_type='libraries') t12 on t1.ringgold_id=t12.ringgold_id
LEFT JOIN(select  value,ringgold_id from ringgold.ringgold_sizes  where size_type='schools') t13 on t1.ringgold_id=t13.ringgold_id
LEFT JOIN(select  value,ringgold_id from ringgold.ringgold_sizes  where size_type='hospitals') t14 on t1.ringgold_id=t14.ringgold_id

);

#