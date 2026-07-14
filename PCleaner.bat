@echo off
title Nettoyeur PC Complet avec Calcul
color 0A

:: Vérification des privilèges administrateur
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Merci de lancer ce script en tant qu'administrateur.
    pause
    exit /b
)

:: Récupération de l'espace libre AVANT via PowerShell (plus fiable que WMIC)
for /f %%a in ('powershell -command "(Get-Volume -DriveLetter %systemdrive:~0,1%).SizeRemaining"') do set "space_before=%%a"

echo ===================================================
echo     DEBUT DU NETTOYAGE COMPLET DE VOTRE PC
echo ===================================================
echo.

:: 1. Vidage de la Corbeille
echo [-] Nettoyage de la Corbeille...
rd /s /q %systemdrive%\$Recycle.bin 2>nul
echo.

:: 2. Nettoyage des fichiers temporaires utilisateur
echo [-] Nettoyage des fichiers temporaires (.temp)...
del /f /q /s %temp%\*.* 2>nul
rd /s /q %temp% 2>nul
mkdir %temp%
echo.

:: 3. Nettoyage des fichiers temporaires système
echo [-] Nettoyage des fichiers temporaires systeme...
del /f /q /s %systemroot%\Temp\*.* 2>nul
rd /s /q %systemroot%\Temp 2>nul
mkdir %systemroot%\Temp
echo.

:: 4. Nettoyage du dossier Prefetch
echo [-] Nettoyage du dossier Prefetch...
del /f /q /s %systemroot%\Prefetch\*.* 2>nul
echo.

:: 5. Nettoyage du cache de Windows Update
echo [-] Nettoyage du cache des mises a jour Windows...
net stop wuauserv >nul 2>&1
del /f /q /s %systemroot%\SoftwareDistribution\Download\*.* 2>nul
net start wuauserv >nul 2>&1
echo.

:: 6. Flush DNS
echo [-] Flush DNS (Cache Internet)...
ipconfig /flushdns >nul
echo.

:: 7. Nettoyage de disque Windows
echo [-] Lancement du nettoyeur de disque Windows...
cleanmgr /sagerun:1 >nul
echo.

:: Récupération de l'espace libre APRES via PowerShell
for /f %%b in ('powershell -command "(Get-Volume -DriveLetter %systemdrive:~0,1%).SizeRemaining"') do set "space_after=%%b"

:: Calcul précis de la différence en Mo (avec gestion si la valeur est égale à 0)
for /f %%i in ('powershell -command "$diff = (%space_after% - %space_before%) / 1MB; if ($diff -lt 0) { 0 } else { [math]::round($diff, 2) }"') do set "saved_space=%%i"

echo ===================================================
echo     NETTOYAGE TERMINE AVEC SUCCES !
echo ===================================================
echo C'est merveilleux, votre PC est maintenant propre.
echo Espace libere : %saved_space% Mo.
echo.
pause