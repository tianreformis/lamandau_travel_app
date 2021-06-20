import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'seat_number_record.g.dart';

abstract class SeatNumberRecord
    implements Built<SeatNumberRecord, SeatNumberRecordBuilder> {
  static Serializer<SeatNumberRecord> get serializer =>
      _$seatNumberRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Kursi')
  String get kursi;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SeatNumberRecordBuilder builder) =>
      builder..kursi = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('seatNumber');

  static Stream<SeatNumberRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SeatNumberRecord._();
  factory SeatNumberRecord([void Function(SeatNumberRecordBuilder) updates]) =
      _$SeatNumberRecord;

  static SeatNumberRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createSeatNumberRecordData({
  String kursi,
}) =>
    serializers.toFirestore(
        SeatNumberRecord.serializer, SeatNumberRecord((s) => s..kursi = kursi));

SeatNumberRecord get dummySeatNumberRecord {
  final builder = SeatNumberRecordBuilder()..kursi = dummyString;
  return builder.build();
}

List<SeatNumberRecord> createDummySeatNumberRecord({int count}) =>
    List.generate(count, (_) => dummySeatNumberRecord);
