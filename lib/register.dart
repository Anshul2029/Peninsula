import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Peninsula/functions.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool signal =false;
  var _auth = FirebaseAuth.instance;
  String email;
  String username;
  String password;
  String confirmpassword;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ModalProgressHUD(
        inAsyncCall: signal,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Text(' Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white
                    ),
                  )
              ),
              SizedBox(height: 60,),

              Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                  color: Color(0XFF696969),
                ),
                child: TextField(
                  cursorColor: Color(0XFFC0C0C0),
                  style: text,
                  decoration: iconfield(Icons.email, 'Email'),
                  onChanged: (value){
                    email= value;
                  },
                ),
              ),
              SizedBox(height: 15,),

              Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                  color: Color(0XFF696969),
                ),
                child: TextField(
                  cursorColor: Color(0XFFC0C0C0),
                  style: text,
                  decoration: iconfield(Icons.person, 'Username'),
                  onChanged: (value){
                    username= value;
                  },
                ),
              ),
              SizedBox(height: 15,),

              Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                  color: Color(0XFF696969),
                ),
                child: TextField( cursorColor: Color(0XFFC0C0C0),
                  style: text, obscureText: true,
                  decoration: iconfield(Icons.lock, 'Enter Password (At least 6 letters long)'),
                  onChanged: (value){
                    password= value;
                  },
                ),
              ),
              SizedBox(height: 15,),

              Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                  color: Color(0XFF696969),
                ),
                child: TextField(
                  cursorColor: Color(0XFFC0C0C0),
                  style: text, obscureText: true,
                  decoration: iconfield(Icons.lock, 'Confirm Password'),
                  onChanged: (value){
                    confirmpassword= value;
                  },
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RawMaterialButton(
                  fillColor: Colors.blue,
                  elevation: 2,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5),),
                  child: box('Register'),
                  onPressed: () async{

                    setState(() {
                      signal=true;
                    });

                    if(password == confirmpassword)
                      {
                        var user = await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        var currentuser= await _auth.currentUser();
                        UserUpdateInfo updateinfo= new UserUpdateInfo();
                        updateinfo.displayName = username;
                        await currentuser.updateProfile(updateinfo);
                        await currentuser.reload();

                        setState(() {
                          signal=false;
                        });
                        Navigator.pushNamed(context, '/chats');
                      }
                    else{
                      setState(() {
                        signal=false;
                      });
                      Navigator.pushNamed(context, '/register');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
