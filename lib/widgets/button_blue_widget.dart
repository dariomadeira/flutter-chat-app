import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {

  final String btnText;
  final Function btnPress;

  const ButtonBlue({
    Key key, 
    @required this.btnText, 
    @required this.btnPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.btnPress,
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: StadiumBorder(),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            this.btnText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}