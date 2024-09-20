# adb_dumpsys.nvim

A Neovim plugin that provides a set of commands to interact with `adb shell dumpsys` command.

## Install

Using vim-plug:

```
Plug 'JefferyBoy/adb_dumpsys.nvim'
```

Using lazy.nvim

```
use {'JefferyBoy/adb_dumpsys.nvim'}
```

## Commands

| Command                     | Execute shell command and show the output           |
| --------------------------- | --------------------------------------------------- |
| AdbDumpsysWindow            | adb shell dumpsys activity                          |
| AdbDumpsysWindowVisible     | adb shell dumpsys window visible                    |
| AdbDumpsysWindowVisibleName | adb shell dumpsys window visible \| grep "Window #" |
| AdbDumpsysWindowContainers  | adb shell dumpsys window containers                 |
| AdbDumpsysPackageAll        | adb shell dumpsys package                           |
| AdbDumpsysPackage           | adb shell dumpsys package                           |
| AdbPmListPackage            | adb shell pm list package --user -1 -f              |
| AdbDumpsysInput             | adb shell dumpsys input                             |
| AdbDumpsysSurfaceFlinger    | adb shell dumpsys SurfaceFlinger                    |
| AdbDumpsysActivity          | adb shell dumpsys activity                          |
| AdbDumpsysActivityServices  | adb shell dumpsys activity services                 |
