// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'DroidDesk';

  @override
  String get statusRunning => 'Desktop Running';

  @override
  String get statusReady => 'Ready';

  @override
  String get descri => 'Full Linux Desktop on Android';

  @override
  String get sessionDetails => 'Ubuntu · XFCE Desktop · Single App';

  @override
  String get container => 'Containerized';

  @override
  String get rootoption => 'Root Optional';

  @override
  String get osname => 'Linux Desktop';

  @override
  String get localization => 'Local Execution';

  @override
  String get setup => 'Set Up Desktop Essentials';

  @override
  String get quickActions => 'QUICK ACTIONS';

  @override
  String get installOnetime =>
      'Install desktop environment packages (one-time setup)';

  @override
  String get returnDesktop => 'Return to Desktop';

  @override
  String get stopServer => 'Stop Server';

  @override
  String get launchDesktop => 'Launch Desktop';

  @override
  String get shutDownenv => 'Shutdown Linux environment';

  @override
  String get dsenv => 'desktop environment';

  @override
  String get noticeNodsenv =>
      'No Desktop Environment installed. Please complete setup first.';

  @override
  String get terminal => 'Terminal';

  @override
  String get envTypeChroot => 'Ubuntu chroot';

  @override
  String get envTypeTermux => 'native Termux';

  @override
  String openShellDesc(String envType) {
    return 'Open a Linux shell in the @envType environment';
  }

  @override
  String btnInstall(String deName) {
    return 'Install @deName';
  }

  @override
  String descRunningInBackground(String deName) {
    return '@deName is currently running in background';
  }

  @override
  String descStartDesktop(String deName) {
    return 'Start @deName desktop environment';
  }

  @override
  String get debianShell => 'Debian shell';

  @override
  String get openPRootenv =>
      'Open the optional minimal PRoot compatibility environment';

  @override
  String get addApplications => 'Add applications';

  @override
  String get installAppcomps =>
      'Install applications or optional Debian compatibility';

  @override
  String get system => 'SYSTEM';

  @override
  String get labelDistribution => 'Distribution';

  @override
  String get labelDesktop => 'Desktop Environment';

  @override
  String get labelGpu => 'GPU';

  @override
  String get labelRenderer => 'Renderer';

  @override
  String get labelDevice => 'Device';

  @override
  String get labelAndroid => 'Android';

  @override
  String get labelRam => 'RAM';

  @override
  String get labelStorageFree => 'Storage Free';

  @override
  String get labelAutomatic => 'Automatic';

  @override
  String get desktopActive => 'Desktop Active';

  @override
  String get desktopIdle => 'Desktop Idle';

  @override
  String get tapToStartDesc => 'Tap \"Launch Desktop\" to start';

  @override
  String get hintText => 'Enter command...';

  @override
  String get appFirefoxName => 'Firefox';

  @override
  String get appFirefoxDesc => 'Full desktop web browser.';

  @override
  String get appCodeName => 'Code OSS';

  @override
  String get appCodeDesc =>
      'Desktop source-code editor. This is a large download.';

  @override
  String get appNodeName => 'Node.js + npm';

  @override
  String get appNodeDesc => 'JavaScript runtime and package manager.';

  @override
  String get appImageMagickName => 'ImageMagick';

  @override
  String get appImageMagickDesc =>
      'Command-line image conversion and processing tools.';

  @override
  String get appProotName => 'Debian (PRoot)';

  @override
  String get appProotDesc =>
      'Minimal PRoot base system. No applications are included.';

  @override
  String msgInstallSuccess(String appName) {
    return '@appName installed';
  }

  @override
  String msgInstallFailed(String appName) {
    return '@appName installation failed. See the log below.';
  }

  @override
  String get deskReady => 'Desktop Essentials is ready';

  @override
  String get installNeeded =>
      'Install only what you need. Each application is independent and can be safely retried.';

  @override
  String get installLabel => 'Install';

  @override
  String get packageLog => 'Package log';

  @override
  String get installComplete => 'Installation Complete';

  @override
  String get installFail => 'Installation Failed';

  @override
  String get configWorkstation => 'Configuring\nLinux Workstation';

  @override
  String get envReady => 'Your Linux environment is ready.';

  @override
  String get downloadconfigPackages =>
      'Downloading and configuring system packages.';

  @override
  String get extractPackages => 'Extracting packages...';

  @override
  String get returnHome => 'Return to Home';

  @override
  String get goBack => 'Go Back';

  @override
  String get supportOpensource => 'Support Open Source';

  @override
  String get chooseDesktop => 'Choose Desktop';

  @override
  String get desktopEssentialsDesc =>
      'Desktop Essentials installs the selected desktop, terminal, file manager, and core tools. More apps can be added later.';

  @override
  String get tagBest => 'BEST';

  @override
  String get back => 'Back';

  @override
  String get installEssentials => 'Install Essentials';

  @override
  String get deXfceName => 'XFCE4';

  @override
  String get deXfceDesc =>
      'Fast, customizable, low resource usage. The best all-rounder.';

  @override
  String get deXfceRam => '~300 MB RAM';

  @override
  String get deLxqtName => 'LXQt';

  @override
  String get deLxqtDesc =>
      'Ultra-lightweight Qt-based desktop. Fastest option.';

  @override
  String get deLxqtRam => '~200 MB RAM';

  @override
  String get deMateName => 'MATE';

  @override
  String get deMateDesc => 'Classic GNOME 2 fork. Familiar and comfortable.';

  @override
  String get deMateRam => '~400 MB RAM';

  @override
  String get deKdeName => 'KDE Plasma';

  @override
  String get deKdeDesc =>
      'Modern, feature-rich. Needs strong GPU and 4GB+ RAM.';

  @override
  String get deKdeRam => '~600 MB RAM';

  @override
  String get chooseLinux => 'Choose Your Linux';

  @override
  String get selectDistroDesc =>
      'Select a distribution to install. This will be downloaded on setup.';

  @override
  String get tagRecommended => 'RECOMMENDED';

  @override
  String get next => 'Next';

  @override
  String get distroUbuntuName => 'Ubuntu 24.04 LTS';

  @override
  String get distroUbuntuDesc =>
      'Best overall experience. Huge package library, great community support.';

  @override
  String get distroUbuntuSize => '~350 MB download';

  @override
  String get distroAlpineName => 'Alpine Linux 3.20';

  @override
  String get distroAlpineDesc =>
      'Ultra minimal and secure. Best for low resource usage.';

  @override
  String get distroAlpineSize => '~3 MB download';

  @override
  String get distroKaliName => 'Kali Linux';

  @override
  String get distroKaliDesc =>
      'Security and pentesting tools. Wireshark, Metasploit, Nmap included.';

  @override
  String get distroKaliSize => '~500 MB download';

  @override
  String get lowStorageTitle => 'Low storage';

  @override
  String lowStorageMessage(String storage) {
    return 'Only @storage MB is available. Desktop Essentials works best with at least 2 GB free. You can continue, but package installation may fail.';
  }

  @override
  String get continueAnyway => 'Continue anyway';

  @override
  String get rootDetectedTitle => 'Root access detected';

  @override
  String get rootDetectedMessage =>
      'Your device is rooted. Continue with the rooted chroot runtime for the best performance and full Linux support?';

  @override
  String get cancel => 'Cancel';

  @override
  String get continueWithRoot => 'Continue with root';

  @override
  String get retry => 'Retry';

  @override
  String get launchDroidDesk => 'Launch DroidDesk';

  @override
  String get stepBootstrap => 'Bootstrap environment';

  @override
  String get stepRepos => 'Configure package repositories';

  @override
  String get stepInstallEssentials => 'Install Desktop Essentials';

  @override
  String get stepFinalize => 'Finalize Desktop Essentials';

  @override
  String get stepRootConfirmed => 'Root access confirmed';

  @override
  String get stepDownloadRootfs => 'Download Ubuntu rootfs';

  @override
  String get stepInstallNative => 'Install native packages';

  @override
  String get stepExtractRootfs => 'Extract rootfs';

  @override
  String get stepConfigureDesktop => 'Configure desktop';

  @override
  String get stepConfigureLinux => 'Configure Linux';

  @override
  String get phaseSetupFailed => 'Setup Failed';

  @override
  String get phaseDownloading => 'Downloading';

  @override
  String get phasePreparingDownload => 'Preparing download...';

  @override
  String get phasePreparingRuntime => 'Preparing Runtime';

  @override
  String get phaseInstallingNative => 'Installing Native Linux';

  @override
  String get phasePreparingTermux => 'Preparing native Termux environment...';

  @override
  String get phaseInstallingDesktop => 'Installing Desktop';

  @override
  String get phaseExtracting => 'Extracting';

  @override
  String get phaseExtractingFs => 'Extracting filesystem...';

  @override
  String get phaseSetupComplete => 'Setup Complete!';

  @override
  String get phaseReadyToLaunch => 'Your Linux desktop is ready to launch.';

  @override
  String get phaseSettingUp => 'Setting Up';

  @override
  String get phaseInitializing => 'Initializing...';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get batteryOptimization => 'Battery Optimization';

  @override
  String get batteryOptimizationDesc => 'Disable to prevent session killing';

  @override
  String get reinstallLinux => 'Reinstall Linux';

  @override
  String get reinstallLinuxDesc => 'Re-download and set up rootfs';
}
