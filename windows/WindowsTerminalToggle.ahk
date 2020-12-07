;; Quake-style bash toggler for AutoHotkey.
;; Uses standard minimization/restoring animations.
;; ehpc@ehpc.io

#SingleInstance force

; Process handle
TerminalHandle = ahk_exe WindowsTerminal.exe

; On CTRL+` press
^`::
    WinGet, mx, MinMax, %TerminalHandle%
    ; If window is minimized, restore it
    if (mx = -1)
    {
        WinRestore, %TerminalHandle%

        ; Uncomment these lines to overcome tmux/vim rendering bug
        ; ControlSend, , ^{VK42}, %TerminalHandle%
        ; ControlSend, , {VK52}, %TerminalHandle%
    }
    ; Otherwise minimize it
    else
    {
        WinMinimize, %TerminalHandle%
    }
Return