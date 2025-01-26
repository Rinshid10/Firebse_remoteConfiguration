import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

class Messegefirebase {
  final firemassege = FirebaseMessaging.instance;

  intitNotification() async {
    await firemassege.requestPermission();
    final token = await firemassege.getToken();
    log('token ${token}');
  }
}
