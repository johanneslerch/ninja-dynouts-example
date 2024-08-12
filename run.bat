rem SET NINJA_EXE=ninja-1.11.1.conti.2.exe
SET NINJA_EXE=ninja-pr2366-Jun12.exe

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
@echo invoke with a changed build graph, should be no work to do
%NINJA_EXE% -d explain -f build2.ninja