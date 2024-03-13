select 
_c.id, 
_c.name, 
_s.name as sub_name,
_s.id as sub_id,
ABS((SELECT  MIN(subdivisions.id) FROM dbo.subdivisions) - _s.id) as sub_level,
(SELECT  COUNT(*) from dbo.collaborators where subdivision_id = _s.id) as colls_count

from collaborators as _c join subdivisions as _s
on _c.subdivision_id = _s.id

where subdivision_id > (select subdivision_id from collaborators where id = 710253)

AND age < 40
AND subdivision_id  NOT IN (100055, 100059)
ORDER BY _s.id