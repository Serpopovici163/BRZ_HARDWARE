@ECHO OFF
set ROPTS=-np 8 --parallel-authenticate sspi --machines-file nodes
set COPTS=
set FEKO_SCRIPT_FILE=C:/Users/se097192/Documents/0_PERSONAL/BRZ/0_BRZ_HARDWARE/7_EWM/00_FEKO/0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST/array_diamr_sweep/0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_01.bof

if "%FEKO_HOME%"=="" (
echo           INFO: Parameter Sweep Solve 
echo ************************************************ 
echo *         FEKO_HOME variable is not set.       * 
echo ************************************************ 
echo  Please run initfeko, or set the environment variable FEKO_HOME to point to the FEKO installation.
echo  This script will now exit.
exit /B
) else (
call "%FEKO_HOME%/bin/initfeko.bat"
)
"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_01" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_01" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_02" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_02" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_03" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_03" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_04" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_04" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_05" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_05" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_06" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_06" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_07" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_07" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_08" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_08" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_09" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_09" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_10" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_10" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_11" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_11" %ROPTS%

"C:\Program Files\Altair\2023.1-edu\feko/bin/cadfeko_batch" "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_12" %COPTS%
runfeko "0_BASIC_MONOPOLE_ARRAY_BEAMFORMING_TEST_12" %ROPTS%

echo           DONE: Parameter Sweep Solve
echo ************************************************
echo * Launch POSTFEKO and merge the results.       *
echo ************************************************
choice /N /M "Do you want to run POSTFEKO now (y/n):"

if not errorlevel 2 (
    if exist "%FEKO_SCRIPT_FILE%" (
        start postfeko "%FEKO_SCRIPT_FILE%" --run-script "%FEKO_SHARED_HOME%/installedapplicationmacrolibrary/Shared/ParameterSweep/combine_parameter_sweep_results.lua"
    ) else (
        start postfeko --run-script "%FEKO_SHARED_HOME%/installedapplicationmacrolibrary/Shared/ParameterSweep/combine_parameter_sweep_results.lua"
    )
)
exit
