@echo off

setlocal enabledelayedexpansion

\\fil-s01\SystemAvd\Tools\GitVersion\GitVersion.exe /showvariable SemVer>SemVer.txt

set /P _version=<SemVer.txt
	
del SemVer.txt
	
if "!_version!"=="" (
	echo "Er ikke istand til � finne SemVer"
	exit /b 666
)
	
echo Setter tag '!_version!' i git

git tag -f !_version!
git push origin !_version!

echo ... utf�rt

