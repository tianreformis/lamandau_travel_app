import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'order_record.g.dart';

abstract class OrderRecord implements Built<OrderRecord, OrderRecordBuilder> {
  static Serializer<OrderRecord> get serializer => _$orderRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'travel_time')
  DateTime get travelTime;

  @nullable
  @BuiltValueField(wireName: 'number_of_chair')
  int get numberOfChair;

  @nullable
  DocumentReference get users;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrderRecordBuilder builder) =>
      builder..numberOfChair = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrderRecord._();
  factory OrderRecord([void Function(OrderRecordBuilder) updates]) =
      _$OrderRecord;
}

Map<String, dynamic> createOrderRecordData({
  DateTime travelTime,
  int numberOfChair,
  DocumentReference users,
}) =>
    serializers.toFirestore(
        OrderRecord.serializer,
        OrderRecord((o) => o
          ..travelTime = travelTime
          ..numberOfChair = numberOfChair
          ..users = users));

OrderRecord get dummyOrderRecord {
  final builder = OrderRecordBuilder()
    ..travelTime = dummyTimestamp
    ..numberOfChair = dummyInteger;
  return builder.build();
}

List<OrderRecord> createDummyOrderRecord({int count}) =>
    List.generate(count, (_) => dummyOrderRecord);
