import 'package:flutter/material.dart';

import '../SCREENS/profilepage.dart';

class Pageprofile extends StatefulWidget {
  const Pageprofile({super.key});

  @override
  State<Pageprofile> createState() => _PageprofileState();
}

class _PageprofileState extends State<Pageprofile> {
  @override
  Widget build(BuildContext context) {
    return ProfilePage(
      profileImagePath: 'assets/tj.jpeg',
      name: 'Ebenezer Gyamfi',
      jobTitle: 'CD-Tarkwa Nsuem ',
      email: 'ebenezer.gyamfi@gmail.com',
      phone: '0240994061',
      onEditProfile: () {
        // Add your action here
      },
    );
  }
}
