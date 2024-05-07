@echo off
rem This batch file runs MATLAB scripts to generate and analyze data

rem Adding the current directory to MATLAB's path and setting up environment
set MATLABPATH=%MATLABPATH%;%CD%

rem Function-like call to run a MATLAB script
:run_matlab
echo Running %1...
matlab -batch "try, addpath(genpath('.')); %1; catch e, disp(getReport(e, 'extended')); end"
goto :eof

rem Main execution block
echo Starting MATLAB script executions...

rem Call MATLAB scripts here
call :run_matlab Tyson1991
call :run_matlab OtherModel1995
call :run_matlab AnotherModel2000

echo All models have been processed.


