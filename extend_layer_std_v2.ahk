#Requires AutoHotkey v2.0.2
#SingleInstance Force


Komorebic(cmd) {
  RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

; CapsLock:: {
;   start := A_TickCount                              ; run once
;   KeyWait('CapsLock')                               ; wait for Capslock to be released
;   if (A_TickCount - start < 200)                    ; in 0.2 seconds
;   and KeyWait('CapsLock', 'D T0.2')                 ; and pressed again within 0.2 seconds
;   and (A_PriorKey = 'CapsLock')                     ; block other keys
;      SetCapsLockState !GetKeyState('CapsLock', 'T')
; }
*CapsLock::return                                   ; This forces capslock into a modifying key.

; Capslock modified hotkeys
#HotIf GetKeyState("CapsLock", "P")

; digit row
SC001::return
SC002::workspaces("0")
SC003::workspaces("1")
SC004::workspaces("2")
SC005::workspaces("3")
SC006::workspaces("4")
SC007::workspaces("5")
SC008::workspaces("6")
SC009::workspaces("7")
SC00A::return
SC00B::return
SC00C::return
SC00D::return

; top row
SC010::cycle("previous")
SC011::cycle("next")
SC012::Komorebic("cycle-workspace previous")
SC013::Komorebic("cycle-workspace next")
SC014::Send "{Esc}"
*SC015::send_mods("PgUp")
*SC016::send_mods("Home")
*SC017::send_mods("Up")
*SC018::send_mods("End")
*SC019::Send "{Blind}{Del}"
SC01A:: SetCapsLockState !GetKeyState('CapsLock', 'T')

; middle row
*SC01E::return ; Disabled and reimplemented in send_mods function
*SC01F::return ; Disabled and reimplemented in send_mods function
*SC020::return ; Disabled and reimplemented in send_mods function
*SC021::return ; Disabled and reimplemented in send_mods function
*SC022::return
*SC023::send_mods("PgDn")
*SC024::send_mods("Left")
*SC025::send_mods("Down")
*SC026::send_mods("Right")
SC027::Send "{Blind}{Backspace}"
SC028::return

; bottom row
SC056::Send "{CtrlDown}{y}{CtrlUp}"
SC02C::Send "{CtrlDown}{z}{CtrlUp}"
SC02D::Send "{CtrlDown}{x}{CtrlUp}"
SC02E::Send "{CtrlDown}{c}{CtrlUp}"
SC02F::Send "{CtrlDown}{v}{CtrlUp}"
SC030::return
SC031::Send "{Blind}{PrintScreen}"
SC032::Send "{Blind}{Backspace}"
SC033::Send "{Blind}{Tab}"
SC034::Send "{AppsKey}"
SC035::Send "{Enter}"
; Space rebind
Space::Send "{Enter}"

#HotIf

send_mods(key) {
  mods := ""
       .  (GetKeyState("SC01E", "P") ? "!" : "")
       .  (GetKeyState("SC01F", "P") ? "#" : "")
       .  (GetKeyState("SC020", "P") ? "+" : "")
       .  (GetKeyState("SC021", "P") ? "^" : "")
  SendInput mods "{" key "}"
}

workspaces(wrkspNumber) {
  if GetKeyState("SC020", "P") {
    Komorebic(format("move-to-workspace {}", wrkspNumber))
  } else {
    Komorebic(format("focus-workspace {}", wrkspNumber))
  }
}

cycle(direction) {
  if GetKeyState("SC020", "P") {
    Komorebic(format("cycle-move {}", direction))
  } else {
    Komorebic(format("cycle-focus {}", direction))
  }
}

; Rshift modified hotkeys

; digit row
RShift & SC002::Komorebic("change-layout bsp")
RShift & SC003::Komorebic("change-layout grid")
RShift & SC004::Komorebic("change-layout rows")
RShift & SC005::Komorebic("change-layout vertical-stack")
RShift & SC006::Komorebic("change-layout ultrawide-vertical-stack")
RShift & SC007::Komorebic("change-layout columns")
RShift & SC008::Komorebic("change-layout horizontal-stack")
RShift & SC009::Komorebic("change-layout right-main-vertical-stack")

; top row
RShift & SC010::Send "{<}"
RShift & SC011::Send "{>}"
RShift & SC012::Send "{:}"
RShift & SC013::Send "{;}"
RShift & SC014::Send "{*}"

; middle row
RShift & SC01E::Send "{+}"
RShift & SC01F::Send "{=}"
RShift & SC020::Send "{[}"
RShift & SC021::Send "{(}"
RShift & SC022::Send "{{}"

; bottom rows
RShift & SC02C::Send "{-}"
RShift & SC02D::Send "{_}"
RShift & SC02E::Send "{]}"
RShift & SC02F::Send "{)}"
RShift & SC030::Send "{}}"
