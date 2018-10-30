@echo off

setlocal enabledelayedexpansion

\\fil-s01\SystemAvd\Tools\GitVersion\GitVersion.exe /showvariable SemVer>SemVer.txt

set /P _version=<SemVer.txt
	
del SemVer.txt
	
if "!_version!"=="" (
	echo "Can't find SemVer"
	exit /b 666
)
	
echo Setting tag '!_version!' in git

git tag -f !_version!
git push origin !_version!

echo ... finished

