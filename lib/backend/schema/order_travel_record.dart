import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'order_travel_record.g.dart';

abstract class OrderTravelRecord
    implements Built<OrderTravelRecord, OrderTravelRecordBuilder> {
  static Serializer<OrderTravelRecord> get serializer =>
      _$orderTravelRecordSerializer;

  @nullable
  String get rute;

  @nullable
  DocumentReference get users;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'seat_number')
  String get seatNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrderTravelRecordBuilder builder) => builder
    ..rute = ''
    ..seatNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_travel');

  static Stream<OrderTravelRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrderTravelRecord._();
  factory OrderTravelRecord([void Function(OrderTravelRecordBuilder) updates]) =
      _$OrderTravelRecord;
}

Map<String, dynamic> createOrderTravelRecordData({
  String rute,
  DocumentReference users,
  DateTime createdAt,
  String seatNumber,
}) =>
    serializers.toFirestore(
        OrderTravelRecord.serializer,
        OrderTravelRecord((o) => o
          ..rute = rute
          ..users = users
          ..createdAt = createdAt
          ..seatNumber = seatNumber));

OrderTravelRecord get dummyOrderTravelRecord {
  final builder = OrderTravelRecordBuilder()
    ..rute = dummyString
    ..createdAt = dummyTimestamp
    ..seatNumber = dummyString;
  return builder.build();
}

List<OrderTravelRecord> createDummyOrderTravelRecord({int count}) =>
    List.generate(count, (_) => dummyOrderTravelRecord);
