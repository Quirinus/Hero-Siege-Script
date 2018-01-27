#include <Misc.au3>

Global $Down = False
Global $cx = @DesktopWidth/2
Global $cy = @DesktopHeight/2
Global $qw = @DesktopWidth/4
Global $qh = @DesktopHeight/4
Global $dx = 0
Global $dy = 0

Func ToggleMouse()
    If $Down Then
        MouseUp('Left')
    Else
        MouseDown('Left')
    EndIf
    $Down = Not $Down
EndFunc

Func Quit()
    Exit
 EndFunc

Func Move()
   MouseMove($cx+$dx, $cy+$dy, 0)
EndFunc

HotkeySet('{SPACE}', 'ToggleMouse')
HotkeySet('^x', 'Quit')

While True
   If $Down Then
	  Send("1")
   EndIf
   $dx = 0
   $dy = 0
   If _IsPressed("57") Then ;w
	  $dy = -$qh
   EndIf
   If _IsPressed("53") Then ;s
	  $dy = $qh
   EndIf
   If _IsPressed("41") Then ;a
 	  $dx = -$qw
   EndIf
   If _IsPressed("44") Then ;d
	  $dx = $qw
   EndIf
   If Not ($dx == 0 And $dy == 0) Then
	  Move()
   EndIf
   Sleep(100)
WEnd

