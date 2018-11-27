@echo off
rem 延时退出时间和监测的服务：
set secs=3
set srvname="CRM"

echo.
echo ========================================
echo == 查询计算机服务的状态， ==
echo == 延时%secs%秒种退出， ==
echo == 如发现其停止，则立即启动。 ==
echo ========================================
echo.
echo 此脚本监测的服务是：%srvname%
echo.

if %srvname%. == . goto end


set svrst=0
for /F "tokens=1* delims= " %%a in ('net start') do if /I "%%a %%b" == %srvname% set svrst=1
if %svrst% == 0 net start %srvname%
set svrst=
rem 下面的命令用于延时
choice /t %secs% /d y /n >nul


:end