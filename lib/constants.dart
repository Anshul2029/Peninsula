import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

var field = TextEditingController();

TextStyle text = TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    );

const kSendButtonTextStyle = TextStyle(
//  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

var kMessageTextFieldDecoration =InputDecoration(
  border: InputBorder.none,
  icon: Padding(
    padding:  EdgeInsets.fromLTRB(3,0,0,0),
  ),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(
    color: Colors.white60,
    fontSize: 16,
  ),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.transparent, width: 2.0),
  ),
);

const radius = Radius.circular(15);
const myborder = BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),);
const otherborder= BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),);

class feature extends StatelessWidget {
  feature({this.desc, this.image});
  String image;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(image),
              height: 75,
              width: 75,
            ),
            SizedBox(height: 20,),
            TypewriterAnimatedTextKit(
              isRepeatingAnimation: false,
              speed: Duration(milliseconds: 200),
              text: [desc],
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontFamily: 'MeriendaOne',
                color: Colors.white,
                fontSize: 15,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
