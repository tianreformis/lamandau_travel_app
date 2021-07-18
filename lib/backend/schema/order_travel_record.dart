import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

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
  String get price;

  @nullable
  DocumentReference get uid;

  @nullable
  LatLng get userLocation;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrderTravelRecordBuilder builder) => builder
    ..rute = ''
    ..seatNumber = ''
    ..price = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..phoneNumber = '';

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
  String price,
  DocumentReference uid,
  LatLng userLocation,
  String email,
  String displayName,
  String photoUrl,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        OrderTravelRecord.serializer,
        OrderTravelRecord((o) => o
          ..rute = rute
          ..users = users
          ..createdAt = createdAt
          ..seatNumber = seatNumber
          ..price = price
          ..uid = uid
          ..userLocation = userLocation
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
