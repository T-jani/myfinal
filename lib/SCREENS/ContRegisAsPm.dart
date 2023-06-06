import 'package:flutter/material.dart';
import 'package:myapp/SCREENS/homepage.dart';



class regis2 extends StatefulWidget {
  const regis2({super.key});
  // void _showDatePicker(){
  //   var context;
  //   showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2023));

  // }

  @override
  State<regis2> createState() => _regis2State();
}

class _regis2State extends State<regis2> {
  final _formKey = GlobalKey<FormState>();
  // TextEditingController _date = TextEditingController();
  // String name = '';
  // String email = '';
  // String phone = '';
  // String address = '';
  // String city = '';
  // String state = '';
  // String country = '';
  // String zipCode = '';
  // String password = '';
  // String confirmPassword = '';
  // String gender = '';
  // String education = '';
  // String occupation = '';
  // String aboutYou = '';


  //  List _options: ['Option 1', 'Option 2', 'Option 3'];
  var _value = "-1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (null),
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
              )),
          title: Text('mychat'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          'REGISTER AS A PARTY MEMBER',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 23,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    DropdownButtonFormField(
                      decoration: InputDecoration(label: Text('Constituecy')),
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
                        )
                      ],
                      onChanged: (v) {},
                    ),
                    TextFormField(
                      // controller: _date,
                      decoration: InputDecoration(
                        // icon: Icon(Icons.calendar_today_rounded),
                        labelText: 'Date of Birth',
                      ),
                      onTap: () async {
                      },
                     
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Age',
                      ),
                    ),  TextFormField(
                          decoration: InputDecoration(
                            labelText: 'GPS',
                          ),
                         
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'National ID',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Voters ID',
                          ),
                         
                        ),
                     
 Center(
                       
                        child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyApp()),
                          );
                        },
                        child: Text('Submit'),
                      ),
                    )),
                  ],
                )))));
  }
}
