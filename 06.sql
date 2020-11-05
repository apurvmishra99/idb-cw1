select A.student,
    A.A as A,
    B.B as B,
    C.C as C,
    D.D as D
from (
        select E.student,
            count(E.course) as D
        from exams E
        where E.grade < 40
        group by E.student
        union
        select E.student,
            0 as D
        from exams E
        where E.student not in (
                select distinct Einner.student
                from exams Einner
                where Einner.grade < 40
            )
    ) as D
    join (
        select E.student,
            count(E.course) as C
        from exams E
        where E.grade >= 40
            and E.grade < 60
        group by E.student
        union
        select E.student,
            0 as C
        from exams E
        where E.student not in (
                select distinct Einner.student
                from exams Einner
                where Einner.grade >= 40
                    and Einner.grade < 60
            )
    ) as C on D.student = C.student
    join (
        select E.student,
            count(E.course) as B
        from exams E
        where E.grade >= 60
            and E.grade < 80
        group by E.student
        union
        select E.student,
            0 as B
        from exams E
        where E.student not in (
                select distinct Einner.student
                from exams Einner
                where Einner.grade >= 60
                    and Einner.grade < 80
            )
    ) as B on C.student = B.student
    join (
        select E.student,
            count(E.course) as A
        from exams E
        where E.grade >= 80
        group by E.student
        union
        select E.student,
            0 as A
        from exams E
        where E.student not in (
                select distinct Einner.student
                from exams Einner
                where Einner.grade >= 80
            )
    ) as A on B.student = A.student;
