import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'album_record.g.dart';

abstract class AlbumRecord implements Built<AlbumRecord, AlbumRecordBuilder> {
  static Serializer<AlbumRecord> get serializer => _$albumRecordSerializer;

  String? get img;

  String? get name;

  String? get artist;

  String? get category;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AlbumRecordBuilder builder) => builder
    ..img = ''
    ..name = ''
    ..artist = ''
    ..category = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('album');

  static Stream<AlbumRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AlbumRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AlbumRecord._();
  factory AlbumRecord([void Function(AlbumRecordBuilder) updates]) =
      _$AlbumRecord;

  static AlbumRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAlbumRecordData({
  String? img,
  String? name,
  String? artist,
  String? category,
}) {
  final firestoreData = serializers.toFirestore(
    AlbumRecord.serializer,
    AlbumRecord(
      (a) => a
        ..img = img
        ..name = name
        ..artist = artist
        ..category = category,
    ),
  );

  return firestoreData;
}
