; AutoHotKey script for defining an Extend layer (default is CapsLock)
; Hold Extend and press other keys to provide navigation and other fuctionality
;
; The script defines F24 as Extend, so you can apply to any key of your choice
; e.g. to use CapsLock, define:
#InputLevel 1
CapsLock::F24
#InputLevel 0

#Persistent
SetCapsLockState, AlwaysOff

; digit row

F24 & SC001::
return

F24 & SC002::
  Send {Blind}{F1}
return

F24 & SC003::
  Send {Blind}{F2}
return

F24 & SC004::
  Send {Blind}{F3}
return

F24 & SC005::
  Send {Blind}{F4}
return

F24 & SC006::
  Send {Blind}{F5}
return

F24 & SC007::
  Send {Blind}{F6}
return

F24 & SC008::
  Send {Blind}{F7}
return

F24 & SC009::
  Send {Blind}{F8}
return

F24 & SC00A::
  Send {Blind}{F9}
return

F24 & SC00B::
  Send {Blind}{F10}
return

F24 & SC00C::
  Send {Blind}{F11}
return

F24 & SC00D::
  Send {Blind}{F12}
return

; top row

F24 & SC010::
  Send {Esc}
return

F24 & SC011::
  Send {Blind}{Numpad1}
return


F24 & SC012::
  {
    MouseGetPos,,,win
    WinGetClass, class, ahk_id %win%
    If class in Progman,WorkerW
      send {Click}^#{Left}
    else
      send ^#{Left}  ; Previous Desktop  
    return
  }

F24 & SC013::
  {
    MouseGetPos,,,win
    WinGetClass, class, ahk_id %win%
    If class in Progman,WorkerW
        send {Click}^#{Right}  
    else
        send ^#{Right}  ; Next  Desktop  
    return
  }

F24 & SC014::
  Send {Insert}
return

F24 & SC015::
  Send {Blind}{PgUp}
return

F24 & SC016::
  Send {Blind}{Home}
return

F24 & SC017::
  Send {Blind}{Up}
return

F24 & SC018::
  Send {Blind}{End}
return

F24 & SC019::
  Send {Blind}{Del}
return

F24 & SC01A::
  GetKeyState, cp, CapsLock, T
  if cp = D
    SetCapsLockState, AlwaysOff
  else
    SetCapsLockState, AlwaysOn
return

; middle row

F24 & SC01E::
  Send {Blind}{AltDown}
return

F24 & SC01E Up::
  Send {AltUp}
return

F24 & SC01F::
  Send {Blind}{LWinDown}
return

F24 & SC01F Up::
  Send {LWinUp}
return

F24 & SC020::
  Send {Blind}{ShiftDown}
return

F24 & SC020 Up::
  Send {ShiftUp}
return

F24 & SC021::
  Send {Blind}{CtrlDown}
return

F24 & SC021 Up::
  Send {CtrlUp}
return

F24 & SC022::
  Send {Blind}{RAltDown}
return

F24 & SC022 Up::
  Send {RAltUp}
return

F24 & SC023::
  Send {Blind}{PgDn}
return

F24 & SC024::
  Send {Blind}{Left}
return

F24 & SC025::
  Send {Blind}{Down}
return

F24 & SC026::
  Send {Blind}{Right}
return

F24 & SC027::
  Send {Blind}{Backspace}
return

F24 & SC028::
return

; bottom row

F24 & SC056::
  Send {CtrlDown}{y}{CtrlUp}
return

F24 & SC02C::
  Send {CtrlDown}{z}{CtrlUp}
return

F24 & SC02D::
  Send {CtrlDown}{x}{CtrlUp}
return

F24 & SC02E::
  Send {CtrlDown}{c}{CtrlUp}
return

F24 & SC02F::
  Send {CtrlDown}{v}{CtrlUp}
return

F24 & SC030::
return

F24 & SC031::
  Send {Blind}{PrintScreen}
return

F24 & SC032::
  Send {Blind}{Backspace}
return

F24 & SC033::
  Send {Blind}{Tab}
return

F24 & SC034::
  Send {AppsKey}
return

F24 & SC035::
  Send {Return}
return

; Space rebind
F24 & Space::
  Send {Return}
return

; RAlt cancel caps / nav layer

RAlt::
  GetKeyState, cp, CapsLock, T
  if navLayer 
  {
    navLayer := 0
  } 
  else if cp = D
  {
    SetCapsLockState, AlwaysOff
  } 
Return

; training disables
$Enter::return
$Backspace::return
SC00D::return ; =
Shift & SC00D::return ; +
SC00C::return ; -
Shift & SC00C::return ; _
Shift & SC00A::return ; (
Shift & SC00B::return ; )

SC01A::return ; [
SC01B::return ; ]
Shift & SC01A::return ; {
Shift & SC01B::return ; }


; start RHIFT binginds

; top row
RShift & SC010::
  Send {<}
return

RShift & SC011::
  Send {>}
return

RShift & SC012::
  Send {:}
return

RShift & SC013::
  Send {;}
return

RShift & SC014::
  Send {*}
return

; middle row
RShift & SC01E::
    Send {+}
return

RShift & SC01F::
    Send {=}
return

RShift & SC020::
    Send {[}
return

RShift & SC021::
    Send {(}
return

RShift & SC022::
    Send {{}
return

; bottom row
RShift & SC02C::
    Send {-}
return

RShift & SC02D::
    Send {_}
return

RShift & SC02E::
    Send {]}
return

RShift & SC02F::
    Send {)}
return

RShift & SC030::
    Send {}}
return
