select F.student
from (
        select E.student,
            count(E.course) as Failed
        from exams E
        where E.grade < 40
        group by E.student
    ) as F
    join (
        select E.student,
            count(E.course) as Total
        from exams E
        group by E.student
    ) as T on F.student = T.student
where 100.0 * F.Failed / T.Total > 30;