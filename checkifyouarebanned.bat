@echo off
echo Checking if your IP is banned from OmeTV...
echo Testing all known OmeTV server IPs...
echo Please wait...

REM List of known OmeTV IPv4 and IPv6 addresses
set "IPv4=104.18.42.213 172.64.145.43"
set "IPv6=2606:4700:4400::ac40:912b 2606:4700:4400::6812:2ad5"

REM Initialize flag for ban detection
set "banned=0"

echo.
echo Testing IPv4 Addresses:
for %%i in (%IPv4%) do (
    echo.
    echo Testing IP: %%i
    ping %%i -n 4 >nul 2>&1
    if %errorlevel% equ 0 (
        echo Success: Your computer can reach %%i. This suggests no ban on this server.
    ) else (
        echo Failure: No response from %%i. This could indicate a ban or network issue.
        set "banned=1"
    )
)

echo.
echo Testing IPv6 Addresses (Note: Requires IPv6 support on your network):
for %%i in (%IPv6%) do (
    echo.
    echo Testing IP: %%i
    ping %%i -n 4 >nul 2>&1
    if %errorlevel% equ 0 (
        echo Success: Your computer can reach %%i. This suggests no ban on this server.
    ) else (
        echo Failure: No response from %%i. This could indicate a ban, network issue, or lack of IPv6 support.
        set "banned=1"
    )
)

echo.
if %banned% equ 0 (
    echo Overall Result: Your IP can reach all tested OmeTV servers. You are likely not banned.
) else (
    echo Overall Result: Your IP failed to reach one or more OmeTV servers. You might be banned, or there’s a network issue.
)

echo.
echo Notes:
echo - This test pings known IPs. A failure might not confirm a ban (e.g., firewall or server settings).
echo - IPv6 tests may fail if your network doesn’t support IPv6.
echo - For a definitive check, try accessing OmeTV directly or use a VPN.
pause
