import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../signup/signup_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginpageWidget extends StatefulWidget {
  LoginpageWidget({Key key}) : super(key: key);

  @override
  _LoginpageWidgetState createState() => _LoginpageWidgetState();
}

class _LoginpageWidgetState extends State<LoginpageWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -1),
              child: CachedNetworkImage(
                imageUrl:
                    'https://www.celebes.co/borneo/wp-content/uploads/2020/01/Tempat-Wisata-Lamandau-768x403.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                      width: 0,
                      height: 0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 60, 0, 60),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(1, 0, 0, 10),
                              child: Text(
                                'Silahkan Masuk',
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(4, 0, 0, 20),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE0E0E0),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: TextFormField(
                                          controller: emailTextController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Email',
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
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
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
                                    padding: EdgeInsets.fromLTRB(4, 0, 4, 20),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE0E0E0),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: TextFormField(
                                          controller: passwordTextController,
                                          obscureText: !passwordVisibility,
                                          decoration: InputDecoration(
                                            hintText: 'Password',
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
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => passwordVisibility =
                                                    !passwordVisibility,
                                              ),
                                              child: Icon(
                                                passwordVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                size: 22,
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
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final user = await signInWithEmail(
                                          context,
                                          emailTextController.text,
                                          passwordTextController.text,
                                        );
                                        if (user == null) {
                                          return;
                                        }

                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomePageWidget(),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      text: 'Masuk',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 50,
                                        color: Color(0xFF0F2A58),
                                        textStyle: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFFDEDEDE),
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
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment(-0.7, -0.01),
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment(0, 0),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 1),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final user =
                                                        await signInWithGoogle(
                                                            context);
                                                    if (user == null) {
                                                      return;
                                                    }
                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePageWidget(),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  },
                                                  text: 'Masuk via Google',
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.transparent,
                                                    size: 20,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 200,
                                                    height: 38,
                                                    color: Colors.transparent,
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Color(0xFF616161),
                                                      fontSize: 14,
                                                    ),
                                                    elevation: 1,
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 30,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment(-0.7, -0.01),
                                              child: Container(
                                                width: 22,
                                                height: 22,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/facebook-circle-logo-png-4-Transparent-Images.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment(0, 0),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 1),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final user =
                                                        await signInWithFacebook(
                                                            context);
                                                    if (user == null) {
                                                      return;
                                                    }
                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePageWidget(),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  },
                                                  text: 'Masuk via Facebook',
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.transparent,
                                                    size: 20,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 200,
                                                    height: 38,
                                                    color: Colors.transparent,
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Color(0xFF616161),
                                                      fontSize: 14,
                                                    ),
                                                    elevation: 1,
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 30,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Text(
                                        'Belum punya akun',
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFFADADAD),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignupWidget(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Daftar',
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment(0, -0.65),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
