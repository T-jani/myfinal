import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String profileImagePath;
  final String name;
  final String jobTitle;
  final String email;
  final String phone;
  final VoidCallback onEditProfile;

  ProfilePage({
    required this.profileImagePath,
    required this.name,
    required this.jobTitle,
    required this.email,
    required this.phone,
    required this.onEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(profileImagePath),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              jobTitle,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text(email),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text(phone),
              ),
            ),
            ElevatedButton(
              onPressed: onEditProfile,
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
