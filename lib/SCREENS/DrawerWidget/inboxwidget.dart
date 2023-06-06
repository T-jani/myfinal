import 'package:flutter/material.dart';

class MessageInbox extends StatelessWidget {
  final List<Message> messages;

  const MessageInbox({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Inbox'),
      // ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return MessageItem(message: messages[index]);
        },
      ),
    );
  }
}

class Message {
  final String sender;
  final String subject;
  final String body;
  final DateTime time;
  final String position;

  Message({
    required this.sender,
    required this.subject,
    required this.body,
    required this.time,
    required this.position,
  });
}

class MessageItem extends StatelessWidget {
  final Message message;

  const MessageItem({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(message.sender[0]),
        ),
        title: Row(
          children: [
            Text(message.subject),
            SizedBox(width: 10),
            Text(
              message.position,
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
          ],
        ),
        subtitle: Text(message.body),
        trailing: Text(_formatTime(message.time)),
        onTap: () {
          // TODO: navigate to message details screen
        },
      ),
    );
  }

  String _formatTime(DateTime time) {
    // TODO: implement a function to format the message time
    return '';
  }
}
