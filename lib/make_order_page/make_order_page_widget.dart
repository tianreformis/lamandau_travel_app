import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
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
    this.seatParameter,
  }) : super(key: key);

  final String seatParameter;

  @override
  _MakeOrderPageWidgetState createState() => _MakeOrderPageWidgetState();
}

class _MakeOrderPageWidgetState extends State<MakeOrderPageWidget> {
  DateTimeRange calendarSelectedDay;
  String dropDownValue;
  String radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
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
                          StreamBuilder<List<SeatNumberRecord>>(
                            stream: querySeatNumberRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List<SeatNumberRecord>
                                  dropDownSeatNumberRecordList = snapshot.data;
                              // Customize what your widget looks like with no query results.
                              if (snapshot.data.isEmpty) {
                                // return Container();
                                // For now, we'll just include some dummy data.
                                dropDownSeatNumberRecordList =
                                    createDummySeatNumberRecord(count: 1);
                              }
                              final dropDownSeatNumberRecord =
                                  dropDownSeatNumberRecordList.first;
                              return FlutterFlowDropDown(
                                initialOption: 'Options 1',
                                options: [
                                  'Kudangan - Nangabulik',
                                  'Lopung - Nangabulik'
                                ],
                                onChanged: (value) {
                                  setState(() => dropDownValue = value);
                                },
                                height: 40,
                                textStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.black,
                                ),
                                icon: FaIcon(
                                  FontAwesomeIcons.route,
                                ),
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                              );
                            },
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
                              '2 - Depan Samping Sopir',
                              '3 - Belakang Sopir',
                              '4 - Tengah',
                              '5 - Samping'
                            ],
                            onChanged: (value) {
                              setState(() => radioButtonValue = value);
                            },
                            optionHeight: 25,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.vertical,
                            radioButtonColor: FlutterFlowTheme.secondaryColor,
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
                              final rute = dropDownValue;
                              final users = currentUserReference;
                              final createdAt = calendarSelectedDay.start;
                              final seatNumber = radioButtonValue;

                              final orderTravelRecordData =
                                  createOrderTravelRecordData(
                                rute: rute,
                                users: users,
                                createdAt: createdAt,
                                seatNumber: seatNumber,
                              );

                              await OrderTravelRecord.collection
                                  .doc()
                                  .set(orderTravelRecordData);
                              Navigator.pop(context);
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
