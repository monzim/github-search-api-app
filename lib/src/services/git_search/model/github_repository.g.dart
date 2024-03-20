// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubRepositoryImpl _$$GithubRepositoryImplFromJson(
        Map<String, dynamic> json) =>
    _$GithubRepositoryImpl(
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      private: json['private'] as bool?,
      owner: json['owner'] == null
          ? null
          : RepositoryOwner.fromJson(json['owner'] as Map<String, dynamic>),
      htmlUrl: json['html_url'] as String?,
      description: json['description'] as String?,
      fork: json['fork'] as bool?,
      url: json['url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      pushedAt: json['pushed_at'] as String?,
      gitUrl: json['git_url'] as String?,
      sshUrl: json['ssh_url'] as String?,
      cloneUrl: json['clone_url'] as String?,
      svnUrl: json['svn_url'] as String?,
      homepage: json['homepage'] as String?,
      size: json['size'] as int?,
      stargazersCount: json['stargazers_count'] as int?,
      watchersCount: json['watchers_count'] as int?,
      language: json['language'] as String?,
      hasIssues: json['has_issues'] as bool?,
      hasProjects: json['has_projects'] as bool?,
      hasDownloads: json['has_downloads'] as bool?,
      hasWiki: json['has_wiki'] as bool?,
      hasPages: json['has_pages'] as bool?,
      hasDiscussions: json['has_discussions'] as bool?,
      forksCount: json['forks_count'] as int?,
      mirrorUrl: json['mirror_url'] as String?,
      archived: json['archived'] as bool?,
      disabled: json['disabled'] as bool?,
      openIssuesCount: json['open_issues_count'] as int?,
      license: json['license'] == null
          ? null
          : License.fromJson(json['license'] as Map<String, dynamic>),
      allowForking: json['allow_forking'] as bool?,
      isTemplate: json['is_template'] as bool?,
      webCommitSignoffRequired: json['web_commit_signoff_required'] as bool?,
      topics:
          (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList(),
      visibility: json['visibility'] as String?,
      forks: json['forks'] as int?,
      openIssues: json['open_issues'] as int?,
      watchers: json['watchers'] as int?,
      defaultBranch: json['default_branch'] as String?,
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$GithubRepositoryImplToJson(
        _$GithubRepositoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'fork': instance.fork,
      'url': instance.url,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'pushed_at': instance.pushedAt,
      'git_url': instance.gitUrl,
      'ssh_url': instance.sshUrl,
      'clone_url': instance.cloneUrl,
      'svn_url': instance.svnUrl,
      'homepage': instance.homepage,
      'size': instance.size,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'language': instance.language,
      'has_issues': instance.hasIssues,
      'has_projects': instance.hasProjects,
      'has_downloads': instance.hasDownloads,
      'has_wiki': instance.hasWiki,
      'has_pages': instance.hasPages,
      'has_discussions': instance.hasDiscussions,
      'forks_count': instance.forksCount,
      'mirror_url': instance.mirrorUrl,
      'archived': instance.archived,
      'disabled': instance.disabled,
      'open_issues_count': instance.openIssuesCount,
      'license': instance.license,
      'allow_forking': instance.allowForking,
      'is_template': instance.isTemplate,
      'web_commit_signoff_required': instance.webCommitSignoffRequired,
      'topics': instance.topics,
      'visibility': instance.visibility,
      'forks': instance.forks,
      'open_issues': instance.openIssues,
      'watchers': instance.watchers,
      'default_branch': instance.defaultBranch,
      'score': instance.score,
    };
