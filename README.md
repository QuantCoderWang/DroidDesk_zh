# DroidDesk 汉化增强版

## 项目简介

本项目基于 [DroidDesk](https://github.com/orailnoor/DroidDesk) 原版进行深度汉化与功能增强。
DroidDesk 是一款强大的 Android Linux 环境 Deployer 和 Desktop Launcher，允许用户在 Android 设备上运行完整的 Linux 桌面环境。

本fork版本旨在为中文用户提供更友好的本地化体验，并预置了丰富的常用软件，开箱即用。

---

## ✨ 汉化作者贡献

作为本项目的汉化作者，我对源项目进行了以下主要的改进与增强：

1.  **完整的国际化支持 (i18n)**：
    *   实现了应用界面核心文本的中英文双语支持。
    *   修复了原版中部分硬编码的文本，使其支持动态语言切换。

2.  **应用库大幅扩充**：
    *   在原版有限的应用列表基础上，新增了大量 Linux 桌面常用软件，涵盖开发工具、图形设计、多媒体播放、系统工具等多个类别。
    *   用户现可通过应用商店“一键安装”以下新增软件（不限于）：
        *   **办公**：LibreOffice, Okular
        *   **开发**：Vim, Node.js
        *   **图形**：GIMP, Blender, ImageMagick
        *   **多媒体**：VLC, Steam
        *   **工具**：Htop, p7zip, Remmina, Aria2
        *   **其他**：Thunderbird, Eog 等。

3.  **一键汉化脚本**：
    *   内置了 Linux 系统环境的一键汉化功能。用户只需在应用列表中点击“系统改中文”，即可自动安装中文字体并配置 Locale 环境。
    *   *注意：执行汉化命令后，需要重启 Linux 系统才能生效。*

---

## ⚠️ 核心注意事项

由于 DroidDesk 运行在 PRoot 环境下，用户默认以 `root` 身份登录。现代基于 Electron 和 Chromium 的应用（如 VS Code, Discord 等）拥有严格的安全沙盒机制，通常会拒绝以 root 身份运行。解决方法原作者已给出，请查看APP_TROUBLESHOOTING.md。

## 🛠️ 二次开发指南

如果您是开发者，希望继续扩展应用库，添加更多自定义的一键安装应用，请修改以下两个核心文件：

1.  **前端界面**：
    *   文件路径：`app/lib/screens/apps/app_catalog_screen.dart`
    *   修改内容：在 `baseApps` 列表中添加新的应用条目，包含名称、描述、图标及颜色配置。

2.  **后端逻辑**：
    *   文件路径：`android/app/src/main/kotlin/com/orailnoor/droiddesk/runtime/ChrootRuntime.kt`
    *   修改内容：在 `installOptionalApp` 方法的 `when` 语句中添加对应的安装命令（Shell Command）。

3.  **国际化资源**：
    *   文件路径：`app/l10n/app_zh.arb` 和 `app_en.arb`
    *   修改内容：添加应用名称和描述的翻译键值对。

---

## 📜 版权与致谢

*   **原作者**：Orail Noor ([GitHub](https://github.com/orailnoor/DroidDesk))
*   **汉化与增强**：QuantCoder_Wang
*   本项目中的第三方软件（如 Steam, Blender, VS Code 等）版权归各自所有者所有。
*   软件安装包均从各软件官方仓库直接下载，请遵守相关开源协议及当地法律法规使用。

---
*最后更新：2026年8月7日