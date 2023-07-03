import 'package:flutter/material.dart';
import 'package:mind_spark/Screens/appointment_screen.dart';
import 'package:mind_spark/Screens/book_appointment.dart';
import 'package:mind_spark/Screens/doctor_profile.dart';
import 'package:mind_spark/Screens/edit_profile.dart';
import 'package:mind_spark/Screens/feedback_screen.dart';
import 'package:mind_spark/Screens/find_doc_screen.dart';
import 'package:mind_spark/Screens/home_screen.dart';
import 'package:mind_spark/Screens/my_notification.dart';
import 'package:mind_spark/Screens/pay_screen.dart';
import 'package:mind_spark/Screens/review.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home_screen':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case '/find_doc_screen':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const FindDocScreen(),
        );
      case '/appointment_screen':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AppointmentScreen(),
        );
      case '/doctor_profile':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DoctorProfile(),
        );
      case '/book_appointment':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const BookAppointment(),
        );
      case '/edit_profile':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EditProfile(),
        );
      case '/my_notification':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyNotification(),
        );
      case '/review':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Review(),
        );
      case '/pay_screen':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PayScreen(),
        );
      case '/feedback_screen':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const FeedbackScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Blank Page'),
            ),
          ),
        );
    }
  }
}
