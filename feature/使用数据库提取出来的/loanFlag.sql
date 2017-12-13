select T_USER.uid,nvl(loanflag8,0) as loanflag8,  nvl(loanflag9,0) as loanflag9,  nvl(loanflag10,0) as loanflag10,  nvl(loanflag11,0) as loanflag11 
from  T_USER left JOIN 
(
select 
        uid,
        case when ( sum(case when loan_time < '2016-09' then loan_amount else 0 end ) )>0 then 1 else 0 end  as loanflag8,
        case when ( sum(case when loan_time < '2016-10' then loan_amount else 0 end ) )>0 then 1 else 0 end  as loanflag9,
        case when ( sum(case when loan_time < '2016-11' then loan_amount else 0 end ) )>0 then 1 else 0 end  as loanflag10,
        case when ( sum(case when loan_time < '2016-12' then loan_amount else 0 end ) )>0 then 1 else 0 end  as loanflag11 
         from T_loan  group by uid
 ) tloan on T_USER.uid=tloan.uid 
