select distinct C.code
from courses C
where C.code in (
        select P.course
        from degrees D,
            programmes P
        where D.code = P.degree
            and D.type = 'UG'
    )
    and c.code in (
        select P.course
        from degrees D,
            programmes P
        where D.code = P.degree
            and D.type = 'PG'
    );