//SHA-1: 12:B2:FE:5F:26:89:47:A2:95:B1:17:2C:91:32:2F:79:E7:18:EA:82

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;


  static Future _backgroundHandler(RemoteMessage message) async {
    print('backgroundHandler: ${message.messageId}');
    _messageStream.add(message.data['producto'] ?? 'no data');
    print(message.data);
  }

  static Future _onMessagedHandler(RemoteMessage message) async {
    print('onMessagedHandler: ${message.messageId}');
    _messageStream.add(message.data['producto'] ?? 'no data');
    print(message.data);
  }

  static Future _onOpenMessageHandler(RemoteMessage message) async {
    print('onOpenMessage: ${message.messageId}');
    _messageStream.add(message.data['producto'] ?? 'no data');
    print(message.data);
  }
  
  //TODO video 277 Missing Default Notification Channel metadata in AndroidManifest. Default value will be used.
  //en las consultas del curso hay soluciones

  
  static Future initializeApp() async {

    //push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    //handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessagedHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageHandler);

    //local notifications

  

  }

  static closeStreams(){
    _messageStream.close();
  }
}