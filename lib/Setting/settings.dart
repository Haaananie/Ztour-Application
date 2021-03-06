import 'package:firebase_auth_ui/firebase_auth_ui.dart';
import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ztour_mobile/Pages/Login_Signup_Page/user_profile.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/assets.dart';
import '../Setting/language.dart';
import '../Setting/localization/localization_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AlertDialoglogout.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../Pages/Login_Signup_Page/login_page.dart';
import 'package:ztour_mobile/Pages/Login_Signup_Page/login_page.dart';

class SettingsOnePage extends StatefulWidget {
  static final String path = "lib/settings.dart";

  static void setLocale(BuildContext context, Locale locale) {
    _SettingsOnePageState state =
        context.findAncestorStateOfType<_SettingsOnePageState>();
    state.setLocale(locale);
  }

  @override
  _SettingsOnePageState createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<SettingsOnePage> {
  Locale _locale;
  bool _dark;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    initUser();
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  static String email = "";
  static String uid = '';
  bool logout = false;

  Future logoutConfirmation(BuildContext context) async {
    VoidCallback continueCallBack = () {
      Navigator.of(context).pop();
      this.logout = true;
    };
    BlurryDialog2nd alert = BlurryDialog2nd(
        "Confirmation", "Are you sure you want to log out?", continueCallBack);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {
      _SettingsOnePageState.email = user.email;
      _SettingsOnePageState.uid = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = new ProgressDialog(context);
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.yellow[50],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Colors.orange,
          //backgroundColor: Colors.blueGrey,
          title: Text(
            getTranslated(context, "setting_page"),
            style: TextStyle(color: _dark ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.moon),
              onPressed: () {
                setState(() {
                  _dark = !_dark;
                });
              },
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.orange,
                    child: ListTile(
                      onTap: () {
                        //open edit profile
                      },
                      title: Text(
                        email,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/6d/cd/94/6dcd94c7c4bf4800648ef7cbe0113c33.gif'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const SizedBox(height: 20.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.language,
                            color: Colors.orange,
                          ),
                          title: Text(getTranslated(context, "language_page")),
                          //subtitle: Text("English US"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LanguagePage()));
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.notifications,
                            color: Colors.orange,
                          ),
                          title: Text(getTranslated(context, "notifications")),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open notification setting
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline,
                            color: Colors.orange,
                          ),
                          title: Text(getTranslated(context, "privacy")),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open privacy and security
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.help_outline,
                            color: Colors.orange,
                          ),
                          title: Text(getTranslated(context, "help")),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change location
                          },
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Colors.orange,
                          ),
                          title: Text("Logout",
                              style: TextStyle(
                                color: Colors.red,
                              )),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () async {
                            await logoutConfirmation(context);

                            if (this.logout == true) {
                              dialog.style(
                                message: 'Please wait...',
                              );
                              await dialog.show();

                              await _auth.signOut();

                              await dialog.hide();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AuthPage(),
                                ),
                              );

                              this.logout = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100.0),
                  /*Text(
                    "Notification Settings",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Received notification"),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text("Received newsletter"),
                    onChanged: null,
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Received Offer Notification"),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Received App Updates"),
                    onChanged: null,
                  ),*/
                  const SizedBox(height: 100.0),
                ],
              ),
            ),
            /*Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 00,
              left: 00,
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.powerOff,
                  color: Colors.white,
                ),
                onPressed: () {
                  //log out
                },
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
