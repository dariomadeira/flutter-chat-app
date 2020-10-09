import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {

  final String logoText;

  const CustomLogo({
    Key key, 
    @required this.logoText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: 170,
        child: SafeArea(
          child: Column(
            children: [
              Image(image: AssetImage('assets/tag-logo.png')),
              const SizedBox(height: 20),
              Text(
              this.logoText,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}