--3. 배점 입출력
-- 3-1. 강의를 마친 과목에 한해 특정 과목 선택, 배점 정보를 출결, 필기, 실기로 구분해 등록
-- procTeacherScoringAdd
-- procTeacherScoringEdit
-- procTeacherScoringDel

-- 3-2. 시험 날짜와 시험 문제 추가
-- procTeacherTestAdd
-- procTeacherTestEdit
-- procTeacherTestDel
-- procTeacherQuestionDel

-- 3-3. 과목 목록 전체 출력: (해당 교사가 맡은) 과목번호, 과정명, 과정기간(시작,끝), 강의실, 과목명, 과목기간(시작,끝), 교재명, 출결배점, 필기배점, 실기배점
-- vwTeacherOSList

-- 3-4. 특정 과목 선택해 배점 출력(개설과목번호로): 출결배점, 필기배점, 실기배점, 시험날짜, 시험문제
-- vwTeacherScoring




--3.1 강의를 마친 과목에 한해 특정 과목 선택, 배점 정보를 출결, 필기, 실기로 구분해 등록
-- 프로시저: 입력, 수정, 삭제 -> 출결+필기+실기배점 = 1이 아니면 에러 나도록


--배점 정보 등록
insert into tblscoring(seq, osseq, attrate, wtestrate, ptestrate)
    values(seq_Scoring.nextVal, (select seq from tblOpenedSubject where isprogress = '강의종료' and seq = 개설과목번호), 출결배점, 필기배점, 실기배점);

create or replace procedure procTeacherScoringAdd (
    posseq number,
    pattrate number,
    pwtestrate number,
    pptestrate number
)
is
    vflag number;
    visprogress tblOpenedSubject.isprogress%type;
    vresult number;
    vsum number;
    vseq number;
    
    cursor vcursor
    is
    select * from tblScoring;
    
    vrow tblScoring%rowtype;

begin
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        
        if vrow.osseq = posseq then
            vflag := 1;
        end if;
    end loop;
    close vcursor;
    
    if vflag = 1 then
        dbms_output.put_line('이미 배점이 등록된 개설과목입니다.');
    else
        vsum := pattrate + pwtestrate + pptestrate;
        select isprogress into visprogress from tblOpenedSubject where seq = posseq;
        
        if visprogress <> '강의종료' then
            dbms_output.put_line('강의종료된 개설과목이 아닙니다.');
            
        elsif vsum <> 1 then 
            dbms_output.put_line('배점의 총합이 1이 아닙니다.');
    
        elsif pattrate < 0.2 then
            dbms_output.put_line('출결 점수는 최소 20%(0.2) 이상 반영되어야 합니다.');
        
        elsif vsum = 1 then
            insert into tblScoring values (seq_Scoring.nextVal, posseq, pattrate, pwtestrate, pptestrate);
            vresult := 1;        
        
        end if;
    end if;
    
    if vresult = 1 then
        select seq into vseq from tblScoring where osseq = posseq;
        dbms_output.put_line('배점 정보 등록에 성공했습니다.');
        dbms_output.put_line('[' || vseq || '] 개설과목: ' || posseq || '번, 출결배점: ' || pattrate * 100 || '%, 필기배점: ' || pwtestrate * 100 || '%, 실기배점: ' || pptestrate * 100 || '%');
        commit;
    else
        dbms_output.put_line('배점 정보 등록에 실패했습니다.');
        rollback;
    end if;
exception
    when others then
        dbms_output.put_line('배점 정보 등록에 실패했습니다.');
        rollback;
end;





--배점 정보 수정
update tblScoring set attrate = 수정할 출결배점, wtestrate = 수정할 필기배점, ptestrate = 수정할 실기배점 where osseq = 수정할 개설과목번호;

create or replace procedure procTeacherScoringEdit (
    posseq number,
    pattrate number,
    pwtestrate number,
    pptestrate number
)
is
    vseq number;
    vresult number;
    vsum number;
begin
    
    vsum := pattrate + pwtestrate + pptestrate;
    
    if vsum <> 1 then 
        dbms_output.put_line('배점의 총합이 1이 아닙니다.');
    
    elsif pattrate < 0.2 then
        dbms_output.put_line('출결 점수는 최소 20%(0.2) 이상 반영되어야 합니다.');
    elsif vsum = 1 then
        update tblScoring set attrate = pattrate, wtestrate = pwtestrate, ptestrate = pptestrate where osseq = posseq;
        vresult := 1;        
    end if;
    
    if vresult = 1 then
        select seq into vseq from tblScoring where osseq = posseq;
        dbms_output.put_line('배점 정보 수정에 성공했습니다.');
        dbms_output.put_line('[' || vseq || '] 개설과목: ' || posseq || '번, 출결배점: ' || pattrate * 100 || '%, 필기배점: ' || pwtestrate * 100 || '%, 실기배점: ' || pptestrate * 100 || '%');
        commit;
    else
        dbms_output.put_line('배점 정보 수정에 실패했습니다.');
        rollback;
    end if;

exception
    when others then
        dbms_output.put_line('배점 정보 수정에 실패했습니다.');
        rollback;
end;


-- 프로시저 실행
select * from tblScoring;

-- 배점 등록 (이미 배점 등록이 완료된 경우)
-- > 이미 배점이 등록된 개설과목입니다. 배점 정보 등록에 실패했습니다.
begin
    procTeacherScoringAdd(1, 0.2, 0.33, 0.47);
end;


-- 배점 등록 (강의종료된 개설과목이 아닌 경우)
-- > 강의종료된 개설과목이 아닙니다. 배점 정보 등록에 실패했습니다.
begin
    procTeacherScoringAdd(6, 0.2, 0.4, 0.4);
end;


-- 배점 수정 (출결, 필기, 실기 배점 총합을 1로 입력하지 않은 경우)
-- > 배점의 총합이 1이 아닙니다. 배점 정보 수정에 실패했습니다.
begin
    procTeacherScoringEdit(1, 0.3, 0.4, 0.4);
end;

-- 배점 수정 (출결 배점이 최소 점수(20%)를 넘지 않는 경우
-- > 출결 점수는 최소 20%(0.2) 이상 반영되어야 합니다. 배점 정보 수정에 실패했습니다.
begin
    procTeacherScoringEdit(1, 0.1, 0.45, 0.45);
end;

-- 배점 수정 성공
begin
    procTeacherScoringEdit(14, 0.3, 0.35, 0.35);
end;
select * from tblScoring;






--배점 정보 삭제
delete from tblScoring where osseq = 삭제할 개설과목번호;


create or replace procedure procTeacherScoringDel(
    posseq number
)
is
    vseq number;
begin
    select seq into vseq from tblScoring where osseq = posseq;
    delete from tblScoring where osseq = posseq;
    dbms_output.put_line('[' || vseq || '] 개설과목 ' || posseq || '번 배점 정보 삭제를 성공했습니다.');
    commit;
exception
    when others then
        dbms_output.put_line('배점 정보 삭제를 실패했습니다.');
        rollback;
end;


-- 프로시저 실행
begin
    procTeacherScoringDel(1);    
end;






--3.2 시험 날짜와 시험 문제 추가
-- 프로시저: 입력, 수정, 삭제

-- 시험 추가
insert into tblTest(seq, osseq, testdate, testtype, question)
    values (seq_Test.nextVal, '개설과목번호', '원하는 날짜', '필기/실기 중 하나의 값', '시험문제');


create or replace procedure procTeacherTestAdd (
    posseq number,
    ptestdate date,
    ptesttype varchar2,
    pquestion varchar2 default null
)
is
    vflag number;
    vresult number;
    vseq number;
    cursor vcursor
    is
    select * from tblTest;
    
    vrow tblTest%rowtype;
    vquestion tblTest.question%type;
begin
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        
        if vrow.osseq = posseq and vrow.testtype = ptesttype then
            vflag := 1;
        end if;
    end loop;
    close vcursor;
    
    if vflag = 1 then
        dbms_output.put_line('이미 시험이 등록된 개설과목입니다.');
    
    elsif ptesttype not in ('필기', '실기') then
        dbms_output.put_line('<필기>, <실기> 시험 유형 중 하나를 입력해 주세요.');
    
    else
        insert into tblTest values (seq_Test.nextVal, posseq, ptestdate, ptesttype, pquestion);
        vresult := 1;
    end if;
    
    if pquestion is null then
        vquestion := '미등록';
    else
        vquestion := pquestion;
    end if;
    
    if vresult = 1 then
        select seq into vseq from tblTest where osseq = posseq and testtype = ptesttype;
        dbms_output.put_line('시험 등록에 성공했습니다.');
        dbms_output.put_line('[' || vseq || '] 개설과목번호: ' || posseq || '번, 시험날짜: ' || ptestdate || ', 시험유형: ' || ptesttype || ', 시험문제: ' || vquestion);
        commit;
    else
        dbms_output.put_line('시험 등록에 실패했습니다.');
        rollback;
    end if;
exception
    when others then
        dbms_output.put_line('시험 등록에 실패했습니다.');
        rollback;
end;


-- 프로시저 실행
-- 해당 개설과목 및 날짜에 이미 등록된 시험이 있는 경우
-- > 이미 시험이 등록된 개설과목입니다. 시험 등록에 실패했습니다.
begin
    procTeacherTestAdd(36, '2023-05-03', '실기');
end;

-- 테스트: 72번 시험 delete 후 다시 만들기 > (36, 23/05/03, 실기, null)
delete tblTest where seq = 72;
drop sequence seq_test;
create sequence seq_test start with 72;

-- 시험 유형이 '필기' 혹은 '실기'가 아닌 경우
-- <필기>, <실기> 시험 유형 중 하나를 입력해 주세요. 시험 등록에 실패했습니다.
begin
    procTeacherTestAdd(36, '2023-05-03', '시험');
end;

-- 시험 등록에 성공했습니다. 개설과목번호: 36번, 시험날짜: 23/05/03, 시험유형: 실기, 시험문제: 미등록
begin
    procTeacherTestAdd(36, '2023-05-03', '실기');
end;





-- 시험 수정 및 시험 문제 등록: 개설과목번호는 unique key가 아니므로 시험번호(seq)로 수정
-- procTeacherTestEdit(수정할 시험번호, 수정할 컬럼(1=날짜, 2=시험유형, 3=시험문제), 수정될 값)
update tblTest set testdate = '수정할 날짜' where seq = 수정할 시험 번호;
update tblTest set testtype = '수정할 시험유형' where seq = 수정할 시험 번호;
update tbltest set question = '수정할 시험문제' where seq = 수정할 시험 번호;

create or replace procedure procTeacherTestEdit(
    pseq number,
    ptarget number,
    pedit varchar2
)
is
    vseq number;
    vtestdate tblTest.testdate%type;
    vcolumn varchar2(20);
    vresult number;
begin
    select testdate into vtestdate from tblTest where seq = pseq;
    
    if vtestdate < sysdate then
        dbms_output.put_line('이미 진행된 시험입니다.');
    
    else
        if ptarget = 1 and pedit > sysdate then 
            update tblTest set testdate = pedit where seq = pseq;
            vcolumn := '시험 날짜';
            vresult := 1;
            
        elsif ptarget = 2 and pedit in ('필기', '실기') then 
            update tblTest set testtype = pedit where seq = pseq;    
            vcolumn := '시험 유형';
            vresult := 1;
            
        elsif ptarget = 3 and pedit like '문제%' then
            update tblTest set question = pedit where seq = pseq;
            vcolumn := '시험 문제';
            vresult := 1;
            
        else
            dbms_output.put_line('입력한 값이 올바르지 않습니다.');
        
        end if;
    end if;
        
        if vresult = 1 then
            select seq into vseq from tblScoring where seq = pseq;
            dbms_output.put_line('[' || vseq || '] 시험 수정/시험 문제 등록에 성공했습니다.');
            dbms_output.put_line(vcolumn || ': ' || pedit);
            commit;
        else   
            dbms_output.put_line('시험 수정/시험 문제 등록에 실패했습니다.');
            rollback;
        end if;
        
exception
    when others then
        dbms_output.put_line('시험 수정/시험 문제 등록에 실패했습니다.');
        rollback;
end;


-- 프로시저 실행
-- 시험 날짜 수정
select * from tblTest;

-- 이미 시행된 시험일 경우
-- (1, 1, 21/11/18, 필기, 문제01)
-- 이미 진행된 시험입니다. 시험 수정/시험 문제 등록에 실패했습니다.
begin
    procTeacherTestEdit(1, 1, '2022-05-18'); 
end;

-- 시험 수정/시험 문제 등록에 성공했습니다. 시험 날짜: 2023-06-17
begin
    procTeacherTestEdit(16, 1, '2023-06-17');
end;


-- 시험 유형 수정
-- '필기', '실기' 중 하나의 값이 아닌 경우
-- 입력한 값이 올바르지 않습니다. 시험 수정/시험 문제 등록에 실패했습니다.
begin
    procTeacherTestEdit(16, 2, '시험');
end;

-- 시험 수정/시험 문제 등록에 성공했습니다. 시험 유형: 실기
begin
    procTeacherTestEdit(16, 2, '실기');
end;



-- 시험 문제 수정
-- '문제%' 형식이 아닌 경우
-- 입력한 값이 올바르지 않습니다. 시험 수정/시험 문제 등록에 실패했습니다.
begin
    procTeacherTestEdit(16, 3, '시험16');
end;

-- 시험 수정/시험 문제 등록에 성공했습니다. 시험 문제: 문제16
begin
    procTeacherTestEdit(16, 3, '문제16');
end;




-- 시험 삭제 (시험 자체를 삭제)

delete from tblTest where seq = 삭제할 시험 번호;

create or replace procedure procTeacherTestDel(
    pseq number
)
is 
    vseq number;
begin
    select seq into vseq from tblTest where seq = pseq;
    delete from tblTest where seq = pseq;
    dbms_output.put_line('[' || vseq || '] 시험 정보 삭제를 성공했습니다.');
    commit;
exception
    when others then
        dbms_output.put_line('시험 정보 삭제를 실패했습니다.');
        rollback;
end;


-- 시험문제 삭제(null)
update tblTest set question = null where seq = 문제를 삭제할 시험번호;

create or replace procedure procTeacherQuestionDel(
    pseq number
)
is
    vseq number;
begin
    select seq into vseq from tblTest where seq = pseq;
    update tblTest set question = null where seq = pseq;
    dbms_output.put_line('[' || vseq || '] 시험 문제 삭제를 성공했습니다.');
    commit;
exception
    when others then
        dbms_output.put_line('시험 문제 삭제를 실패했습니다.');
        rollback;
end;


-- 시험 삭제 프로시저 실행
-- 시험 결과(child record)가 있는 경우 
-- 시험 정보 삭제를 실패했습니다.
begin
    procTeacherTestDel(1);
end;



-- 시험 정보 삭제를 성공했습니다.
begin
    procTeacherTestDel(74);
end;



-- 시험문제 삭제 프로시저 실행
-- 시험 문제 삭제를 성공했습니다.
begin
    procTeacherQuestionDel(48);
end;





--3.3 과목 목록 전체 출력: (해당 교사가 맡은) 과목번호, 과정명, 과정기간(시작,끝), 강의실, 과목명, 과목기간(시작,끝), 교재명, 출결배점, 필기배점, 실기배점
--    배점 미등록 시 null로 출력
-- vwTeacherOSList
-- vwGetTseq


-- view 생성
create or replace view vwTeacherOSList
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
    score.attrate as "출결배점",
    score.wtestrate as "필기배점",
    score.ptestrate as "실기배점"
    
from tblOpenedSubject os
    inner join tblSubjectCourse sc on os.scseq = sc.seq
    inner join tblCourse c on sc.cseq = c.seq
    inner join tblOpenedCourse oc on os.ocseq = oc.seq
    inner join tblClassroom cr on oc.rseq = cr.seq
    inner join tblSubject s on sc.sseq = s.seq
    inner join tblBookSubject bs on os.seq = bs.osseq
    inner join tblBook b on bs.bseq = b.seq
    left outer join tblScoring score on os.seq = score.osseq
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
    "출결배점",
    "필기배점",
    "실기배점"
from vwTeacherOSList
    where "교사번호" = (select "교사번호" from vwGetTseq where "주민등록번호" = '1534921');





--3.4 특정 과목 선택해 배점 출력(개설과목번호로): 출결배점, 필기배점, 실기배점, 시험날짜, 시험문제
--    배점, 시험문제 미등록 시 null로 출력
--vwTeacherScoring


-- view 생성
create or replace view vwTeacherScoring
as
select
    os.seq as "개설과목번호",
    score.attrate as "출결배점",
    score.wtestrate as "필기배점",
    score.ptestrate as "실기배점",
    t.testdate as "시험날짜",
    t.testtype as "시험유형",
    t.question as "시험문제"
    
from tblScoring score
    right outer join tblOpenedSubject os on score.osseq = os.seq
    inner join tblTest t on os.seq = t.osseq
            order by t.testdate asc;
        

-- view 실행
select * from vwTeacherScoring where "개설과목번호" = 1;