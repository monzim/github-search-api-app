import 'package:git_search/services/local_storage/isar/constants/isar_constants.dart';
import 'package:isar/isar.dart';

part 'cache_model.g.dart';

@collection
class CacheModel {
  Id id = IsarConstantsCollections.cache;

  DateTime? lastUpdated;
  int? lastPage;
  int? perPage;

  String? json;
  String? searchQuery;
}
