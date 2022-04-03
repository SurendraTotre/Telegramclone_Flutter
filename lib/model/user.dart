class TelegramUser{
  String? uid;
  String? email;
  String? name;
  String? num;

  TelegramUser({
    required this.uid,
    required this.email,
    required this.name,
    required this.num,
  });

  factory TelegramUser.fromMap(map){
    return TelegramUser(
        uid: map['uid'],
        email: map['email'],
        name: map['name'],
        num: map['num'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'num': num,
    };
  }
}


// final List<User> users= [
// User(email: 'Surendratotre25@gmail.com', name: 'Surendra', num: 8356032646, password: 'Surendr@25'),
// ];