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

const ActivitySchema = CollectionSchema(
  name: r'Activity',
  id: -6099828696840999229,
  properties: {
    r'accentColor': PropertySchema(
      id: 0,
      name: r'accentColor',
      type: IsarType.string,
    ),
    r'activityType': PropertySchema(
      id: 1,
      name: r'activityType',
      type: IsarType.string,
    ),
    r'avgPaceSecPerKm': PropertySchema(
      id: 2,
      name: r'avgPaceSecPerKm',
      type: IsarType.double,
    ),
    r'distanceMeters': PropertySchema(
      id: 3,
      name: r'distanceMeters',
      type: IsarType.double,
    ),
    r'durationSeconds': PropertySchema(
      id: 4,
      name: r'durationSeconds',
      type: IsarType.long,
    ),
    r'elevationGainMeters': PropertySchema(
      id: 5,
      name: r'elevationGainMeters',
      type: IsarType.double,
    ),
    r'endedAt': PropertySchema(
      id: 6,
      name: r'endedAt',
      type: IsarType.dateTime,
    ),
    r'estimatedCalories': PropertySchema(
      id: 7,
      name: r'estimatedCalories',
      type: IsarType.long,
    ),
    r'exportedToStrava': PropertySchema(
      id: 8,
      name: r'exportedToStrava',
      type: IsarType.bool,
    ),
    r'lapSplits': PropertySchema(
      id: 9,
      name: r'lapSplits',
      type: IsarType.longList,
    ),
    r'paceVariancePercent': PropertySchema(
      id: 10,
      name: r'paceVariancePercent',
      type: IsarType.double,
    ),
    r'startedAt': PropertySchema(
      id: 11,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'synced': PropertySchema(id: 12, name: r'synced', type: IsarType.bool),
  },

  estimateSize: _activityEstimateSize,
  serialize: _activitySerialize,
  deserialize: _activityDeserialize,
  deserializeProp: _activityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'laps': LinkSchema(
      id: -9031073061389991699,
      name: r'laps',
      target: r'LapSplit',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _activityGetId,
  getLinks: _activityGetLinks,
  attach: _activityAttach,
  version: '3.3.2',
);

int _activityEstimateSize(
  Activity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accentColor.length * 3;
  bytesCount += 3 + object.activityType.length * 3;
  bytesCount += 3 + object.lapSplits.length * 8;
  return bytesCount;
}

void _activitySerialize(
  Activity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accentColor);
  writer.writeString(offsets[1], object.activityType);
  writer.writeDouble(offsets[2], object.avgPaceSecPerKm);
  writer.writeDouble(offsets[3], object.distanceMeters);
  writer.writeLong(offsets[4], object.durationSeconds);
  writer.writeDouble(offsets[5], object.elevationGainMeters);
  writer.writeDateTime(offsets[6], object.endedAt);
  writer.writeLong(offsets[7], object.estimatedCalories);
  writer.writeBool(offsets[8], object.exportedToStrava);
  writer.writeLongList(offsets[9], object.lapSplits);
  writer.writeDouble(offsets[10], object.paceVariancePercent);
  writer.writeDateTime(offsets[11], object.startedAt);
  writer.writeBool(offsets[12], object.synced);
}

Activity _activityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Activity();
  object.accentColor = reader.readString(offsets[0]);
  object.activityType = reader.readString(offsets[1]);
  object.avgPaceSecPerKm = reader.readDouble(offsets[2]);
  object.distanceMeters = reader.readDouble(offsets[3]);
  object.durationSeconds = reader.readLong(offsets[4]);
  object.elevationGainMeters = reader.readDouble(offsets[5]);
  object.endedAt = reader.readDateTime(offsets[6]);
  object.estimatedCalories = reader.readLong(offsets[7]);
  object.exportedToStrava = reader.readBool(offsets[8]);
  object.id = id;
  object.lapSplits = reader.readLongList(offsets[9]) ?? [];
  object.paceVariancePercent = reader.readDouble(offsets[10]);
  object.startedAt = reader.readDateTime(offsets[11]);
  object.synced = reader.readBool(offsets[12]);
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readLongList(offset) ?? []) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _activityGetId(Activity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _activityGetLinks(Activity object) {
  return [object.laps];
}

void _activityAttach(IsarCollection<dynamic> col, Id id, Activity object) {
  object.id = id;
  object.laps.attach(col, col.isar.collection<LapSplit>(), r'laps', id);
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
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
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

  QueryBuilder<Activity, Activity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
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
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ActivityQueryFilter
    on QueryBuilder<Activity, Activity, QFilterCondition> {
  QueryBuilder<Activity, Activity, QAfterFilterCondition> accentColorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  accentColorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> accentColorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> accentColorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accentColor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> accentColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> accentColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> accentColorContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> accentColorMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'accentColor',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> accentColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'accentColor', value: ''),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  accentColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'accentColor', value: ''),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> activityTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'activityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  activityTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> activityTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> activityTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activityType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  activityTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'activityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> activityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'activityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> activityTypeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'activityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> activityTypeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'activityType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  activityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activityType', value: ''),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  activityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'activityType', value: ''),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  avgPaceSecPerKmEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'avgPaceSecPerKm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  avgPaceSecPerKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'avgPaceSecPerKm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  avgPaceSecPerKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'avgPaceSecPerKm',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'avgPaceSecPerKm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> distanceMetersEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'distanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  distanceMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'distanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  distanceMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'distanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'distanceMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  durationSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'durationSeconds', value: value),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  durationSecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'durationSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  durationSecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'durationSeconds',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'durationSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  elevationGainMetersEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'elevationGainMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  elevationGainMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'elevationGainMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  elevationGainMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'elevationGainMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  elevationGainMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'elevationGainMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> endedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endedAt', value: value),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> endedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'endedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> endedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'endedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> endedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'endedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  estimatedCaloriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'estimatedCalories', value: value),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  estimatedCaloriesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'estimatedCalories',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  estimatedCaloriesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'estimatedCalories',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  estimatedCaloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'estimatedCalories',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  exportedToStravaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'exportedToStrava', value: value),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  lapSplitsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lapSplits', value: value),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  lapSplitsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lapSplits',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  lapSplitsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lapSplits',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lapSplits',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  lapSplitsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lapSplits', length, true, length, true);
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lapSplitsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lapSplits', 0, true, 0, true);
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  lapSplitsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lapSplits', 0, false, 999999, true);
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  lapSplitsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lapSplits', 0, true, length, include);
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  lapSplitsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lapSplits', length, include, 999999, true);
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  paceVariancePercentEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'paceVariancePercent',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  paceVariancePercentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'paceVariancePercent',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  paceVariancePercentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'paceVariancePercent',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
  paceVariancePercentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'paceVariancePercent',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> startedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> startedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> startedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> syncedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'synced', value: value),
      );
    });
  }
}

extension ActivityQueryObject
    on QueryBuilder<Activity, Activity, QFilterCondition> {}

extension ActivityQueryLinks
    on QueryBuilder<Activity, Activity, QFilterCondition> {
  QueryBuilder<Activity, Activity, QAfterFilterCondition> laps(
    FilterQuery<LapSplit> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'laps');
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lapsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'laps', length, true, length, true);
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lapsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'laps', 0, true, 0, true);
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lapsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'laps', 0, false, 999999, true);
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lapsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'laps', 0, true, length, include);
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lapsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'laps', length, include, 999999, true);
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lapsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'laps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ActivityQuerySortBy on QueryBuilder<Activity, Activity, QSortBy> {
  QueryBuilder<Activity, Activity, QAfterSortBy> sortByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByAccentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByActivityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByActivityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.desc);
    });
  }

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

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByElevationGainMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevationGainMeters', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
  sortByElevationGainMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevationGainMeters', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByEstimatedCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCalories', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByEstimatedCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCalories', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByPaceVariancePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paceVariancePercent', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
  sortByPaceVariancePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paceVariancePercent', Sort.desc);
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
  QueryBuilder<Activity, Activity, QAfterSortBy> thenByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByAccentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByActivityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByActivityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.desc);
    });
  }

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

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByElevationGainMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevationGainMeters', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
  thenByElevationGainMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevationGainMeters', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByEstimatedCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCalories', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByEstimatedCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCalories', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByPaceVariancePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paceVariancePercent', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
  thenByPaceVariancePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paceVariancePercent', Sort.desc);
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
  QueryBuilder<Activity, Activity, QDistinct> distinctByAccentColor({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accentColor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByActivityType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityType', caseSensitive: caseSensitive);
    });
  }

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

  QueryBuilder<Activity, Activity, QDistinct> distinctByElevationGainMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elevationGainMeters');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endedAt');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByEstimatedCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedCalories');
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

  QueryBuilder<Activity, Activity, QDistinct> distinctByPaceVariancePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paceVariancePercent');
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

  QueryBuilder<Activity, String, QQueryOperations> accentColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accentColor');
    });
  }

  QueryBuilder<Activity, String, QQueryOperations> activityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityType');
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

  QueryBuilder<Activity, double, QQueryOperations>
  elevationGainMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elevationGainMeters');
    });
  }

  QueryBuilder<Activity, DateTime, QQueryOperations> endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endedAt');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> estimatedCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedCalories');
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

  QueryBuilder<Activity, double, QQueryOperations>
  paceVariancePercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paceVariancePercent');
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

const LocationPointSchema = CollectionSchema(
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
    r'altitudeMeters': PropertySchema(
      id: 2,
      name: r'altitudeMeters',
      type: IsarType.double,
    ),
    r'lat': PropertySchema(id: 3, name: r'lat', type: IsarType.double),
    r'lng': PropertySchema(id: 4, name: r'lng', type: IsarType.double),
    r'recordedAt': PropertySchema(
      id: 5,
      name: r'recordedAt',
      type: IsarType.dateTime,
    ),
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
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _locationPointGetId,
  getLinks: _locationPointGetLinks,
  attach: _locationPointAttach,
  version: '3.3.2',
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
  writer.writeDouble(offsets[2], object.altitudeMeters);
  writer.writeDouble(offsets[3], object.lat);
  writer.writeDouble(offsets[4], object.lng);
  writer.writeDateTime(offsets[5], object.recordedAt);
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
  object.altitudeMeters = reader.readDouble(offsets[2]);
  object.id = id;
  object.lat = reader.readDouble(offsets[3]);
  object.lng = reader.readDouble(offsets[4]);
  object.recordedAt = reader.readDateTime(offsets[5]);
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
      return (reader.readDouble(offset)) as P;
    case 5:
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
  IsarCollection<dynamic> col,
  Id id,
  LocationPoint object,
) {
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
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
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
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause>
  activityIdEqualTo(int activityId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'activityId', value: [activityId]),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause>
  activityIdNotEqualTo(int activityId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [],
                upper: [activityId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [activityId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [activityId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [],
                upper: [activityId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause>
  activityIdGreaterThan(int activityId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'activityId',
          lower: [activityId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterWhereClause>
  activityIdLessThan(int activityId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'activityId',
          lower: [],
          upper: [activityId],
          includeUpper: include,
        ),
      );
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
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'activityId',
          lower: [lowerActivityId],
          includeLower: includeLower,
          upper: [upperActivityId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LocationPointQueryFilter
    on QueryBuilder<LocationPoint, LocationPoint, QFilterCondition> {
  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  accuracyMetersEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'accuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  accuracyMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  accuracyMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accuracyMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  activityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activityId', value: value),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  activityIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activityId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  activityIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activityId',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activityId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  altitudeMetersEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'altitudeMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  altitudeMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'altitudeMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  altitudeMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'altitudeMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  altitudeMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'altitudeMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> latEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  latGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> latLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lat',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lat',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> lngEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  lngGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition> lngLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lng',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lng',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recordedAt', value: value),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  recordedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recordedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterFilterCondition>
  recordedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recordedAt',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recordedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
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

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
  sortByAltitudeMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeMeters', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
  sortByAltitudeMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeMeters', Sort.desc);
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

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
  thenByAltitudeMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeMeters', Sort.asc);
    });
  }

  QueryBuilder<LocationPoint, LocationPoint, QAfterSortBy>
  thenByAltitudeMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeMeters', Sort.desc);
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

  QueryBuilder<LocationPoint, LocationPoint, QDistinct>
  distinctByAltitudeMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'altitudeMeters');
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

  QueryBuilder<LocationPoint, double, QQueryOperations>
  altitudeMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'altitudeMeters');
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

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLapSplitCollection on Isar {
  IsarCollection<LapSplit> get lapSplits => this.collection();
}

const LapSplitSchema = CollectionSchema(
  name: r'LapSplit',
  id: -2418217168977644727,
  properties: {
    r'activityId': PropertySchema(
      id: 0,
      name: r'activityId',
      type: IsarType.long,
    ),
    r'lapNumber': PropertySchema(
      id: 1,
      name: r'lapNumber',
      type: IsarType.long,
    ),
    r'markedAt': PropertySchema(
      id: 2,
      name: r'markedAt',
      type: IsarType.dateTime,
    ),
    r'splitDistanceMeters': PropertySchema(
      id: 3,
      name: r'splitDistanceMeters',
      type: IsarType.double,
    ),
    r'splitDurationSeconds': PropertySchema(
      id: 4,
      name: r'splitDurationSeconds',
      type: IsarType.long,
    ),
  },

  estimateSize: _lapSplitEstimateSize,
  serialize: _lapSplitSerialize,
  deserialize: _lapSplitDeserialize,
  deserializeProp: _lapSplitDeserializeProp,
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
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _lapSplitGetId,
  getLinks: _lapSplitGetLinks,
  attach: _lapSplitAttach,
  version: '3.3.2',
);

int _lapSplitEstimateSize(
  LapSplit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _lapSplitSerialize(
  LapSplit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.activityId);
  writer.writeLong(offsets[1], object.lapNumber);
  writer.writeDateTime(offsets[2], object.markedAt);
  writer.writeDouble(offsets[3], object.splitDistanceMeters);
  writer.writeLong(offsets[4], object.splitDurationSeconds);
}

LapSplit _lapSplitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LapSplit();
  object.activityId = reader.readLong(offsets[0]);
  object.id = id;
  object.lapNumber = reader.readLong(offsets[1]);
  object.markedAt = reader.readDateTime(offsets[2]);
  object.splitDistanceMeters = reader.readDouble(offsets[3]);
  object.splitDurationSeconds = reader.readLong(offsets[4]);
  return object;
}

P _lapSplitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lapSplitGetId(LapSplit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lapSplitGetLinks(LapSplit object) {
  return [];
}

void _lapSplitAttach(IsarCollection<dynamic> col, Id id, LapSplit object) {
  object.id = id;
}

extension LapSplitQueryWhereSort on QueryBuilder<LapSplit, LapSplit, QWhere> {
  QueryBuilder<LapSplit, LapSplit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterWhere> anyActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'activityId'),
      );
    });
  }
}

extension LapSplitQueryWhere on QueryBuilder<LapSplit, LapSplit, QWhereClause> {
  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> activityIdEqualTo(
    int activityId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'activityId', value: [activityId]),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> activityIdNotEqualTo(
    int activityId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [],
                upper: [activityId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [activityId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [activityId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [],
                upper: [activityId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> activityIdGreaterThan(
    int activityId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'activityId',
          lower: [activityId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> activityIdLessThan(
    int activityId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'activityId',
          lower: [],
          upper: [activityId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterWhereClause> activityIdBetween(
    int lowerActivityId,
    int upperActivityId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'activityId',
          lower: [lowerActivityId],
          includeLower: includeLower,
          upper: [upperActivityId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LapSplitQueryFilter
    on QueryBuilder<LapSplit, LapSplit, QFilterCondition> {
  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> activityIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activityId', value: value),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> activityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activityId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> activityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activityId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> activityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activityId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> lapNumberEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lapNumber', value: value),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> lapNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lapNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> lapNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lapNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> lapNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lapNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> markedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'markedAt', value: value),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> markedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'markedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> markedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'markedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition> markedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'markedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition>
  splitDistanceMetersEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'splitDistanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition>
  splitDistanceMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'splitDistanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition>
  splitDistanceMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'splitDistanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition>
  splitDistanceMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'splitDistanceMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition>
  splitDurationSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'splitDurationSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition>
  splitDurationSecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'splitDurationSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition>
  splitDurationSecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'splitDurationSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterFilterCondition>
  splitDurationSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'splitDurationSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LapSplitQueryObject
    on QueryBuilder<LapSplit, LapSplit, QFilterCondition> {}

extension LapSplitQueryLinks
    on QueryBuilder<LapSplit, LapSplit, QFilterCondition> {}

extension LapSplitQuerySortBy on QueryBuilder<LapSplit, LapSplit, QSortBy> {
  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> sortByActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> sortByActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.desc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> sortByLapNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapNumber', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> sortByLapNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapNumber', Sort.desc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> sortByMarkedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedAt', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> sortByMarkedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedAt', Sort.desc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> sortBySplitDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'splitDistanceMeters', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy>
  sortBySplitDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'splitDistanceMeters', Sort.desc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> sortBySplitDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'splitDurationSeconds', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy>
  sortBySplitDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'splitDurationSeconds', Sort.desc);
    });
  }
}

extension LapSplitQuerySortThenBy
    on QueryBuilder<LapSplit, LapSplit, QSortThenBy> {
  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenByActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenByActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.desc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenByLapNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapNumber', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenByLapNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapNumber', Sort.desc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenByMarkedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedAt', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenByMarkedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedAt', Sort.desc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenBySplitDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'splitDistanceMeters', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy>
  thenBySplitDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'splitDistanceMeters', Sort.desc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy> thenBySplitDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'splitDurationSeconds', Sort.asc);
    });
  }

  QueryBuilder<LapSplit, LapSplit, QAfterSortBy>
  thenBySplitDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'splitDurationSeconds', Sort.desc);
    });
  }
}

extension LapSplitQueryWhereDistinct
    on QueryBuilder<LapSplit, LapSplit, QDistinct> {
  QueryBuilder<LapSplit, LapSplit, QDistinct> distinctByActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityId');
    });
  }

  QueryBuilder<LapSplit, LapSplit, QDistinct> distinctByLapNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lapNumber');
    });
  }

  QueryBuilder<LapSplit, LapSplit, QDistinct> distinctByMarkedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'markedAt');
    });
  }

  QueryBuilder<LapSplit, LapSplit, QDistinct> distinctBySplitDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'splitDistanceMeters');
    });
  }

  QueryBuilder<LapSplit, LapSplit, QDistinct> distinctBySplitDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'splitDurationSeconds');
    });
  }
}

extension LapSplitQueryProperty
    on QueryBuilder<LapSplit, LapSplit, QQueryProperty> {
  QueryBuilder<LapSplit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LapSplit, int, QQueryOperations> activityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityId');
    });
  }

  QueryBuilder<LapSplit, int, QQueryOperations> lapNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lapNumber');
    });
  }

  QueryBuilder<LapSplit, DateTime, QQueryOperations> markedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'markedAt');
    });
  }

  QueryBuilder<LapSplit, double, QQueryOperations>
  splitDistanceMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'splitDistanceMeters');
    });
  }

  QueryBuilder<LapSplit, int, QQueryOperations> splitDurationSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'splitDurationSeconds');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppSettingsCollection on Isar {
  IsarCollection<AppSettings> get appSettings => this.collection();
}

const AppSettingsSchema = CollectionSchema(
  name: r'AppSettings',
  id: -5633561779022347008,
  properties: {
    r'accentColor': PropertySchema(
      id: 0,
      name: r'accentColor',
      type: IsarType.string,
    ),
    r'monthlyGoalKm': PropertySchema(
      id: 1,
      name: r'monthlyGoalKm',
      type: IsarType.double,
    ),
    r'stravaAccessToken': PropertySchema(
      id: 2,
      name: r'stravaAccessToken',
      type: IsarType.string,
    ),
    r'stravaUsername': PropertySchema(
      id: 3,
      name: r'stravaUsername',
      type: IsarType.string,
    ),
    r'supabaseEnabled': PropertySchema(
      id: 4,
      name: r'supabaseEnabled',
      type: IsarType.bool,
    ),
    r'units': PropertySchema(id: 5, name: r'units', type: IsarType.string),
  },

  estimateSize: _appSettingsEstimateSize,
  serialize: _appSettingsSerialize,
  deserialize: _appSettingsDeserialize,
  deserializeProp: _appSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _appSettingsGetId,
  getLinks: _appSettingsGetLinks,
  attach: _appSettingsAttach,
  version: '3.3.2',
);

int _appSettingsEstimateSize(
  AppSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accentColor.length * 3;
  {
    final value = object.stravaAccessToken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stravaUsername;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.units.length * 3;
  return bytesCount;
}

void _appSettingsSerialize(
  AppSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accentColor);
  writer.writeDouble(offsets[1], object.monthlyGoalKm);
  writer.writeString(offsets[2], object.stravaAccessToken);
  writer.writeString(offsets[3], object.stravaUsername);
  writer.writeBool(offsets[4], object.supabaseEnabled);
  writer.writeString(offsets[5], object.units);
}

AppSettings _appSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppSettings();
  object.accentColor = reader.readString(offsets[0]);
  object.id = id;
  object.monthlyGoalKm = reader.readDouble(offsets[1]);
  object.stravaAccessToken = reader.readStringOrNull(offsets[2]);
  object.stravaUsername = reader.readStringOrNull(offsets[3]);
  object.supabaseEnabled = reader.readBool(offsets[4]);
  object.units = reader.readString(offsets[5]);
  return object;
}

P _appSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appSettingsGetId(AppSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appSettingsGetLinks(AppSettings object) {
  return [];
}

void _appSettingsAttach(
  IsarCollection<dynamic> col,
  Id id,
  AppSettings object,
) {
  object.id = id;
}

extension AppSettingsQueryWhereSort
    on QueryBuilder<AppSettings, AppSettings, QWhere> {
  QueryBuilder<AppSettings, AppSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppSettingsQueryWhere
    on QueryBuilder<AppSettings, AppSettings, QWhereClause> {
  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AppSettingsQueryFilter
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {
  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accentColor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'accentColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'accentColor',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'accentColor', value: ''),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  accentColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'accentColor', value: ''),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  monthlyGoalKmEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'monthlyGoalKm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  monthlyGoalKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'monthlyGoalKm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  monthlyGoalKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'monthlyGoalKm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  monthlyGoalKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'monthlyGoalKm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'stravaAccessToken'),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'stravaAccessToken'),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stravaAccessToken',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stravaAccessToken',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stravaAccessToken',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stravaAccessToken',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'stravaAccessToken',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'stravaAccessToken',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'stravaAccessToken',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'stravaAccessToken',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stravaAccessToken', value: ''),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaAccessTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'stravaAccessToken', value: ''),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'stravaUsername'),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'stravaUsername'),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stravaUsername',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stravaUsername',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stravaUsername',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stravaUsername',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'stravaUsername',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'stravaUsername',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'stravaUsername',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'stravaUsername',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stravaUsername', value: ''),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  stravaUsernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'stravaUsername', value: ''),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  supabaseEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'supabaseEnabled', value: value),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> unitsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'units',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  unitsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'units',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> unitsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'units',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> unitsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'units',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> unitsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'units',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> unitsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'units',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> unitsContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'units',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> unitsMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'units',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> unitsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'units', value: ''),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
  unitsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'units', value: ''),
      );
    });
  }
}

extension AppSettingsQueryObject
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {}

extension AppSettingsQueryLinks
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {}

extension AppSettingsQuerySortBy
    on QueryBuilder<AppSettings, AppSettings, QSortBy> {
  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByAccentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByMonthlyGoalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyGoalKm', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  sortByMonthlyGoalKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyGoalKm', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  sortByStravaAccessToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaAccessToken', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  sortByStravaAccessTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaAccessToken', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByStravaUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaUsername', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  sortByStravaUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaUsername', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortBySupabaseEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supabaseEnabled', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  sortBySupabaseEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supabaseEnabled', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'units', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'units', Sort.desc);
    });
  }
}

extension AppSettingsQuerySortThenBy
    on QueryBuilder<AppSettings, AppSettings, QSortThenBy> {
  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByAccentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByMonthlyGoalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyGoalKm', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  thenByMonthlyGoalKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyGoalKm', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  thenByStravaAccessToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaAccessToken', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  thenByStravaAccessTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaAccessToken', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByStravaUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaUsername', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  thenByStravaUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaUsername', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenBySupabaseEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supabaseEnabled', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
  thenBySupabaseEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supabaseEnabled', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'units', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'units', Sort.desc);
    });
  }
}

extension AppSettingsQueryWhereDistinct
    on QueryBuilder<AppSettings, AppSettings, QDistinct> {
  QueryBuilder<AppSettings, AppSettings, QDistinct> distinctByAccentColor({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accentColor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QDistinct> distinctByMonthlyGoalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyGoalKm');
    });
  }

  QueryBuilder<AppSettings, AppSettings, QDistinct>
  distinctByStravaAccessToken({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'stravaAccessToken',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QDistinct> distinctByStravaUsername({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'stravaUsername',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QDistinct>
  distinctBySupabaseEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supabaseEnabled');
    });
  }

  QueryBuilder<AppSettings, AppSettings, QDistinct> distinctByUnits({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'units', caseSensitive: caseSensitive);
    });
  }
}

extension AppSettingsQueryProperty
    on QueryBuilder<AppSettings, AppSettings, QQueryProperty> {
  QueryBuilder<AppSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppSettings, String, QQueryOperations> accentColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accentColor');
    });
  }

  QueryBuilder<AppSettings, double, QQueryOperations> monthlyGoalKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyGoalKm');
    });
  }

  QueryBuilder<AppSettings, String?, QQueryOperations>
  stravaAccessTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stravaAccessToken');
    });
  }

  QueryBuilder<AppSettings, String?, QQueryOperations>
  stravaUsernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stravaUsername');
    });
  }

  QueryBuilder<AppSettings, bool, QQueryOperations> supabaseEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supabaseEnabled');
    });
  }

  QueryBuilder<AppSettings, String, QQueryOperations> unitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'units');
    });
  }
}
