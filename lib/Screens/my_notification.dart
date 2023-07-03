import 'package:flutter/material.dart';

import '../src/constants/constants.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          foregroundColor: kTextColor,
          title: const Text(
            'Notification',
            style: TextStyle(color: kTextColor),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dr. Himashi Disanayake accept your appointment.'),
              Divider(
                color: kPrimaryColor,
              ),
              Text('Dr. Prakash Disanayake accept your appointment.'),
              Divider(
                color: kPrimaryColor,
              ),
            ],
          ),
        ));
  }
}
