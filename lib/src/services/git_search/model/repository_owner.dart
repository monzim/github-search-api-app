import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_owner.freezed.dart';
part 'repository_owner.g.dart';

@freezed
class RepositoryOwner with _$RepositoryOwner {
  const RepositoryOwner._();

  const factory RepositoryOwner({
    @JsonKey(name: 'login') String? login,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'node_id') String? nodeId,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'gravatar_id') String? gravatarId,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'followers_url') String? followersUrl,
    @JsonKey(name: 'following_url') String? followingUrl,
    @JsonKey(name: 'gists_url') String? gistsUrl,
    @JsonKey(name: 'starred_url') String? starredUrl,
    @JsonKey(name: 'subscriptions_url') String? subscriptionsUrl,
    @JsonKey(name: 'organizations_url') String? organizationsUrl,
    @JsonKey(name: 'repos_url') String? reposUrl,
    @JsonKey(name: 'events_url') String? eventsUrl,
    @JsonKey(name: 'received_events_url') String? receivedEventsUrl,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'site_admin') bool? siteAdmin,
  }) = _RepositoryOwner;

  factory RepositoryOwner.fromJson(Map<String, Object?> json) =>
      _$RepositoryOwnerFromJson(json);
}
