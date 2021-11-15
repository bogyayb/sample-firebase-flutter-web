import 'package:flutter/material.dart';
import 'package:p15_flash_chat_flutter_new/components/button.dart';
import 'package:p15_flash_chat_flutter_new/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:p15_flash_chat_flutter_new/screens/chat_screen.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // firebase
  final _auth = FirebaseAuth.instance;

  //fields
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
            child: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  style: kInputFieldTextStyle,
                  decoration: kInputFieldDecoration.copyWith(
                      hintText: 'Enter your email.'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  style: kInputFieldTextStyle,
                  decoration: kInputFieldDecoration.copyWith(
                      hintText: 'Enter your password.'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  color: Colors.lightBlueAccent,
                  text: 'Log in',
                  onPressed: () async {
                    final progress = ProgressHUD.of(context);
                    progress!.show();

                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email!, password: password!);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    Future.delayed(
                        const Duration(seconds: 0, milliseconds: 500), () {
                      progress.dismiss();
                    });
                  },
                ),
              ],
            ),
          ),
        )));
  }
}
