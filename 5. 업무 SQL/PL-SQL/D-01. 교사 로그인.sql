
-- 1. 교사 로그인
-- procTeacherLogin('로그인할 교사 이름', 로그인할 교사 주민등록번호 뒷자리);


-- procedure 생성

create or replace procedure procTeacherLogin(
    pname varchar2,
    pjumin varchar2
)
is
    vname tblTeacher.name%type;
    vseq tblTeacher.seq%type;
begin
    select name, seq into vname, vseq from tblTeacher where name = pname and jumin = pjumin;
    dbms_output.put_line(vname || '(교사번호 ' || vseq || ') 님, 환영합니다.');
    dbms_output.put_line('로그인에 성공했습니다.');

exception
    when others then
        dbms_output.put_line('입력한 이름: ' || pname || ', 입력한 주민등록번호: ' || pjumin);
        dbms_output.put_line('로그인에 실패했습니다.');
end;




-- procedure 실행
select * from tblTeacher;

begin
    procTeacherLogin('한광훈', 1534921);
end;
