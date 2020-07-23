import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Peninsula/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseAuth _auth= FirebaseAuth.instance;
  var field= new TextEditingController();
  var _store= Firestore.instance;
  var displayname ;
  var textmessage;
  var time = '20:10';

  
  @override
  void initState() {
    // TODO: implement initState
    getuser();
  }

  void getuser()async{
    var user= await _auth.currentUser();
    displayname= user.displayName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/chatbg1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  //Implement logout functionality

                }),
          ],
          title: Text('Peninsula'),
          backgroundColor: Colors.black54,
        ),
        body: Container(
          child: SafeArea(
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 3,),
                    StreamBuilder(
                      stream: _store.collection('Messages').snapshots(),
                      builder: (context, snapshot){
                        var messages = snapshot.data.documents;
                        List<Padding> messagecontainers = [];
                        for (var message in messages)
                        {
                          var txt = message.data['message'];
                          var send = message.data['sender'];
                          var time = message.data['time'];
                          var aln;
                          var seeborder, bgcolor;
                          send== displayname ?  (aln= CrossAxisAlignment.end) :  (aln=CrossAxisAlignment.start);
                          // ignore: unnecessary_statements
                          send== displayname ? (seeborder = myborder) : seeborder= otherborder ;
                          send== displayname ? bgcolor= Color(0XFF457e46) : bgcolor =Colors.green.shade900 ;
                        var msgwidget = Padding(
                            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: aln,
                              children: <Widget>[
                                ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: 80, maxWidth: 330),
                                  child: Material (
                                    color: bgcolor,
                                    elevation: 4,
                                    borderRadius: seeborder,
                                    child: Padding(
                                      padding:  EdgeInsets.fromLTRB(8,4,4,4),
                                      child: Column (
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(1.0,0,0,0),
                                            child: Text ( send ,
                                              textAlign: TextAlign.left,
                                              style: TextStyle (
                                                  color: Colors.lightGreen,
                                                  fontSize: 12,
                                              ) , ),
                                          ) ,
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(1,2,1,1),
                                            child: Text ( txt,
                                              style: TextStyle (
                                                  color: Colors.white ,
                                                  fontSize: 16
                                              ) , ),
                                          ) ,
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(1,1.5,0,0),
                                            child: Text ('- '+ time ,
                                              style: TextStyle (
                                                  color: Colors.grey.shade300,
                                                fontSize: 10,
                                              ) , ),
                                          ) ,
                                        ] ,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                          messagecontainers.add(msgwidget);
                        }
                        return Expanded(
                          child: ListView(
                            children: messagecontainers ,
                          ),
                        );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,3.5,0,6),
                    child: Container(
                      decoration: kMessageContainerDecoration,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 20,
                            child: Padding(
                              padding:  EdgeInsets.fromLTRB(10,0,0,0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white30,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 40,
                                      child: TextField(
                                        controller: field,
                                        cursorColor: Color(0XFFC0C0C0),
                                        style: text,
                                        decoration: kMessageTextFieldDecoration,
                                        onChanged: (value){
                                          textmessage= value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: RaisedButton(
                              elevation: 2,
                              color: Colors.green,
                              shape: CircleBorder(),
                              onPressed: () {
                                //Implement send functionality.
                                int hour = DateTime.now().hour;
                                int min = DateTime.now().minute;
                                _store.collection('Messages').add({
                                  'message' : textmessage.toString(),
                                  'sender' : displayname.toString(),
                                  'time' : ('$hour:$min').toString()
                                });

                                field.clear();
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 12, 7, 12),
                                child: Icon(Icons.send,
                                  color: Colors.white,
                                  size: 20  ,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}