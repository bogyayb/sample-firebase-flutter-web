import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  //fields
  final Color? color;
  final String? text;
  final Function? onPressed;

  //constructor
  RoundedButton({this.color, this.text, this.onPressed});

  //widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        // color: Colors.lightBlueAccent,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Go to login screen.
            // Navigator.pushNamed(context, LoginScreen.id);
            this.onPressed!();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            // 'Log In',
            this.text!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
