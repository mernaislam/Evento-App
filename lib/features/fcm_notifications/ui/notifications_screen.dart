import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({
    super.key,
    this.message,
  });
  final RemoteMessage? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${message?.notification!.title.toString()} \n  ${message?.notification!.body.toString()}',
        ),
      ),
    );
  }
}
