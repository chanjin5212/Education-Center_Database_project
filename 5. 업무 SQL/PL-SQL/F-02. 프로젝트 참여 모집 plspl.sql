--프로젝트 정보 조회
create or replace view vwProjectRecruitment
as
select 
projectname as 프로젝트이름,
projectcontents as 프로젝트내용,
projectstartdate as 프로젝트시작일,
projectenddate as 프로젝트종료일,
headcount as 모집인원
from tblProjectRecruitment;

select *from vwProjectRecruitment
where 프로젝트이름 like '자바%';


--교육생이 교육생 번호, 프로젝트명, 프로젝트내용, 프로젝트 시작일, 프로젝트마감일, 인원수, 공고 마감기한 입력
create or replace procedure procProjectRecruitment(
    pstuseq           in tblProjectRecruitment.stuseq%type,
    pprojectname      in tblProjectRecruitment.projectname%type,
    pprojectcontents  in tblProjectRecruitment.projectcontents%type,
    pprojectstartdate in tblProjectRecruitment.projectstartdate%type,
    pprojectenddate   in tblProjectRecruitment.projectenddate%type,
    pheadcount        in tblProjectRecruitment.headcount%type,
    pdeadline         in tblProjectRecruitment.deadline%type
    
)
is

begin

    insert into tblProjectRecruitment (seq, stuseq, projectname, projectcontents, projectstartdate, projectenddate, headcount, deadline)
    values (seq_ProjectRecruitment.nextVal, pstuseq, pprojectname, pprojectcontents, pprojectstartdate, pprojectenddate, pheadcount, pdeadline);
    dbms_output.put_line('교육생번호:' ||pstuseq||' '||'프로젝트명:' ||pprojectname||' '||'프로젝트내용:' ||pprojectcontents);
    dbms_output.put_line('프로젝트시작일:' ||pprojectstartdate||' '||'프로젝트마감일:' ||pprojectenddate||' '||'인원수:' ||pheadcount||' '||'공고마감기한:'||pdeadline);
    dbms_output.put_line('입력에 성공하였습니다.');
    commit;

exception
    when others then
        dbms_output.put_line('입력에 실패하였습니다.');
    rollback;

end procProjectRecruitment;


--프로젝트모집 공고 입력 실행
begin
    procProjectRecruitment(1, '웹 사이트 제작 프로젝트 인원 모집합니다.', '자바스크립트 이용한 웹 프로젝트 입니다.','2022-06-01', '2022-06-14', 5, '2022-05-31');
end;




--교육생이 공고 번호, 교육생 번호 입력해 프로젝트 참여 신청
create or replace procedure procProjectParticipant (
    ppseq  in tblprojectparticipant.pseq%type,
    pstuseq in tblprojectparticipant.stuseq%type
)
is

begin
    insert into tblProjectParticipant (seq, pseq, stuseq) 
    values (seq_ProjectParticipant.nextVal, ppseq, pstuseq);
    dbms_output.put_line('공고번호: '||ppseq||' '||'교육생번호: '||pstuseq);
    dbms_output.put_line('신청에 성공하였습니다.');
    commit;

exception
    when OTHERS then 
        dbms_output.put_line('신청에 실패하였습니다.');
    rollback;

end procProjectParticipant;


insert into tblProjectParticipant (seq, pseq, stuseq) values (seq_ProjectParticipant.nextVal, 공고번호, 교육생번호);
--프로젝트 참여 신청 실행
begin
    procProjectParticipant(1, 2);
end;
