ClipboardBackup := Clipboard
Clipboard =

Send, !{Space} ;Menu
Sleep, 100
Send, e ;Edit
Send, s ;Select All

Send, {Enter} ;Copy
ClipWait

FileAppend, %Clipboard%, *

Clipboard := ClipboardBackup

ExitApp
