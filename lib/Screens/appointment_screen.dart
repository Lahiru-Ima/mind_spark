import 'package:flutter/material.dart';
import 'package:mind_spark/src/common_widgets/user_card.dart';

import '../src/constants/constants.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        foregroundColor: kTextColor,
        title: const Text(
          'My Appointments',
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            UserCard(
                userimg: 'images/doctor1.jpg',
                title: 'Dr. Pallavi Shekar',
                subtitle: 'Consultant',
                date: '10/06/2023',
                starttime: '10.00 a.m',
                endtime: '11.00 a.m'),
            SizedBox(height: 20),
            UserCard(
                userimg: 'images/doctor1.jpg',
                title: 'Dr. Pallavi Shekar',
                subtitle: 'Consultant',
                date: '10/06/2023',
                starttime: '10.00 a.m',
                endtime: '11.00 a.m'),
          ],
        ),
      ),
    );
  }
}
