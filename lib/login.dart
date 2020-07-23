import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:Peninsula/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginemail;
  String loginpassword;
  var _auth= FirebaseAuth.instance;
  bool spinner= false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Text(' Log In ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white
                    ),
                  ),
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
                    loginemail= value;
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
                  obscureText: true,
                  decoration: iconfield(Icons.lock, 'Password'),
                  onChanged: (value){
                    loginpassword= value;
                  },
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:RawMaterialButton(
                  fillColor: Colors.blue,
                  elevation: 2,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5),),
                  child: box('Log In'),
                  onPressed: () async{
                    setState(() {
                      spinner=true;
                    });
                    try{
                      var user = await _auth.signInWithEmailAndPassword (
                          email: loginemail , password: loginpassword );
                      Navigator.pushNamed ( context , '/chats' );
                      setState(() {
                        spinner=false;
                      });
                    }
                    catch(e)
                    {
                        spinner = false;
                        Navigator.pushNamed ( context , '/login' );
                    }
                  },
                ),
              ),
              SizedBox(height: 40,),
              Divider(indent: 12,
                endIndent: 12,
                height: 1,
                color: Colors.white,),
              SizedBox(height: 40,),
              Text(" Don't have an account? ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17
                ),),
              SizedBox(height: 10,),
              GestureDetector(
                child: Text(" Sign Up ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17
                  ),),
                onTap: (){
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
