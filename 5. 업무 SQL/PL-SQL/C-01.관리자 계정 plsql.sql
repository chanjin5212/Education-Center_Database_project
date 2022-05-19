--C-01.관리자 계정 procedure

select * from tblManager;
select count(*) as cnt from tblManager where id = '입력id' and password = '입력password';

---관리자 계정 로그인 프로시저 생성
create or replace procedure procManagerLogin(
    pid varchar2,
    ppw varchar2
)
is
    completelogin number;
begin
    select count(*) into completelogin from tblManager where id = pid and password = ppw;
    
    if completelogin = 1 then 
    dbms_output.put_line('관리자 '|| pid ||'님, 환영합니다.');
    dbms_output.put_line('로그인에 성공했습니다.');
    
    else 
    dbms_output.put_line('로그인에 실패했습니다.');
    end if;
exception 
    when others then
    dbms_output.put_line('로그인에 실패했습니다.');
end procManagerLogin;

--관리자 계정 로그인 프로시저 실행
begin
    procManagerLogin('eSfCEw54', 'jbQKtlKl62');
end;