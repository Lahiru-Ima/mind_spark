import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.press,
    required this.width,
    required this.btncolor,
    required this.btntextcolor,
  });
  final VoidCallback? press;
  final String text;
  final double width;
  final Color btncolor;
  final Color btntextcolor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: btntextcolor),
        ),
      ),
    );
  }
}
