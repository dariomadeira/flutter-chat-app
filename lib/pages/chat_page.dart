import 'dart:io';
import 'package:chat/widgets/chat_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _chatInputCrtl = TextEditingController();
  final _focusNode = FocusNode();
  bool _isWriting = false;
  List<ChatBubble> _messages = [
    // ChatBubble(texto: "hola mundo", uid: '123'),
    // ChatBubble(texto: "hola mundo", uid: '123'),
    // ChatBubble(texto: "hola mundo", uid: '34123'),
    // ChatBubble(texto: "hola mundo", uid: '123'),
    // ChatBubble(texto: "hola mundo", uid: '555123'),
    // ChatBubble(texto: "hola mundo", uid: '123'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Column(
          children: [
            CircleAvatar(
              maxRadius: 14,
              backgroundColor: Colors.blue[100],
              child: Text(
                "Te",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              "Mesila flores",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                reverse: true,
                itemBuilder: (BuildContext context, int i) {
                  return _messages[i];
                },
              ),
            ),
            Divider(height: 1),
            Container(
              color: Colors.white,
              child: _inputChat(),
            ),
          ],
        ),
      )
   );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje',
                ),
                controller: _chatInputCrtl,
                onSubmitted: _handleSubmit,
                onChanged: (String texto){
                  setState(() {
                    if (texto.trim().length > 0) {
                      _isWriting = true;
                    } else {
                      _isWriting = false;
                    }
                  });
                },
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS 
                ? CupertinoButton(
                  child: Text('Enviar'),
                  onPressed: _isWriting 
                    ? () => _handleSubmit(_chatInputCrtl.text.trim()) 
                    : null,
                )
                : Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: IconTheme(
                    data: IconThemeData(
                      color: Colors.blue[400],
                    ),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(
                        Icons.send,
                      ),
                      onPressed: _isWriting 
                        ? () => _handleSubmit(_chatInputCrtl.text.trim()) 
                        : null,
                    ),
                  ),
                )
            )
          ],
        ),
      )
    );
  }

  _handleSubmit (String texto) {
    if (texto.length == 0) return;
    _chatInputCrtl.clear();
    _focusNode.requestFocus();
    final newMessage = ChatBubble(
      texto: texto,
      uid: '123',
      animaBubble: AnimationController(vsync: this, duration: Duration(milliseconds: 200)),
    );
    _messages.insert(0, newMessage);
    newMessage.animaBubble.forward();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  void dispose() {
    // TODO OFF del socket
    for(ChatBubble message in _messages) {
      message.animaBubble.dispose();
    }
    super.dispose();
  }

}