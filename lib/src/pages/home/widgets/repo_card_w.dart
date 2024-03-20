import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:git_search/src/global/global.dart';
import 'package:git_search/src/services/git_search/model/github_repository.dart';

class RepoCardWidget extends StatelessWidget {
  const RepoCardWidget({
    super.key,
    required this.repository,
    this.index,
  });

  final GithubRepository repository;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            index.toString(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            repository.name ?? 'No name',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repository.description ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            if (repository.updatedAt != null) const SizedBox(height: 5.0),
            if (repository.updatedAt != null)
              Row(
                children: [
                  Icon(
                    Icons.update,
                    size: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    repository.updatedAt?.timeWithAgo ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
          ],
        ),
        trailing: Chip(
          shape: const StadiumBorder(
            side: BorderSide(
              color: Colors.transparent,
            ),
          ),
          avatar: Icon(
            Icons.star,
            color: Colors.yellow[600],
          ),
          label: Text(
            repository.stargazersCount?.count ?? '0',
          ),
        ),
      ),
    )
        .animate()
        .fade(duration: 500.ms)
        .slide(
          duration: 500.ms,
          begin: Offset(index! % 2 == 0 ? -1 : 1, 0),
          end: const Offset(0, 0),
        )
        .scale(
          duration: 500.ms,
        );
  }
}
