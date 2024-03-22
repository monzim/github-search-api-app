import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_search/aurora.dart';

import 'common_setting.dart';
import 'services/localization/providers/localization_provider.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /* 
    --------------------------------
    Can do any async operation here
    and to check error while processing the async operation using the runZonedGuarded
    --------------------------------
  */
    GlobalSettings.appFlavor = AppFlavor.development;
    GlobalSettings.colorSchemeSeed = Colors.red;
    GlobalSettings.locale = AppLocales.bnBD;

    runApp(
      const ProviderScope(
        child: Initializer(),
      ),
    );
  }, (error, stack) {
    debugPrint('runZonedGuarded: Caught error in my root zone.');
    debugPrint(stack.toString());
  });
}
