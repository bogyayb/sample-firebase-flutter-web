import 'package:flutter/material.dart';
import 'package:p15_flash_chat_flutter_new/screens/login_screen.dart';
import 'package:p15_flash_chat_flutter_new/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:p15_flash_chat_flutter_new/components/button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //variables
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();

    //set up
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1.0,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);

    //usage
    controller!.forward();

    controller!.addListener(() {
      setState(() {});
      print(animation!.value);
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Locksy by GitHub! 😍',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: 'Log in',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              text: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
