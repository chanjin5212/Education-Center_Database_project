--교육생별로 입력한 방문/택배여부 조회          
create or replace view vwDelivery
as
select  
s.stuseq as 교육생번호,
d.delivery as 수령방법
from tblSignUp s
    inner join tblDelivery d
        on s.seq = d.suseq
            order by d.delivery asc;
            
            
select * from vwDelivery;

--교육생이 개설과목번호, 수강정보번호, 방문/택배여부 입력
create or replace procedure procDelivery (
    psuseq in tblDelivery.suseq%type,
    pdelivery in tblDelivery.delivery%type,
    preceipt in tblDelivery.receipt%type

)
is

begin
    insert into tblDelivery (seq, suseq, delivery, receipt) 
    values (seq_Delivery.nextVal, psuseq, pdelivery, preceipt);
    dbms_output.put_line('수강정보번호: '||psuseq||' '||'방문/택배입력: '||pdelivery||' '||'수령여부: '||preceipt);
    dbms_output.put_line('입력에 성공하였습니다.');
    commit;

exception
    when OTHERS then
    dbms_output.put_line('입력에 실패하였습니다.');
    rollback;

end procDelivery;


--교재 수령방법 입력 실행
begin
    procDelivery(241, '방문', 'n');
end;



--관리자 교재수령여부(y, n) 등록
create or replace procedure procDeliveryUpdate (
    psuseq in tblDelivery.suseq%type,
    preceipt in tblDelivery.receipt%type
)
is
begin

   update tbldelivery
   set receipt = preceipt
   where  suseq  = psuseq;
     
   
    dbms_output.put_line('수강정보번호: '||psuseq||'수령여부: '||preceipt );
    dbms_output.put_line('업데이트를 성공하였습니다.');

exception
    when OTHERS then
    dbms_output.put_line('업데이트를 실패하였습니다.');

end procDeliveryUpdate;

--교재 수령여부 등록 실행
begin
   procDeliveryUpdate(241,'y');
end;
