// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataStruct> _$dataStructSerializer = new _$DataStructSerializer();

class _$DataStructSerializer implements StructuredSerializer<DataStruct> {
  @override
  final Iterable<Type> types = const [DataStruct, _$DataStruct];
  @override
  final String wireName = 'DataStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, DataStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  DataStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$DataStruct extends DataStruct {
  @override
  final double? time;
  @override
  final DateTime? date;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DataStruct([void Function(DataStructBuilder)? updates]) =>
      (new DataStructBuilder()..update(updates))._build();

  _$DataStruct._({this.time, this.date, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DataStruct', 'firestoreUtilData');
  }

  @override
  DataStruct rebuild(void Function(DataStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataStructBuilder toBuilder() => new DataStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataStruct &&
        time == other.time &&
        date == other.date &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, time.hashCode), date.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DataStruct')
          ..add('time', time)
          ..add('date', date)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DataStructBuilder implements Builder<DataStruct, DataStructBuilder> {
  _$DataStruct? _$v;

  double? _time;
  double? get time => _$this._time;
  set time(double? time) => _$this._time = time;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DataStructBuilder() {
    DataStruct._initializeBuilder(this);
  }

  DataStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time;
      _date = $v.date;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataStruct;
  }

  @override
  void update(void Function(DataStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataStruct build() => _build();

  _$DataStruct _build() {
    final _$result = _$v ??
        new _$DataStruct._(
            time: time,
            date: date,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'DataStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
