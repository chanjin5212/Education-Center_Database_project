-- 관리자_시험 관리 및 성적 조회.sql

/*
        개설 과정 선택 시 개설 과목 정보 출력
        개설 과목별로 성적 등록 여부, 시험 문제 파일 등록 여부
        
        성적 정보 출력 (개설 과목별,  교육생 개인별)

        개설 과목별: 개설과정명, 개설과정 기간, 강의실명, 개설과목명, 교사명, 교재명, 수강중인 모든 교육생들의 성적 정보(교육생 이름, 주민번호 뒷자리, 출결, 필기, 실기)
        
        교육생 개인별: 교육생 이름, 주민번호 뒷자리, 개설과정명, 개설과정기간, 강의실명, 해당 교육생이 수강한 모든 개설과목에 대한 성적정보(개설과목명, 개설과목기간, 교사명, 필기, 실기)

*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.개설 과정 선택 시 개설 과목 정보 출력
--개설 과목별로 성적 등록 여부, 시험 문제 파일 등록 여부


create or replace view vwinfoSubjectTest
as
select distinct   
    a.seq as "과정번호",
    e.courseName as "과정명", 
    d.subjectName as "과목명",  
    a.startdate as "과정 시작일",
    a.enddate as "과정 종료일", 
    (case when f.question is not null then 'Y' else 'N' end) as "시험문제등록여부" , 
    (case when g.score is not null then 'Y' else 'N' end) as "성적등록여부" 
from  tblOpenedCourse a
    inner join tblOpenedSubject b on b.ocseq = a.seq
    inner join tblSubjectCourse c on  b.scseq  = c.seq
    inner join tblSubject d on c.sseq = d.seq
    inner join tblCourse e on e.seq = c.cseq
    inner join tblTest f on f.osseq = b.seq
    full outer join tblscore g on g.tseq = f.seq
order by a.seq;

--view 실행
select * from vwinfoSubjectTest where  과정번호 = 1;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2. 개설 과목별: 개설과정명, 개설과정 기간, 강의실명, 개설과목명, 교사명, 교재명, 수강중인 모든 교육생들의 성적 정보(교육생 이름, 주민번호 뒷자리, 필기, 실기)


create or replace view vwinfoCourseSubjectScore
as
select distinct   
    e.courseName as "과정명", 
    b.seq as "과목 번호",
    d.subjectName as "과목명", 
    a.startdate as "과정 시작일", 
    a.enddate as "과정 종료일" , 
    z.classroomname as "강의실명" ,
    x.seq as "교육생 번호",
    x.name as "교육생 이름" ,  
    x.jumin as "주민번호 뒷자리" , 
    f.testtype as"유형" , 
    g.score as "성적",
    출결점수
from  tblOpenedCourse a
    inner join tblOpenedSubject b on b.ocseq = a.seq
    inner join tblSubjectCourse c on  b.scseq  = c.seq
    inner join tblSubject d on c.sseq = d.seq
    inner join tblCourse e on e.seq = c.cseq
    inner join tblTest f on f.osseq = b.seq
    inner join tblClassroom z on z.seq = a.rseq
    inner join tblSignUp y  on a.seq =  y.ocseq
    inner join tblStudent x on  y.stuseq = x.seq
    inner join tblscore g on g.suseq = y.seq and  g.tseq  = f.seq
    full outer join vwSubjectAdScore q on q.suseq = y.seq and q.osseq =  b.seq
order by  b.seq asc, x.seq asc, f.testtype desc;
    
--view 실행

select "과정명", "과목명","과정 시작일", "과정 종료일", "강의실명", "교육생 이름", "주민번호 뒷자리", "유형" , "성적" ,출결점수 from vwinfoCourseSubjectScore where "과목 번호" = '개설 과목seq';

--select "과정명", "과목명","과정 시작일", "과정 종료일", "강의실명", "교육생 이름", "주민번호 뒷자리", "유형" , "성적", 출결점수 from vwinfoCourseSubjectScore where "과목 번호" = '1';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. 교육생 개인별: 교육생 이름, 주민번호 뒷자리, 개설과정명, 개설과정기간, 강의실명, 해당 교육생이 수강한 모든 개설과목에 대한 성적정보(개설과목명, 개설과목기간, 교사명, 필기, 실기)

create or replace view vwinfoStudentSubjectCourseTest
as
select distinct   
    e.courseName as "과정명", 
    d.subjectName as "과목명",  
    a.startdate as "과정 시작일", 
    a.enddate as "과정 종료일" , 
    z.classroomname as "강의실명" , 
    x.seq as "교육생 번호",
    x.name as "교육생 이름" ,  
    x.jumin as "주민번호 뒷자리" , 
    f.testtype as"유형" , 
    g.score as "성적", 
    출결점수
from  tblOpenedCourse a
    inner join tblOpenedSubject b on b.ocseq = a.seq
    inner join tblSubjectCourse c on  b.scseq  = c.seq
    inner join tblSubject d on c.sseq = d.seq
    inner join tblCourse e on e.seq = c.cseq
    inner join tblTest f on f.osseq = b.seq
    inner join tblClassroom z on z.seq = a.rseq
    inner join tblSignUp y  on a.seq =  y.ocseq
    inner join tblStudent x on  y.stuseq = x.seq
    full outer join vwSubjectAdScore q on q.suseq = y.seq and q.osseq =  b.seq
    full outer join tblscore g on g.suseq = y.seq and  g.tseq  = f.seq
order by x.seq ,d.subjectName, f.testtype desc;

-- view 실행
select "과정명","과목명","과정 시작일", "과정 종료일", "강의실명", "교육생 이름", "주민번호 뒷자리", "유형", "성적" ,출결점수 from vwinfoStudentSubjectCourseTest where "교육생 번호" = '교육생seq';

select "과정명","과목명","과정 시작일", "과정 종료일", "강의실명", "교육생 이름", "주민번호 뒷자리", "유형", "성적", 출결점수 from vwinfoStudentSubjectCourseTest where "교육생 번호" = '1';



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--view
-- 출결 점수 (과목마다 100점) - (지각, 조퇴, 외출) 1점
create or replace view vwScoreAttendence
as
select at.suseq, os.seq as osseq, count(*) as cnt from tblOpenedSubject os
    inner join tblSignUp su on os.ocseq = su.ocseq
    inner join tblAttendence at on at.suseq = su.seq 
where os.startdate <= at.attdate and at.attdate <= os.enddate and at.state in ('지각', '조퇴', '외출') 
    group by at.suseq, os.seq order by at.suseq;
  
  
 select * from  vwScoreAttendence;
                
-- 과목마다 출결 점수
create or replace view vwSubjectAdScore
as
select su.seq as suseq, os.seq as osseq, nvl(100 - vsa.cnt, 100) as "출결점수" from tblSignUp su
    inner join tblopenedcourse oc on su.ocseq = oc.seq
    inner join tblOpenedSubject os on os.ocseq = oc.seq
    left join vwScoreAttendence vsa on vsa.suseq = su.seq and vsa.osseq = os.seq order by su.seq, os.seq;

select * from  vwSubjectAdScore;






