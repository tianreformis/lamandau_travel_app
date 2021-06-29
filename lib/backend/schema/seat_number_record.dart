import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'seat_number_record.g.dart';

abstract class SeatNumberRecord
    implements Built<SeatNumberRecord, SeatNumberRecordBuilder> {
  static Serializer<SeatNumberRecord> get serializer =>
      _$seatNumberRecordSerializer;

  @nullable
  BuiltList<String> get route;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SeatNumberRecordBuilder builder) =>
      builder..route = ListBuilder();

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

Map<String, dynamic> createSeatNumberRecordData() => serializers.toFirestore(
    SeatNumberRecord.serializer, SeatNumberRecord((s) => s..route = null));
