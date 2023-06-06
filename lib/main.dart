import 'package:flutter/material.dart';
// import 'package:myapp/SCREENS/Registration.dart';
import 'package:myapp/SCREENS/splashscreen.dart';

// import 'SCREENS/RegAsPm.dart';
// import 'package:myapp/SCREENS/splashscreen.dart';

// import 'package:myapp/SCREENS/splashscreen.dart';

// import 'SCREENS/RegAsPm2.dart';
// import 'SCREENS/splashscreen.dart';
// import 'SCREENS/trialoutput.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
