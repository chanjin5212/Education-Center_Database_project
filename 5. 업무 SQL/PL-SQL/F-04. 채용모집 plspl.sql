--수료생 일치하는 채용모집 출력
create or replace view vwGraduateRecruitment
as
select 
g.seq as 수료생번호,
c.companyName as 기업이름,
j.jobName as 직무,
r.workingArea as 근무지,
r.annulIncome as 연봉,
r.recruitmentNum as 채용인원,
r.startregdate as 채용시작날짜,
r.endregdate as 채용종료날짜
from tblGraduate g
    inner join tblJob j
        on g.seq = j.seq
            inner join tblRecruitment r
                on j.seq = r.jseq
                    inner join tblCompany c
                        on c.seq = r.cseq
                            inner join tblEmploymentLink e
                                on e.seq = g.seq;
                                    
select * from vwGraduateRecruitment
where 수료생번호 = 1;

--채용 모집
--관리자 기업 정보 입력(이름, 주소, 전화번호)
create or replace PROCEDURE procCompany (
    pcompanyName in tblCompany.companyName%type,
    paddress in tblCompany.address%type,
    ptel in tblCompany.tel%type
)
is

begin
    insert into tblCompany (seq, companyName, address, tel) 
    values (seq_Company.nextVal, pcompanyName, paddress, ptel);
    dbms_output.put_line('기업이름: '||pcompanyName||' '||'주소: '||paddress||' '||'전화번호: '||ptel);
    dbms_output.put_line('입력에 성공하였습니다.');
    commit;

exception
    when OTHERS then
    dbms_output.put_line('입력에 실패하였습니다.');
    rollback;

end procCompany;

--기업정보 입력 실행
begin
    procCompany('GS', '서울시 강남구', '1566-3322');
end;



--채용 모집 입력
create or replace PROCEDURE procRecruitment (
    pcseq in tblrecruitment.cseq%type,
    pjseq in tblrecruitment.jseq%type,
    pworkingArea in tblrecruitment.workingarea%type,
    pannulIncome in tblrecruitment.annulincome%type,
    precruitmentNum in tblrecruitment.recruitmentnum%type,
    pstartregdate in tblrecruitment.startregdate%type,
    pendregdate in tblrecruitment.endregdate%type

)
is

begin

    insert into tblRecruitment (seq, cseq, jseq, workingArea, annulIncome, recruitmentNum, startregdate, endregdate)
    values (seq_Recruitment.nextVal, pcseq, pjseq, pworkingArea , pannulIncome, precruitmentNum, pstartregdate, pendregdate);
    dbms_output.put_line('기업번호: '||pcseq||' '||'직무번호: '||pjseq||' '||'근무지: '||pworkingArea);
    dbms_output.put_line('연봉: '||pannulIncome||' '||'채용인원: '||precruitmentNum||' '||'채용시작날짜: '||pstartregdate||' '||'채용종료날짜: '||pendregdate);
    dbms_output.put_line('입력에 성공하였습니다.');
    commit;

exception
    when OTHERS then
    dbms_output.put_line('입력에 실패하였습니다.');
    rollback;

end procRecruitment;


--채용모집 입력 실행
begin
    procRecruitment(5, 1, '서울', 40000000, 5, '2022-05-20', '2022-05-31');
end;


create or replace procedure procEmploymentLink (
    pgseq in tblEmploymentLink.gseq%type,
    prseq in tblEmploymentLink.rseq%type
)
is

begin
    insert into tblEmploymentLink (seq, gseq, rseq) 
    values (seq_EmploymentLink.nextVal, pgseq, prseq);
    dbms_output.put_line('수료생번호: '||pgseq||' '||'모집번호: '||prseq);
    dbms_output.put_line('입력에 성공하였습니다.');
    commit;

exception
    when OTHERS then
    dbms_output.put_line('입력에 실패하였습니다.');
    rollback;

end procEmploymentLink;


--관리자 취업 연계 입력 실행
begin
    procEmploymentLink(1, 1);
end;
