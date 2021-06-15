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
  DocumentReference get users;

  @nullable
  @BuiltValueField(wireName: 'number_of_chair')
  String get numberOfChair;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrderRecordBuilder builder) =>
      builder..numberOfChair = '';

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
  DocumentReference users,
  String numberOfChair,
}) =>
    serializers.toFirestore(
        OrderRecord.serializer,
        OrderRecord((o) => o
          ..travelTime = travelTime
          ..users = users
          ..numberOfChair = numberOfChair));

OrderRecord get dummyOrderRecord {
  final builder = OrderRecordBuilder()
    ..travelTime = dummyTimestamp
    ..numberOfChair = dummyString;
  return builder.build();
}

List<OrderRecord> createDummyOrderRecord({int count}) =>
    List.generate(count, (_) => dummyOrderRecord);
