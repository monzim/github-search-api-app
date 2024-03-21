import 'package:flutter/material.dart';
import 'package:git_search/services/routers/app_router.dart';
import 'package:git_search/src/global/global.dart';
import 'package:git_search/src/pages/home/widgets/sort_button_w.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchBarSection extends HookConsumerWidget {
  const SearchBarSection({
    super.key,
    required this.contoller,
  });
  final TextEditingController contoller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      title: SearchBar(
        hintText: context.l10n.search,
        controller: contoller,
        elevation: MaterialStateProperty.all<double>(1),
        onSubmitted: (value) {
          ref.read(searchRepositoriesProvider.notifier).searchWithTerm(value);
        },
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 15)),
        leading: const Icon(Icons.search),
      ),
      actions: [
        const SortingChooseButton(),
        IconButton.filledTonal(
          onPressed: () => const SettingsRoute().push(context),
          icon: const Icon(Icons.settings),
        ),
      ],
      pinned: false,
      expandedHeight: 250,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        collapseMode: CollapseMode.parallax,
        title: Text(
          context.l10n.appTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 20,
          ),
        ),
        background: const Image(
          image: NetworkImage(
              'https://cdn-monzim-com.azureedge.net/blog/a92b9ec0-cc8c-11ee-9b9b-4d4cad20df55'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
