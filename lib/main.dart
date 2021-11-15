import 'package:flutter/material.dart';
import 'package:p15_flash_chat_flutter_new/screens/welcome_screen.dart';
import 'package:p15_flash_chat_flutter_new/screens/login_screen.dart';
import 'package:p15_flash_chat_flutter_new/screens/registration_screen.dart';
import 'package:p15_flash_chat_flutter_new/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //init Firebase (backend database)
  WidgetsFlutterBinding.ensureInitialized(); //dont know why.. but necessary
  await Firebase.initializeApp();

  //run the app
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     bodyText1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
