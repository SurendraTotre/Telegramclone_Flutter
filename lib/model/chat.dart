class ChatModel{
  final String name;
  final String message;
  final String time;
  final String imgPath;
  final int messNum;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.imgPath,
    required this.messNum
  });
}

final List<ChatModel> items =[
  ChatModel(name: 'James',message: 'Good morning', time: '10:39',imgPath: 'assets/images/img1.jpg', messNum: 200),
  ChatModel(name: 'Robert',message: 'Hi', time: 'Feb 12',imgPath: 'assets/images/img2.jpg', messNum: 420),
  ChatModel(name: 'Michael',message: 'Hello', time: '12:12',imgPath: 'assets/images/img3.jpg', messNum: 20),
  ChatModel(name: 'William',message: 'xyz', time: '6:11',imgPath: 'assets/images/img4.jpg', messNum: 10 ),
  ChatModel(name: 'Richard ',message: 'I am back', time: 'Jan 1',imgPath: 'assets/images/img5.jpg', messNum: 50),
  ChatModel(name: 'Christopher',message: 'abc', time: '4:00',imgPath: 'assets/images/img6.jpg', messNum: 104),
  ChatModel(name: 'Daniel',message: 'Good Night', time: 'Dec 10',imgPath: 'assets/images/img7.jpg', messNum: 249),
  ChatModel(name: 'Mark',message: 'Take Care', time: '4:30',imgPath: 'assets/images/img8.jpg', messNum: 50),
  ChatModel(name: 'Anthony',message: 'pqr', time: '6:00',imgPath: 'assets/images/img9.jpg', messNum: 30),
];