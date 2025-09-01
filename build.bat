@echo off
setlocal

set SLN_PATH=D:\Project\demo\osafw\osafw.sln
set MSBUILD_PATH="C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin\MSBuild.exe"

echo [INFO] MSBuildを実行中...
%MSBUILD_PATH% %SLN_PATH% /p:Configuration=Release /m

if %errorlevel% neq 0 (
    echo [ERROR] ビルド失敗
    exit /b 1
)

echo [SUCCESS] ビルド成功
exit /b 0