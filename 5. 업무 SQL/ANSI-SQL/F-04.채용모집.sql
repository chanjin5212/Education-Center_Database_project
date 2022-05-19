--관리자 기업 정보 입력(이름, 주소, 전화번호)
insert into tblCompany (seq, companyName, address, tel) values (seq_Company.nextVal, '기업이름', '주소', '전화번호');

--관리자 채용 모집 입력(기업이름, 직무, 근무지, 연봉, 채용인원, 채용 시작,끝 날짜)
insert into tblRecruitment (seq, cseq, jseq, workingArea, annulIncome, recruitmentNum, startregdate, endregdate)
    values (seq_Recruitment.nextVal, 기업번호, 직무번호, '근무지', 연봉, 채용인원, '채용시작날짜', '채용종료날짜');


--관리자 취업 연계 입력(수료생, 채용모집)
insert into tblEmploymentLink (seq, gseq, rseq) values (seq_EmploymentLink.nextVal, 수료생번호, 모집번호);

--수료생 일치하는 채용 모집 출력(기업이름, 직무, 근무지, 연봉, 채용인원, 채용 시작,끝 날짜)
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
                                on e.seq = g.seq
                                    where g.seq = 1;
