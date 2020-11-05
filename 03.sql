select distinct E.student,
    MIN(E.grade),
    MAX(E.grade),
    COUNT(E.course)
from exams E
group by E.student
having count(E.course) > 0
    and avg(E.grade) >= 75;