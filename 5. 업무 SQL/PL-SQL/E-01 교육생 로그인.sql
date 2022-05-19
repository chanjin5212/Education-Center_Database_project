set serverout on;

-- E-01. 교육생 로그인
create or replace procedure procStudentLogin(
    pid tblstudent.tel%type,
    ppw tblstudent.jumin%type
)
is
    vname tblStudent.name%type;
    vcheck number;
begin
  select 1, name into vcheck, vname from tblStudent where tel = pid and jumin = ppw;
  dbms_output.put_line(vname || '님 로그인 성공');
exception when others then
    dbms_output.put_line('로그인 실패');
end;


begin
    procStudentLogin('010-7931-1658','2709960');
end;
