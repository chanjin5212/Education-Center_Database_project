-- E-02. 교육생 성적 조회

-- E-02-01. 교육생 메인 정보 조회
create or replace view vwStudentTitle
as 
select
    s.seq as "학생번호",
    s.name as "이름", 
    s.jumin as "주민번호 뒷자리",
    s.tel as "전화번호",
    c.courseName as "수강과정",
    oc.startdate as "과정시작일",
    oc.enddate as "과정종료일",
    r.classroomname as "강의실"
from tblStudent s
    inner join tblSignUp su
        on s.seq = su.stuseq
            inner join tblOpenedCourse oc
                on su.ocseq = oc.seq
                    inner join tblClassRoom r
                        on oc.rseq = r.seq
                            inner join tblCourse c
                                on oc.cseq = c.seq;
                                
                                    
select 
    "이름", "주민번호 뒷자리", "전화번호", "수강과정", "과정시작일", "과정종료일", "강의실"
from vwStudentTitle 
where "학생번호" = 1;



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



-- 시험 필기,실기 컬럼 합치기
create or replace view vwSumTest
as
select 
osseq,
LISTAGG(testdate, '/') WITHIN GROUP (ORDER BY testdate) as "필기,실기 시험날짜",
LISTAGG(question, '/') WITHIN GROUP (ORDER BY question) as "필기,실기 시험문제"
from tbltest
    group by osseq;


-- 성적 조회 뷰
create or replace view vwStudentScore
as
select
st.seq as "학생번호",
os.seq as "과목번호",
sub.subjectname as "과목명",
os.startdate as "과목시작일",
os.enddate as "과목종료일",
b.booktitle as "교재명",
tea.name as "교사명",
sco.attrate as "출결배점",
sco.ptestrate as "필기배점",
sco.wtestrate as "실기배점",
vst."필기,실기 시험날짜" as "필기, 실기 시험날짜",
vst."필기,실기 시험문제" as "필기,실기 시험문제",
(vsas."출결점수" * sco.attrate) as "출결점수",
(vstt."필기점수" * sco.ptestrate) as "필기점수",
(vstt."실기점수" * sco.wtestrate) as "실기점수"
from tblSignUp su
    inner join tblStudent st on su.stuseq = st.seq
    left join tblopenedsubject os on su.ocseq = os.ocseq
    left join tblsubjectcourse sc on sc.seq = os.scseq
    left join tblsubject sub on sc.sseq = sub.seq
    left join tblbooksubject bs on bs.osseq = os.seq
    left join tblteacher tea on tea.seq = os.tseq
    left join tblscoring sco on sco.osseq = os.seq
    left join tblbook b on bs.bseq = b.seq
    left join vwSumTest vst on vst.osseq = os.seq
    left join vwScoreTestType vstt on vstt.suseq = su.seq and vstt.osseq = os.seq
    left join vwSubjectAdScore vsas on vsas.suseq = su.seq and vsas.osseq = os.seq;

-- E-02-02. 교육생 성적 정보 조회
select
    "과목번호", "과목명", "과목시작일", "과목종료일", "교재명", "교사명", "출결배점", "필기배점", "실기배점", "필기, 실기 시험날짜", "필기,실기 시험문제"
    , "출결점수", "필기점수", "실기점수"
from vwStudentScore 
where 학생번호 = 50;
