import 'package:fl_pushing/services/push_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:fl_pushing/screens/home_screen.dart';
import 'package:fl_pushing/screens/message_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    
    super.initState();
  }


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