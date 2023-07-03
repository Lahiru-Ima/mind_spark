import 'package:flutter/material.dart';
import 'package:mind_spark/src/constants/constants.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  const AccountCheck({
    Key? key,
    this.login = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account ? " : "Already have an account ? ",
          style: const TextStyle(color: kTextColor),
        ),
        GestureDetector(
          onTap: () {
            login
                ? Navigator.pushNamed(context, '/sign_up_screen')
                : Navigator.pushNamed(context, '/sign_in_screen');
          },
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
                color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
