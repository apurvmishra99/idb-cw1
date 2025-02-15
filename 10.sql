select S.uun,
    S.name
from students S
where (
        select count (distinct P.course)
        from programmes P
        where P.degree = S.degree
            and P.course in (
                select distinct E.course
                from exams E
                where E.student = S.uun
            )
    ) =(
        select count (distinct P.course)
        from programmes P
        where P.degree = S.degree
    );