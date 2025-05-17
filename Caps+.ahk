#Requires AutoHotkey v2.0
; CapsPlus (Caps+.ahk) - CapsLock键增强脚本
; 通过CapsLock键+其它按键的组合实现键盘高效操作

; 创建任务栏图标菜单
Tray := A_TrayMenu
Tray.Delete() ; 清空所有默认菜单项
Tray.Add("开机自启动", ToggleStartup)
Tray.Add("暂停热键", ToggleSuspend)
Tray.Add("退出", (*) => ExitApp())

; 初始化菜单勾选状态
UpdateStartupMenuState()
UpdateSuspendMenuState()

; 切换开机自启动功能
ToggleStartup(ItemName, ItemPos, MyMenu) {
    startupFolder := A_Startup
    exePath := A_ScriptFullPath
    shortcutPath := startupFolder "\Caps+.lnk"

    if FileExist(shortcutPath) {
        FileDelete shortcutPath
    } else {
        FileCreateShortcut exePath, shortcutPath
    }

    UpdateStartupMenuState()
}

; 切换暂停热键功能
ToggleSuspend(ItemName, ItemPos, MyMenu) {
    Suspend
    UpdateSuspendMenuState()
}

; 更新“暂停热键”菜单勾选状态
UpdateSuspendMenuState() {
    if (A_IsSuspended) {
        Tray.Check("暂停热键")
    } else {
        Tray.Uncheck("暂停热键")
    }
}

; 更新“开机自启动”菜单勾选状态
UpdateStartupMenuState() {
    shortcutPath := A_Startup "\Caps+.lnk"
    if FileExist(shortcutPath) {
        Tray.Check("开机自启动")
    } else {
        Tray.Uncheck("开机自启动")
    }
}

; 全局变量，用于跟踪是否有其他键在CapsLock按下期间被按下
global g_CapsLockCombinationUsed := false

; 完全禁用CapsLock的默认行为
SetCapsLockState "AlwaysOff"

; 方向键映射
CapsLock & w::
{
    g_CapsLockCombinationUsed := true
    Send "{Up}"
}

CapsLock & a::
{
    g_CapsLockCombinationUsed := true
    Send "{Left}"
}

CapsLock & s::
{
    g_CapsLockCombinationUsed := true
    Send "{Down}"
}

CapsLock & d::
{
    g_CapsLockCombinationUsed := true
    Send "{Right}"
}

; 其他功能键映射
CapsLock & q::
{
    g_CapsLockCombinationUsed := true
    Send "{Delete}"
}

CapsLock & Tab::
{
    g_CapsLockCombinationUsed := true
    Send "{Backspace}"
}

CapsLock & Space::
{
    g_CapsLockCombinationUsed := true
    Send "{Enter}"
}

; 小键盘区按键映射
CapsLock & 0::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad0}"
}
CapsLock & 1::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad1}"
}
CapsLock & 2::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad2}"
}
CapsLock & 3::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad3}"
}
CapsLock & 4::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad4}"
}
CapsLock & 5::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad5}"
}
CapsLock & 6::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad6}"
}
CapsLock & 7::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad7}"
}
CapsLock & 8::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad8}"
}
CapsLock & 9::
{
    g_CapsLockCombinationUsed := true
    Send "{Numpad9}"
}
CapsLock & =::
{
    g_CapsLockCombinationUsed := true
    Send "{NumpadAdd}"
}
CapsLock & -::
{
    g_CapsLockCombinationUsed := true
    Send "{NumpadSub}"
}
CapsLock & .::
{
    g_CapsLockCombinationUsed := true
    Send "{NumpadDot}"
}
CapsLock & NumpadMult::
{
    g_CapsLockCombinationUsed := true
    SendText "×"
}
CapsLock & NumpadDiv::
{
    g_CapsLockCombinationUsed := true
    SendText "÷"
}
CapsLock & NumpadAdd::
{
    g_CapsLockCombinationUsed := true
    SendText "±"
}
CapsLock & NumpadSub::
{
    g_CapsLockCombinationUsed := true
    SendText "Φ"
}

; CapsLock按下时，只重置组合键使用标志，不做其他操作
*CapsLock::
{
    g_CapsLockCombinationUsed := false
    ; 按下时不做任何操作
}

; CapsLock抬起时，检查是否使用了组合键
*CapsLock Up::
{
    ; 只有在没有使用组合键的情况下才切换大小写锁定状态
    if (!g_CapsLockCombinationUsed) {
        ; 手动切换大小写锁定状态
        if (GetKeyState("CapsLock", "T"))
            SetCapsLockState "AlwaysOff"
        else
            SetCapsLockState "AlwaysOn"
    }
}
