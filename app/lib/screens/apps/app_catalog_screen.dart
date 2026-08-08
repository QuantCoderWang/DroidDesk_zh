import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:droiddesk/state/app_state.dart';
import 'package:droiddesk/theme/droid_theme.dart';
import 'package:droiddesk/l10n/app_localizations.dart';

class AppCatalogScreen extends StatefulWidget {
  const AppCatalogScreen({super.key});

  @override
  State<AppCatalogScreen> createState() => _AppCatalogScreenState();
}

class _AppCatalogScreenState extends State<AppCatalogScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppState>().refreshOptionalApps();
    });
  }

  Future<void> _install(_OptionalApp app) async {
    final state = context.read<AppState>();
    final loc = AppLocalizations.of(context)!;
    
    final ok = await state.installOptionalApp(app.id);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          ok
              ? loc.msgInstallSuccess(app.name)
              : loc.msgInstallFailed(app.name),
        ),
        backgroundColor: ok ? DroidTheme.success : DroidTheme.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final state = context.watch<AppState>();

    final baseApps = [
      _OptionalApp(
        id: 'firefox',
        name: loc.appFirefoxName,
        description: loc.appFirefoxDesc,
        icon: Icons.public_rounded,
        color: const Color(0xFFFF7139),
      ),
      _OptionalApp(
        id: 'code_oss',
        name: loc.appCodeName,
        description: loc.appCodeDesc,
        icon: Icons.code_rounded,
        color: const Color(0xFF23A8F2),
      ),
      _OptionalApp(
        id: 'nodejs',
        name: loc.appNodeName,
        description: loc.appNodeDesc,
        icon: Icons.javascript_rounded,
        color: const Color(0xFF68A063),
      ),
      _OptionalApp(
        id: 'imagemagick',
        name: loc.appImageMagickName,
        description: loc.appImageMagickDesc,
        icon: Icons.image_rounded,
        color: DroidTheme.primaryLight,
      ),
    ];

    final prootApp = _OptionalApp(
      id: 'proot_debian',
      name: loc.appProotName,
      description: loc.appProotDesc,
      icon: Icons.inventory_2_rounded,
      color: const Color(0xFFD70A53),
    );

    final apps = state.hasRoot ? baseApps : [...baseApps, prootApp];

    return Scaffold(
      appBar: AppBar(title: Text(loc.addApplications)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: DroidTheme.backgroundGradient,
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            Text(loc.deskReady, style: DroidTheme.headingMd),
            const SizedBox(height: 6),
            Text(
              loc.installNeeded,
              style: DroidTheme.bodyMd,
            ),
            const SizedBox(height: 20),
            for (final app in apps) ...[
              // 4. 传递 loc 给构建方法
              _buildAppCard(state, app, loc),
              const SizedBox(height: 10),
            ],
            if (state.installingOptionalApp != null ||
                state.optionalInstallLog.isNotEmpty) ...[
              const SizedBox(height: 12),
              // 5. 传递 loc 给构建方法
              _buildInstallPanel(state, loc),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAppCard(AppState state, _OptionalApp app, AppLocalizations loc) {
    final installed = state.optionalApps[app.id] == true;
    final installing = state.installingOptionalApp == app.id;
    final busy = state.installingOptionalApp != null;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DroidTheme.cardBg,
        borderRadius: BorderRadius.circular(DroidTheme.radiusMd),
        border: Border.all(
          color: installed
              ? DroidTheme.success.withValues(alpha: 0.45)
              : DroidTheme.surfaceBorder,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: app.color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(app.icon, color: app.color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(app.name, style: DroidTheme.headingSm),
                const SizedBox(height: 3),
                Text(app.description, style: DroidTheme.bodySm),
              ],
            ),
          ),
          const SizedBox(width: 10),
          if (installed)
            const Icon(Icons.check_circle_rounded, color: DroidTheme.success)
          else if (installing)
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            )
          else
            FilledButton(
              onPressed: busy ? null : () => _install(app),
              // 7. 替换按钮文字
              child: Text(loc.installLabel),
            ),
        ],
      ),
    );
  }

  Widget _buildInstallPanel(AppState state, AppLocalizations loc) {
    final cleanLog = state.optionalInstallLog.replaceAll(
      RegExp(r'\x1B\[[0-?]*[ -/]*[@-~]'),
      '',
    );
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF080D18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DroidTheme.surfaceBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  // 9. 替换日志标题
                  state.optionalInstallStatus.isEmpty
                      ? loc.packageLog
                      : state.optionalInstallStatus,
                  style: DroidTheme.headingSm,
                ),
              ),
              Text(
                '${(state.optionalInstallProgress * 100).round()}%',
                style: DroidTheme.monoSm,
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: state.installingOptionalApp == null
                ? null
                : state.optionalInstallProgress,
          ),
          if (cleanLog.isNotEmpty) ...[
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: SingleChildScrollView(
                reverse: true,
                child: SelectableText(
                  cleanLog,
                  style: DroidTheme.monoSm.copyWith(height: 1.35),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _OptionalApp {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color color;

  const _OptionalApp({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });
}
