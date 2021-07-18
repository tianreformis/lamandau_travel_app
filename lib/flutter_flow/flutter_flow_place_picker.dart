import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

import 'flutter_flow_widgets.dart';
import 'lat_lng.dart';

class FlutterFlowPlacePicker extends StatefulWidget {
  const FlutterFlowPlacePicker({
    Key key,
    @required this.iOSGoogleMapsApiKey,
    @required this.androidGoogleMapsApiKey,
    @required this.webGoogleMapsApiKey,
    @required this.defaultText,
    @required this.icon,
    @required this.buttonOptions,
    @required this.onSelect,
    this.proxyBaseUrl,
  }) : super(key: key);

  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final String defaultText;
  final Widget icon;
  final FFButtonOptions buttonOptions;
  final Function(LatLng location) onSelect;
  final String proxyBaseUrl;

  @override
  _FFPlacePickerState createState() => _FFPlacePickerState();
}

class _FFPlacePickerState extends State<FlutterFlowPlacePicker> {
  String _selectedPlace;

  String get googleMapsApiKey {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return widget.iOSGoogleMapsApiKey;
      case TargetPlatform.android:
        return widget.androidGoogleMapsApiKey;
      default:
        return widget.webGoogleMapsApiKey;
    }
  }

  @override
  Widget build(BuildContext context) => FFButtonWidget(
        text: _selectedPlace ?? "Search places",
        icon: widget.icon,
        onPressed: () async {
          Prediction p = await PlacesAutocomplete.show(
            context: context,
            apiKey: googleMapsApiKey,
            onError: (response) =>
                print('Error occured when getting places response:'
                    '\n${response.errorMessage}'),
            mode: Mode.overlay,
            proxyBaseUrl: widget.proxyBaseUrl,
          );

          await displayPrediction(p);
        },
        options: widget.buttonOptions,
      );

  Future displayPrediction(Prediction p) async {
    if (p == null) {
      return;
    }
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: googleMapsApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
    setState(() {
      _selectedPlace = detail.result.name;
    });
    widget.onSelect(LatLng(
      detail.result.geometry.location.lat,
      detail.result.geometry.location.lng,
    ));
  }
}
