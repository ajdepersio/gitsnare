cd %~dp0
if not exist "..\..\.git\hooks\" (
    mkdir "..\..\.git\hooks\"
    if not errorlevel 1 (
        xcopy "hooks\*" "..\..\.git\hooks\" /s /v /e /Y
    )
) else (
    xcopy "hooks\*" "..\..\.git\hooks\" /s /v /e /Y
)
pause