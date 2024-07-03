; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Nickvision Spotlight"
#define MyAppShortName "Spotlight"
#define MyAppVersion "2024.6.3"
#define MyAppPublisher "Nickvision"
#define MyAppURL "https://nickvision.org"
#define MyAppExeName "org.nickvision.spotlight.winui.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{EFA41EAC-2C62-474B-83E9-4BD7DFAD9C68}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
UsePreviousAppDir=no
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=..\COPYING
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=..\inno
OutputBaseFilename=NickvisionSpotlightSetup
SetupIconFile=..\resources\org.nickvision.spotlight.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
DirExistsWarning=no
CloseApplications=yes

[Code]
procedure SetupVC();
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{app}\deps\vc_redist.x64.exe'), '/install /quiet /norestart', '', SW_HIDE, ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Unable to install VC . Please try again', mbError, MB_OK);
end;

procedure SetupWinAppSDK();
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{app}\deps\windowsappruntimeinstall-x64.exe'), '--quiet', '', SW_HIDE, ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Unable to install Windows App SDK. Please try again', mbError, MB_OK);
end;

procedure Cleanup();
begin
  DelTree(ExpandConstant('{app}\deps'), True, True, True);
end;

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\vc_redist.x64.exe"; DestDir: "{app}\deps"; AfterInstall: SetupVC  
Source: "..\windowsappruntimeinstall-x64.exe"; DestDir: "{app}\deps"; AfterInstall: SetupWinAppSDK  
Source: "..\build\org.nickvision.spotlight.winui\Release\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion 
Source: "..\build\org.nickvision.spotlight.winui\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; AfterInstall: Cleanup
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppShortName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppShortName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

