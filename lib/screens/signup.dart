import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telegram/model/user.dart';
import 'package:telegram/screens/homepage.dart';
//import 'package:telegram/model/user.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _name = TextEditingController();
  TextEditingController _num = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); //key for form

  //firebase
  final _auth = FirebaseAuth.instance;

  // void validate(){
  //   if(formKey.currentState!.validate()){
  //     print('Validated');
  //   }else{
  //     print('Not Validated');
  //   }
  // }

  void signup(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFirestore()
          })
          .catchError((e) {
            Fluttertoast.showToast(msg: e!.message);
          });

    }
  }

  postDetailsToFirestore() async{
    // calling firestore
    // calling user model
    // sending values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    TelegramUser telegramUser = TelegramUser(uid: '', email: '', name: '', num: '');

    telegramUser.email = user!.email;
    telegramUser.uid = user.uid;
    telegramUser.name = _name.text;
    telegramUser.num = _num.text;

    await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(telegramUser.toMap());
    Fluttertoast.showToast(msg: "Account created Sucessfully");
    
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return  Scaffold(
        key: _scaffoldKey,

        appBar: AppBar(
          title: Text('Telegram',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff24313b),
        ),

        backgroundColor: Color(0xff1d2733),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10, left: 40, right: 40),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,//key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/telegram_logo.jpg'),
                  radius: 40,
                ),

                SizedBox(height: height*0.01,),
                Text(
                  "Sign-Up",
                  style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: _name,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Enter Your Name',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Correct Name';
                    }else{
                      return null;
                    }
                  },
                ),

                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: _num,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Enter Your Mobile Number',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Correct Mobile Number';
                    }else if(value.length < 10){
                      return 'Should Be At Least 10 Digits';
                    }else if(value.length > 15){
                      return 'Should Not Be More Than 15 Digits';
                    }else{
                      return null;
                    }
                  },
                ),

                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: _email,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Enter Your Email ID',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                      return 'Enter Correct Email ID';
                    }else{
                      return null;
                    }
                  },
                ),

                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: _password,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Enter Your Password',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Correct Password';
                    }else if(value.length < 6){
                      return 'Should Be At Least 6 Characters';
                    }else if(value.length > 15){
                      return 'Should Not Be More Than 15 Characters';
                    }else{
                      return null;
                    }
                  },
                ),

                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: _confirmpassword,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Correct Password';
                    }else if(_password.text != _confirmpassword.text){
                      return 'Password Do Not Match';
                    }else{
                      return null;
                    }
                  },
                ),

                Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        signup(_email.text, _password.text);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 40,),
                  child: Text(
                    'Already Have Account?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Log-In',
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
        )
    );
  }
}