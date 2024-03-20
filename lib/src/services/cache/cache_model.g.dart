// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCacheModelCollection on Isar {
  IsarCollection<CacheModel> get cacheModels => this.collection();
}

const CacheModelSchema = CollectionSchema(
  name: r'CacheModel',
  id: -4435749714086930208,
  properties: {
    r'json': PropertySchema(
      id: 0,
      name: r'json',
      type: IsarType.string,
    ),
    r'lastPage': PropertySchema(
      id: 1,
      name: r'lastPage',
      type: IsarType.long,
    ),
    r'lastUpdated': PropertySchema(
      id: 2,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'perPage': PropertySchema(
      id: 3,
      name: r'perPage',
      type: IsarType.long,
    )
  },
  estimateSize: _cacheModelEstimateSize,
  serialize: _cacheModelSerialize,
  deserialize: _cacheModelDeserialize,
  deserializeProp: _cacheModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cacheModelGetId,
  getLinks: _cacheModelGetLinks,
  attach: _cacheModelAttach,
  version: '3.1.0+1',
);

int _cacheModelEstimateSize(
  CacheModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.json;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cacheModelSerialize(
  CacheModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.json);
  writer.writeLong(offsets[1], object.lastPage);
  writer.writeDateTime(offsets[2], object.lastUpdated);
  writer.writeLong(offsets[3], object.perPage);
}

CacheModel _cacheModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CacheModel();
  object.id = id;
  object.json = reader.readStringOrNull(offsets[0]);
  object.lastPage = reader.readLongOrNull(offsets[1]);
  object.lastUpdated = reader.readDateTimeOrNull(offsets[2]);
  object.perPage = reader.readLongOrNull(offsets[3]);
  return object;
}

P _cacheModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cacheModelGetId(CacheModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cacheModelGetLinks(CacheModel object) {
  return [];
}

void _cacheModelAttach(IsarCollection<dynamic> col, Id id, CacheModel object) {
  object.id = id;
}

extension CacheModelQueryWhereSort
    on QueryBuilder<CacheModel, CacheModel, QWhere> {
  QueryBuilder<CacheModel, CacheModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CacheModelQueryWhere
    on QueryBuilder<CacheModel, CacheModel, QWhereClause> {
  QueryBuilder<CacheModel, CacheModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CacheModelQueryFilter
    on QueryBuilder<CacheModel, CacheModel, QFilterCondition> {
  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'json',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'json',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'json',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'json',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'json',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'json',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'json',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'json',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'json',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'json',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'json',
        value: '',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> jsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'json',
        value: '',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> lastPageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastPage',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      lastPageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastPage',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> lastPageEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPage',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      lastPageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastPage',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> lastPageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastPage',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> lastPageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastPage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> perPageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'perPage',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      perPageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'perPage',
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> perPageEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perPage',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition>
      perPageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'perPage',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> perPageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'perPage',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterFilterCondition> perPageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'perPage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CacheModelQueryObject
    on QueryBuilder<CacheModel, CacheModel, QFilterCondition> {}

extension CacheModelQueryLinks
    on QueryBuilder<CacheModel, CacheModel, QFilterCondition> {}

extension CacheModelQuerySortBy
    on QueryBuilder<CacheModel, CacheModel, QSortBy> {
  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> sortByJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'json', Sort.asc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> sortByJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'json', Sort.desc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> sortByLastPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPage', Sort.asc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> sortByLastPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPage', Sort.desc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> sortByPerPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perPage', Sort.asc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> sortByPerPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perPage', Sort.desc);
    });
  }
}

extension CacheModelQuerySortThenBy
    on QueryBuilder<CacheModel, CacheModel, QSortThenBy> {
  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenByJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'json', Sort.asc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenByJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'json', Sort.desc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenByLastPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPage', Sort.asc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenByLastPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPage', Sort.desc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenByPerPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perPage', Sort.asc);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QAfterSortBy> thenByPerPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perPage', Sort.desc);
    });
  }
}

extension CacheModelQueryWhereDistinct
    on QueryBuilder<CacheModel, CacheModel, QDistinct> {
  QueryBuilder<CacheModel, CacheModel, QDistinct> distinctByJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'json', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CacheModel, CacheModel, QDistinct> distinctByLastPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPage');
    });
  }

  QueryBuilder<CacheModel, CacheModel, QDistinct> distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<CacheModel, CacheModel, QDistinct> distinctByPerPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'perPage');
    });
  }
}

extension CacheModelQueryProperty
    on QueryBuilder<CacheModel, CacheModel, QQueryProperty> {
  QueryBuilder<CacheModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CacheModel, String?, QQueryOperations> jsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'json');
    });
  }

  QueryBuilder<CacheModel, int?, QQueryOperations> lastPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPage');
    });
  }

  QueryBuilder<CacheModel, DateTime?, QQueryOperations> lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<CacheModel, int?, QQueryOperations> perPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'perPage');
    });
  }
}
