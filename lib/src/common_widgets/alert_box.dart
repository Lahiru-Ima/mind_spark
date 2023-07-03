import 'package:flutter/material.dart';
import 'package:mind_spark/src/common_widgets/primary_button.dart';
import 'package:mind_spark/src/constants/constants.dart';

class AlertBox extends StatelessWidget {
  const AlertBox(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.btntext,
      required this.press});
  final String title;
  final String subtitle;
  final String btntext;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      icon: const Icon(
        Icons.check_circle_rounded,
        color: kPrimaryColor,
        size: 50,
      ),
      title: Text(title),
      titleTextStyle: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: kPrimaryColor),
      content: SizedBox(
        height: size.height * 0.18,
        child: Column(
          children: [
            Text(
              subtitle,
              style: const TextStyle(color: kTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              text: btntext,
              press: press,
              width: 0.7,
              btncolor: kPrimaryColor,
              btntextcolor: kWhiteColor,
            )
          ],
        ),
      ),
    );
  }
}
