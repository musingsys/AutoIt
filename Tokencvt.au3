$sFile = FileOpenDialog("Please select a file", "", "Token File (*.sdtid)") 
If @error Then Exit 
	
$fName = StringRegExpReplace($sFile, "^.*\\", "") 

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <WindowsConstants.au3>
$Form1_1 = GUICreate("Token Cvt", 174, 208, 192, 114)
global $Input1 = GUICtrlCreateInput("User", 24, 136, 121, 21)
$Button1 = GUICtrlCreateButton("Submit", 48, 168, 75, 25)
global $Input2 = GUICtrlCreateList("", 24, 24, 121, 97)
GUICtrlSetData(-1, "android|iphone|winphone")
GUISetState(@SW_SHOW)
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
			$user = GUICtrlRead($Input1)
			$phone = GUICtrlRead($Input2)
			$options = ' -jar TokenConverter.jar ' & $fName & ' -' & $phone & ' -d 5 -o ' & $User & '.jpg -qr'
			ConsoleWrite ($phone & " " & $user)
			ConsoleWrite ($options)
			ShellExecuteWait('java', $options)
			ShellExecuteWait( $user & ".jpg" )
			Exit
	EndSwitch
WEnd

