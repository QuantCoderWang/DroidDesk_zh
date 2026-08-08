import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:droiddesk/theme/droid_theme.dart';
import 'package:droiddesk/state/app_state.dart';
import 'package:droiddesk/services/platform_bridge.dart';
import 'package:droiddesk/screens/setup/de_install_screen.dart';
import 'package:droiddesk/screens/apps/app_catalog_screen.dart';
import 'package:droiddesk/l10n/app_localizations.dart';

/// Home dashboard — shown after setup is complete.
/// Central hub for launching the desktop, terminal, and managing the environment.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    // 注意：这里不再需要 loc，因为 HomeScreen 本身没有直接使用字符串，
    // 它只是作为容器。子组件会自己获取。

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: DroidTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // ── App Bar ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/icons/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded( // 添加 Expanded 防止溢出
                        child: _AppBarContent(state: state),
                      ),
                      IconButton(
                        onPressed: () => _showSettings(context),
                        icon: const Icon(
                          Icons.settings_rounded,
                          color: DroidTheme.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Status Card ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: _StatusCard(state: state)
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(begin: 0.05, duration: 500.ms),
                ),
              ),

              // ── Quick Actions ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                  child: _SectionTitle(titleKey: (context) => AppLocalizations.of(context)!.quickActions)
                      .animate().fadeIn(delay: 200.ms, duration: 400.ms),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                  child: Column(
                    children: [
                      // Installation is only actionable when setup is missing.
                      if (!state.isDEInstalled) ...[
                        _ActionCard(
                          icon: Icons.download_rounded,
                          titleKey: (context) => AppLocalizations.of(context)!.btnInstall(state.selectedDE.toUpperCase()),
                          subtitleKey: (context) => AppLocalizations.of(context)!.installOnetime,
                          color: DroidTheme.secondary,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const DEInstallScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                      ],

                      // ── Launch Desktop / Reconnect ──
                      if (state.isRunning)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _ActionCard(
                            icon: Icons.fullscreen_rounded,
                            titleKey: (context) => AppLocalizations.of(context)!.returnDesktop,
                            subtitleKey: (context) => AppLocalizations.of(context)!.descRunningInBackground(state.selectedDE.toUpperCase()),
                            color: DroidTheme.primary,
                            gradient: DroidTheme.primaryGradient,
                            onTap: () {
                              state.launchDesktopActivity();
                            },
                          ),
                        ),

                      _ActionCard(
                        icon: state.isRunning
                            ? Icons.stop_circle_rounded
                            : Icons.desktop_mac_rounded,
                        titleKey: (context) => state.isRunning
                            ? AppLocalizations.of(context)!.stopServer
                            : AppLocalizations.of(context)!.launchDesktop,
                        subtitleKey: (context) => state.isRunning
                            ? AppLocalizations.of(context)!.shutDownenv
                            : AppLocalizations.of(context)!.descStartDesktop(state.selectedDE.toUpperCase()),
                        color: state.isRunning
                            ? DroidTheme.error
                            : DroidTheme.primary,
                        gradient: state.isRunning
                            ? null
                            : DroidTheme.primaryGradient,
                        onTap: () async {
                          if (state.isRunning) {
                            state.stopLinux();
                          } else {
                            if (!state.isDEInstalled) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar( // 移除了 const
                                  content: Text(
                                    AppLocalizations.of(context)!.noticeNodsenv,
                                  ),
                                  backgroundColor: DroidTheme.error,
                                ),
                              );
                              return;
                            }
                            await state.startLinux(mode: 'x11');
                          }
                        },
                      ),

                      const SizedBox(height: 10),

                      // ── Terminal ──
                      _ActionCard(
                        icon: Icons.terminal_rounded,
                        titleKey: (context) => AppLocalizations.of(context)!.terminal,
                        subtitleKey: (context) =>
                            state.hasRoot ? AppLocalizations.of(context)!.envTypeChroot : AppLocalizations.of(context)!.envTypeTermux,
                        color: DroidTheme.secondary,
                        onTap: () {
                          state.useNativeTerminal();
                          _showTerminal(context, state);
                        },
                      ),

                      if (!state.hasRoot &&
                          state.optionalApps['proot_debian'] == true) ...[
                        const SizedBox(height: 10),
                        _ActionCard(
                          icon: Icons.inventory_2_rounded,
                          titleKey: (context) => AppLocalizations.of(context)!.debianShell,
                          subtitleKey: (context) => AppLocalizations.of(context)!.openPRootenv,
                          color: const Color(0xFFD70A53),
                          onTap: () => _showDebianTerminal(context, state),
                        ),
                      ],

                      const SizedBox(height: 10),

                      _ActionCard(
                        icon: Icons.apps_rounded,
                        titleKey: (context) => AppLocalizations.of(context)!.addApplications,
                        subtitleKey: (context) => AppLocalizations.of(context)!.installAppcomps,
                        color: DroidTheme.primaryLight,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const AppCatalogScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 10),
                    ].animate(interval: 80.ms).fadeIn(delay: 300.ms, duration: 400.ms).slideY(begin: 0.05, duration: 400.ms),
                  ),
                ),
              ),

              // ── System Info ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: _SectionTitle(titleKey: (context) => AppLocalizations.of(context)!.system)
                      .animate().fadeIn(delay: 500.ms, duration: 400.ms),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
                  child: _SystemInfoCard(state: state)
                      .animate().fadeIn(delay: 600.ms, duration: 400.ms),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  // ── Widgets Extracted for Scope Management ──
  void _showSettings(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      backgroundColor: DroidTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.settingsTitle, style: DroidTheme.headingLg),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.battery_charging_full,
                color: DroidTheme.warning,
              ),
              title: Text(loc.batteryOptimization),
              subtitle: Text(loc.batteryOptimizationDesc),
              onTap: () {
                DroidDeskPlatform.requestBatteryOptimization();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh, color: DroidTheme.secondary),
              title: Text(loc.reinstallLinux),
              subtitle: Text(loc.reinstallLinuxDesc),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showTerminal(BuildContext context, AppState state) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF0A0A0A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _TerminalSheet(state: state),
    );
  }

  void _showDebianTerminal(BuildContext context, AppState state) {
    _showTerminal(context, state);
    Future<void>.delayed(const Duration(milliseconds: 150), () {
      state.startDebianShell();
    });
  }
}

// ── Helper Widgets ──

class _AppBarContent extends StatelessWidget {
  final AppState state;
  const _AppBarContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(loc.appName, style: DroidTheme.headingSm),
        Text(
          state.isRunning ? loc.statusRunning : loc.statusReady,
          style: DroidTheme.bodySm.copyWith(
            color: state.isRunning
                ? DroidTheme.accent
                : DroidTheme.textMuted,
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String Function(BuildContext) titleKey;
  const _SectionTitle({required this.titleKey});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleKey(context),
      style: DroidTheme.label,
    );
  }
}

class _StatusCard extends StatelessWidget {
  final AppState state;
  const _StatusCard({required this.state});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: state.isRunning
            ? const LinearGradient(
                colors: [Color(0xFF0D2818), Color(0xFF0A1F14)],
              )
            : DroidTheme.cardGradient,
        borderRadius: BorderRadius.circular(DroidTheme.radiusLg),
        border: Border.all(
          color: state.isRunning
              ? DroidTheme.accent.withValues(alpha: 0.3)
              : DroidTheme.surfaceBorder,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: state.isRunning ? DroidTheme.accent : DroidTheme.textDim,
              boxShadow: state.isRunning
                  ? [
                      BoxShadow(
                        color: DroidTheme.accent.withValues(alpha: 0.5),
                        blurRadius: 10,
                      ),
                    ]
                  : [],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.isRunning ? loc.desktopActive : loc.desktopIdle,
                  style: DroidTheme.headingSm.copyWith(
                    color: state.isRunning
                        ? DroidTheme.accent
                        : DroidTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  state.isRunning
                      ? '${state.selectedDE.toUpperCase()} · ${_distroLabel(state.installedDistro)}'
                      : loc.tapToStartDesc,
                  style: DroidTheme.bodySm,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SystemInfoCard extends StatelessWidget {
  final AppState state;
  const _SystemInfoCard({required this.state});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DroidTheme.cardBg,
        borderRadius: BorderRadius.circular(DroidTheme.radiusMd),
        border: Border.all(color: DroidTheme.surfaceBorder),
      ),
      child: Column(
        children: [
          _infoRow(
            loc.labelDistribution,
            _distroLabel(state.installedDistro),
          ),
          _divider(),
          _infoRow(loc.labelDesktop, state.selectedDE.toUpperCase()),
          _divider(),
          _infoRow(loc.labelGpu, state.gpuType),
          _divider(),
          _infoRow(
            loc.labelRenderer,
            state.deviceInfo['graphicsMode']?.toString() ??
                loc.labelAutomatic,
          ),
          _divider(),
          _infoRow(
            loc.labelDevice,
            '${state.deviceInfo['brand'] ?? ''} ${state.deviceInfo['model'] ?? ''}',
          ),
          _divider(),
          _infoRow(
            loc.labelAndroid,
            '${state.deviceInfo['androidVersion'] ?? ''} (SDK ${state.deviceInfo['sdkVersion'] ?? ''})',
          ),
          _divider(),
          _infoRow(
            loc.labelRam,
            '${state.deviceInfo['totalRamMB'] ?? 'N/A'} MB',
          ),
          _divider(),
          _infoRow(
            loc.labelStorageFree,
            '${state.deviceInfo['availableStorageMB'] ?? 'N/A'} MB',
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(label, style: DroidTheme.bodySm),
          const Spacer(),
          Text(
            value,
            style: DroidTheme.monoSm.copyWith(color: DroidTheme.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      color: DroidTheme.surfaceBorder.withValues(alpha: 0.5),
    );
  }
}

String _distroLabel(String distro) {
  switch (distro) {
    case 'ubuntu-chroot':
      return 'Ubuntu 24.04 (chroot)';
    case 'ubuntu':
      return 'Ubuntu 24.04';
    case 'alpine':
      return 'Alpine Linux 3.20';
    case 'kali':
      return 'Kali Linux';
    case 'termux-native':
      return 'Termux Native';
    default:
      return distro;
  }
}

/// Simple terminal bottom sheet with command execution.
class _TerminalSheet extends StatefulWidget {
  final AppState state;
  const _TerminalSheet({required this.state});

  @override
  State<_TerminalSheet> createState() => _TerminalSheetState();
}

class _TerminalSheetState extends State<_TerminalSheet> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  late AppLocalizations loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loc = AppLocalizations.of(context)!;
  }

  @override
  void initState() {
    super.initState();
    widget.state.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    if (!mounted) return;
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    widget.state.removeListener(_onStateChanged);
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _runCommand() async {
    final cmd = _controller.text.trim();
    if (cmd.isEmpty) return;

    _controller.clear();
    await widget.state.executeCommand(cmd);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollCtrl) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: DroidTheme.textDim,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.terminal,
                      size: 18,
                      color: DroidTheme.secondary,
                    ),
                    const SizedBox(width: 8),
                    Text(loc.terminal, style: DroidTheme.headingSm),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.stop_circle_rounded,
                        color: DroidTheme.error,
                        size: 20,
                      ),
                      onPressed: () {
                        widget.state.interruptCommand();
                        widget.state.appendTerminalOutput(
                          '\n^C (Command interrupted)\n',
                        );
                      },
                      tooltip: 'Interrupt Command (Ctrl+C)',
                      splashRadius: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.state.isProotTerminal
                          ? 'compat · Debian PRoot'
                          : widget.state.hasRoot
                          ? 'chroot · ${_distroLabel(widget.state.installedDistro)}'
                          : 'native · Termux/TUR',
                      style: DroidTheme.monoSm,
                    ),
                  ],
                ),
              ),

              const Divider(color: DroidTheme.surfaceBorder, height: 1),

              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(12),
                  itemCount: widget.state.terminalOutput.length,
                  itemBuilder: (context, index) {
                    return SelectableText(
                      widget.state.terminalOutput[index],
                      style: DroidTheme.mono.copyWith(
                        color:
                            widget.state.terminalOutput[index].startsWith('\$')
                            ? DroidTheme.accent
                            : DroidTheme.textSecondary,
                        height: 1.4,
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(12, 8, 8, 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF0D0D0D),
                  border: Border(
                    top: BorderSide(color: DroidTheme.surfaceBorder),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '\$ ',
                      style: DroidTheme.mono.copyWith(color: DroidTheme.accent),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: DroidTheme.mono.copyWith(fontSize: 13),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: loc.hintText,
                          hintStyle: const TextStyle(color: DroidTheme.textDim),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onSubmitted: (_) => _runCommand(),
                        autofocus: true,
                      ),
                    ),
                    IconButton(
                      onPressed: _runCommand,
                      icon: const Icon(Icons.send_rounded, size: 20),
                      color: DroidTheme.primary,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 36,
                        minHeight: 36,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ── Small Action Card widget ──

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String Function(BuildContext) titleKey;
  final String Function(BuildContext) subtitleKey;
  final Color color;
  final Gradient? gradient;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.titleKey,
    required this.subtitleKey,
    required this.color,
    this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: gradient != null
              ? LinearGradient(
                  colors: [
                    color.withValues(alpha: 0.15),
                    color.withValues(alpha: 0.05),
                  ],
                )
              : null,
          color: gradient == null ? DroidTheme.cardBg : null,
          borderRadius: BorderRadius.circular(DroidTheme.radiusMd),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleKey(context), style: DroidTheme.headingSm),
                  Text(
                    subtitleKey(context),
                    style: DroidTheme.bodySm,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: DroidTheme.textDim),
          ],
        ),
      ),
    );
  }
}
