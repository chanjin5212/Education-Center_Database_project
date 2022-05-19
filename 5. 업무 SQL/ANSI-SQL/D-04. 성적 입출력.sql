-- 성적 입출력
-- 성적이 등록된 학생의 카운트
create or replace view vwscoretest
as
select t.osseq, count(*) as cnt from tblScore s inner join tbltest t on s.tseq = t.seq group by t.osseq order by t.osseq;

-- 중도탈락을 하지 않은 학생*2 카운트 (필기,시험 2개라서)
create or replace view vwsignup
as
select ocseq, count(*)*2 as cnt from tblSignUp where dropoutdate is null group by ocseq order by ocseq;



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
    b.booktitle as "교재명", 
    sco.attrate as "출결 배점", 
    sco.wtestrate as "필기 배점", 
    sco.ptestrate as "실기 배점",
nvl(case
    when test.cnt >= signup.cnt then '등록'
end, '미등록') as "성적등록여부" -- 성적이 등록된 학생과 중도탈락을 하지 않은 학생*2 카운트가 같으면 성적이 등록된것이기에 '등록' 아니면 '미등록'
from tblteacher t
    inner join tblopenedsubject os on t.seq = os.tseq
    inner join tblsubjectcourse sc on os.scseq = sc.seq
    inner join tblopenedcourse oc on os.ocseq = oc.seq
    inner join tblcourse c on sc.cseq = c.seq
    inner join tblsubject s on sc.sseq = s.seq
    inner join tblclassroom r on r.seq = oc.rseq
    inner join tblBookSubject bs on bs.osseq = os.seq
    inner join tblbook b on b.seq = bs.bseq
    left join tblScoring sco on sco.osseq = os.seq
    left join vwscoretest test on test.osseq = os.seq
    left join vwsignup signup on signup.ocseq = oc.seq
where t.seq = '로그인한 교사 번호'
    order by os.seq;

-- 출결 점수 (과목마다 100점) - (지각, 조퇴, 외출) 1점
create or replace view vwScoreAttendence
as
select at.suseq, os.seq as osseq, count(*) as cnt from tblOpenedSubject os
    inner join tblSignUp su on os.ocseq = su.ocseq
    inner join tblAttendence at on at.suseq = su.seq 
where os.startdate <= at.attdate and at.attdate <= os.enddate and at.state in ('지각', '조퇴', '외출') 
    group by at.suseq, os.seq order by at.suseq;
  
  
                
-- 과목마다 출결 점수
create or replace view vwSubjectAdScore
as
select su.seq as suseq, os.seq as osseq, nvl(100 - vsa.cnt, 100) as "출결점수" from tblSignUp su
    inner join tblopenedcourse oc on su.ocseq = oc.seq
    inner join tblOpenedSubject os on os.ocseq = oc.seq
    left join vwScoreAttendence vsa on vsa.suseq = su.seq and vsa.osseq = os.seq order by su.seq, os.seq;


-- 필기, 실기 점수
create or replace view vwScoreTestType
as
select score.suseq, test.osseq as osseq,
sum(case
    when test.testtype = '필기' then score.score
end) as "필기점수",
sum(case
    when test.testtype = '실기' then score.score
end) as "실기점수"
from tblscore score
    inner join tbltest test on test.seq = score.tseq 
        group by test.osseq, score.suseq 
            order by score.suseq;


-- 특정 과목 선택 시 교육생 정보 출력
select 
s.seq as "교육생 번호", 
s.name as "이름", 
s.jumin as "주민번호 뒷자리", 
s.tel as "전화번호",
nvl(case
    when su.completiondate is not null then to_char(su.completiondate, 'yyyy-mm-dd')
    when su.dropoutdate is not null then to_char(su.dropoutdate, 'yyyy-mm-dd')
end, '진행중') as "수료여부",
(vsas."출결점수" * sco.attrate) as "출결점수",
(vst."필기점수" * sco.ptestrate) as "필기점수",
(vst."실기점수" * sco.wtestrate) as "실기점수"
from tblOpenedSubject os
    inner join tblopenedcourse oc on os.ocseq = oc.seq
    inner join tblSignUp su on su.ocseq = oc.seq
    inner join tblStudent s on su.stuseq = s.seq
    left join vwSubjectAdScore vsas on vsas.suseq = su.seq and vsas.osseq = os.seq
    left join tblScoring sco on sco.osseq = os.seq
    left join vwScoreTestType vst on vst.suseq = su.seq and vst.osseq = os.seq
where os.seq = '선택한 과목 번호';

-- 교육생의 시험정보 입력
insert into tblScore(seq, tseq, suseq, score) values (seq_score.nextVal, (select seq from tblTest where osseq = '선택한 과목 번호' and testtype = '필기 or 실기'), '선택한 학생 번호', '점수');

set serveroutput on;


--create or replace procedure procSubjectTeacher(
--    pseq tblteacher.seq%type
--)
--is
--
--    cursor vcursor
--    is
--    select 
--    os.seq as "과목번호", 
--    c.coursename as "과정명", 
--    oc.startdate as "과정 시작일", 
--    oc.enddate as "과정 종료일", 
--    r.classroomname as "강의실명", 
--    s.subjectname as "과목명", 
--    os.startdate as "과목 시작일", 
--    os.enddate as "과목 종료일", 
--    b.booktitle as "교재명", 
--    sco.attrate as "출결 배점", 
--    sco.wtestrate as "필기 배점", 
--    sco.ptestrate as "실기 배점",
--nvl(case
--    when test.cnt >= signup.cnt then '등록'
--end, '미등록') as "성적등록여부" -- 성적이 등록된 학생과 중도탈락을 하지 않은 학생*2 카운트가 같으면 성적이 등록된것이기에 '등록' 아니면 '미등록'
--from tblteacher t
--    inner join tblopenedsubject os on t.seq = os.tseq
--    inner join tblsubjectcourse sc on os.scseq = sc.seq
--    inner join tblopenedcourse oc on os.ocseq = oc.seq
--    inner join tblcourse c on sc.cseq = c.seq
--    inner join tblsubject s on sc.sseq = s.seq
--    inner join tblclassroom r on r.seq = oc.rseq
--    inner join tblBookSubject bs on bs.osseq = os.seq
--    inner join tblbook b on b.seq = bs.bseq
--    left join tblScoring sco on sco.osseq = os.seq
--    left join vwscoretest test on test.osseq = os.seq
--    left join vwsignup signup on signup.ocseq = oc.seq
--where t.seq = 1
--    order by os.seq;
--    
--    posseq tblopenedsubject.seq%type;
--    pccoursename tblcourse.coursename%type;
--    pocstartdate tblopenedcourse.startdate%type;
--    pocenddate tblopenedcourse.enddate%type;
--    prclassroomname tblclassroom.classroomname%type;
--    pssubjectname tblsubject.subjectname%type;
--    posstartdate tblopenedsubject.startdate%type;
--    posenddate tblopenedsubject.enddate%type;
--    pbbooktitle tblbook.booktitle%type;
--    pscoattrate tblscoring.attrate%type;
--    pscowtestrate tblscoring.wtestrate%type;
--    pscoptestrate tblscoring.ptestrate%type;
--    pscore varchar2(30);
--    
--begin
--    open vcursor;
--        dbms_output.put_line('============================================================');
--        dbms_output.put_line('과목번호                  과정명                                            과정 시작일      과정 종료일      강의실명        과목명     과목 시작일       과목 종료일     교재명     출결배점       필기 배점        실기 배점       성적등록여부');
--        loop
--            fetch vcursor into posseq, pccoursename, pocstartdate, pocenddate, prclassroomname, pssubjectname, posstartdate, posenddate, pbbooktitle, 
--            pscoattrate, pscowtestrate, pscoptestrate, pscore;
--            exit when vcursor%notfound;
--            
--            dbms_output.put_line(posseq ||'     '|| pccoursename || '       ' || pocstartdate || '      ' || pocenddate || '        ' || prclassroomname ||
--             '      ' || pssubjectname || '     ' || posstartdate || '      ' || posenddate || '        ' || pbbooktitle || '       ' || pscoattrate || '       ' || pscowtestrate
--              || '      ' || pscoptestrate || '     ' || pscore);
--        end loop;
--    close vcursor;
--exception
--    when others then
--        dbms_output.put_line('잘못 입력하셨습니다.');
--        dbms_output.put_line('=============================================================');
--end procSubjectTeacher;
--
--begin
--    procSubjectTeacher(2);
--end;







