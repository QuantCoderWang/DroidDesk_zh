// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'DroidDesk';

  @override
  String get statusRunning => '桌面运行中';

  @override
  String get statusReady => '就绪';

  @override
  String get descri => 'Android 上的完整 Linux 桌面';

  @override
  String get sessionDetails => 'Ubuntu · XFCE 桌面 · 单应用模式';

  @override
  String get container => '容器化运行';

  @override
  String get rootoption => '可选 Root 权限';

  @override
  String get osname => 'Linux 桌面';

  @override
  String get localization => '本地执行';

  @override
  String get setup => '配置桌面基础组件';

  @override
  String get quickActions => '快捷操作';

  @override
  String get installOnetime => '安装桌面环境组件（仅需配置一次）';

  @override
  String get returnDesktop => '返回桌面';

  @override
  String get stopServer => '停止服务器';

  @override
  String get launchDesktop => '启动桌面';

  @override
  String get shutDownenv => '关闭 Linux 环境';

  @override
  String get dsenv => '桌面环境';

  @override
  String get noticeNodsenv => '未安装桌面环境。请先完成设置。';

  @override
  String get terminal => '终端';

  @override
  String get envTypeChroot => 'Ubuntu chroot';

  @override
  String get envTypeTermux => '原生 Termux';

  @override
  String openShellDesc(String envType) {
    return '在 @envType 环境中打开 Linux Shell';
  }

  @override
  String btnInstall(String deName) {
    return '安装 @deName';
  }

  @override
  String descRunningInBackground(String deName) {
    return '@deName 正在后台运行';
  }

  @override
  String descStartDesktop(String deName) {
    return '启动 @deName 桌面环境';
  }

  @override
  String get debianShell => 'Debian Shell';

  @override
  String get openPRootenv => '打开可选的微型 PRoot 兼容环境';

  @override
  String get addApplications => '添加应用';

  @override
  String get installAppcomps => '安装应用程序或可选的Debian兼容组件';

  @override
  String get system => '系统信息';

  @override
  String get labelDistribution => '发行版';

  @override
  String get labelDesktop => '桌面环境';

  @override
  String get labelGpu => '显卡';

  @override
  String get labelRenderer => '渲染器';

  @override
  String get labelDevice => '设备型号';

  @override
  String get labelAndroid => '安卓';

  @override
  String get labelRam => '运行内存';

  @override
  String get labelStorageFree => '可用存储';

  @override
  String get labelAutomatic => '自动';

  @override
  String get desktopActive => '桌面活动';

  @override
  String get desktopIdle => '桌面空闲';

  @override
  String get tapToStartDesc => '点击“启动桌面”以开始';

  @override
  String get hintText => '输入命令...';

  @override
  String get appFirefoxName => 'Firefox 浏览器';

  @override
  String get appFirefoxDesc => '功能完整的桌面网页浏览器。';

  @override
  String get appCodeName => 'Code OSS';

  @override
  String get appCodeDesc => '桌面源代码编辑器。（安装包较大）';

  @override
  String get appNodeName => 'Node.js + npm';

  @override
  String get appNodeDesc => 'JavaScript 运行时及包管理器。';

  @override
  String get appImageMagickName => 'ImageMagick';

  @override
  String get appImageMagickDesc => '命令行图像转换与处理工具集。';

  @override
  String get appProotName => 'Debian (PRoot)';

  @override
  String get appProotDesc => '极简 PRoot 基础系统。（不包含预装应用）';

  @override
  String msgInstallSuccess(String appName) {
    return '@appName 已安装';
  }

  @override
  String msgInstallFailed(String appName) {
    return '@appName 安装失败。请查看下方日志。';
  }

  @override
  String get deskReady => '桌面环境组件已就绪';

  @override
  String get installNeeded => '按需安装。每个应用相互独立，可随时安全重试。';

  @override
  String get installLabel => '安装';

  @override
  String get packageLog => '安装日志';

  @override
  String get installComplete => '安装完成';

  @override
  String get installFail => '安装失败';

  @override
  String get configWorkstation => '正在配置\nLinux 工作站';

  @override
  String get envReady => '您的 Linux 环境已准备就绪。';

  @override
  String get downloadconfigPackages => '正在下载并配置系统软件包。';

  @override
  String get extractPackages => '正在解压软件包...';

  @override
  String get returnHome => '返回主页';

  @override
  String get goBack => '返回';

  @override
  String get supportOpensource => '支持开源';

  @override
  String get chooseDesktop => '选择桌面环境';

  @override
  String get desktopEssentialsDesc =>
      '桌面环境安装程序将安装所选的桌面、终端、文件管理器和核心工具。之后可以添加更多应用程序。';

  @override
  String get tagBest => '推荐';

  @override
  String get back => '返回';

  @override
  String get installEssentials => '安装核心组件';

  @override
  String get deXfceName => 'XFCE4';

  @override
  String get deXfceDesc => '快速、可定制、低资源占用。最佳综合选择。';

  @override
  String get deXfceRam => '约 300 MB 内存';

  @override
  String get deLxqtName => 'LXQt';

  @override
  String get deLxqtDesc => '超轻量级 Qt 桌面。速度最快。';

  @override
  String get deLxqtRam => '约 200 MB 内存';

  @override
  String get deMateName => 'MATE';

  @override
  String get deMateDesc => '经典的 GNOME 2 分支。熟悉且舒适。';

  @override
  String get deMateRam => '约 400 MB 内存';

  @override
  String get deKdeName => 'KDE Plasma';

  @override
  String get deKdeDesc => '现代、功能丰富。需要较强的 GPU 和 4GB+ 内存。';

  @override
  String get deKdeRam => '约 600 MB 内存';

  @override
  String get chooseLinux => '选择 Linux 发行版';

  @override
  String get selectDistroDesc => '选择要安装的发行版。它将在设置过程中下载。';

  @override
  String get tagRecommended => '推荐';

  @override
  String get next => '下一步';

  @override
  String get distroUbuntuName => 'Ubuntu 24.04 LTS';

  @override
  String get distroUbuntuDesc => '最佳综合体验。拥有庞大的软件库和强大的社区支持。';

  @override
  String get distroUbuntuSize => '约 350 MB 下载';

  @override
  String get distroAlpineName => 'Alpine Linux 3.20';

  @override
  String get distroAlpineDesc => '超轻量且安全。低资源占用的最佳选择。';

  @override
  String get distroAlpineSize => '约 3 MB 下载';

  @override
  String get distroKaliName => 'Kali Linux';

  @override
  String get distroKaliDesc => '安全与渗透测试工具。包含 Wireshark、Metasploit、Nmap 等。';

  @override
  String get distroKaliSize => '约 500 MB 下载';

  @override
  String get lowStorageTitle => '存储空间不足';

  @override
  String lowStorageMessage(String storage) {
    return '仅剩 @storage MB 可用空间。桌面环境组件建议至少预留 2 GB 空间。您可以继续，但可能会导致软件包安装失败。';
  }

  @override
  String get continueAnyway => '继续安装';

  @override
  String get rootDetectedTitle => '检测到 Root 权限';

  @override
  String get rootDetectedMessage =>
      '您的设备已获取 Root 权限。是否使用 Root Chroot 运行时以获得最佳性能和完整的 Linux 支持？';

  @override
  String get cancel => '取消';

  @override
  String get continueWithRoot => '使用 Root 继续';

  @override
  String get retry => '重试';

  @override
  String get launchDroidDesk => '启动 DroidDesk';

  @override
  String get stepBootstrap => '引导环境';

  @override
  String get stepRepos => '配置软件仓库';

  @override
  String get stepInstallEssentials => '安装桌面组件';

  @override
  String get stepFinalize => '完成桌面配置';

  @override
  String get stepRootConfirmed => 'Root 权限已确认';

  @override
  String get stepDownloadRootfs => '下载 Ubuntu 根文件系统';

  @override
  String get stepInstallNative => '安装原生软件包';

  @override
  String get stepExtractRootfs => '解压根文件系统';

  @override
  String get stepConfigureDesktop => '配置桌面环境';

  @override
  String get stepConfigureLinux => '配置 Linux';

  @override
  String get phaseSetupFailed => '安装失败';

  @override
  String get phaseDownloading => '正在下载';

  @override
  String get phasePreparingDownload => '正在准备下载...';

  @override
  String get phasePreparingRuntime => '正在准备运行时';

  @override
  String get phaseInstallingNative => '正在安装原生 Linux';

  @override
  String get phasePreparingTermux => '正在准备原生 Termux 环境...';

  @override
  String get phaseInstallingDesktop => '正在安装桌面';

  @override
  String get phaseExtracting => '正在解压';

  @override
  String get phaseExtractingFs => '正在解压文件系统...';

  @override
  String get phaseSetupComplete => '安装完成！';

  @override
  String get phaseReadyToLaunch => '您的 Linux 桌面已准备就绪。';

  @override
  String get phaseSettingUp => '正在设置';

  @override
  String get phaseInitializing => '初始化中...';

  @override
  String get settingsTitle => '设置';

  @override
  String get batteryOptimization => '电池优化';

  @override
  String get batteryOptimizationDesc => '禁用以防止会话被系统杀死';

  @override
  String get reinstallLinux => '重装 Linux';

  @override
  String get reinstallLinuxDesc => '重新下载并设置根文件系统';
}
