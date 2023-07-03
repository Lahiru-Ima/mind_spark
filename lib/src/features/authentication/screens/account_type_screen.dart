import 'package:flutter/material.dart';
import 'package:mind_spark/src/common_widgets/primary_button.dart';
import 'package:mind_spark/src/constants/constants.dart';
import 'package:mind_spark/src/features/authentication/screens/signup/sign_up_screen.dart';

import '../../../common_widgets/account_check.dart';

enum UserType { patient, doctor }

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        centerTitle: true,
        foregroundColor: kTextColor,
        title: const Text(
          'Account Type',
          style: TextStyle(
            color: kTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/account_type.png',
                  width: 300,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Select your accout type',
                style: TextStyle(fontSize: 16, color: kTextColor),
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                text: 'Patient',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignUpScreen(user: UserType.patient),
                    ),
                  );
                },
                width: 0.9,
                btncolor: kPrimaryColor,
                btntextcolor: kWhiteColor,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: 'Doctor',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(user: UserType.doctor),
                    ),
                  );
                },
                width: 0.9,
                btncolor: kPrimaryColor,
                btntextcolor: kWhiteColor,
              ),
              const SizedBox(height: 20),
              const AccountCheck(login: false),
            ],
          ),
        ),
      ),
    );
  }
}
