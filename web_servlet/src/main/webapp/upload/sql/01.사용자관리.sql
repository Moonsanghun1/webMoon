select sysdate from dual;

-- �ּ� : ����� ����� (���� �̸����� DB�� ����� ����. ����ڿ� ����ǵ��� �Ǿ����.)
create USER java IDENTIFIED BY java; 

-- ����� ����
Drop USER JAVA;

-- ������ ����� �ƹ��͵� ���ϴ� ����ƺ� ������ ���� ->  ������ ��� ���� �� �� �ִ�.
GRANT CONNECT, RESOURCE , CREATE VIEW to Java;