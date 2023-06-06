import 'package:flutter/material.dart';
import 'package:myapp/SCREENS/RegAsPm.dart';
// import 'package:myapp/SCREENS/RegAsPm.dart';
import 'package:myapp/SCREENS/RegOnApp.dart';
// import 'package:mychat/regasPm.dart';

// ignore: camel_case_types
class RegistrationScreens extends StatefulWidget {
  const RegistrationScreens({super.key});

  @override
  State<RegistrationScreens> createState() => _RegistrationScreensState();
}

class _RegistrationScreensState extends State<RegistrationScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Registration'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyForm()),
                    );
                  },
                  child: Text('Register as Party Member'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => appregis()),
                  );
                },
                child: Text('Register on App'),
              ),
            ],
          ),
        ));
  }
}
