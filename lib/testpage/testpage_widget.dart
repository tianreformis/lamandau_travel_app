import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';
import 'package:mapbox_search/mapbox_search.dart';

class TestpageWidget extends StatefulWidget {
  TestpageWidget({Key key}) : super(key: key);

  @override
  _TestpageWidgetState createState() => _TestpageWidgetState();
}

class _TestpageWidgetState extends State<TestpageWidget> {
  String pilihKursiValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Pemesanan',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Ubuntu',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowDropDown(
              initialOption: 'Option',
              options: ['Option 1'],
              onChanged: (value) {
                setState(() => pilihKursiValue = value);
              },
              width: 130,
              height: 40,
              textStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Colors.transparent,
              borderWidth: 0,
              borderRadius: 0,
              margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
            ),
            FlutterFlowStaticMap(
              location: LatLng(9.341465, -79.891704),
              apiKey:
                  'pk.eyJ1IjoidGlhbnJlZm9ybWlzIiwiYSI6ImNrcTRncTI3dDAxZ3Eyb210NHJ4NjJ1dHQifQ.IDCAp-YvimdPGJ--sNjozg',
              style: MapBoxStyle.Light,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(0),
              zoom: 12,
              tilt: 0,
              rotation: 0,
            ),
            FFButtonWidget(
              onPressed: () async {
                final seatNumber = pilihKursiValue;

                final orderTravelRecordData = createOrderTravelRecordData(
                  seatNumber: seatNumber,
                );

                await OrderTravelRecord.collection
                    .doc()
                    .set(orderTravelRecordData);
              },
              text: 'Button',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
            ),
            FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Button',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
