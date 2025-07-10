Apps Folder - Required Files for GHOST v2025.07
===============================================

These are the required installer files that must be present in the "Apps\" directory
for the batch script to work properly. File names must match **exactly**.

Filename                          | Description
----------------------------------|----------------------------------------------
CuteWriter.exe                    | Acro Software CutePDF
readerdc.exe                      | Adobe Reader DC
anyconnect.msi                    | Cisco AnyConnect
ChromeSetup.exe                   | Google Chrome
dotnetfx35.exe                    | Microsoft .NET Framework 3.5
MSTeamsSetup.exe                  | Microsoft Teams for Work
Firefox Installer.exe             | Mozilla Firefox
npp.exe                           | Notepad++
OperaSetup.exe                    | Opera Browser
jre-6u25-windows-i586-s.exe       | Oracle Java 6
jre-7-windows-x64.exe             | Oracle Java 7
essex_SurePDF.msi                 | RSA SurePDF
vlc.exe                           | VLC Media Player
WinSCP.exe                        | WinSCP File Transfer Client
ZoomInstallerFull.exe             | Zoom Client for Meetings
MOPPI.cmd                         | Microsoft Office 2019/2021/365 Installer Script

Notes:
- All files must be located in the "Apps\" subdirectory.
- Microsoft Office runs via MOPPI.cmd, which may launch multiple setup files.
- Firefox filename includes a space: `Firefox Installer.exe`

