import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:telegram/model/chat.dart';
import 'package:telegram/model/user.dart';
import 'package:telegram/screens/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String name='Surendra', num='8356032646', password='Surendr@25';

  User? user = FirebaseAuth.instance.currentUser;

  TelegramUser telegramUser = TelegramUser(uid: '', email: '', name: '', num: '');

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .get()
      .then((value) => {
        this.telegramUser = TelegramUser.fromMap(value.data()),
        setState(() {}),
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff1d2733),
          appBar: AppBar(
            title: Text('Telegram',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xff24313b),
            actions: [Icon(Icons.search)],
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Color(0xff0d1923),
                thickness: 5,
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chat(index: index),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(items[index].imgPath),
                    radius: 30,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'SourceSansPro-Bold'),
                      ),
                      Text(items[index].time,
                        style: TextStyle(color: Colors.grey,
                            fontSize: 17,
                            fontFamily: 'SourceSansPro-SemiBold'),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items[index].message,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: 'SourceSansPro-SemiBold'),
                      ),
                      Chip(label: Text('${items[index].messNum}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                          backgroundColor: Color(0xff64b4ef)),
                    ],
                  ),
                );
              }),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                child: Icon(Icons.chat),
                label: 'New Chat',
              ),
              SpeedDialChild(
                child: Icon(Icons.group),
                label: 'New Group',
              ),
              SpeedDialChild(
                child: Icon(Icons.groups),
                label: 'New Channel',
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: Color(0xff212d3b),
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child:UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        color: Color(0xff1d2733)
                    ),
                    accountName: Text("${telegramUser.name}"),
                    accountEmail: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("+91 ${telegramUser.num}"),
                        Icon(Icons.arrow_downward, color: Colors.white)
                      ],
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_outline, color: Colors.white),
                  title: Text("Contact", style: TextStyle(color: Colors.white),),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.save_alt, color: Colors.white),
                  title: Text("Saved Message", style: TextStyle(color: Colors.white),),
                  onTap: () {},
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/setting');
                  },
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text("Settings", style: TextStyle(color: Colors.white),),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.person_add_alt, color: Colors.white),
                  title: Text("Invite Friends", style: TextStyle(color: Colors.white),),
                  onTap: () {},
                ),
              ],
            ),
          ),
        )
    );
  }
}
