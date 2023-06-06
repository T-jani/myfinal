import 'package:flutter/material.dart';
import 'package:myapp/PSCD/MPSCD.dart';
import 'package:myapp/PSCD/PprofilePic.dart';
import 'package:myapp/RCD/Rchat.dart';
// import 'package:myapp/SCREENS/Chatbox.dart';
import 'package:myapp/SCREENS/DrawerWidget/Approval.dart';

// import '../SCREENS/Approval.dart';
import '../SCREENS/DisableMember.dart';
import '../SCREENS/settingpage.dart';
// import 'PChatpage.dart';

import '../SCREENS/DrawerWidget/drawerheader.dart';
// import '../SCREENS/DrawerWidget/home.dart';

class Rdashmain extends StatelessWidget {
  const Rdashmain({Key? key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(
      title: 'RCD',
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Center(
            child: Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Pageprofile()),
                      );
                    },
                    icon: Icon(Icons.person),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserApprovalPage()),
                      );
                    },
                    icon: Icon(Icons.person_add_alt_1_outlined),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: mydrawerHeaderwidget(
                image: 'assets/tj.jpeg',
                name: 'Ebenezer Gyamfi',
                position: 'CD-Tarkwa Nsuewm',
              ),
            ),
            ContainerWidget(
              text: 'Home',
              navigatorpage: MyHomePage(
                title: 'CCD',
              ),
              icon: Icons.home_filled,
            ),
            // container(
            //     text: 'Profile',
            //     navigatorpage: ProfilePage(),
            //     icon: Icons.person_2_rounded),
            ContainerWidget(
              text: 'Approval',
              navigatorpage: UserApprovalPage(),
              icon: Icons.approval_rounded,
            ),
            ContainerWidget(
              text: 'Disable Member',
              navigatorpage: ApprovalPage(),
              icon: Icons.disabled_by_default,
            ),
            ContainerWidget(
              text: 'Setting',
              navigatorpage: const SettingsPage(),
              icon: Icons.disabled_visible,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('List Of Messages'),
            Divider(
              thickness: 2,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: const Text('View Message from'),
                              children: <Widget>[
                                Divider(
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => M4b(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'National  Comm. Directorate',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Message From Top'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => M4b()),
                      );
                    },
                    child: Text('Message From Down(CCD)'),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => M4b()),
                      );
                    },
                    child: Text('ChatBox'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Rchat()),
          );
        },
        hoverColor: Colors.amber,
        // elevation: 60,
        child: const Icon(Icons.message_sharp),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  ContainerWidget({
    Key? key,
    required this.text,
    required this.navigatorpage,
    required this.icon,
  });

  final String text;
  final Widget navigatorpage;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigatorpage),
          );
        },
      ),
    );
  }
}
