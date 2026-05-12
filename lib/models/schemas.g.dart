// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActivityCollection on Isar {
  IsarCollection<Activity> get activitys => this.collection();
}

final ActivitySchema = CollectionSchema(
  name: r'Activity',
  id: -6099828696840999229,
  properties: {
    r'avgPaceSecPerKm': PropertySchema(
      id: 0,
      name: r'avgPaceSecPerKm',
      type: IsarType.double,
    ),
    r'distanceMeters': PropertySchema(
      id: 1,
      name: r'distanceMeters',
      type: IsarType.double,
    ),
    r'durationSeconds': PropertySchema(
      id: 2,
      name: r'durationSeconds',
      type: IsarType.long,
    ),
    r'endedAt': PropertySchema(
      id: 3,
      name: r'endedAt',
      type: IsarType.dateTime,
    ),
    r'exportedToStrava': PropertySchema(
      id: 4,
      name: r'exportedToStrava',
      type: IsarType.bool,
    ),
    r'lapSplits': PropertySchema(
      id: 5,
      name: r'lapSplits',
      type: IsarType.longList,
    ),
    r'startedAt': PropertySchema(
      id: 6,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'synced': PropertySchema(
      id: 7,
      name: r'synced',
      type: IsarType.bool,
    )
  },
  estimateSize: _activityEstimateSize,
  serialize: _activitySerialize,
  deserialize: _activityDeserialize,
  deserializeProp: _activityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _activityGetId,
  getLinks: _activityGetLinks,
  attach: _activityAttach,
  version: '3.1.0+1',
);

int _activityEstimateSize(
  Activity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lapSplits.length * 8;
  return bytesCount;
}

void _activitySerialize(
  Activity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.avgPaceSecPerKm);
  writer.writeDouble(offsets[1], object.distanceMeters);
  writer.writeLong(offsets[2], object.durationSeconds);
  writer.writeDateTime(offsets[3], object.endedAt);
  writer.writeBool(offsets[4], object.exportedToStrava);
  writer.writeLongList(offsets[5], object.lapSplits);
  writer.writeDateTime(offsets[6], object.startedAt);
  writer.writeBool(offsets[7], object.synced);
}

Activity _activityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Activity();
  object.avgPaceSecPerKm = reader.readDouble(offsets[0]);
  object.distanceMeters = reader.readDouble(offsets[1]);
  object.durationSeconds = reader.readLong(offsets[2]);
  object.endedAt = reader.readDateTime(offsets[3]);
  object.exportedToStrava = reader.readBool(offsets[4]);
  object.id = id;
  object.lapSplits = reader.readLongList(offsets[5]) ?? [];
  object.startedAt = reader.readDateTime(offsets[6]);
  object.synced = reader.readBool(offsets[7]);
  return object;
}

P _activityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLongList(offset) ?? []) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _activityGetId(Activity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _activityGetLinks(Activity object) {
  return [];
}

void _activityAttach(IsarCollection<dynamic> col, Id id, Activity object) {
  object.id = id;
}

extension ActivityQueryWhereSort on QueryBuilder<Activity, Activity, QWhere> {
  QueryBuilder<Activity, Activity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ActivityQueryWhere on QueryBuilder<Activity, Activity, QWhereClause> {
  QueryBuilder<Activity, Activity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Activity, Activity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> idBetween(
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

extension ActivityQueryFilter
    on QueryBuilder<Activity, Activity, QFilterCondition> {
  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      avgPaceSecPerKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avgPaceSecPerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      avgPaceSecPerKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avgPaceSecPerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      avgPaceSecPerKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avgPaceSecPerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      avgPaceSecPerKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avgPaceSecPerKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> distanceMetersEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distanceMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      distanceMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distanceMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      distanceMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distanceMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> distanceMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distanceMeters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      durationSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      durationSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      durationSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      durationSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> endedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> endedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> endedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> endedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      exportedToStravaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exportedToStrava',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lapSplitsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lapSplits',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lapSplitsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lapSplits',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lapSplitsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lapSplits',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lapSplitsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lapSplits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lapSplitsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lapSplits',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lapSplitsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lapSplits',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lapSplitsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lapSplits',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lapSplitsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lapSplits',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lapSplitsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lapSplits',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lapSplitsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lapSplits',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> startedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> startedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> startedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> syncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'synced',
        value: value,
      ));
    });
  }
}

extension ActivityQueryObject
    on QueryBuilder<Activity, Activity, QFilterCondition> {}

extension ActivityQueryLinks
    on QueryBuilder<Activity, Activity, QFilterCondition> {}

extension ActivityQuerySortBy on QueryBuilder<Activity, Activity, QSortBy> {
  QueryBuilder<Activity, Activity, QAfterSortBy> sortByAvgPaceSecPerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgPaceSecPerKm', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByAvgPaceSecPerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgPaceSecPerKm', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByExportedToStrava() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exportedToStrava', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByExportedToStravaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exportedToStrava', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortBySynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synced', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortBySyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synced', Sort.desc);
    });
  }
}

extension ActivityQuerySortThenBy
    on QueryBuilder<Activity, Activity, QSortThenBy> {
  QueryBuilder<Activity, Activity, QAfterSortBy> thenByAvgPaceSecPerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgPaceSecPerKm', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByAvgPaceSecPerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgPaceSecPerKm', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByExportedToStrava() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exportedToStrava', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByExportedToStravaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exportedToStrava', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenBySynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synced', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenBySyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synced', Sort.desc);
    });
  }
}

extension ActivityQueryWhereDistinct
    on QueryBuilder<Activity, Activity, QDistinct> {
  QueryBuilder<Activity, Activity, QDistinct> distinctByAvgPaceSecPerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avgPaceSecPerKm');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceMeters');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationSeconds');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endedAt');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByExportedToStrava() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exportedToStrava');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByLapSplits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lapSplits');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctBySynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'synced');
    });
  }
}

extension ActivityQueryProperty
    on QueryBuilder<Activity, Activity, QQueryProperty> {
  QueryBuilder<Activity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Activity, double, QQueryOperations> avgPaceSecPerKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avgPaceSecPerKm');
    });
  }

  QueryBuilder<Activity, double, QQueryOperations> distanceMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceMeters');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> durationSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationSeconds');
    });
  }

  QueryBuilder<Activity, DateTime, QQueryOperations> endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endedAt');
    });
  }

  QueryBuilder<Activity, bool, QQueryOperations> exportedToStravaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exportedToStrava');
    });
  }

  QueryBuilder<Activity, List<int>, QQueryOperations> lapSplitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lapSplits');
    });
  }

  QueryBuilder<Activity, DateTime, QQueryOperations> startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<Activity, bool, QQueryOperations> syncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'synced');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocationPointCollection on Isar {
  IsarCollection<LocationPoint> get locationPoints => this.collection();
}

final LocationPointSchema = CollectionSchema(
  name: r'LocationPoint',
  id: -3394630736659185878,
  properties: {
    r'accuracyMeters': PropertySchema(
      id: 0,
      name: r'accuracyMeters',
      type: IsarType.double,
    ),
    r'activityId': PropertySchema(
      id: 1,
      name: r'activityId',
      type: IsarType.long,
    ),
    r'lat': PropertySchema(
      id: 2,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lng': PropertySchema(
      id: 3,
      name: r'lng',
      type: IsarType.double,
    ),
    r'recordedAt': PropertySchema(
      id: 4,
      name: r'recordedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _locationPointEstimateSize,
  serialize: _locationPointSerialize,
  deserialize: _locationPointDeserialize,
  deserializeProp: _locationPointDeserializeProp,
  idName: r'id',
  indexes: {
    r'activityId': IndexSchema(
      id: 8968520805042838249,
      name: r'activityId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'activityId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _locationPointGetId,
  getLinks: _locationPointGetLinks,
  attach: _locationPointAttach,
  version: '3.1.0+1',
);

int _locationPointEstimateSize(
  LocationPoint object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _locationPointSerialize(
  LocationPoint object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracyMeters);
  writer.writeLong(offsets[1], object.activityId);
  writer.writeDouble(offsets[2], object.lat);
  writer.writeDouble(offsets[3], object.lng);
  writer.writeDateTime(offsets[4], object.recordedAt);
}

LocationPoint _locationPointDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocationPoint();
  object.accuracyMeters = reader.readDouble(offsets[0]);
  object.activityId = reader.readLong(offsets[1]);
  object.id = id;
  object.lat = reader.readDouble(offsets[2]);
  object.lng = reader.readDouble(offsets[3]);
  object.recordedAt = reader.readDateTime(offsets[4]);
  return object;
}

P _locationPointDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _locationPointGetId(LocationPoint object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _locationPointGetLinks(LocationPoint object) {
  return [];
}

void _locationPointAttach(
    IsarCollection<dynamic> col, Id id, LocationPoint object) {
  object.id = id;
}

extension LocationPointQueryWhereSort
    on QueryBuilder<LocationPoint, LocationPoint, QWhere> {
  QueryBuilder<LocationPoint, LocationPoint, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhere> anyActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'activityId'),
      );
    });
  }
}

extension LocationPointQueryWhere
    on QueryBuilder<LocationPoint, LocationPoint, QWhereClause> {
  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause> idBetween(
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

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause>
      activityIdEqualTo(int activityId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'activityId',
        value: [activityId],
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause>
      activityIdNotEqualTo(int activityId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activityId',
              lower: [],
              upper: [activityId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activityId',
              lower: [activityId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activityId',
              lower: [activityId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activityId',
              lower: [],
              upper: [activityId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause>
      activityIdGreaterThan(
    int activityId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'activityId',
        lower: [activityId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause>
      activityIdLessThan(
    int activityId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'activityId',
        lower: [],
        upper: [activityId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause>
      activityIdBetween(
    int lowerActivityId,
    int upperActivityId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'activityId',
        lower: [lowerActivityId],
        includeLower: includeLower,
        upper: [upperActivityId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocationPointQueryFilter
    on QueryBuilder<LocationPoint, LocationPoint, QFilterCondition> {
  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      accuracyMetersEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracyMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      accuracyMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracyMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      accuracyMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracyMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      accuracyMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracyMeters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      activityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      activityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activityId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      activityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activityId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      activityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> latEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      latGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> latLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> latBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> lngEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      lngGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> lngLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> lngBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      recordedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      recordedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
      recordedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocationPointQueryObject
    on QueryBuilder<LocationPoint, LocationPoint, QFilterCondition> {}

extension LocationPointQueryLinks
    on QueryBuilder<LocationPoint, LocationPoint, QFilterCondition> {}

extension LocationPointQuerySortBy
    on QueryBuilder<LocationPoint, LocationPoint, QSortBy> {
  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
      sortByAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
      sortByAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> sortByActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
      sortByActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.desc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> sortByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> sortByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
      sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }
}

extension LocationPointQuerySortThenBy
    on QueryBuilder<LocationPoint, LocationPoint, QSortThenBy> {
  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
      thenByAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
      thenByAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> thenByActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
      thenByActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.desc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> thenByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> thenByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy> thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
      thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }
}

extension LocationPointQueryWhereDistinct
    on QueryBuilder<LocationPoint, LocationPoint, QDistinct> {
  QueryBuilder<LocationPoint, LocationPoint, QDistinct>
      distinctByAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracyMeters');
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QDistinct> distinctByActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityId');
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QDistinct> distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QDistinct> distinctByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lng');
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QDistinct> distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }
}

extension LocationPointQueryProperty
    on QueryBuilder<LocationPoint, LocationPoint, QQueryProperty> {
  QueryBuilder<LocationPoint, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocationPoint, double, QQueryOperations>
      accuracyMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracyMeters');
    });
  }

  QueryBuilder<LocationPoint, int, QQueryOperations> activityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityId');
    });
  }

  QueryBuilder<LocationPoint, double, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<LocationPoint, double, QQueryOperations> lngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lng');
    });
  }

  QueryBuilder<LocationPoint, DateTime, QQueryOperations> recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }
}
