#Requires AutoHotkey v2.0.2
#SingleInstance Force

Glazewm(cmd) {
    RunWait(format("glazewm command {}", cmd), , "Hide")
}

*CapsLock:: return                                   ; This forces capslock into a modifying key.

; Capslock modified hotkeys
#HotIf GetKeyState("CapsLock", "P")

; digit row
SC001:: return
SC002:: workspaces("1")
SC003:: workspaces("2")
SC004:: workspaces("3")
SC005:: workspaces("4")
SC006:: workspaces("5")
SC007:: workspaces("6")
SC008:: workspaces("7")
SC009:: workspaces("8")
SC00A:: return
SC00B:: return
SC00C:: return
SC00D:: return

; top row
SC010:: return
SC011:: return
SC012:: cycleWorkspace("prev")
SC013:: cycleWorkspace("next")
SC014:: Glazewm("toggle-minimized")
*SC015:: send_mods("PgUp")
*SC016:: send_mods("Home")
*SC017:: send_mods("Up")
*SC018:: send_mods("End")
*SC019:: Send "{Blind}{Del}"
SC01A:: SetCapsLockState !GetKeyState('CapsLock', 'T')

; middle row
*SC01E:: return ; Disabled and reimplemented in send_mods function
*SC01F:: return ; Disabled and reimplemented in send_mods function
*SC020:: return ; Disabled and reimplemented in send_mods function
*SC021:: return ; Disabled and reimplemented in send_mods function
*SC022:: Send "{Esc}"
*SC023:: send_mods("PgDn")
*SC024:: send_mods("Left")
*SC025:: send_mods("Down")
*SC026:: send_mods("Right")
SC027:: Send "{Blind}{Backspace}"
SC028:: return

; bottom row
SC056:: Send "{CtrlDown}{y}{CtrlUp}"
SC02C:: Send "{CtrlDown}{z}{CtrlUp}"
SC02D:: Send "{CtrlDown}{x}{CtrlUp}"
SC02E:: Send "{CtrlDown}{c}{CtrlUp}"
SC02F:: Send "{CtrlDown}{v}{CtrlUp}"
SC030:: return
SC031:: Send "{Blind}{PrintScreen}"
SC032:: Send "{Blind}{Backspace}"
SC033:: Send "{Blind}{Tab}"
SC034:: Send "{AppsKey}"
SC035:: Send "{Enter}"
; Space rebind
Space:: Send "{Enter}"

#HotIf

send_mods(key) {
    mods := ""
        . (GetKeyState("SC01E", "P") ? "!" : "")
        . (GetKeyState("SC01F", "P") ? "#" : "")
        . (GetKeyState("SC020", "P") ? "+" : "")
        . (GetKeyState("SC021", "P") ? "^" : "")
    SendInput mods "{" key "}"
}

workspaces(wrkspNumber) {
    if GetKeyState("SC020", "P") {
        Glazewm(format("move --workspace {}", wrkspNumber))
    } else {
        Glazewm(format("focus --workspace {}", wrkspNumber))
    }
}

cycleWorkspace(direction) {
    Glazewm(format("focus  --{}-workspace", direction))
}

; Rshift modified hotkeys

; digit row
RShift & SC002:: return ; ("change-layout bsp")
RShift & SC003:: return ; ("change-layout grid")
RShift & SC004:: return ; ("change-layout rows")
RShift & SC005:: return ; ("change-layout vertical-stack")
RShift & SC006:: return ; ("change-layout ultrawide-vertical-stack")
RShift & SC007:: return ; ("change-layout columns")
RShift & SC008:: return ; ("change-layout horizontal-stack")
RShift & SC009:: return ; ("change-layout right-main-vertical-stack")
RShift & SC00A:: return
RShift & SC00B:: return
RShift & SC00C:: return ; ("cycle-move-workspace-to-monitor next")
RShift & SC00D:: return ; ("cycle-move-workspace-to-monitor previous")

; top row
RShift & SC010:: Send "{<}"
RShift & SC011:: Send "{>}"
RShift & SC012:: Send "{:}"
RShift & SC013:: Send "{;}"
RShift & SC014:: Send "{*}"

; middle row
RShift & SC01E:: Send "{+}"
RShift & SC01F:: Send "{=}"
RShift & SC020:: Send "{[}"
RShift & SC021:: Send "{(}"
RShift & SC022:: Send "{{}"

; bottom rows
RShift & SC02C:: Send "{-}"
RShift & SC02D:: Send "{_}"
RShift & SC02E:: Send "{]}"
RShift & SC02F:: Send "{)}"
RShift & SC030:: Send "{}}"

^!SC011:: Send "{æ}"
+^!SC011:: Send "{Æ}"
^!SC013:: Send "{ø}"
+^!SC013:: Send "{Ø}"
^!SC02C:: Send "{å}"
+^!SC02C:: Send "{Å}"

$LWin::
{
    if KeyWait("LWin", "T0.2") {  ; returns true if key was released within 200ms
        Send("^{Space}")             ; send Ctrl+Space
    } else {
        Send("{LWin Down}")       ; hold LWin down
        KeyWait("LWin")           ; wait for release
        Send("{LWin Up}")         ; release LWin
    }
}
