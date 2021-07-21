import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
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
  String dropdownRuteValue;
  String dropdownSeatValue;
  var placePickerValue = FFPlace();
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
        iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
        automaticallyImplyLeading: true,
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
              child: Text(
                'Buat Pesanan',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Ubuntu',
                  color: FlutterFlowTheme.tertiaryColor,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
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
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlutterFlowDropDown(
                            initialOption: 'Pilih Rute',
                            options: [
                              'Kubung - Nangabulik',
                              'Sekombulan - Nangabulik',
                              'Kudangan - Nangabulik',
                              'Lopus - Nangabulik ',
                              'Nyalang - Nangabulik ',
                              'Landau Kantu - Nangabulik ',
                              ''
                            ],
                            onChanged: (value) {
                              setState(() => dropdownRuteValue = value);
                            },
                            width: double.infinity,
                            height: 40,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            icon: FaIcon(
                              FontAwesomeIcons.streetView,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
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
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlutterFlowDropDown(
                            initialOption: 'Pilih Kursi',
                            options: [
                              '02. Samping Supir',
                              '03. Belakang Supir',
                              '04. Tengah',
                              '05. Samping',
                              '06. Belakang',
                              '07. Belakang'
                            ],
                            onChanged: (value) {
                              setState(() => dropdownSeatValue = value);
                            },
                            width: double.infinity,
                            height: 40,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            icon: Icon(
                              Icons.airline_seat_recline_normal,
                              size: 15,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Lokasi Jemput',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyB-VkPAUsW9DR0Ksci5blQrMLU2kTzUeW8',
                          androidGoogleMapsApiKey:
                              'AIzaSyDBH6NvqxTTrbrdDfwvML1D85Tc9xX6MrY',
                          webGoogleMapsApiKey:
                              'AIzaSyALfwqSPFGHzoMv_TKJhg4qVMoSv_iderQ',
                          onSelect: (place) =>
                              setState(() => placePickerValue = place),
                          defaultText: 'Select Location',
                          icon: Icon(
                            Icons.place,
                            color: Colors.white,
                            size: 16,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: 200,
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
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: FlutterFlowCalendar(
                            color: FlutterFlowTheme.primaryColor,
                            weekFormat: false,
                            weekStartsMonday: false,
                            onChange: (DateTimeRange newSelectedDate) {
                              setState(
                                  () => calendarSelectedDay = newSelectedDate);
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final orderTravelCreateData =
                                    createOrderTravelRecordData(
                                  rute: dropdownRuteValue,
                                  createdAt: calendarSelectedDay.start,
                                  seatNumber: dropdownSeatValue,
                                  uid: currentUserReference,
                                  users: currentUserReference,
                                  price: 'TextPrice',
                                  userLocation: placePickerValue.latLng,
                                );
                                await OrderTravelRecord.collection
                                    .doc()
                                    .set(orderTravelCreateData);
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
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFE05034),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.moneyBillAlt,
                                      color: FlutterFlowTheme.tertiaryColor,
                                      size: 24,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Text(
                                      dropdownRuteValue,
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Ubuntu',
                                        color: FlutterFlowTheme.tertiaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
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
  }
}
