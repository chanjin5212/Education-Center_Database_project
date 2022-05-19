-- 출결 기록 (지각, 조퇴, 병가, 외출, 기타)
insert into tblAttendence values(SEQ_ATTENDENCE.nextval, (select su.seq 
                                                            from tblSignUp su
                                                                inner join tblStudent s
                                                                    on su.stuseq = s.seq
                                                                        where s.seq = 학생번호), sysdate, '출결');
                                                                        
-- 출결 현황 기간별 조회(전체, 월, 일)
-- 과정 시작일 ~ 종료일 뷰
create or replace view vwDate
as
select
    startdate + (level - 1) as regdate
from
(select
   enddate, startdate
from tblStudent s  
    inner join tblSignUp su 
        on s.seq = su.stuseq 
            inner join tblOpenedCourse oc 
                 on su.ocseq = oc.seq 
                    where s.seq = 1)
connect by level <= enddate - startdate + 1;



-- 출결 날짜 + 출결 상태
create or replace view vwAttendenceStatus
as
select 
    d.regdate as regdate,
    state
from vwDate d
    left outer join tblAttendence a
        on d.regdate = a.attdate
            where a.suseq = (select seq from tblSignUp where stuseq = 1);
                        

-- 과정 시작 ~ 끝 출결 전체
create or replace view vwAttendence
as
select
    d.regdate as "날짜",
    case
        when to_char(d.regdate,'d') in (1,7) then '주말'
        when a.state is null and h.name is not null then '공휴일' 
        when a.state is null and h.name is null then '정상'
        when a.state is not null then a.state
    end as "출결"
from vwDate d
    left outer join vwAttendenceStatus a
        on d.regdate = a.regdate
            left outer join tblHoliday h
                on d.regdate = h.holiday
                    order by d.regdate;
     
-- 전체 출결 조회
select
    *
from vwAttendence;
                        

-- 월별 출결 조회            
select
    *
from vwAttendence where to_char("날짜", 'mm') = '11';


-- 일별 출결 조회
select
    *
from vwAttendence where to_char("날짜", 'mm-dd') = '11-18';
    