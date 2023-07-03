import 'package:flutter/material.dart';
import 'package:mind_spark/Screens/home_screen.dart';
import 'package:mind_spark/src/features/on_boarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import '../authentication/models/user_model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const OnboardingScreen();
    } else {
      return const HomeScreen();
    }
  }
}
