import 'package:flutter/material.dart';

class User {
  final String name;
  bool approved;
  final String email;
  final String phoneNumber;

  User({
    required this.name,
    this.approved = false,
    required this.email,
    required this.phoneNumber,
  });
}


class ApprovalPage extends StatefulWidget {
  const ApprovalPage({Key? key}) : super(key: key);

  @override
  _ApprovalPageState createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  List<User> _users = [
    User(
      name: 'John Doe',
      email: 'johndoe@example.com',
      phoneNumber: '1234567890',
    ),
    User(
      name: 'Jane Smith',
      email: 'janesmith@example.com',
      phoneNumber: '9876543210',
    ),
    User(
      name: 'Michael Johnson',
      email: 'michaeljohnson@example.com',
      phoneNumber: '4567890123',
    ),
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
            subtitle: Text(user.email),
            trailing: user.approved
                ? const Icon(Icons.check_circle, color: Colors.green)
                : const Icon(Icons.remove_circle, color: Colors.red),
            onTap: () {
              _showUserDetails(user);
            },
            onLongPress: () {
              _toggleApproval(user);
            },
          );
        },
      ),
    );
  }

  void _showUserDetails(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${user.name}'),
              Text('Email: ${user.email}'),
              Text('Phone: ${user.phoneNumber}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleApproval(User user) {
    setState(() {
      user.approved = !user.approved;
    });
  }
}

void main() {
  runApp(const MaterialApp(
    home: ApprovalPage(),
  ));
}
