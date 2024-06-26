import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_search/common_setting.dart';

import '/src/pages/splash/splash_scree.dart';
import 'services/app_preference/providers/app_settings_provider.dart';
import 'services/localization/providers/localization_provider.dart';
import 'services/routers/router_provider.dart';
import 'services/themes/helpers/dark_mode/dark_mode_helper.dart';
import 'services/themes/helpers/light_mode/light_mode_helper.dart';
import 'services/themes/providers/theme_mode_provider.dart';

class Initializer extends ConsumerWidget {
  const Initializer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSetting = ref.watch(appSettingsProvider);

    return appSetting.when(
      skipLoadingOnRefresh: true,
      data: (value) => const AuroraApp(),
      loading: () => const SplashScreen(),
      error: (error, stack) => const AuroraApp(),
    );
  }
}

/*
  --------------------------------
  AuroraApp
  https://docs.aurora.monzim.com
  --------------------------------
  This is app using the Aurora Architecture.
  --------------------------------
 */
class AuroraApp extends ConsumerWidget {
  const AuroraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeServiceProvider);
    final routerConfig = ref.watch(routerProvider);
    final locale = ref.watch(appLocalizationServiceProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner:
          GlobalSettings.appFlavor == AppFlavor.development,
      routerConfig: routerConfig,
      themeMode: themeMode,
      theme: ref.watch(lightThemeProvider),
      darkTheme: ref.watch(darkThemeProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
    );
  }
}
