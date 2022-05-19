--대면/비대면(관리자) 교육생이 선택한 대면.비대면 출력
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

                
--대면/비대면(교육생) 다음 주 대면/비대면 입력
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 수강정보번호, '수업일', '대면');