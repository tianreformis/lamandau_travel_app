import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.primaryColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    'Tiket Travel',
                    style: FlutterFlowTheme.title1.override(
                      fontFamily: 'Ubuntu',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Ubuntu',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tanggal Keberangkatan',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          Text(
                            widget.orderTravelParameter.createdAt.toString(),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Ubuntu',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Waktu Keberangaktan',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          Text(
                            '08.00 WIB',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Ubuntu',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rute',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          Text(
                            widget.orderTravelParameter.rute,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Ubuntu',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kursi',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          Text(
                            '08.00 WIB',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Ubuntu',
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
