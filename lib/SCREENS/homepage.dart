import 'package:flutter/material.dart';
// import 'package:myapp/CCD/Cdash.dart';
// 
//import 'package:myapp/NCD/Nchatpage.dart';
import 'package:myapp/NCD/Ndash.dart';

// import 'package:myapp/GS/Gdash.dart';
// import 'package:myapp/NCD/Ndash.dart';
// import 'package:myapp/PSCD/Pdash.dart';
// import 'package:myapp/RCD/Rchat.dart';
// import 'package:myapp/RCD/Rdash.dart';

import 'package:myapp/SCREENS/ForgetPassword.dart';
import 'package:myapp/SCREENS/Registration.dart';

// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const String id = 'Signin_Page';
  const MyApp({Key? key}) : super(key: key);

  // static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // String title = 'Register As Party Member';
  // String item1 = 'Register on App';
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          SizedBox(height: 60),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'CORPCOM',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          // Container(
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.all(10),

          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              // controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              // controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onLongPress: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyHomePage()),
                  // );
                },
                child: const Text('Login'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ndashmain()),
                  );
                },
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(children: <Widget>[
              const Text('Does not have account?'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationScreens()),
                  );
                  ;
                },
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ForgotPasswordPage()),
                    // );
                  },
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPasswordPage()),
                          );
                        },
                        child: Text(
                          'Forgot Password',
                        ),
                      )
                    ],
                  )),
            ]),
          )
        ] // mainAxisAlignment: MainAxisAlignment.center,
            ));
  }
}
