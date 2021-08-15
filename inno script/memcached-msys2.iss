﻿; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Memcached"
#define MyAppPublisher "Lucifer"
#define MyAppURL "https://github.com/X-Lucifer/win-memcached"
#define MyAppExeName "nssm.exe"
#define MyCopyright "Copyright © Lucifer. All Rights Reserved."
#define MyDescription "Windows Memcached Service"
#define MyAppLowerName "memcached"
#define MyAppPlatform "msys2"
#define MyAppRuntime "msys-2.0.dll"
;升级需要更新的代码块
#define MyPath "D:\Publish\Memcached"
#define MyAppVersion "1.6.10"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{54B71439-76CC-4BAB-8E94-638DD43FC70A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir={#MyPath}
OutputBaseFilename={#MyAppLowerName}-{#MyAppVersion}-{#MyAppPlatform}
SetupIconFile={#MyPath}\memcached.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
DisableReadyPage=True
DisableFinishedPage=True
AppCopyright={#MyCopyright}
EnableDirDoesntExistWarning=True
DirExistsWarning=no
UninstallDisplayIcon={uninstallexe}
UninstallDisplayName={#MyAppName}
ArchitecturesInstallIn64BitMode=x64 ia64
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription={#MyDescription}
VersionInfoTextVersion={#MyAppVersion}
VersionInfoProductName={#MyAppName}
UsePreviousGroup=False
AppendDefaultGroupName=False

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{#MyPath}\{#MyAppLowerName}-{#MyAppPlatform}\nssm.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\{#MyAppLowerName}-{#MyAppPlatform}\{#MyAppRuntime}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\{#MyAppLowerName}-{#MyAppPlatform}\{#MyAppLowerName}.exe"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Run]
Filename: "{app}\nssm.exe"; Parameters: "install {#MyAppName} ""{app}\{#MyAppLowerName}.exe"""; WorkingDir: "{app}\"; Description: "安装为Windows服务";
Filename: "{app}\nssm.exe"; Parameters: "set {#MyAppName} DisplayName {#MyAppName}"; WorkingDir: "{app}"; Description: "设置服务名称";
Filename: "{app}\nssm.exe"; Parameters: "set {#MyAppName} Description ""{#MyDescription}"""; WorkingDir: "{app}"; Description: "设置服务描述";

[UninstallRun]
Filename: "{app}\nssm.exe"; Parameters: "stop {#MyAppName}"; 
Filename: "{app}\nssm.exe"; Parameters: "remove {#MyAppName} confirm";