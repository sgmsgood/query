/*
2. lucky_pack ��Ű���� �μ���ȣ�� �޾� emp ���̺��� �μ���
   ����� ��� �ټӳ���� out_parameter�� �����ϴ� procedure��
   �߰��ϼ���.
*/

var avr_y number(10);
exec lucky_pack.avr_work(10,:avr_y);
print avr_y;

