@echo off
rem ��ʱ�˳�ʱ��ͼ��ķ���
set secs=3
set srvname="CRM"

echo.
echo ========================================
echo == ��ѯ����������״̬�� ==
echo == ��ʱ%secs%�����˳��� ==
echo == �緢����ֹͣ�������������� ==
echo ========================================
echo.
echo �˽ű����ķ����ǣ�%srvname%
echo.

if %srvname%. == . goto end


set svrst=0
for /F "tokens=1* delims= " %%a in ('net start') do if /I "%%a %%b" == %srvname% set svrst=1
if %svrst% == 0 net start %srvname%
set svrst=
rem ���������������ʱ
choice /t %secs% /d y /n >nul


:end