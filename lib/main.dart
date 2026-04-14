
import 'package:facebook/views/login/login_screen.dart';
import 'package:facebook/views/register/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChatApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "SF Pro Display"),
      initialRoute: '/', 
      routes: {
        '/': (context) => LoginScreen(),    
        '/register': (context) => RegisterScreen(),     
      },
    );
  }
}
