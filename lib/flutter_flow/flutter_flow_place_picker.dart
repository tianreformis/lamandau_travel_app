import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

import 'flutter_flow_widgets.dart';
import 'lat_lng.dart';

class FlutterFlowPlacePicker extends StatefulWidget {
  FlutterFlowPlacePicker({
    Key key,
    @required this.googleMapsApiKey,
    @required this.defaultText,
    @required this.icon,
    @required this.buttonOptions,
    @required this.onSelect,
  }) : super(key: key);

  String googleMapsApiKey;
  String defaultText;
  Widget icon;
  FFButtonOptions buttonOptions;
  Function(LatLng location) onSelect;

  @override
  _FFPlacePickerState createState() => _FFPlacePickerState();
}

class _FFPlacePickerState extends State<FlutterFlowPlacePicker> {
  String _selectedPlace;

  @override
  Widget build(BuildContext context) => FFButtonWidget(
        text: _selectedPlace ?? "Search places",
        icon: widget.icon,
        onPressed: () async {
          Prediction p = await PlacesAutocomplete.show(
            context: context,
            apiKey: widget.googleMapsApiKey,
            onError: (response) =>
                print('Error occured when getting places response:'
                    '\n${response.errorMessage}'),
            mode: Mode.overlay,
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
      apiKey: widget.googleMapsApiKey,
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
