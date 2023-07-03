import 'package:flutter/material.dart';
import 'package:mind_spark/src/features/authentication/Services/auth_service.dart';
import 'package:mind_spark/src/common_widgets/account_check.dart';
import 'package:mind_spark/src/common_widgets/primary_button.dart';
import 'package:mind_spark/src/constants/constants.dart';
import '../../../../common_widgets/input_text_field.dart';
import '../forget_password/forget_pw_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignInScreen> {
  final _formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool passToggle = true;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        foregroundColor: kTextColor,
        title: const Text(
          'Login',
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/login.png',
                      width: 300,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    width: 0.9,
                    controller: email,
                    hintText: 'Enter email address',
                    labelText: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)")
                          .hasMatch(value);
                      if (value.isEmpty) {
                        return "Enter email";
                      } else if (!emailValid) {
                        return "Enter valid email";
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    width: 0.9,
                    controller: password,
                    hintText: 'Enter password',
                    labelText: 'Password',
                    obscureText: passToggle,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter password";
                      } else if (password.text.length < 6) {
                        return "Password length should be more than 6 characters";
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      forgetPwBottomSheet(context);
                    },
                    child: const Text(
                      'Forget Password ?',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    text: 'Log in',
                    press: () async {
                      if (_formkey.currentState!.validate()) {
                        await AuthServices().signInWithEmailAndPassword(
                            email.text.trim(), password.text.trim());
                        await Navigator.pushNamed(context, '/home_screen');
                      }
                    },
                    width: 0.9,
                    btncolor: kPrimaryColor,
                    btntextcolor: kWhiteColor,
                  ),
                  const SizedBox(height: 20),
                  const AccountCheck(login: true),
                ],
              )),
        ),
      ),
    );
  }
}
