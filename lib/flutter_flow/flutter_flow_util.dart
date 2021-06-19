import 'dart:io';

import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:json_path/json_path.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

String dateTimeFormat(String format, DateTime dateTime) {
  if (format == 'relative') {
    return timeago.format(dateTime);
  }
  return DateFormat(format).format(dateTime);
}

Future launchURL(String url) async {
  var uri = Uri.parse(url).toString();
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

DateTime get getCurrentTimestamp => DateTime.now();

dynamic getJsonField(dynamic response, String jsonPath) {
  final field = JsonPath(jsonPath).read(response);
  return field.isNotEmpty ? field.first.value : null;
}

bool get isIos => Platform.isIOS;
final locationManager = Location();
Future<LatLng> get getCurrentUserLocation async {
  var serviceEnabled = await locationManager.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await locationManager.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }
  var permissionGranted = await locationManager.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await locationManager.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }
  final location = await locationManager.getLocation();
  return location != null && location.latitude != 0 && location.longitude != 0
      ? LatLng(location.latitude, location.longitude)
      : null;
}
