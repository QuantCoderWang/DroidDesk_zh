import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'DroidDesk'**
  String get appName;

  /// No description provided for @statusRunning.
  ///
  /// In en, this message translates to:
  /// **'Desktop Running'**
  String get statusRunning;

  /// No description provided for @statusReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get statusReady;

  /// No description provided for @descri.
  ///
  /// In en, this message translates to:
  /// **'Full Linux Desktop on Android'**
  String get descri;

  /// No description provided for @sessionDetails.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu · XFCE Desktop · Single App'**
  String get sessionDetails;

  /// No description provided for @container.
  ///
  /// In en, this message translates to:
  /// **'Containerized'**
  String get container;

  /// No description provided for @rootoption.
  ///
  /// In en, this message translates to:
  /// **'Root Optional'**
  String get rootoption;

  /// No description provided for @osname.
  ///
  /// In en, this message translates to:
  /// **'Linux Desktop'**
  String get osname;

  /// No description provided for @localization.
  ///
  /// In en, this message translates to:
  /// **'Local Execution'**
  String get localization;

  /// No description provided for @setup.
  ///
  /// In en, this message translates to:
  /// **'Set Up Desktop Essentials'**
  String get setup;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'QUICK ACTIONS'**
  String get quickActions;

  /// No description provided for @installOnetime.
  ///
  /// In en, this message translates to:
  /// **'Install desktop environment packages (one-time setup)'**
  String get installOnetime;

  /// No description provided for @returnDesktop.
  ///
  /// In en, this message translates to:
  /// **'Return to Desktop'**
  String get returnDesktop;

  /// No description provided for @stopServer.
  ///
  /// In en, this message translates to:
  /// **'Stop Server'**
  String get stopServer;

  /// No description provided for @launchDesktop.
  ///
  /// In en, this message translates to:
  /// **'Launch Desktop'**
  String get launchDesktop;

  /// No description provided for @shutDownenv.
  ///
  /// In en, this message translates to:
  /// **'Shutdown Linux environment'**
  String get shutDownenv;

  /// No description provided for @dsenv.
  ///
  /// In en, this message translates to:
  /// **'desktop environment'**
  String get dsenv;

  /// No description provided for @noticeNodsenv.
  ///
  /// In en, this message translates to:
  /// **'No Desktop Environment installed. Please complete setup first.'**
  String get noticeNodsenv;

  /// No description provided for @terminal.
  ///
  /// In en, this message translates to:
  /// **'Terminal'**
  String get terminal;

  /// No description provided for @envTypeChroot.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu chroot'**
  String get envTypeChroot;

  /// No description provided for @envTypeTermux.
  ///
  /// In en, this message translates to:
  /// **'native Termux'**
  String get envTypeTermux;

  /// No description provided for @openShellDesc.
  ///
  /// In en, this message translates to:
  /// **'Open a Linux shell in the @envType environment'**
  String openShellDesc(String envType);

  /// No description provided for @btnInstall.
  ///
  /// In en, this message translates to:
  /// **'Install @deName'**
  String btnInstall(String deName);

  /// No description provided for @descRunningInBackground.
  ///
  /// In en, this message translates to:
  /// **'@deName is currently running in background'**
  String descRunningInBackground(String deName);

  /// No description provided for @descStartDesktop.
  ///
  /// In en, this message translates to:
  /// **'Start @deName desktop environment'**
  String descStartDesktop(String deName);

  /// No description provided for @debianShell.
  ///
  /// In en, this message translates to:
  /// **'Debian shell'**
  String get debianShell;

  /// No description provided for @openPRootenv.
  ///
  /// In en, this message translates to:
  /// **'Open the optional minimal PRoot compatibility environment'**
  String get openPRootenv;

  /// No description provided for @addApplications.
  ///
  /// In en, this message translates to:
  /// **'Add applications'**
  String get addApplications;

  /// No description provided for @installAppcomps.
  ///
  /// In en, this message translates to:
  /// **'Install applications or optional Debian compatibility'**
  String get installAppcomps;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM'**
  String get system;

  /// No description provided for @labelDistribution.
  ///
  /// In en, this message translates to:
  /// **'Distribution'**
  String get labelDistribution;

  /// No description provided for @labelDesktop.
  ///
  /// In en, this message translates to:
  /// **'Desktop Environment'**
  String get labelDesktop;

  /// No description provided for @labelGpu.
  ///
  /// In en, this message translates to:
  /// **'GPU'**
  String get labelGpu;

  /// No description provided for @labelRenderer.
  ///
  /// In en, this message translates to:
  /// **'Renderer'**
  String get labelRenderer;

  /// No description provided for @labelDevice.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get labelDevice;

  /// No description provided for @labelAndroid.
  ///
  /// In en, this message translates to:
  /// **'Android'**
  String get labelAndroid;

  /// No description provided for @labelRam.
  ///
  /// In en, this message translates to:
  /// **'RAM'**
  String get labelRam;

  /// No description provided for @labelStorageFree.
  ///
  /// In en, this message translates to:
  /// **'Storage Free'**
  String get labelStorageFree;

  /// No description provided for @labelAutomatic.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get labelAutomatic;

  /// No description provided for @desktopActive.
  ///
  /// In en, this message translates to:
  /// **'Desktop Active'**
  String get desktopActive;

  /// No description provided for @desktopIdle.
  ///
  /// In en, this message translates to:
  /// **'Desktop Idle'**
  String get desktopIdle;

  /// No description provided for @tapToStartDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Launch Desktop\" to start'**
  String get tapToStartDesc;

  /// No description provided for @hintText.
  ///
  /// In en, this message translates to:
  /// **'Enter command...'**
  String get hintText;

  /// No description provided for @appFirefoxName.
  ///
  /// In en, this message translates to:
  /// **'Firefox'**
  String get appFirefoxName;

  /// No description provided for @appFirefoxDesc.
  ///
  /// In en, this message translates to:
  /// **'Full desktop web browser.'**
  String get appFirefoxDesc;

  /// No description provided for @appCodeName.
  ///
  /// In en, this message translates to:
  /// **'Code OSS'**
  String get appCodeName;

  /// No description provided for @appCodeDesc.
  ///
  /// In en, this message translates to:
  /// **'Desktop source-code editor. This is a large download.'**
  String get appCodeDesc;

  /// No description provided for @appNodeName.
  ///
  /// In en, this message translates to:
  /// **'Node.js + npm'**
  String get appNodeName;

  /// No description provided for @appNodeDesc.
  ///
  /// In en, this message translates to:
  /// **'JavaScript runtime and package manager.'**
  String get appNodeDesc;

  /// No description provided for @appImageMagickName.
  ///
  /// In en, this message translates to:
  /// **'ImageMagick'**
  String get appImageMagickName;

  /// No description provided for @appImageMagickDesc.
  ///
  /// In en, this message translates to:
  /// **'Command-line image conversion and processing tools.'**
  String get appImageMagickDesc;

  /// No description provided for @appProotName.
  ///
  /// In en, this message translates to:
  /// **'Debian (PRoot)'**
  String get appProotName;

  /// No description provided for @appProotDesc.
  ///
  /// In en, this message translates to:
  /// **'Minimal PRoot base system. No applications are included.'**
  String get appProotDesc;

  /// Message shown when an app is successfully installed
  ///
  /// In en, this message translates to:
  /// **'@appName installed'**
  String msgInstallSuccess(String appName);

  /// Message shown when installation fails
  ///
  /// In en, this message translates to:
  /// **'@appName installation failed. See the log below.'**
  String msgInstallFailed(String appName);

  /// No description provided for @deskReady.
  ///
  /// In en, this message translates to:
  /// **'Desktop Essentials is ready'**
  String get deskReady;

  /// No description provided for @installNeeded.
  ///
  /// In en, this message translates to:
  /// **'Install only what you need. Each application is independent and can be safely retried.'**
  String get installNeeded;

  /// No description provided for @installLabel.
  ///
  /// In en, this message translates to:
  /// **'Install'**
  String get installLabel;

  /// No description provided for @packageLog.
  ///
  /// In en, this message translates to:
  /// **'Package log'**
  String get packageLog;

  /// No description provided for @installComplete.
  ///
  /// In en, this message translates to:
  /// **'Installation Complete'**
  String get installComplete;

  /// No description provided for @installFail.
  ///
  /// In en, this message translates to:
  /// **'Installation Failed'**
  String get installFail;

  /// No description provided for @configWorkstation.
  ///
  /// In en, this message translates to:
  /// **'Configuring\nLinux Workstation'**
  String get configWorkstation;

  /// No description provided for @envReady.
  ///
  /// In en, this message translates to:
  /// **'Your Linux environment is ready.'**
  String get envReady;

  /// No description provided for @downloadconfigPackages.
  ///
  /// In en, this message translates to:
  /// **'Downloading and configuring system packages.'**
  String get downloadconfigPackages;

  /// No description provided for @extractPackages.
  ///
  /// In en, this message translates to:
  /// **'Extracting packages...'**
  String get extractPackages;

  /// No description provided for @returnHome.
  ///
  /// In en, this message translates to:
  /// **'Return to Home'**
  String get returnHome;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @supportOpensource.
  ///
  /// In en, this message translates to:
  /// **'Support Open Source'**
  String get supportOpensource;

  /// No description provided for @chooseDesktop.
  ///
  /// In en, this message translates to:
  /// **'Choose Desktop'**
  String get chooseDesktop;

  /// No description provided for @desktopEssentialsDesc.
  ///
  /// In en, this message translates to:
  /// **'Desktop Essentials installs the selected desktop, terminal, file manager, and core tools. More apps can be added later.'**
  String get desktopEssentialsDesc;

  /// No description provided for @tagBest.
  ///
  /// In en, this message translates to:
  /// **'BEST'**
  String get tagBest;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @installEssentials.
  ///
  /// In en, this message translates to:
  /// **'Install Essentials'**
  String get installEssentials;

  /// No description provided for @deXfceName.
  ///
  /// In en, this message translates to:
  /// **'XFCE4'**
  String get deXfceName;

  /// No description provided for @deXfceDesc.
  ///
  /// In en, this message translates to:
  /// **'Fast, customizable, low resource usage. The best all-rounder.'**
  String get deXfceDesc;

  /// No description provided for @deXfceRam.
  ///
  /// In en, this message translates to:
  /// **'~300 MB RAM'**
  String get deXfceRam;

  /// No description provided for @deLxqtName.
  ///
  /// In en, this message translates to:
  /// **'LXQt'**
  String get deLxqtName;

  /// No description provided for @deLxqtDesc.
  ///
  /// In en, this message translates to:
  /// **'Ultra-lightweight Qt-based desktop. Fastest option.'**
  String get deLxqtDesc;

  /// No description provided for @deLxqtRam.
  ///
  /// In en, this message translates to:
  /// **'~200 MB RAM'**
  String get deLxqtRam;

  /// No description provided for @deMateName.
  ///
  /// In en, this message translates to:
  /// **'MATE'**
  String get deMateName;

  /// No description provided for @deMateDesc.
  ///
  /// In en, this message translates to:
  /// **'Classic GNOME 2 fork. Familiar and comfortable.'**
  String get deMateDesc;

  /// No description provided for @deMateRam.
  ///
  /// In en, this message translates to:
  /// **'~400 MB RAM'**
  String get deMateRam;

  /// No description provided for @deKdeName.
  ///
  /// In en, this message translates to:
  /// **'KDE Plasma'**
  String get deKdeName;

  /// No description provided for @deKdeDesc.
  ///
  /// In en, this message translates to:
  /// **'Modern, feature-rich. Needs strong GPU and 4GB+ RAM.'**
  String get deKdeDesc;

  /// No description provided for @deKdeRam.
  ///
  /// In en, this message translates to:
  /// **'~600 MB RAM'**
  String get deKdeRam;

  /// No description provided for @chooseLinux.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Linux'**
  String get chooseLinux;

  /// No description provided for @selectDistroDesc.
  ///
  /// In en, this message translates to:
  /// **'Select a distribution to install. This will be downloaded on setup.'**
  String get selectDistroDesc;

  /// No description provided for @tagRecommended.
  ///
  /// In en, this message translates to:
  /// **'RECOMMENDED'**
  String get tagRecommended;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @distroUbuntuName.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu 24.04 LTS'**
  String get distroUbuntuName;

  /// No description provided for @distroUbuntuDesc.
  ///
  /// In en, this message translates to:
  /// **'Best overall experience. Huge package library, great community support.'**
  String get distroUbuntuDesc;

  /// No description provided for @distroUbuntuSize.
  ///
  /// In en, this message translates to:
  /// **'~350 MB download'**
  String get distroUbuntuSize;

  /// No description provided for @distroAlpineName.
  ///
  /// In en, this message translates to:
  /// **'Alpine Linux 3.20'**
  String get distroAlpineName;

  /// No description provided for @distroAlpineDesc.
  ///
  /// In en, this message translates to:
  /// **'Ultra minimal and secure. Best for low resource usage.'**
  String get distroAlpineDesc;

  /// No description provided for @distroAlpineSize.
  ///
  /// In en, this message translates to:
  /// **'~3 MB download'**
  String get distroAlpineSize;

  /// No description provided for @distroKaliName.
  ///
  /// In en, this message translates to:
  /// **'Kali Linux'**
  String get distroKaliName;

  /// No description provided for @distroKaliDesc.
  ///
  /// In en, this message translates to:
  /// **'Security and pentesting tools. Wireshark, Metasploit, Nmap included.'**
  String get distroKaliDesc;

  /// No description provided for @distroKaliSize.
  ///
  /// In en, this message translates to:
  /// **'~500 MB download'**
  String get distroKaliSize;

  /// No description provided for @lowStorageTitle.
  ///
  /// In en, this message translates to:
  /// **'Low storage'**
  String get lowStorageTitle;

  /// No description provided for @lowStorageMessage.
  ///
  /// In en, this message translates to:
  /// **'Only @storage MB is available. Desktop Essentials works best with at least 2 GB free. You can continue, but package installation may fail.'**
  String lowStorageMessage(String storage);

  /// No description provided for @continueAnyway.
  ///
  /// In en, this message translates to:
  /// **'Continue anyway'**
  String get continueAnyway;

  /// No description provided for @rootDetectedTitle.
  ///
  /// In en, this message translates to:
  /// **'Root access detected'**
  String get rootDetectedTitle;

  /// No description provided for @rootDetectedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your device is rooted. Continue with the rooted chroot runtime for the best performance and full Linux support?'**
  String get rootDetectedMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @continueWithRoot.
  ///
  /// In en, this message translates to:
  /// **'Continue with root'**
  String get continueWithRoot;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @launchDroidDesk.
  ///
  /// In en, this message translates to:
  /// **'Launch DroidDesk'**
  String get launchDroidDesk;

  /// No description provided for @stepBootstrap.
  ///
  /// In en, this message translates to:
  /// **'Bootstrap environment'**
  String get stepBootstrap;

  /// No description provided for @stepRepos.
  ///
  /// In en, this message translates to:
  /// **'Configure package repositories'**
  String get stepRepos;

  /// No description provided for @stepInstallEssentials.
  ///
  /// In en, this message translates to:
  /// **'Install Desktop Essentials'**
  String get stepInstallEssentials;

  /// No description provided for @stepFinalize.
  ///
  /// In en, this message translates to:
  /// **'Finalize Desktop Essentials'**
  String get stepFinalize;

  /// No description provided for @stepRootConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Root access confirmed'**
  String get stepRootConfirmed;

  /// No description provided for @stepDownloadRootfs.
  ///
  /// In en, this message translates to:
  /// **'Download Ubuntu rootfs'**
  String get stepDownloadRootfs;

  /// No description provided for @stepInstallNative.
  ///
  /// In en, this message translates to:
  /// **'Install native packages'**
  String get stepInstallNative;

  /// No description provided for @stepExtractRootfs.
  ///
  /// In en, this message translates to:
  /// **'Extract rootfs'**
  String get stepExtractRootfs;

  /// No description provided for @stepConfigureDesktop.
  ///
  /// In en, this message translates to:
  /// **'Configure desktop'**
  String get stepConfigureDesktop;

  /// No description provided for @stepConfigureLinux.
  ///
  /// In en, this message translates to:
  /// **'Configure Linux'**
  String get stepConfigureLinux;

  /// No description provided for @phaseSetupFailed.
  ///
  /// In en, this message translates to:
  /// **'Setup Failed'**
  String get phaseSetupFailed;

  /// No description provided for @phaseDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get phaseDownloading;

  /// No description provided for @phasePreparingDownload.
  ///
  /// In en, this message translates to:
  /// **'Preparing download...'**
  String get phasePreparingDownload;

  /// No description provided for @phasePreparingRuntime.
  ///
  /// In en, this message translates to:
  /// **'Preparing Runtime'**
  String get phasePreparingRuntime;

  /// No description provided for @phaseInstallingNative.
  ///
  /// In en, this message translates to:
  /// **'Installing Native Linux'**
  String get phaseInstallingNative;

  /// No description provided for @phasePreparingTermux.
  ///
  /// In en, this message translates to:
  /// **'Preparing native Termux environment...'**
  String get phasePreparingTermux;

  /// No description provided for @phaseInstallingDesktop.
  ///
  /// In en, this message translates to:
  /// **'Installing Desktop'**
  String get phaseInstallingDesktop;

  /// No description provided for @phaseExtracting.
  ///
  /// In en, this message translates to:
  /// **'Extracting'**
  String get phaseExtracting;

  /// No description provided for @phaseExtractingFs.
  ///
  /// In en, this message translates to:
  /// **'Extracting filesystem...'**
  String get phaseExtractingFs;

  /// No description provided for @phaseSetupComplete.
  ///
  /// In en, this message translates to:
  /// **'Setup Complete!'**
  String get phaseSetupComplete;

  /// No description provided for @phaseReadyToLaunch.
  ///
  /// In en, this message translates to:
  /// **'Your Linux desktop is ready to launch.'**
  String get phaseReadyToLaunch;

  /// No description provided for @phaseSettingUp.
  ///
  /// In en, this message translates to:
  /// **'Setting Up'**
  String get phaseSettingUp;

  /// No description provided for @phaseInitializing.
  ///
  /// In en, this message translates to:
  /// **'Initializing...'**
  String get phaseInitializing;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @batteryOptimization.
  ///
  /// In en, this message translates to:
  /// **'Battery Optimization'**
  String get batteryOptimization;

  /// No description provided for @batteryOptimizationDesc.
  ///
  /// In en, this message translates to:
  /// **'Disable to prevent session killing'**
  String get batteryOptimizationDesc;

  /// No description provided for @reinstallLinux.
  ///
  /// In en, this message translates to:
  /// **'Reinstall Linux'**
  String get reinstallLinux;

  /// No description provided for @reinstallLinuxDesc.
  ///
  /// In en, this message translates to:
  /// **'Re-download and set up rootfs'**
  String get reinstallLinuxDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
