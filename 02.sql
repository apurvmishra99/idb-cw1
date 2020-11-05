select count(S.uun)
from students S
    join degrees D on S.degree = D.code
where D.type = 'PG';