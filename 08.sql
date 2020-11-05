select P.course
from degrees D,
    programmes P
where D.code = P.degree
    and D.type = 'PG'
group by P.course,
    D.type
having count(*) = 1;