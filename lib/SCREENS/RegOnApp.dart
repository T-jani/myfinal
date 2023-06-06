import 'package:flutter/material.dart';

import 'homepage.dart';
// ignore: unused_import

class appregis extends StatefulWidget {
  const appregis({super.key});

  @override
  State<appregis> createState() => _appregisState();
}

class _appregisState extends State<appregis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register On App'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        // controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Party ID',
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          // style: ButtonStyle(backgroundColor:Colors.pinkAccent[50],),
                          onPressed: () {},
                          child: Text('check Details')),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Username'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: Text('Submit'),
              )
            ],
          ),
        ),
      )),
    );
  }
}
