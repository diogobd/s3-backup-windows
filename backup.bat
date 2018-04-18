rem Requer instalação 7-Zip AWS CLi
rem Executar: aws configure e informar os dados do bucket

@echo off
set folder=c:\public\backup\
set folderok=C:\public\backup\ok\
set BUCKET=waylog-backup
@echo on

cd %folder%

for %%i in (*.bak) do (
	"c:\Program Files\7-Zip\7z.exe" a "%%i.7z" "%%i" -mx7
	move %%i %folderok%
	aws s3 cp "%%i.7z" s3://%BUCKET%/
	del "%%i.7z"
)