import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram/model/chat.dart';


class Chat extends StatefulWidget {
  final index;
  const Chat({Key? key, required this.index}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff1d2733),
          appBar: AppBar(
            backgroundColor: Color(0xff212d3b),
            iconTheme: IconThemeData(color: Colors.white),
            leading: CircleAvatar(
              backgroundImage: AssetImage(items[widget.index].imgPath),
            ),
            title: Text(items[widget.index].name,
              style: TextStyle(color: Colors.white),
            ),
            actions: [Icon(Icons.more_vert, color: Colors.white)],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 9,
                child: ListView.builder(
                    itemCount: 10,
                    reverse: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: chatbubble(context, index),
                      );
                    }),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.smiley , color: Colors.white, size: 30,),
                      Flexible(child: TextFormField(cursorHeight: 25,)),
                      Icon(Icons.camera_alt_outlined, color: Colors.white, size: 30,),
                      Icon(Icons.attachment, color: Colors.white, size: 30,),
                      Icon(Icons.mic, color: Colors.white, size: 30,),
                    ],
                  ),
              ),
            ],
          ),
      ),
    );
  }
}

Widget chatbubble(BuildContext context, int index) {
  if (index % 2 == 0) {
    return Padding(
      padding: EdgeInsets.only(right: 150, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hi $index",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20),
            ),
            Text('12.00pm',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  } else {
    return Padding(
      padding: EdgeInsets.only(left: 150, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hello $index", style: TextStyle(color: Colors.white, fontSize: 20),),
            Text('12.00pm', style: TextStyle(color: Colors.white60, fontSize: 15),),
          ],
        ),
      ),
    );
  }
}