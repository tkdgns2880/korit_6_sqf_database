
create view master_view as
select
	mt.master_id,
    mt.join1_id,
    j1tb.name,
    mt.join2_id,
    j2tb.phone
from
	master_tb mt
    left outer join join1_tb j1tb on(j1tb.join1_id = mt.join1_id)
    left outer join join2_tb j2tb on(j2tb.join2_id = mt.join2_id)