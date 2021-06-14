import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class EditprofileWidget extends StatefulWidget {
  EditprofileWidget({
    Key key,
    this.userRecord,
  }) : super(key: key);

  final UsersRecord userRecord;

  @override
  _EditprofileWidgetState createState() => _EditprofileWidgetState();
}

class _EditprofileWidgetState extends State<EditprofileWidget> {
  String uploadedFileUrl = '';
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 =
        TextEditingController(text: widget.userRecord.displayName);
    textController2 =
        TextEditingController(text: widget.userRecord.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final editprofileUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3, 0, 0, 2),
                  child: Text(
                    'Edit Profile',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.title1.override(
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 1),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                        iconSize: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(3, 0, 0, 2),
                      child: Text(
                        'Edit Profile',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Nunito',
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: InkWell(
                    onTap: () async {
                      final selectedMedia = await selectMedia();
                      if (selectedMedia != null &&
                          validateFileFormat(
                              selectedMedia.storagePath, context)) {
                        showUploadMessage(context, 'Uploading file...',
                            showLoading: true);
                        final downloadUrl = await uploadData(
                            selectedMedia.storagePath, selectedMedia.bytes);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrl != null) {
                          setState(() => uploadedFileUrl = downloadUrl);
                          showUploadMessage(context, 'Success!');
                        } else {
                          showUploadMessage(context, 'Failed to upload media');
                        }
                      }
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              editprofileUsersRecord.photoUrl,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Color(0x8FFFFFFF),
                              size: 50,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Nama Lengkap',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
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
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: Color(0xFF455A64),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Nomor Handphone',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Nomor Handphone',
                          hintStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: Color(0xFF455A64),
                            fontWeight: FontWeight.normal,
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
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: Color(0xFF455A64),
                          fontWeight: FontWeight.normal,
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Konfirmasi Perubahan'),
                                content: Text('Yakin Menyimpan?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Batal'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.pop(alertDialogContext);
                                      final displayName = textController1.text;
                                      final phoneNumber = textController2.text;
                                      final photoUrl = uploadedFileUrl;

                                      final usersRecordData =
                                          createUsersRecordData(
                                        displayName: displayName,
                                        phoneNumber: phoneNumber,
                                        photoUrl: photoUrl,
                                      );

                                      await editprofileUsersRecord.reference
                                          .update(usersRecordData);
                                      ;
                                    },
                                    child: Text('Ya, Simpan'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        text: 'Simpan',
                        options: FFButtonOptions(
                          width: 100,
                          height: 50,
                          color: Color(0xFF15D434),
                          textStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: Color(0xFFDEDEDE),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Batal',
                        options: FFButtonOptions(
                          width: 100,
                          height: 50,
                          color: Color(0xFFFF0003),
                          textStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: Color(0xFFDEDEDE),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: 25,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
