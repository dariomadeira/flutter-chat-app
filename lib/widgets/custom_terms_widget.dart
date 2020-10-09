import 'package:flutter/material.dart';

class CustomTerms extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Text(
      'Términos y condiciones de uso',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}