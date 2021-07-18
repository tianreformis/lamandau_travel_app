import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';
import '../testpage/testpage_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:page_transition/page_transition.dart';

class ReportPageWidget extends StatefulWidget {
  ReportPageWidget({
    Key key,
    this.orderTravelParameter,
    this.userRecord,
  }) : super(key: key);

  final OrderTravelRecord orderTravelParameter;
  final DocumentReference userRecord;

  @override
  _ReportPageWidgetState createState() => _ReportPageWidgetState();
}

class _ReportPageWidgetState extends State<ReportPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrderTravelRecord>(
      stream:
          OrderTravelRecord.getDocument(widget.orderTravelParameter.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        final reportPageOrderTravelRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0x00A2DBFA),
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: InkWell(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0x00EC5555),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.tertiaryColor,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: TestpageWidget(),
                        ),
                      );
                    },
                    child: Text(
                      'Tiket Travel',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.primaryColor,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: double.infinity,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Text(
                                widget.orderTravelParameter.rute,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.title2.override(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Nama Penumpang',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Tanggal Keberangkatan',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                dateTimeFormat('MMMMEEEEd',
                                    widget.orderTravelParameter.createdAt),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Jam Keberangkatan',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                dateTimeFormat('Hm',
                                    widget.orderTravelParameter.createdAt),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Nomor Kursi',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                widget.orderTravelParameter.seatNumber,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Lokasi Jemput',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: FlutterFlowStaticMap(
                                location:
                                    widget.orderTravelParameter.userLocation,
                                apiKey:
                                    'pk.eyJ1IjoidGlhbnJlZm9ybWlzIiwiYSI6ImNrcTRncTI3dDAxZ3Eyb210NHJ4NjJ1dHQifQ.IDCAp-YvimdPGJ--sNjozg',
                                style: MapBoxStyle.Outdoors,
                                width: 150,
                                height: 340,
                                fit: BoxFit.cover,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                                cached: true,
                                zoom: 12,
                                tilt: 0,
                                rotation: 0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
