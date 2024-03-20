import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import '/services/routers/app_router.dart';
import '/src/global/global.dart';
import 'providers/home_provider.dart';
import 'sections/documentation_section.dart';
import 'widgets/my_image_w.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homePageProvider(isDebug: kDebugMode));

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [
          IconButton(
            onPressed: () => const SettingsRoute().push(context),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyImageWidget(),
              SizedBox(height: 10),
              DocumentationSection()
            ],
          ),
        ),
      ),
    );
  }
}
