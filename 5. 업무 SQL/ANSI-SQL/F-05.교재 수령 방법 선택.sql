--교육생이 개설과목번호, 수강정보번호, 방문/택배여부 입력
insert into tblDelivery (seq, suseq, delivery, receipt) values (seq_Delivery_next.Val, 수강정보번호, '방문'or'택배', '수령여부');

--관리자는 교육생별로 입력한 방문/택배여부 조회
select  
s.stuseq as 교육생번호,
d.delivery as 수령방법
from tblSignUp s
    inner join tblDelivery d
        on s.seq = d.suseq
            order by d.delivery asc;

--수령여부(y, n) 등록
update tblDelivery set seq = 1, receipt = 'y';
