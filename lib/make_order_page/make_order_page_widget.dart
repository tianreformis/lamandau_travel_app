import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MakeOrderPageWidget extends StatefulWidget {
  MakeOrderPageWidget({
    Key key,
    this.makeOrderParamater,
  }) : super(key: key);

  final OrderTravelRecord makeOrderParamater;

  @override
  _MakeOrderPageWidgetState createState() => _MakeOrderPageWidgetState();
}

class _MakeOrderPageWidgetState extends State<MakeOrderPageWidget> {
  DateTimeRange calendarSelectedDay;
  String radioButtonPilihKursiValue;
  TextEditingController textController;
  OrderTravelRecord RadioButton_PilihKursi;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    textController = TextEditingController();
  }

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
                  fontFamily: 'Ubuntu',
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rute',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Silahkan Pilih Rute',
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Kursi',
                              style: FlutterFlowTheme.title3.override(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          FlutterFlowRadioButton(
                            options: [
                              'Kursi 1 - Depan',
                              'Kursi 2 - Belakang Supir',
                              'Kursi 3 - Tengah',
                              'Kursi 4 - Samping',
                              'Kursi 5 - Belakang',
                              'Kursi 6 - Belakang'
                            ],
                            onChanged: (value) {
                              setState(
                                  () => radioButtonPilihKursiValue = value);
                            },
                            optionHeight: 25,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.horizontal,
                            radioButtonColor: Colors.blue,
                            toggleable: false,
                            horizontalAlignment: WrapAlignment.start,
                            verticalAlignment: WrapCrossAlignment.start,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Tanggal Keberangkatan',
                              style: FlutterFlowTheme.title3.override(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: FlutterFlowCalendar(
                              color: FlutterFlowTheme.primaryColor,
                              weekFormat: false,
                              weekStartsMonday: false,
                              onChange: (DateTimeRange newSelectedDate) {
                                setState(() =>
                                    calendarSelectedDay = newSelectedDate);
                              },
                              titleStyle: GoogleFonts.getFont(
                                'Ubuntu',
                              ),
                              dayOfWeekStyle: GoogleFonts.getFont(
                                'Ubuntu',
                                fontStyle: FontStyle.italic,
                              ),
                              dateStyle: GoogleFonts.getFont(
                                'Ubuntu',
                              ),
                              selectedDateStyle: GoogleFonts.getFont(
                                'Ubuntu',
                                fontWeight: FontWeight.bold,
                              ),
                              inactiveDateStyle: GoogleFonts.getFont(
                                'Ubuntu',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              final rute = textController.text;
                              final users = currentUserReference;
                              final createdAt = calendarSelectedDay.start;
                              final seatNumber =
                                  RadioButton_PilihKursi.seatNumber;

                              final orderTravelRecordData =
                                  createOrderTravelRecordData(
                                rute: rute,
                                users: users,
                                createdAt: createdAt,
                                seatNumber: seatNumber,
                              );

                              final orderTravelRecordReference =
                                  OrderTravelRecord.collection.doc();
                              await orderTravelRecordReference
                                  .set(orderTravelRecordData);
                              RadioButton_PilihKursi =
                                  OrderTravelRecord.getDocumentFromData(
                                      orderTravelRecordData,
                                      orderTravelRecordReference);
                              Navigator.pop(context);

                              setState(() {});
                            },
                            text: 'Simpan',
                            icon: FaIcon(
                              FontAwesomeIcons.save,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: Color(0xFF34E07A),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
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
