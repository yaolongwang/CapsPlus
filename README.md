# Caps+ (CapsPlus) - CapsLock 键增强脚本

Caps+ 是一个基于 AutoHotkey v2.0 的 CapsLock 增强脚本，通过将 CapsLock 键与其它按键组合，实现高效的方向键、数字小键盘、常用功能键等操作，提升键盘操作效率。

## 功能特性

- **CapsLock 组合键增强**：CapsLock + 其它按键，快速输入方向键、数字小键盘、常用符号等。
- **智能切换大小写锁定**：仅在单独按下 CapsLock 时切换大小写状态，组合键不影响。
- **任务栏菜单**：支持一键开机自启动、临时暂停热键、退出程序。

## 快捷键说明

| 组合键                           | 功能                         |
| -------------------------------- | ---------------------------- |
| CapsLock + `W` / `A` / `S` / `D` | 方向键 `↑` / `←` / `↓` / `→` |
| CapsLock + `Q`                   | `Delete`                     |
| CapsLock + `Tab`                 | `Backspace`                  |
| CapsLock + `Space`               | `Enter`                      |
| CapsLock + `0`~`9`               | 小键盘 `0`~`9`               |
| CapsLock + `=`                   | 小键盘 `+`                   |
| CapsLock + `-`                   | 小键盘 `-`                   |
| CapsLock + `.`                   | 小键盘 `.`                   |
| CapsLock + 小键盘 `*`            | `×` 符号                     |
| CapsLock + 小键盘 `/`            | `÷` 符号                     |
| CapsLock + 小键盘 `+`            | `±` 符号                     |
| CapsLock + 小键盘 `-`            | `Φ` 符号                     |

> **注意**：CapsLock 键单独按下时，仅在未与其它键组合时才切换大小写锁定状态。

## 任务栏菜单

- **开机自启动**：勾选后自动将程序快捷方式添加到启动文件夹（`shell:startup`），实现开机自启。
- **暂停热键**：临时禁用所有热键，再次点击恢复。
- **退出**：退出程序。

## 使用方法

1. 下载本仓库的 `Caps+.exe` 可执行文件。
2. 双击运行 `Caps+.exe`，无需安装 AutoHotkey 环境。
3. 可通过任务栏图标菜单设置开机自启、暂停热键或退出。

## 源码与自定义

如需自定义快捷键或功能，请下载并直接编辑 `Caps+.ahk` 源码，并用 [AutoHotkey v2](https://www.autohotkey.com/) 运行脚本或用 [Ahk2Exe](https://github.com/AutoHotkey/Ahk2Exe) 编译为 exe 可执行文件。

## 许可协议

本项目基于 MIT License 开源，欢迎自由使用与修改。
