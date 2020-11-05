select D.code,
    sum(C.credits)
from degrees D,
    programmes P,
    courses C
where D.code = P.degree
    and C.code = P.course
group by D.code
union
select D.code,
    0
from degrees D,
    programmes P
where D.code not in (
        select distinct Pinner.degree
        from programmes Pinner
    );