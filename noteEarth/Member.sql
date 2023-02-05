DROP TABLE n_e_member;
CREATE TABLE n_e_member(
memberno varchar2(100),
email varchar2(100),
name varchar2(100),
rrn varchar2(100),
password varchar2(100),
kakaoemail varchar2(100),
googleemail varchar2(100)
);
--데이터삭제

DELETE n_e_member WHERE memberno='mem-4';
--유저번호 시퀸스
DROP SEQUENCE n_e_member_seq;
CREATE SEQUENCE n_e_member_seq 
      increment by 1
      start with 1
      MINVALUE 0
      MAXVALUE 100000; 
--전체확인
SELECT * FROM n_e_member;
--회원여부확인
SELECT * FROM n_e_member WHERE name='' AND rrn='';
--회원가입시 이메일 여부확인
SELECT * FROM n_e_member WHERE email='';
--회원가입
INSERT INTO n_e_member VALUES('mem-'||n_e_member_seq.nextval,'28888wjdaud@naver.com','이지은','950828-1111112','2222',NULL,null);
--카카오 로그인 눌럿을떄 확인
SELECT email,kakaoemail,googleemail FROM n_e_member WHERE (email || kakaoemail || googleemail) like '%'||'28888wjdaud@google.com'||'%';
--기존 계정에 카카오 이메일 추가
UPDATE N_E_MEMBER
SET KAKAOEMAIL  = null
WHERE memberno = 'mem-13';

--??
select * from n_e_member 
where (email || kakaoemail || googleemail) LIKE '%'||'aaaaaaa'||'%'
OR (email || kakaoemail || googleemail) LIKE '%'||'288888wjdaud@gmail.com'||'%';
--and password=#{password};

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO aoddl IDENTIFIED BY 1111;
ALTER USER aoddl DEFAULT TABLESPACE USERS;
ALTER USER aoddl TEMPORARY TABLESPACE TEMP;

CREATE TABLE member2323( name varchar2(20));


UPDATE N_E_MEMBER 
SET email = 'aoddl56@nate.com', PASSWORD ='2222'
WHERE name='이정명' AND rrn='950828-1111111';
