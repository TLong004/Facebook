
import 'package:facebook/auth_wapper.dart';
import 'package:facebook/firebase_options.dart';
import 'package:facebook/view_models/auth_view_model.dart';
import 'package:facebook/views/login/login_screen.dart';
import 'package:facebook/views/main_page.dart';
import 'package:facebook/views/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: MaterialApp(
        title: "ChatApp",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "SF Pro Display"),
        initialRoute: '/', 
        routes: {
          '/': (context) => AuthWrapper(),  
          '/home': (context) => MainPage(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),     
        },
      ),
    );
  }
}