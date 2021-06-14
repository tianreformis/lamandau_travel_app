import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../make_order_page/make_order_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ActiveOrderPageWidget extends StatefulWidget {
  ActiveOrderPageWidget({Key key}) : super(key: key);

  @override
  _ActiveOrderPageWidgetState createState() => _ActiveOrderPageWidgetState();
}

class _ActiveOrderPageWidgetState extends State<ActiveOrderPageWidget> {
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
                'Pesanan Aktif',
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
            child: StreamBuilder<List<OrderRecord>>(
              stream: queryOrderRecord(
                queryBuilder: (orderRecord) =>
                    orderRecord.orderBy('travel_time', descending: true),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<OrderRecord> listViewOrderRecordList = snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  // return Container();
                  // For now, we'll just include some dummy data.
                  listViewOrderRecordList = createDummyOrderRecord(count: 4);
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewOrderRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewOrderRecord =
                        listViewOrderRecordList[listViewIndex];
                    return StreamBuilder<UsersRecord>(
                      stream:
                          UsersRecord.getDocument(listViewOrderRecord.users),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final shopListItemUsersRecord = snapshot.data;
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: FlutterFlowTheme.primaryColor,
                                    spreadRadius: 5,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 1, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                listViewOrderRecord
                                                    .numberOfChair
                                                    .toString(),
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Nunito',
                                                  color: Color(0xFF15212B),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                dateTimeFormat(
                                                    'MMMMEEEEd',
                                                    listViewOrderRecord
                                                        .travelTime),
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Nunito',
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
  }
}
