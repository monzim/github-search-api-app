import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_search/src/services/git_search/model/license.dart';
import 'package:git_search/src/services/git_search/model/repository_owner.dart';

part 'github_repository.freezed.dart';
part 'github_repository.g.dart';

@freezed
class GithubRepository with _$GithubRepository {
  const GithubRepository._();

  const factory GithubRepository({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'node_id') String? nodeId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'private') bool? private,
    @JsonKey(name: 'owner') RepositoryOwner? owner,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'fork') bool? fork,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'pushed_at') String? pushedAt,
    @JsonKey(name: 'git_url') String? gitUrl,
    @JsonKey(name: 'ssh_url') String? sshUrl,
    @JsonKey(name: 'clone_url') String? cloneUrl,
    @JsonKey(name: 'svn_url') String? svnUrl,
    @JsonKey(name: 'homepage') String? homepage,
    @JsonKey(name: 'size') int? size,
    @JsonKey(name: 'stargazers_count') int? stargazersCount,
    @JsonKey(name: 'watchers_count') int? watchersCount,
    @JsonKey(name: 'language') String? language,
    @JsonKey(name: 'has_issues') bool? hasIssues,
    @JsonKey(name: 'has_projects') bool? hasProjects,
    @JsonKey(name: 'has_downloads') bool? hasDownloads,
    @JsonKey(name: 'has_wiki') bool? hasWiki,
    @JsonKey(name: 'has_pages') bool? hasPages,
    @JsonKey(name: 'has_discussions') bool? hasDiscussions,
    @JsonKey(name: 'forks_count') int? forksCount,
    @JsonKey(name: 'mirror_url') String? mirrorUrl,
    @JsonKey(name: 'archived') bool? archived,
    @JsonKey(name: 'disabled') bool? disabled,
    @JsonKey(name: 'open_issues_count') int? openIssuesCount,
    @JsonKey(name: 'license') License? license,
    @JsonKey(name: 'allow_forking') bool? allowForking,
    @JsonKey(name: 'is_template') bool? isTemplate,
    @JsonKey(name: 'web_commit_signoff_required')
    bool? webCommitSignoffRequired,
    @JsonKey(name: 'topics') List<String>? topics,
    @JsonKey(name: 'visibility') String? visibility,
    @JsonKey(name: 'forks') int? forks,
    @JsonKey(name: 'open_issues') int? openIssues,
    @JsonKey(name: 'watchers') int? watchers,
    @JsonKey(name: 'default_branch') String? defaultBranch,
    @JsonKey(name: 'score') double? score,
  }) = _GithubRepository;

  factory GithubRepository.fromJson(Map<String, Object?> json) =>
      _$GithubRepositoryFromJson(json);
}
