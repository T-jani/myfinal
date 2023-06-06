import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/SCREENS/ContRegisAsPm.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  var _value = "-1";

  String name = '';
  String email = '';
  String phone = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
        title: Text('CORPCOM'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      'REGISTER AS A PARTY MEMBER',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 23,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phone = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    address = value!;
                  },
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(label: Text('Region')),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Select Region"),
                      value: "-1",
                    ),
                    DropdownMenuItem(
                      child: Text("Eastern Region"),
                      value: "1",
                    ),
                    DropdownMenuItem(
                      child: Text("Northern region"),
                      value: "2",
                    ),
                    DropdownMenuItem(
                      child: Text("Western Region"),
                      value: "3",
                    ),
                  ],
                  onChanged: (v) {},
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(label: Text('Constituency')),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Select Constituency"),
                      value: "-1",
                    ),
                    DropdownMenuItem(
                      child: Text("Ayawaso-West  Constituency"),
                      value: "1",
                    ),
                    DropdownMenuItem(
                      child: Text("Ayawaso-East  Constituency"),
                      value: "2",
                    ),
                    DropdownMenuItem(
                      child: Text("Ayawaso-North  Constituency"),
                      value: "3",
                    ),
                  ],
                  onChanged: (v) {},
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // All form fields are filled
                        _formKey.currentState!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => regis2(),
                          ),
                        );
                      }
                    },
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
