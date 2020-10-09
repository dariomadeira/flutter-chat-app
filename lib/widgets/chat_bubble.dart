import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {

  final String texto;
  final String uid;
  final AnimationController animaBubble;

  const ChatBubble({
    Key key, 
    @required this.texto, 
    @required this.uid,
    @required this.animaBubble
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animaBubble,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animaBubble, curve: Curves.easeOut),
        child: Container(
          child: this.uid == '123'
          ? _myBubble()
          : _notMyBubble(),
        ),
      ),
    );
  }

  Widget _myBubble() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 5, left: 50, right: 5),
        child: Text(
          this.texto,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _notMyBubble() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 5, left: 5, right: 50),
        child: Text(
          this.texto,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}