--2. 강의 스케줄 조회

-- 2-1. 교사 본인의 강의 스케줄 확인(강의예정/강의중/강의종료 구분): 개설과목번호, 과정명, 과정기간(시작, 끝), 강의실, 과목명, 과목기간(시작, 끝), 교재명, 교육생 등록 인원
-- vwTeacherSchedule
-- vwGetTseq

-- 2-2. 과목번호로 특정 과목 선택 > 해당 과정에 등록된 교육생 정보 확인: 이름, 전화번호, 등록일, 수료or중도탈락
-- vwTeacherStudentInfo



-- view 생성
create or replace view vwTeacherSchedule
as
select
    os.tseq as "교사번호",
    os.seq as "개설과목번호",
    c.courseName as "과정명",
    oc.startdate as "과정시작일",
    oc.enddate as "과정종료일",
    cr.classroomname as "강의실명",
    s.subjectname as "과목명",
    os.startdate as "과목시작일",
    os.enddate as "과목종료일",
    os.isprogress as "강의진행여부",
    b.booktitle as "교재명",
    (select count(*) from tblSignUp where ocseq = oc.seq and (dropoutdate is null or dropoutdate > os.enddate)) || '명' as "교육생 등록 인원"
    
from tblOpenedSubject os
    inner join tblSubjectCourse sc on os.scseq = sc.seq
    inner join tblCourse c on sc.cseq = c.seq
    inner join tblOpenedCourse oc on os.ocseq = oc.seq
    inner join tblClassroom cr on oc.rseq = cr.seq
    inner join tblSubject s on sc.sseq = s.seq
    inner join tblBookSubject bs on os.seq = bs.osseq
    inner join tblBook b on bs.bseq = b.seq
                order by oc.startdate, os.startdate asc;
                
                
create or replace view vwGetTseq
as
select seq as "교사번호", jumin as "주민등록번호" from tblTeacher;


-- view 실행
select
    "개설과목번호",
    "과정명",
    "과정시작일",
    "과정종료일",
    "강의실명",
    "과목명",
    "과목시작일",
    "과목종료일",
    "강의진행여부",
    "교재명",
    "교육생 등록 인원"
from vwTeacherSchedule
    where "교사번호" = (select "교사번호" from vwGetTseq where "주민등록번호" = '1534921');





-- 2-2. 과목번호로 특정 과목 선택 > 해당 과정에 등록된 교육생 정보 확인: 이름, 전화번호, 등록일, 수료or중도탈락
-- vwTeacherStudentInfo


-- view 생성
create or replace view vwTeacherStudentInfo
as
select
    os.seq as "개설과목번호",
    stu.name as "이름",
    stu.tel as "전화번호",
    stu.regdate as "등록일",
    case
        when su.completiondate is not null then '수료'
        when su.dropoutdate is not null then '중도탈락'
        else '수강중'
    end as "현재 상태"
    
from tblOpenedSubject os inner join tblOpenedCourse oc on os.ocseq = oc.seq
                  inner join tblSignUp su on oc.seq = su.ocseq
                  inner join tblStudent stu on su.stuseq = stu.seq;


-- view 실행
select
    "이름",
    "전화번호",
    "등록일",
    "현재 상태"
from vwTeacherStudentInfo
    where "개설과목번호" = 1;   


