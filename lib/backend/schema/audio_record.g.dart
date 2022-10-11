// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AudioRecord> _$audioRecordSerializer = new _$AudioRecordSerializer();

class _$AudioRecordSerializer implements StructuredSerializer<AudioRecord> {
  @override
  final Iterable<Type> types = const [AudioRecord, _$AudioRecord];
  @override
  final String wireName = 'AudioRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AudioRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.track;
    if (value != null) {
      result
        ..add('track')
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
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genre;
    if (value != null) {
      result
        ..add('genre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coverImg;
    if (value != null) {
      result
        ..add('coverImg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.downloaded;
    if (value != null) {
      result
        ..add('downloaded')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  AudioRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AudioRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'track':
          result.track = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'genre':
          result.genre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'coverImg':
          result.coverImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'downloaded':
          result.downloaded = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$AudioRecord extends AudioRecord {
  @override
  final String? track;
  @override
  final String? name;
  @override
  final String? author;
  @override
  final String? genre;
  @override
  final String? coverImg;
  @override
  final bool? downloaded;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AudioRecord([void Function(AudioRecordBuilder)? updates]) =>
      (new AudioRecordBuilder()..update(updates))._build();

  _$AudioRecord._(
      {this.track,
      this.name,
      this.author,
      this.genre,
      this.coverImg,
      this.downloaded,
      this.ffRef})
      : super._();

  @override
  AudioRecord rebuild(void Function(AudioRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AudioRecordBuilder toBuilder() => new AudioRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AudioRecord &&
        track == other.track &&
        name == other.name &&
        author == other.author &&
        genre == other.genre &&
        coverImg == other.coverImg &&
        downloaded == other.downloaded &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, track.hashCode), name.hashCode),
                        author.hashCode),
                    genre.hashCode),
                coverImg.hashCode),
            downloaded.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AudioRecord')
          ..add('track', track)
          ..add('name', name)
          ..add('author', author)
          ..add('genre', genre)
          ..add('coverImg', coverImg)
          ..add('downloaded', downloaded)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AudioRecordBuilder implements Builder<AudioRecord, AudioRecordBuilder> {
  _$AudioRecord? _$v;

  String? _track;
  String? get track => _$this._track;
  set track(String? track) => _$this._track = track;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _author;
  String? get author => _$this._author;
  set author(String? author) => _$this._author = author;

  String? _genre;
  String? get genre => _$this._genre;
  set genre(String? genre) => _$this._genre = genre;

  String? _coverImg;
  String? get coverImg => _$this._coverImg;
  set coverImg(String? coverImg) => _$this._coverImg = coverImg;

  bool? _downloaded;
  bool? get downloaded => _$this._downloaded;
  set downloaded(bool? downloaded) => _$this._downloaded = downloaded;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AudioRecordBuilder() {
    AudioRecord._initializeBuilder(this);
  }

  AudioRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _track = $v.track;
      _name = $v.name;
      _author = $v.author;
      _genre = $v.genre;
      _coverImg = $v.coverImg;
      _downloaded = $v.downloaded;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AudioRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AudioRecord;
  }

  @override
  void update(void Function(AudioRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AudioRecord build() => _build();

  _$AudioRecord _build() {
    final _$result = _$v ??
        new _$AudioRecord._(
            track: track,
            name: name,
            author: author,
            genre: genre,
            coverImg: coverImg,
            downloaded: downloaded,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
