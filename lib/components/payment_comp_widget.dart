import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCompWidget extends StatefulWidget {
  PaymentCompWidget({Key key}) : super(key: key);

  @override
  _PaymentCompWidgetState createState() => _PaymentCompWidgetState();
}

class _PaymentCompWidgetState extends State<PaymentCompWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        width: double.infinity,
        height: 250,
        constraints: BoxConstraints(
          maxWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.tertiaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await launchURL('https://www.visa.co.id/');
                  },
                  text: 'VISA Credit Card',
                  icon: FaIcon(
                    FontAwesomeIcons.ccVisa,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: Color(0xFF1A1F71),
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
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await launchURL('https://ib.bri.co.id/');
                  },
                  text: 'Bank BRI',
                  icon: Icon(
                    Icons.payment_sharp,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: Color(0xFF5A4976),
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
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await launchURL('https://ibank.bankmandiri.co.id/');
                  },
                  text: 'Bank Mandiri',
                  icon: Icon(
                    Icons.payment_sharp,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: Color(0xFF2D41D7),
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
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: FFButtonWidget(
                  onPressed: () async {
                    await launchURL('https://ibank.bni.co.id/');
                  },
                  text: 'Bank BNI',
                  icon: Icon(
                    Icons.payment_sharp,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: Color(0xFFD3BF89),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
