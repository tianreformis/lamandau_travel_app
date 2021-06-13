import 'dart:math';

import 'package:latlong/latlong.dart';

final random = Random();

int get dummyInteger => random.nextInt(10);
double get dummyDouble => random.nextDouble() * 10;
bool get dummyBoolean => random.nextBool();
String get dummyString => [
      'Lorem ipsum',
      'dolor sit',
      'amet consectetur',
      'adipiscing elit'
    ][random.nextInt(4)];

// TODO: Dummy url paths are not being used anywhere
String get dummyImagePath =>
    "https://picsum.photos/seed/${random.nextInt(1000)}/400";
String get dummyVideoPath => 'https://assets.mixkit.co/videos/preview/'
    'mixkit-forest-stream-in-the-sunlight-529-large.mp4';
String get dummyAudioPath =>
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3';
DateTime get dummyTimestamp => DateTime.fromMillisecondsSinceEpoch(
    1612302574000 - (random.nextDouble() * 8000000000).round());
LatLng get dummyLatLng => LatLng(
    9.341465 + (random.nextDouble() - 0.5) * 0.0001,
    -79.891704 + (random.nextDouble() - 0.5) * 0.0001);
