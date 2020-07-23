import 'package:flutter/material.dart';
import 'Welcome.dart';
import 'login.dart';
import 'register.dart';
import 'chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context)=> WelcomeScreen(),
        '/register': (context)=> RegisterScreen(),
        '/login': (context)=> LoginScreen(),
        '/chats': (context)=> ChatScreen(),
      },
    );
  }
}