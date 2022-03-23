import 'package:flutter/material.dart';
import 'package:fl_pushing/screens/home_screen.dart';
import 'package:fl_pushing/screens/message_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home'    : ( _ ) => const HomeScreen(),
        'message' : ( _ ) => const MessageScreen(),
      },
    );
  }
}