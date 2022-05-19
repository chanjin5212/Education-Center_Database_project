--대면/비대면 여부 조회
create or replace view vwHomeStudent
as
select 
s.name as 이름,
st.classday as 날짜,
st.home as 대면비대면여부
from tblStudent s
    inner join tblSignUp si
        on s.seq = si.stuseq
            inner join tblHomeStudent st
                on si.seq = st.suseq
                    order by st.home asc;
                    
select * from vwHomeStudent
where 대면비대면여부 = '비대면';

--대면/비대면(교육생) 다음 주 대면/비대면 입력

create or replace procedure procHomeStudent(
    psuseq in tblHomeStudent.suseq%type,
    pclassday in tblHomeStudent.classday%type,
    phome in tblHomeStudent.home%type
    
)
is
    
begin

    insert into tblHomeStudent (seq, suseq, classday, home) 
    values (seq_HomeStudent.nextVal, psuseq, pclassday, phome);
    dbms_output.put_line('수강정보번호:' ||psuseq||' '||'수업일:' ||pclassday||' '||'대면/비대면 입력:' ||phome);
    dbms_output.put_line('입력에 성공하였습니다.');
    commit;

exception
    when others then
        dbms_output.put_line('입력에 실패하였습니다.');
    rollback;

end procHomeStudent;

--대면/비대면여부 입력 실행
begin
    procHomeStudent(140, '2022-05-20', '대면');
end;
