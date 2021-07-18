import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../make_order_page/make_order_page_widget.dart';
import '../report_page/report_page_widget.dart';
import '../testpage/testpage_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ActiveOrderPageWidget extends StatefulWidget {
  ActiveOrderPageWidget({
    Key key,
    this.userRecord,
    this.orderList,
  }) : super(key: key);

  final DocumentReference userRecord;
  final DocumentReference orderList;

  @override
  _ActiveOrderPageWidgetState createState() => _ActiveOrderPageWidgetState();
}

class _ActiveOrderPageWidgetState extends State<ActiveOrderPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrderTravelRecord>>(
      stream: queryOrderTravelRecord(
        singleRecord: true,
      ),
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
        List<OrderTravelRecord> activeOrderPageOrderTravelRecordList =
            snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          return Container(
            height: 100,
            child: Center(
              child: Text('No results.'),
            ),
          );
        }
        final activeOrderPageOrderTravelRecord =
            activeOrderPageOrderTravelRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.tertiary1,
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
                      'Pesanan Aktif',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFF1F4F8),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 300),
                  reverseDuration: Duration(milliseconds: 300),
                  child: MakeOrderPageWidget(),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: MakeOrderPageWidget(),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.tertiaryColor,
                size: 30,
              ),
              iconSize: 30,
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<OrderTravelRecord>>(
                  stream: queryOrderTravelRecord(
                    queryBuilder: (orderTravelRecord) => orderTravelRecord
                        .where('users', isEqualTo: widget.userRecord)
                        .orderBy('created_at', descending: true),
                  ),
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
                    List<OrderTravelRecord> listViewOrderTravelRecordList =
                        snapshot.data;
                    if (listViewOrderTravelRecordList.isEmpty) {
                      return Center(
                        child: Image.asset(
                          'assets/images/app_launcher.png',
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewOrderTravelRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewOrderTravelRecord =
                            listViewOrderTravelRecordList[listViewIndex];
                        return StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              listViewOrderTravelRecord.users),
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
                            final cardUsersRecord = snapshot.data;
                            return Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.base1,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 4, 0, 4),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .locationArrow,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  10, 0, 0, 0),
                                                          child: Text(
                                                            listViewOrderTravelRecord
                                                                .rute,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .title3
                                                                    .override(
                                                              fontFamily:
                                                                  'Ubuntu',
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 4, 0, 4),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  1, 0, 0, 0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .carAlt,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  10, 4, 0, 4),
                                                          child: Text(
                                                            listViewOrderTravelRecord
                                                                .seatNumber,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .subtitle2
                                                                    .override(
                                                              fontFamily:
                                                                  'Ubuntu',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 4, 0, 4),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .calendarCheck,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  10, 4, 0, 4),
                                                          child: Text(
                                                            dateTimeFormat(
                                                                'MMMEd',
                                                                listViewOrderTravelRecord
                                                                    .createdAt),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .subtitle2
                                                                    .override(
                                                              fontFamily:
                                                                  'Ubuntu',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 4, 0, 4),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .people_alt_sharp,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  10, 0, 0, 0),
                                                          child: Text(
                                                            cardUsersRecord
                                                                .displayName,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText2
                                                                    .override(
                                                              fontFamily:
                                                                  'Ubuntu',
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 10),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            reverseDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        300),
                                                            child:
                                                                ReportPageWidget(
                                                              orderTravelParameter:
                                                                  listViewOrderTravelRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      text: 'Cetak',
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.print,
                                                        size: 20,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 40,
                                                        color:
                                                            Color(0xFF44CB85),
                                                        textStyle:
                                                            FlutterFlowTheme
                                                                .subtitle2
                                                                .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        elevation: 3,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Batalkan Pesanan'),
                                                            content: Text(
                                                                'Apakah anda yakin ingin membatalkan pesanan?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Tidak Jadi'),
                                                              ),
                                                              TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      alertDialogContext);
                                                                  await listViewOrderTravelRecord
                                                                      .reference
                                                                      .delete();
                                                                  ;
                                                                },
                                                                child:
                                                                    Text('Ya'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    text: 'Batal',
                                                    icon: Icon(
                                                      Icons.cancel_outlined,
                                                      size: 20,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 130,
                                                      height: 40,
                                                      color: Color(0xFFE05034),
                                                      textStyle:
                                                          FlutterFlowTheme
                                                              .subtitle2
                                                              .override(
                                                        fontFamily: 'Ubuntu',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 12,
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
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
