import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rider Chat'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          ChatMessage(
            text: 'Hey there!',
            isMe: false,
          ),
          ChatMessage(
            text: 'Hi! How are you?',
            isMe: true,
          ),
          // Add more chat messages as needed
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatMessage({Key? key, required this.text, required this.isMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isMe) ...[
            CircleAvatar(
              child: Text('User'),
            ),
            SizedBox(width: 8.0),
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          if (isMe) ...[
            SizedBox(width: 8.0),
            CircleAvatar(
              child: Text('Me'),
            ),
          ],
        ],
      ),
    );
  }
}
