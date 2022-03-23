import 'package:flutter/material.dart';
import 'package:fl_pushing/services/push_notification_service.dart';
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

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    
    super.initState();
    PushNotificationService.messagesStream.listen((message) {

      navigatorKey.currentState?.pushNamed('message', arguments: message);
      final snackBar = SnackBar( content: Text(message));
      scaffoldKey.currentState?.showSnackBar(snackBar);
     });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey, // Navegacion
      scaffoldMessengerKey: scaffoldKey, //Snacks
      routes: {
        'home'    : ( _ ) => const HomeScreen(),
        'message' : ( _ ) => const MessageScreen(),
      },
    );
  }
}