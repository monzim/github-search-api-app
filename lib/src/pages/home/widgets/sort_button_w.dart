import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_search/src/services/git_search/model/enum.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';

class SortingChooseButton extends ConsumerWidget {
  const SortingChooseButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sort = ref.watch(sortByProvider);

    return PopupMenuButton<Sort>(
      enableFeedback: true,
      iconColor: Theme.of(context).colorScheme.primary,
      icon: Icon(sort.icon),
      tooltip: 'Sort by',
      itemBuilder: (context) => Sort.values
          .map((e) => PopupMenuItem<Sort>(
                value: e,
                onTap: () {
                  ref.read(sortByProvider.notifier).change(e);
                  ref.read(searchRepositoriesProvider.notifier).sortItems(e);
                },
                child: Row(
                  children: [
                    Icon(e.icon,
                        color: e == sort
                            ? Theme.of(context).colorScheme.primary
                            : null),
                    const SizedBox(width: 8),
                    Text(e.title),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
