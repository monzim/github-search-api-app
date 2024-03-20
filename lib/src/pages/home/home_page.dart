import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:git_search/src/services/git_search/model/enum.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';

import '/services/routers/app_router.dart';
import '/src/global/global.dart';
import 'providers/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homePageProvider(isDebug: kDebugMode));

    final sort = ref.watch(sortByProvider);

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(sort.title),

              ElevatedButton(
                  onPressed: () async {
                    ref.read(sortByProvider.notifier).change(Sort.updated);

                    // try {
                    //   final res =
                    //       await ref.read(githubSearchRepositoryProvider).search(
                    //             query: 'Flutter',
                    //             page: 10000,
                    //             perPage: 10000,
                    //           );

                    //   print(res);
                    // } catch (e) {
                    //   print(e);
                    // }
                  },
                  child: const Text('Search'))
              // MyImageWidget(),
              // SizedBox(height: 10),
              // DocumentationSection()
            ],
          ),
        ),
      ),
    );
  }
}
