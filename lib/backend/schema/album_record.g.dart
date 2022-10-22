// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AlbumRecord> _$albumRecordSerializer = new _$AlbumRecordSerializer();

class _$AlbumRecordSerializer implements StructuredSerializer<AlbumRecord> {
  @override
  final Iterable<Type> types = const [AlbumRecord, _$AlbumRecord];
  @override
  final String wireName = 'AlbumRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AlbumRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.artist;
    if (value != null) {
      result
        ..add('artist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AlbumRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'artist':
          result.artist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AlbumRecord extends AlbumRecord {
  @override
  final String? img;
  @override
  final String? name;
  @override
  final String? artist;
  @override
  final String? category;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AlbumRecord([void Function(AlbumRecordBuilder)? updates]) =>
      (new AlbumRecordBuilder()..update(updates))._build();

  _$AlbumRecord._({this.img, this.name, this.artist, this.category, this.ffRef})
      : super._();

  @override
  AlbumRecord rebuild(void Function(AlbumRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumRecordBuilder toBuilder() => new AlbumRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AlbumRecord &&
        img == other.img &&
        name == other.name &&
        artist == other.artist &&
        category == other.category &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, img.hashCode), name.hashCode), artist.hashCode),
            category.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AlbumRecord')
          ..add('img', img)
          ..add('name', name)
          ..add('artist', artist)
          ..add('category', category)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AlbumRecordBuilder implements Builder<AlbumRecord, AlbumRecordBuilder> {
  _$AlbumRecord? _$v;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _artist;
  String? get artist => _$this._artist;
  set artist(String? artist) => _$this._artist = artist;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AlbumRecordBuilder() {
    AlbumRecord._initializeBuilder(this);
  }

  AlbumRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _img = $v.img;
      _name = $v.name;
      _artist = $v.artist;
      _category = $v.category;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AlbumRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AlbumRecord;
  }

  @override
  void update(void Function(AlbumRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AlbumRecord build() => _build();

  _$AlbumRecord _build() {
    final _$result = _$v ??
        new _$AlbumRecord._(
            img: img,
            name: name,
            artist: artist,
            category: category,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
