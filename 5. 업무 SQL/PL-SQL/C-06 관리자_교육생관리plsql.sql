--PLSQL관리자_교육생관리.sql

set serverout on;
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
--1. 교육생 번호 입력시 교육생 이름, 주민번호 뒷자리 , 전화번호, 등록일, 수강(신청) 횟수를 출력한다.


create or replace view vwshowstudentinfo
as
select 
    seq as "교육생 번호",
    name as "교육생 이름", 
    jumin as "주민번호 뒷자리",
    tel as "전화번호",
    regdate as "등록일",
    (select count(*) from tblsignUp where stuseq = a.seq) as "수강(신청) 횟수"
from tblStudent a;

-- view 실행

select "교육생 이름","주민번호 뒷자리", "전화번호", "등록일","수강(신청) 횟수"  from vwshowstudentinfo where "교육생 번호" =  교육생seq; 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2. 

--2-1 교육생 정보 등록 
--교육생 등록 교육생 이름, 주민등록번호, 전화번호, 등록일은 자동 등록

create or REPLACE procedure pAddstudent(
    pseq in tblStudent.seq%type,
    pname in tblStudent.name%type,
    pjumin in tblStudent.jumin%type,
    ptel in tblStudent.tel%type
)
is
begin
    insert into tblStudent (seq , name, jumin, tel) 
    values (pseq, pname, pjumin,ptel);
    
    dbms_output.put_line('교육생번호: '||pseq|| ', 교육생 이름: ' ||pname|| ', 주민번호 뒷자리: '||pjumin|| ', 전화번호: ' ||ptel);
    dbms_output.put_line('교육생 정보 등록에 성공하였습니다.');
exception
    when others then         
    dbms_output.put_line('교육생 정보 등록에 실패하였습니다.');
 
end pAddstudent;

-- 교육생 등록 실행
begin
    paddstudent(seq_Student.nextVal,'남랄희','1234567','010-6754-5453');
exception
    when others then         
    dbms_output.put_line('교육생 정보 등록에 실패하였습니다.');
end;


--2-2 교육생 정보 삭제

create or REPLACE procedure  pDeleteStudent (
    pseq in tblstudent.seq%type
)
is
    vname tblstudent.name%type;
begin
    
    select name into vname from tblstudent where seq = pseq;
    delete  from tblStudent where seq = pseq ;
    
    dbms_output.put_Line('교육생번호 '||vname||'님의 정보 삭제에 성공했습니다.');
    
 exception
    when others then  
    
    dbms_output.put_line('교육생 정보 삭제에 실패하였습니다.');
    
end pDeleteStudent;

-- 교육생 정보 삭제 실행
begin
     pDeleteStudent('1');
 exception
    when others then  
    
    dbms_output.put_line('교육생 정보 삭제에 실패하였습니다.');
end;

select * from tblstudent;


--2-3 교육생 수료 

create or REPLACE procedure pAddGraduate(
    pseq in tblGraduate.seq%type,
    pjseq in tblGraduate.jseq%type,
    psuseq in tblGraduate.suseq%type,
    pplace in tblgraduate.place%type,
    psalary in tblgraduate.salary%type,
    peducation in tblgraduate.education%type,
    pemployment in tblGraduate.employment%type
)
is
begin

    insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment)
    values (pseq, pjseq, psuseq, pplace, psalary, peducation , pemployment);
    
    dbms_output.put_line('수료생번호: '||pseq|| ', 직무번호(희망): ' ||pjseq|| ', 수강정보번호: '||psuseq|| ', 희망근무지: ' ||pplace|| ', 희망연봉: ' ||psalary|| ', 학력: ' ||peducation|| ', 취업여부: ' ||pemployment );
    dbms_output.put_line('수료생 정보 등록에 성공하였습니다.');
    
exception
    when others then         
    dbms_output.put_line('수료생 정보 등록에 실패하였습니다.');
 
end pAddGraduate;

-- 수료생 업데이트 실행
begin
    pAddGraduate(seq_graduate.nextVal, '개설과정번호','교육생번호','희망근무지','희망연봉','학력','취업여부 y 또는 n');
exception
    when others then         
    dbms_output.put_line('수료생 정보 등록에 실패하였습니다.');
end;

select * from tblgraduate;


--2-4 교육생 중도탈락시 업데이트

update tblSignUp
Set dropoutdate = to_date('2022-05-17' ,'yyyy-mm-dd')
where stuseq = 21 ;

create or REPLACE procedure pUpdateDropOutDate (
    pseq in tblsignup.seq%type,
    pdropoutdate in tblsignup.dropoutdate%type
)
is
begin
    update tblSignUp set dropoutdate = pdropoutdate where seq = pseq ;
    
    dbms_output.put_Line('수강번호 '||pseq||'님의 중도탈락 날짜 업데이트에 성공했습니다.');
    
exception
    when others then  
    
    dbms_output.put_line('중도탈락 업데이트에 실패하였습니다.');
    
end pUpdateDropOutDate;

-- 중도 탈작자 업데이트 실행
begin
    pUpdateDropOutDate(1,to_date('날짜' ,'yyyy-mm-dd')); 
 exception
    when others then  
    
    dbms_output.put_line('중도탈락 업데이트에 실패하였습니다.');
end;

--2-5) 교육생 정보 수정

create or replace procedure pEditStudent(
    pseq number,
    ptarget number,
    pedit varchar2
)
is
begin
    if ptarget = 1 then
        update tblStudent set name = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '교육생 이름:' || pedit);
        dbms_output.put_line('교육생 이름 수정에 성공하였습니다.');
    elsif ptarget = 2 then
        update tblStudent set jumin = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '강의실명:' || pedit);
        dbms_output.put_line('교육생 주민번호 수정에 성공하였습니다.');
    elsif ptarget = 3 then
        update tblStudent set tel = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '전화번호:' || pedit);
        dbms_output.put_line('교육생 전화번호 수정에 성공하였습니다.');
    else
        dbms_output.put_line('교육생 정보 수정을 실패하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('교육생 정보 수정을 실패하였습니다.');
end;

---교육생 정보 수정 프로시저 실행
begin
    procOpenCourse(1, 2, '1234321'); -- 1번 교육생 이름, 2번 주민번호, 3번 전화번호
exception
    when others then
    dbms_output.put_line('교육생 정보 수정을 실패하였습니다.');
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3. 특정교육생 출력( [수강신청 or 수강중 or 수강했던] 개설과정 정보 > 과정명, 과정기간(시작 년월일, 끝 년월일), 강의실, 수료 및 중도탈락 여부, 수료 및 중도탈락 날짜)


create or replace view vwshowstudentSignUP
as
select
     a.seq as "교육생 번호",
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
    inner join tblCourse e on  c.cseq = e.seq;

-- view 실행
select * from vwshowstudentSignUP where "교육생 번호" =  '교육생seq'; 



