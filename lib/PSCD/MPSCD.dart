import 'package:flutter/material.dart';
import 'package:myapp/PSCD/Pdash.dart';

import '../SCREENS/DrawerWidget/inboxwidget.dart';

class M4b extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Message App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat Inbox'),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pdashmain()),
                );
              },
              icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: MessageInbox(
          messages: [
            Message(
              sender: 'John Doe',
              subject: 'Meeting Reminder',
              position: 'JMR/WR',
              body:
                  'Just a reminder that we have a meeting tomorrow at 10 AM. See you then!',
              time: DateTime.now(),
            ),
            Message(
              sender: 'Jane Smith',
              subject: 'Project Update',
              position: 'TKW/WR',
              body:
                  'Here is the latest project update. Please let me know if you have any questions or concerns.',
              time: DateTime.now().subtract(Duration(days: 1)),
            ),
            Message(
              sender: 'Bob Johnson',
              subject: 'Team Lunch',
              position: 'TRD/WR',
              body:
                  'Don\'t forget that we\'re having a team lunch at noon today. See you there!',
              time: DateTime.now().subtract(Duration(days: 2)),
            ),
          ],
        ),
      ),
    );
  }
}
