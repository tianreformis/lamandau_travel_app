import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';

class TestpageWidget extends StatefulWidget {
  TestpageWidget({Key key}) : super(key: key);

  @override
  _TestpageWidgetState createState() => _TestpageWidgetState();
}

class _TestpageWidgetState extends State<TestpageWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: textController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Alamat Jemput',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Ubuntu',
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: IconButton(
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                      icon: Icon(
                        Icons.search_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      iconSize: 30,
                    ),
                  )
                ],
              ),
            ),
            FlutterFlowStaticMap(
              location: LatLng(9.341465, -79.891704),
              apiKey:
                  'pk.eyJ1IjoidGlhbnJlZm9ybWlzIiwiYSI6ImNrcTRncTI3dDAxZ3Eyb210NHJ4NjJ1dHQifQ.IDCAp-YvimdPGJ--sNjozg',
              style: MapBoxStyle.Light,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(0),
              markerColor: FlutterFlowTheme.secondaryColor,
              cached: true,
              zoom: 12,
              tilt: 0,
              rotation: 0,
            )
          ],
        ),
      ),
    );
  }
}
