// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TracksRecord> _$tracksRecordSerializer =
    new _$TracksRecordSerializer();

class _$TracksRecordSerializer implements StructuredSerializer<TracksRecord> {
  @override
  final Iterable<Type> types = const [TracksRecord, _$TracksRecord];
  @override
  final String wireName = 'TracksRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TracksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.albumRef;
    if (value != null) {
      result
        ..add('albumRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.linkUrl;
    if (value != null) {
      result
        ..add('linkUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.listeningNotes;
    if (value != null) {
      result
        ..add('listeningNotes')
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.collections;
    if (value != null) {
      result
        ..add('collections')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recommendation;
    if (value != null) {
      result
        ..add('recommendation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.speaker;
    if (value != null) {
      result
        ..add('speaker')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.length;
    if (value != null) {
      result
        ..add('length')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fav;
    if (value != null) {
      result
        ..add('fav')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  TracksRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TracksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'albumRef':
          result.albumRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'linkUrl':
          result.linkUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'listeningNotes':
          result.listeningNotes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'collections':
          result.collections = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recommendation':
          result.recommendation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'speaker':
          result.speaker = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'length':
          result.length = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fav':
          result.fav = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$TracksRecord extends TracksRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? albumRef;
  @override
  final String? linkUrl;
  @override
  final String? img;
  @override
  final String? listeningNotes;
  @override
  final String? category;
  @override
  final String? description;
  @override
  final String? collections;
  @override
  final String? recommendation;
  @override
  final String? speaker;
  @override
  final String? length;
  @override
  final bool? fav;
  @override
  final bool? downloaded;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TracksRecord([void Function(TracksRecordBuilder)? updates]) =>
      (new TracksRecordBuilder()..update(updates))._build();

  _$TracksRecord._(
      {this.name,
      this.albumRef,
      this.linkUrl,
      this.img,
      this.listeningNotes,
      this.category,
      this.description,
      this.collections,
      this.recommendation,
      this.speaker,
      this.length,
      this.fav,
      this.downloaded,
      this.ffRef})
      : super._();

  @override
  TracksRecord rebuild(void Function(TracksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TracksRecordBuilder toBuilder() => new TracksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TracksRecord &&
        name == other.name &&
        albumRef == other.albumRef &&
        linkUrl == other.linkUrl &&
        img == other.img &&
        listeningNotes == other.listeningNotes &&
        category == other.category &&
        description == other.description &&
        collections == other.collections &&
        recommendation == other.recommendation &&
        speaker == other.speaker &&
        length == other.length &&
        fav == other.fav &&
        downloaded == other.downloaded &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, name.hashCode),
                                                        albumRef.hashCode),
                                                    linkUrl.hashCode),
                                                img.hashCode),
                                            listeningNotes.hashCode),
                                        category.hashCode),
                                    description.hashCode),
                                collections.hashCode),
                            recommendation.hashCode),
                        speaker.hashCode),
                    length.hashCode),
                fav.hashCode),
            downloaded.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TracksRecord')
          ..add('name', name)
          ..add('albumRef', albumRef)
          ..add('linkUrl', linkUrl)
          ..add('img', img)
          ..add('listeningNotes', listeningNotes)
          ..add('category', category)
          ..add('description', description)
          ..add('collections', collections)
          ..add('recommendation', recommendation)
          ..add('speaker', speaker)
          ..add('length', length)
          ..add('fav', fav)
          ..add('downloaded', downloaded)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TracksRecordBuilder
    implements Builder<TracksRecord, TracksRecordBuilder> {
  _$TracksRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _albumRef;
  DocumentReference<Object?>? get albumRef => _$this._albumRef;
  set albumRef(DocumentReference<Object?>? albumRef) =>
      _$this._albumRef = albumRef;

  String? _linkUrl;
  String? get linkUrl => _$this._linkUrl;
  set linkUrl(String? linkUrl) => _$this._linkUrl = linkUrl;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  String? _listeningNotes;
  String? get listeningNotes => _$this._listeningNotes;
  set listeningNotes(String? listeningNotes) =>
      _$this._listeningNotes = listeningNotes;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _collections;
  String? get collections => _$this._collections;
  set collections(String? collections) => _$this._collections = collections;

  String? _recommendation;
  String? get recommendation => _$this._recommendation;
  set recommendation(String? recommendation) =>
      _$this._recommendation = recommendation;

  String? _speaker;
  String? get speaker => _$this._speaker;
  set speaker(String? speaker) => _$this._speaker = speaker;

  String? _length;
  String? get length => _$this._length;
  set length(String? length) => _$this._length = length;

  bool? _fav;
  bool? get fav => _$this._fav;
  set fav(bool? fav) => _$this._fav = fav;

  bool? _downloaded;
  bool? get downloaded => _$this._downloaded;
  set downloaded(bool? downloaded) => _$this._downloaded = downloaded;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TracksRecordBuilder() {
    TracksRecord._initializeBuilder(this);
  }

  TracksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _albumRef = $v.albumRef;
      _linkUrl = $v.linkUrl;
      _img = $v.img;
      _listeningNotes = $v.listeningNotes;
      _category = $v.category;
      _description = $v.description;
      _collections = $v.collections;
      _recommendation = $v.recommendation;
      _speaker = $v.speaker;
      _length = $v.length;
      _fav = $v.fav;
      _downloaded = $v.downloaded;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TracksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TracksRecord;
  }

  @override
  void update(void Function(TracksRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TracksRecord build() => _build();

  _$TracksRecord _build() {
    final _$result = _$v ??
        new _$TracksRecord._(
            name: name,
            albumRef: albumRef,
            linkUrl: linkUrl,
            img: img,
            listeningNotes: listeningNotes,
            category: category,
            description: description,
            collections: collections,
            recommendation: recommendation,
            speaker: speaker,
            length: length,
            fav: fav,
            downloaded: downloaded,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
