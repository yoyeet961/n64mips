@echo off

set ROM=%~dpnx1

set OLDDIR=%CD%
cd \MAME
mame.exe n64 -window -cart %ROM% -switchres -nofilter
chdir /d %OLDDIR%