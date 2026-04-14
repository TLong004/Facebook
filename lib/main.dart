import 'package:facebook/views/login/login_screen.dart';
import 'package:facebook/views/register/register_screen.dart';
import 'package:facebook/views/main_page.dart'; // Giữ cái này của bạn A
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
      // Kết hợp cả 2: Dùng InitialRoute của Phú nhưng giữ Route tới MainPage của bạn A
      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginScreen(),    
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MainPage(), // Thêm đường dẫn vào trang chính của bạn A
      },
    );
  }
}