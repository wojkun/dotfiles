@ECHO OFF
REM edit the whole cmd.exe screen (save first)
REM sav.exe > %Temp%\cmd_prompt_output.txt && vim -c ":se nowrap" %Temp%\cmd_prompt_output.txt
sav.exe > %Temp%\cmd_prompt_output.txt && sed "s/^M//g" %Temp%\cmd_prompt_output.txt > %Temp%\tmp && vim -c ":se nowrap" %Temp%\tmp
REM vim -c ":se nowrap" C:\Users\w\AppData\Local\Temp\console.dump
@ECHO ON
