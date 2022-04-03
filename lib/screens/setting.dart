import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram/screens/login.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login())
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0d1923),
        appBar: AppBar(
          title: Text('Surendra', style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xff1d2733),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
            radius: 30,
          ),
          actions: [Icon(Icons.more_vert)],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
            Container(
                decoration: BoxDecoration(color: Color(0xff212d3b),),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        top: 10,
                      ),
                      child: Text("Settings",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700)),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications_none, color: Colors.grey),
                      title: Text("Notifications and Sounds",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.storage, color: Colors.grey),
                      title: Text("Data and Storage",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.lock, color: Colors.grey),
                      title: Text("Privacy and Security",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.palette, color: Colors.grey),
                      title: Text("Themes and Chats",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.language, color: Colors.grey),
                      title: Text('Language',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: Color(0xff212d3b),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(CupertinoIcons.question, color: Colors.grey),
                    title: Text("Ask a Question",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip, color: Colors.grey),
                    title: Text("Privacy Policy",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                logout(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}