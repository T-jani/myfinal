import 'package:flutter/material.dart';

class UserApprovalPage extends StatefulWidget {
  const UserApprovalPage({Key? key}) : super(key: key);

  @override
  _UserApprovalPageState createState() => _UserApprovalPageState();
}

class _UserApprovalPageState extends State<UserApprovalPage> {
  List<User> _users = [
    User('John Doe'),
    User('Jane Smith'),
    User('Michael Johnson'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Approval'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    // Approve user logic
                    setState(() {
                      user.approved = true;
                    });
                  },
                  icon: const Icon(Icons.thumb_up),
                  color: Colors.green,
                ),
                IconButton(
                  onPressed: () {
                    // Disapprove user logic
                    setState(() {
                      user.approved = false;
                    });
                  },
                  icon: const Icon(Icons.thumb_down),
                  color: Colors.red,
                ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('User Details'),
                    content:
                        Text('Name: ${user.name}\nApproved: ${user.approved}'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class User {
  final String name;
  bool approved;

  User(this.name, {this.approved = false});
}

void main() {
  runApp(const MaterialApp(
    home: UserApprovalPage(),
  ));
}
