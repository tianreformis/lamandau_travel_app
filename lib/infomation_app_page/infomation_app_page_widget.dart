import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class InfomationAppPageWidget extends StatefulWidget {
  InfomationAppPageWidget({Key key}) : super(key: key);

  @override
  _InfomationAppPageWidgetState createState() =>
      _InfomationAppPageWidgetState();
}

class _InfomationAppPageWidgetState extends State<InfomationAppPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.tertiaryColor,
            size: 32,
          ),
        ),
        title: Text(
          'Informasi Aplikasi',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Ubuntu',
            color: FlutterFlowTheme.tertiaryColor,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/1611984351712.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Aplikasi ini dibuat sebagai syarat untuk penyusunan skripsi',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.title2.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await launchURL('http://facebook.com/christians.reformist');
                },
                text: 'Kristian Reformis',
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                ),
                options: FFButtonOptions(
                  width: 300,
                  height: 60,
                  color: FlutterFlowTheme.secondary1,
                  textStyle: FlutterFlowTheme.title3.override(
                    fontFamily: 'Ubuntu',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                  elevation: 4,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await launchURL('http://github.com/tianreformis');
                },
                text: 'tianreformis',
                icon: FaIcon(
                  FontAwesomeIcons.github,
                ),
                options: FFButtonOptions(
                  width: 300,
                  height: 60,
                  color: Colors.black,
                  textStyle: FlutterFlowTheme.title3.override(
                    fontFamily: 'Ubuntu',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                  elevation: 4,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF515BD4),
                      Color(0xFF8134AF),
                      Color(0xFFDD2A7B),
                      Color(0xFFFED477)
                    ],
                    stops: [0, 1, 1, 1],
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FFButtonWidget(
                  onPressed: () async {
                    await launchURL('http://instagram.com/tianreformis');
                  },
                  text: 'tianreformis',
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                  ),
                  options: FFButtonOptions(
                    width: 300,
                    height: 60,
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.title3.override(
                      fontFamily: 'Ubuntu',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                    elevation: 4,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
