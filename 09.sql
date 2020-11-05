select E.student,
    E.date
from exams E,
    (
        select E.student,
            max(E.date) latest_exam
        from exams E
        group by E.student
    ) as maxE
where E.student = maxE.student
    and E.date = maxE.latest_exam
group by E.student,
    E.date,
    maxE.latest_exam
having count(*) > 1;