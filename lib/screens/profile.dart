import 'package:flutter/material.dart';
import 'package:telegram/model/user.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name='Surendra', num='8356032646', password='Surendr@25';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0d1923),
        appBar: AppBar(
          title: Text(name,
            style: TextStyle(color: Colors.white),
          ),
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
              child: ListTile(
                leading: Icon(Icons.camera_enhance, color: Colors.grey),

                title: Text(
                  "Set Photo Profile",
                  style: TextStyle(color: Colors.blue),
                ),
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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        top: 10,
                      ),
                      child: Text("Account",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700)),
                    ),
                    ListTile(
                      title: Text(
                        "@Surendra",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("Username",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "+918356032646",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("Tap to change phone number",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Bio",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("Add a few words about yourself",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}