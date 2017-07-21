﻿; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "SerialPortAssistant"
!define PRODUCT_VERSION "v0.1.0-7-g2c5f2be"
!define PRODUCT_PUBLISHER "KangLin studio"
!define PRODUCT_WEB_SITE "https://github.com/KangLin/SerialPortAssistant"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\SerialPortAssistant.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\SerialPortAssistant"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"
!include "x64.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "install\LICENSE.md"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\SerialPortAssistant.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

LangString LANG_PRODUCT_NAME ${LANG_ENGLISH} "SerialPortAssistant"
LangString LANG_PRODUCT_NAME ${LANG_SIMPCHINESE} "串口助手"

LangString LANG_UNINSTALL_CONFIRM ${LANG_ENGLISH} "Thank you very much! $(^Name) has been successfully removed."
LangString LANG_UNINSTALL_CONFIRM ${LANG_SIMPCHINESE} "非常感谢您的使用！ $(^Name) 已成功地从您的计算机中移除。"

LangString LANG_REMOVE_COMPONENT ${LANG_ENGLISH} "You sure you want to completely remove $ (^ Name), and all of its components?"
LangString LANG_REMOVE_COMPONENT ${LANG_SIMPCHINESE} "你确实要完全移除 $(^Name) ，其及所有的组件？"

; MUI end ------
Name "$(LANG_PRODUCT_NAME) ${PRODUCT_VERSION}"
OutFile "SerialPortAssistant-Setup-${PRODUCT_VERSION}.exe"
InstallDir "$PROGRAMFILES\${PRODUCT_NAME}"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
#RequestExecutionLevel user

; Install vc runtime
Function InstallVC
   Push $R0
   ClearErrors
   ReadRegDword $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FF66E9F6-83E7-3A3E-AF14-8DE9A809A6A4}" "Version"

   ; check regist
   IfErrors 0 VSRedistInstalled
   Exec "$INSTDIR\vcredist_x86.exe /q"
   StrCpy $R0 "-1"

VSRedistInstalled:
  ;MessageBox MB_OK  "Installed"
  Exch $R0
  Delete "$INSTDIR\vcredist_x86.exe"
FunctionEnd

Function InstallVC64
    Push $R0
    ClearErrors
    ReadRegDword $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FF66E9F6-83E7-3A3E-AF14-8DE9A809A6A4}" "Version"
    
    ; check regist
    IfErrors 0 VSRedistInstalled
    Exec "$INSTDIR\vcredist_x64.exe /q"
    StrCpy $R0 "-1"
    
    VSRedistInstalled:
    ;MessageBox MB_OK  "Installed"
    Exch $R0
    Delete "$INSTDIR\vcredist_x64.exe"
FunctionEnd

Function InstallRuntime
  ${If} ${RunningX64}
    IfFileExists "$INSTDIR\vcredist_x64.exe" 0 +2
    call InstallVC64
    IfFileExists "$INSTDIR\vcredist_x86.exe" 0 +2
    call InstallVC
  ${Else}
    IfFileExists "$INSTDIR\vcredist_x86.exe" 0 +2
    call InstallVC
  ${EndIf}
FunctionEnd

Function InstallFont
  StrCmp $LANGUAGE "2052" 0 +3
  ;Modify environment variable for default font to simsun.ttc
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "OSGEARTH_DEFAULT_FONT" "simsun.ttc"
  ;Reflash environment variable
  SendMessage ${HWND_BROADCAST} ${WM_WININICHANGE} 0 "STR:Environment"
FunctionEnd

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "${PRODUCT_NAME}" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File /r "install\*"
  SetShellVarContext all
  CreateDirectory "$SMPROGRAMS\${PRODUCT_NAME}"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\$(LANG_PRODUCT_NAME).lnk" "$INSTDIR\SerialPortAssistant.exe"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Uninstall.lnk" "$INSTDIR\uninst.exe"
  CreateShortCut "$DESKTOP\$(LANG_PRODUCT_NAME).lnk" "$INSTDIR\SerialPortAssistant.exe"
  SetShellVarContext current
  call InstallRuntime
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  SetShellVarContext all
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Uninstall.lnk" "$INSTDIR\uninst.exe"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  SetShellVarContext current
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\SerialPortAssistant.exe"
  call InstallFont
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\SerialPortAssistant.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "$(LANG_PRODUCT_NAME)"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(LANG_UNINSTALL_CONFIRM)"
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "$(LANG_REMOVE_COMPONENT)" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  SetShellVarContext all
  RMDir /r "$SMPROGRAMS\${PRODUCT_NAME}"
  Delete "$DESKTOP\$(LANG_PRODUCT_NAME).lnk"
  SetOutPath "$SMPROGRAMS"
  SetShellVarContext current
  RMDir /r "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  DeleteRegValue HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "OSGEARTH_DEFAULT_FONT"
  SendMessage ${HWND_BROADCAST} ${WM_WININICHANGE} 0 "STR:Environment"
  SetAutoClose true
SectionEnd
