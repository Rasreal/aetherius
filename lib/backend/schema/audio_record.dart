import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'audio_record.g.dart';

abstract class AudioRecord implements Built<AudioRecord, AudioRecordBuilder> {
  static Serializer<AudioRecord> get serializer => _$audioRecordSerializer;

  String? get track;

  String? get name;

  String? get author;

  String? get genre;

  String? get coverImg;

  bool? get downloaded;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AudioRecordBuilder builder) => builder
    ..track = ''
    ..name = ''
    ..author = ''
    ..genre = ''
    ..coverImg = ''
    ..downloaded = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('audio');

  static Stream<AudioRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AudioRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AudioRecord._();
  factory AudioRecord([void Function(AudioRecordBuilder) updates]) =
      _$AudioRecord;

  static AudioRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAudioRecordData({
  String? track,
  String? name,
  String? author,
  String? genre,
  String? coverImg,
  bool? downloaded,
}) {
  final firestoreData = serializers.toFirestore(
    AudioRecord.serializer,
    AudioRecord(
      (a) => a
        ..track = track
        ..name = name
        ..author = author
        ..genre = genre
        ..coverImg = coverImg
        ..downloaded = downloaded,
    ),
  );

  return firestoreData;
}
