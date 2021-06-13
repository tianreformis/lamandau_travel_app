import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationPageWidget extends StatefulWidget {
  InformationPageWidget({Key key}) : super(key: key);

  @override
  _InformationPageWidgetState createState() => _InformationPageWidgetState();
}

class _InformationPageWidgetState extends State<InformationPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.secondaryColor),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
    );
  }
}
