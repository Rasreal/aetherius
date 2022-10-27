import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tracks_record.g.dart';

abstract class TracksRecord
    implements Built<TracksRecord, TracksRecordBuilder> {
  static Serializer<TracksRecord> get serializer => _$tracksRecordSerializer;

  String? get name;

  DocumentReference? get albumRef;

  String? get linkUrl;

  String? get img;

  String? get listeningNotes;

  String? get category;

  String? get description;

  String? get collections;

  String? get recommendation;

  String? get speaker;

  String? get length;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TracksRecordBuilder builder) => builder
    ..name = ''
    ..linkUrl = ''
    ..img = ''
    ..listeningNotes = ''
    ..category = ''
    ..description = ''
    ..collections = ''
    ..recommendation = ''
    ..speaker = ''
    ..length = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tracks');

  static Stream<TracksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TracksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TracksRecord._();
  factory TracksRecord([void Function(TracksRecordBuilder) updates]) =
      _$TracksRecord;

  static TracksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTracksRecordData({
  String? name,
  DocumentReference? albumRef,
  String? linkUrl,
  String? img,
  String? listeningNotes,
  String? category,
  String? description,
  String? collections,
  String? recommendation,
  String? speaker,
  String? length,
}) {
  final firestoreData = serializers.toFirestore(
    TracksRecord.serializer,
    TracksRecord(
      (t) => t
        ..name = name
        ..albumRef = albumRef
        ..linkUrl = linkUrl
        ..img = img
        ..listeningNotes = listeningNotes
        ..category = category
        ..description = description
        ..collections = collections
        ..recommendation = recommendation
        ..speaker = speaker
        ..length = length,
    ),
  );

  return firestoreData;
}
