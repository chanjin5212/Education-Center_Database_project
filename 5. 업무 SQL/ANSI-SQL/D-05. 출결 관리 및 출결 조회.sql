-- 출결 조회
-- 과목 목록 출력
select 
    os.seq as "과목번호", 
    c.coursename as "과정명", 
    oc.startdate as "과정 시작일", 
    oc.enddate as "과정 종료일", 
    r.classroomname as "강의실명", 
    s.subjectname as "과목명", 
    os.startdate as "과목 시작일", 
    os.enddate as "과목 종료일", 
    b.booktitle as "교재명"
from tblteacher t
    inner join tblopenedsubject os on t.seq = os.tseq
    inner join tblsubjectcourse sc on os.scseq = sc.seq
    inner join tblopenedcourse oc on os.ocseq = oc.seq
    inner join tblcourse c on sc.cseq = c.seq
    inner join tblsubject s on sc.sseq = s.seq
    inner join tblclassroom r on r.seq = oc.rseq
    inner join tblBookSubject bs on bs.osseq = os.seq
    inner join tblbook b on b.seq = bs.bseq
where t.seq = '로그인한 교사 번호'
    order by os.seq;

-- 선택한 과목의 공휴일, 주말 제외한 날짜
create or replace view vwStartEndDate
as
select
    b.a
from(
select
    ((select startdate from tblopenedsubject where seq = '선택한 과목 번호') + level - 1) as a,
    to_char((select startdate from tblopenedsubject where seq = '선택한 과목 번호') + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblopenedsubject where seq = '선택한 과목 번호') - (
    select
    startdate
    from tblopenedsubject where seq = '선택한 과목 번호'
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a;


-- 선택한 과목의 출결상태
select 
    a.name "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name, su.seq from tblopenedsubject os
    inner join tblsignup su on os.ocseq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
    where os.seq = '1') a
    cross join vwStartEndDate vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq order by vd.a; 



-- 년도
select 
    a.name "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name, su.seq from tblopenedsubject os
    inner join tblsignup su on os.ocseq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
    where os.seq = '1') a
    cross join vwStartEndDate vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq 
where to_char(vd.a, 'yyyy') like '2021' order by vd.a;

-- 월별
select 
    a.name "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.seq as sseq ,st.name, su.seq from tblopenedsubject os
    inner join tblsignup su on os.ocseq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
where os.seq = '1') a
    cross join vwStartEndDate vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq 
where to_char(vd.a, 'yyyy-mm') like '2021-10' order by vd.a;
                        

-- 일별
select 
    a.name "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name, su.seq from tblopenedsubject os
    inner join tblsignup su on os.ocseq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
where os.seq = '선택한 과목 번호') a
    cross join vwStartEndDate vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq 
where to_char(vd.a, 'yyyy-mm-dd') like '선택한 년월일' order by vd.a;















