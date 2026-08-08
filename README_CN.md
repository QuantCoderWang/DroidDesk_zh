# DroidDesk 汉化版

## 项目简介

本项目基于 [DroidDesk](https://github.com/orailnoor/DroidDesk) 原版进行汉化。
DroidDesk 是一款强大的 Android Linux 环境 Deployer 和 Desktop Launcher，允许用户在 Android 设备上运行完整的 Linux 桌面环境。

本自制版本旨在为中文用户提供更友好的本地化体验，并预置了丰富的常用软件，开箱即用。

---

## ✨ 汉化作者贡献

作为本项目的汉化作者，我对源项目进行了以下主要的改进与增强：

**完整的国际化支持 (i18n)**：
*   实现了应用界面核心文本的中英文双语支持。
*   修复了原版中部分硬编码的文本，使其支持动态语言切换。


---

## ⚠️ 未完成的部分

由于 DroidDesk 运行在 PRoot 环境下，用户默认以 `root` 身份登录。现代基于 Electron 和 Chromium 的应用（如 VS Code, Discord 等）拥有严格的安全沙盒机制，通常会拒绝以 root 身份运行。解决方法原作者已给出，请查看APP_TROUBLESHOOTING.md。

如果您是开发者，希望继续扩展此应用，可以尝试添加更多一键安装的常用应用，我目前尝试多次都因为各种奇怪原因失败，个人研究中，发现要添加更多自定义的一键安装应用，应该可以修改以下两个核心文件：

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

***

# Project Overview

This project is a localization of the original [DroidDesk](https://github.com/orailnoor/DroidDesk).

DroidDesk is a powerful Android Linux environment Deployer and Desktop Launcher, enabling users to run a full Linux desktop environment on Android devices.

This custom version aims to provide a more user-friendly localized experience for Chinese users, with pre-installed common software for out-of-the-box use.

---

## ✨ Localization Author's Contributions

As the author of this localization, I have made the following main improvements and enhancements to the original project:

**Complete Internationalization Support (i18n):**
*   Implemented bilingual (Chinese and English) support for core application interface text.
*   Fixed some hardcoded text in the original version to support dynamic language switching.

---

## ⚠️ Incomplete Sections

Since DroidDesk runs in a PRoot environment, users log in as `root` by default. Modern applications based on Electron and Chromium (such as VS Code, Discord, etc.) have strict security sandbox mechanisms and usually refuse to run as root. The original author has provided a solution, please refer to APP_TROUBLESHOOTING.md.

If you are a developer and wish to extend this application, you can try adding more one-click installed common applications. I have attempted this multiple times and encountered various strange issues. My personal research suggests that to add more custom one-click installed applications, you should modify the following two core files:

1.  **Frontend Interface:**
    *   File Path: `app/lib/screens/apps/app_catalog_screen.dart`
    *   Modification: Add a new application entry to the `baseApps` list, including name, description, icon, and color configuration.

2.  **Backend Logic:**
    *   File Path: `android/app/src/main/kotlin/com/orailnoor/droiddesk/runtime/ChrootRuntime.kt`
    *   Modification: Add the corresponding installation command (Shell Command) in the `when` statement of the `installOptionalApp` method.

3.  **Internationalization Resources:**
    *   File Path: `app/l10n/app_zh.arb` and `app_en.arb`
    *   Modification: Add translation key-value pairs for the application name and description.

---

## 📜 Copyright and Acknowledgments

*   **Original Author**: Orail Noor ([GitHub](https://github.com/orailnoor/DroidDesk))
*   **Localization and Enhancement**: QuantCoder_Wang
*   Third-party software (such as Steam, Blender, VS Code, etc.) in this project is owned by their respective owners.
*   Software installation packages are downloaded directly from official software repositories; please comply with relevant open-source licenses and local laws and regulations when using them.

---
*Last Updated: August 7, 2026*
