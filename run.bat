rem SET NINJA_EXE=ninja-1.11.1.conti.2.exe
rem SET NINJA_EXE=ninja-pr2366-Jun12.exe
rem set NINJA_EXE=D:\git\ninja\ninja.exe
rem SET NINJA_EXE=ninja-1.11.1.conti.3.exe
SET NINJA_EXE=ninja-1.11.1.dyndep-single-stmt.exe

DEL output.dynamic
DEL output.static
DEL .ninja_deps
DEL .ninja_log

@echo "create all the outputs"
%NINJA_EXE% -d explain -f build1.ninja

@echo ----------------------------------------
@echo invoke again, should be no work to do
%NINJA_EXE% -d explain -f build1.ninja


@echo ----------------------------------------
@echo invoke with a changed build graph containing a conflict: should complain about conflict
%NINJA_EXE% -d explain -f build2.ninja

@echo ----------------------------------------
@echo invoke again, should still complain about the conflict
%NINJA_EXE% -d explain -f build2.ninja


@echo ----------------------------------------
@echo invoke with a changed build graph (no conflict anymore), should re-execute build statement
%NINJA_EXE% -d explain -f build3.ninja

@echo ----------------------------------------
@echo invoke again, should be no work to do
%NINJA_EXE% -d explain -f build3.ninja