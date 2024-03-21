import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';

import '/src/global/global.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({
    super.key,
    required this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(GetRepoByIdProvider(id));

    if (repo == null) {
      return Scaffold(
        body: Center(
            child: Column(
          children: <Widget>[
            Icon(
              Icons.error,
              size: 100,
              color: Theme.of(context).colorScheme.error,
            ),
            Text(
              'Error: Repository not found',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        )),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(repo.name ?? 'No name',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                repo.updatedAt?.timeAgo ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ).animate().fade(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  repo.description ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  child: ListTile(
                    title: Text(
                      repo.owner?.login ?? 'No owner',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    subtitle:
                        SelectableText(repo.owner?.htmlUrl ?? 'No owner url'),
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        repo.owner?.avatarUrl ?? '',
                      ),
                    ).animate().scale(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutBack,
                        ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.language,
                      size: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      'Language: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Text(
                      repo.language ?? 'No language',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      'Stars: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Text(
                      repo.stargazersCount.count,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.call_split,
                      size: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      'Forks: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Text(
                      repo.forksCount.count,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.remove_red_eye,
                      size: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      'Watchers: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Text(
                      repo.watchersCount.count,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.error_outline,
                      size: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      'Open issues: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Text(
                      repo.openIssuesCount.count,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.update,
                      size: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      'Last Update: ${repo.updatedAt?.format}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Wrap(
                  runSpacing: 2,
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    for (final topic in repo.topics ?? <String>[])
                      Chip(
                        label: Text(topic),
                      )
                          .animate()
                          .scale(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutBack)
                          .slideY()
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
