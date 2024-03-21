import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:git_search/src/pages/home/widgets/sort_button_w.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';

import '/services/app_preference/providers/app_settings_provider.dart';
import '/services/themes/providers/themes_provider.dart';
import '/src/global/global.dart';
import 'providers/settings_provider.dart';
import 'sections/app_color_section.dart';
import 'sections/font_section.dart';
import 'sections/language_section.dart';
import 'widgets/theme_toggle_widget.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsPageProvider(isDebug: kDebugMode));

    final themeIcon = ref.watch(themeIconProvider);

    final itemPerPage = ref.watch(searchLimitProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settingsPageTitle),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(appSettingsProvider.notifier).reset();

          // show a dialog to choose if the user want to clear cache
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(context.l10n.clearCache),
                content: Text(context.l10n.clearCacheMessage),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(context.l10n.cancel),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(appSettingsProvider.notifier).reset();
                      Navigator.of(context).pop();
                    },
                    child: Text(context.l10n.clear),
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(
          Icons.lock_reset,
        ),
        label: Text(context.l10n.reset),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Appearance settings
            ListTile(
              title: Text(context.l10n.switchTheme),
              leading: Icon(themeIcon),
              trailing: const ThemeToggleWidget(),
            ),

            const LanguageSettingSection(),
            const FontSettingSection(),
            const AppColorSection(),

            ListTile(
              leading: const Icon(Icons.cached),
              title: Text(context.l10n.clearCache),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ref.read(appSettingsProvider.notifier).reset();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.l10n.cacheCleared),
                  ),
                );
              },
            ),

            // listtitle to choose sorting order
            ListTile(
              leading: const Icon(Icons.sort),
              title: Text(context.l10n.sortBy),
              trailing: const SortingChooseButton(),
            ),

            // a slider to choose the number of items to show
            ListTile(
              leading: const Icon(Icons.list),
              title: Text(context.l10n.itemsPerPage),
              subtitle: Slider(
                value: itemPerPage.toDouble(),
                min: 10,
                max: 100,
                divisions: 9,
                label: itemPerPage.toString(),
                onChanged: (value) {
                  ref.read(searchLimitProvider.notifier).change(value.toInt());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
