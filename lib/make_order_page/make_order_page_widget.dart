import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MakeOrderPageWidget extends StatefulWidget {
  MakeOrderPageWidget({Key key}) : super(key: key);

  @override
  _MakeOrderPageWidgetState createState() => _MakeOrderPageWidgetState();
}

class _MakeOrderPageWidgetState extends State<MakeOrderPageWidget> {
  DateTime datePicked = DateTime.now();
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: InkWell(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
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
              color: FlutterFlowTheme.tertiaryColor,
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                'Buat Pesanan',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFDBE2E7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.tertiaryColor,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Tanggal Keberangkatan',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Nunito',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await DatePicker.showDatePicker(context,
                                showTitleActions: true, onConfirm: (date) {
                              setState(() => datePicked = date);
                            }, currentTime: DateTime.now());
                          },
                          icon: Icon(
                            Icons.date_range_rounded,
                            color: Colors.black,
                            size: 30,
                          ),
                          iconSize: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.tertiaryColor,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Kursi',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Nunito',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(2, 0, 10, 0),
                          child: FlutterFlowDropDown(
                            options: ['1', '2'],
                            onChanged: (value) {
                              setState(() => dropDownValue = value);
                            },
                            width: 130,
                            height: 40,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Nunito',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(4, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3, 2, 2, 2),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Simpan..'),
                                  content: Text('Yakin Simpan'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pop(alertDialogContext);
                                        final travelTime = datePicked;

                                        final orderRecordData =
                                            createOrderRecordData(
                                          travelTime: travelTime,
                                        );

                                        await OrderRecord.collection
                                            .doc()
                                            .set(orderRecordData);
                                        ;
                                      },
                                      child: Text('Ya, Konfirmasi'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          text: 'Simpan',
                          icon: Icon(
                            Icons.save_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 130,
                            height: 50,
                            color: Color(0xFF34E07A),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            elevation: 8,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 3,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(3, 2, 2, 2),
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: 'Batal',
                            icon: Icon(
                              Icons.cancel_presentation_rounded,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color: FlutterFlowTheme.customColor2,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 8,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 3,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
