--교육생이 교육생 번호, 프로젝트명, 프로젝트내용, 프로젝트 시작일, 프로젝트마감일, 인원수, 공고 마감기한 입력
insert into tblProjectRecruitment (seq, stuseq, projectname, projectcontents, projectstartdate, projectenddate, headcount, deadline)
    values (seq_ProjectRecruitment.nextVal, 교육생번호, '프로젝트명', '프로젝트내용', '프로젝트시작일', '프로젝트마감일', 인원수, '공고마감기한');

--특정 프로젝트 정보 출력
select 
projectname as 프로젝트이름,
projectcontents as 프로젝트내용,
projectstartdate as 프로젝트시작일,
projectenddate as 프로젝트종료일,
headcount as 모집인원
from tblProjectRecruitment
where projectname like '파이%';

--교육생이 공고 번호, 교육생 번호 입력해 프로젝트 참여 신청
insert into tblProjectParticipant (seq, pseq, stuseq) values (seq_ProjectParticipant.nextVal, 공고번호, 교육생번호);
