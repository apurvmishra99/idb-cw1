select S.uun
from students S
where S.uun not in (
        select distinct E.student
        from exams E
    );