--관리자_교육생관리.sql

/*
        6) 교육생 관리
        
        교육생 정보 입력 (이름, 주민번호 뒷자리, 전화번호, 등록일(자동입력))
        교육생 정보 출력 
        전체출력(이름, 주민번호 뒷자리, 전화번호, 등록일, 수강(신청) 횟수)
        특정교육생 출력( [수강신청 or 수강중 or 수강했던] 개설과정 정보 > 과정명, 과정기간(시작 년월일, 끝 년월일), 강의실, 수료 및 중도탈락 여부, 수료 및 중도탈락 날짜)
        교육생 정보를 쉽게 확인 하기 위한 검색 기능 사용 (함수, 프로시저 생성)
        교육생 수료 및 중도탈락 처리 (날짜 입력)

*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1. 교육생 번호 출력시 교육생 이름, 주민번호 뒷자리 , 전화번호, 등록일, 수강(신청) 횟수를 출력한다.                                                                                           
select 
    name as "교육생 이름", 
    jumin as "주민번호 뒷자리",
    tel as "전화번호",
    regdate as "등록일",
    (select count(*) from tblsignUp where stuseq = a.seq) as "수강(신청) 횟수"
from tblStudent a
where a.seq = '교육생seq';

select 
    name as "교육생 이름", 
    jumin as "주민번호 뒷자리",
    tel as "전화번호",
    regdate as "등록일",
    (select count(*) from tblsignUp where stuseq = a.seq) as "수강(신청) 횟수"
from tblStudent a
where a.seq = 1;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2. 

--2-1 교육생 정보 등록 
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '이름', '주민번호뒷자리', '전화번호',default);   

--2-2 교육생 정보 삭제
delete from tblStudent where seq = 교육생seq;

--2-3 교육생 수료 
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_graduate.nextVal,직무번호, 수강정보번호, '희망근무지', '희망연봉', '학력', '취업여부 취업시 y 아닐시 n');

--2-4 교육생 중도탈락시 업데이트
update tblSignUp
Set dropoutdate = to_date('2022-05-17' ,'yyyy-mm-dd')
where stuseq = 21 ;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3. 특정교육생 출력( [수강신청 or 수강중 or 수강했던] 개설과정 정보 > 과정명, 과정기간(시작 년월일, 끝 년월일), 강의실, 수료 및 중도탈락 여부, 수료 및 중도탈락 날짜)

select
     a.name as "교육생 이름",
     e.coursename as "과정명",
     c.startdate as "과정시작 날짜",
     c.enddate as "과정종료 날짜",
     d.classroomname as "강의실",
     (case when b.dropoutdate is not null then 'Y' else 'N' end) as "중도탈락여부",
     b.dropoutdate as "중도탈락날짜"
from  tblStudent a 
    inner join tblSignUp b on  a.seq = b.stuseq
    inner join tblOpenedCourse c on b.ocseq = c.seq
    inner join tblClassroom d on d.seq = c.rseq
    inner join tblCourse e on  c.cseq = e.seq
where a.seq = 교육생seq;


--select
--     a.name as "교육생 이름",
--     e.coursename as "과정명",
--     c.startdate as "과정시작 날짜",
--     c.enddate as "과정종료 날짜",
--     d.classroomname as "강의실",
--     (case when b.dropoutdate is not null then 'Y' else 'N' end) as "중도탈락여부",
--     b.dropoutdate as "중도탈락날짜"
--from  tblStudent a 
--    inner join tblSignUp b on  a.seq = b.stuseq
--    inner join tblOpenedCourse c on b.ocseq = c.seq
--    inner join tblClassroom d on d.seq = c.rseq
--    inner join tblCourse e on  c.cseq = e.seq
--where a.seq = 1;




--교육생 정보를 쉽게 확인 하기 위한 검색 기능 사용 (함수, 프로시저 생성)
























