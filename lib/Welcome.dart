import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:Peninsula/functions.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int op = 0;
  bool welcomespinner= false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: welcomespinner,
            color: Colors.white,
            child: Scaffold(
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bg1.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextLiquidFill(
                        boxHeight: 180,
//                   boxBackgroundColor: Colors.red,
                        text: 'Peninsula',
                        textStyle: TextStyle(
                          fontSize: 55,
                          fontFamily: 'Pacifico',
//                    fontWeight: FontWeight.w100,
                        ),
                        waveColor: Colors.lightGreenAccent,
                      ),
//                 Divider(color: Colors.white,),
                      SizedBox(
                        height: 54,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: feature(
                                image: 'images/fast3.jpg',
                                desc: 'High speed exchange of messages',
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: feature(
                                image: 'images/groupchat.png',
                                desc: 'Conveninent group chat option',
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: feature(
                                image: 'images/message.png',
                                desc: 'Providing best messaging service',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 90, ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.white,
                                  )
                                ),
                              ),
                              child: GestureDetector(
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: (){
                                  welcomespinner = true;
                                  Navigator.pushNamed(context, '/register');
                                  welcomespinner = false;
                                },

                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              child: GestureDetector(
                                child: Text(
                                  'Log In',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    welcomespinner= true;
                                  });
                                  Navigator.pushNamed(context, '/login');
                                  setState(() {
                                    welcomespinner= false;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
