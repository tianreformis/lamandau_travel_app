import 'dart:async';

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
  @BuiltValueField(wireName: 'switch_seat')
  bool get switchSeat;

  @nullable
  String get price;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrderTravelRecordBuilder builder) => builder
    ..rute = ''
    ..seatNumber = ''
    ..switchSeat = false
    ..price = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_travel');

  static Stream<OrderTravelRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrderTravelRecord._();
  factory OrderTravelRecord([void Function(OrderTravelRecordBuilder) updates]) =
      _$OrderTravelRecord;

  static OrderTravelRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrderTravelRecordData({
  String rute,
  DocumentReference users,
  DateTime createdAt,
  String seatNumber,
  bool switchSeat,
  String price,
}) =>
    serializers.toFirestore(
        OrderTravelRecord.serializer,
        OrderTravelRecord((o) => o
          ..rute = rute
          ..users = users
          ..createdAt = createdAt
          ..seatNumber = seatNumber
          ..switchSeat = switchSeat
          ..price = price));

OrderTravelRecord get dummyOrderTravelRecord {
  final builder = OrderTravelRecordBuilder()
    ..rute = dummyString
    ..createdAt = dummyTimestamp
    ..seatNumber = dummyString
    ..switchSeat = dummyBoolean
    ..price = dummyString;
  return builder.build();
}

List<OrderTravelRecord> createDummyOrderTravelRecord({int count}) =>
    List.generate(count, (_) => dummyOrderTravelRecord);
