import 'package:flutter/material.dart';

class CustomLoginLabels extends StatelessWidget {

  final String goPage;
  final String question;
  final String navigateText;

  const CustomLoginLabels({
    Key key,
    @required this.goPage,
    @required this.question,
    @required this.navigateText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.question,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, this.goPage);
            },
            child: Text(
              this.navigateText,
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      )
    );
  }
}