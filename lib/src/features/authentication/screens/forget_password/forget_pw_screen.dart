import 'package:flutter/material.dart';
import 'package:mind_spark/src/constants/constants.dart';
import '../../../../common_widgets/input_text_field.dart';
import '../../../../common_widgets/otp_input.dart';
import '../../../../common_widgets/primary_button.dart';

final TextEditingController _forgetpwemail = TextEditingController();
final TextEditingController _newpassword = TextEditingController();
final TextEditingController _confirmpassword = TextEditingController();
final _otpformKey = GlobalKey<FormState>();

forgetPwBottomSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      builder: (context) => SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.5,
                  padding: kDefaultPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Divider(
                        indent: size.width * 0.4,
                        endIndent: size.width * 0.4,
                        thickness: 5,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 20),
                      const Text('Forget Password',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      const Text(
                        'Enter your email for the verification proccess, we will send 4 digits code to your email.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Email: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      InputTextField(
                        width: 0.9,
                        controller: _forgetpwemail,
                        hintText: 'Enter email address',
                        labelText: 'Email Address',
                      
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      PrimaryButton(
                          text: 'Continue',
                          press: () {
                            Navigator.pop(context);
                            otpCodeBottomSheet(context);
                          },
                          width: 0.9, btncolor: kPrimaryColor, btntextcolor: kWhiteColor,),
                    ],
                  ),
                ),
              ],
            ),
          ));
}

//this for OTP popup bottom sheet
otpCodeBottomSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    builder: (context) => SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          Container(
            height: size.height * 0.5,
            padding: kDefaultPadding,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 5),
              Divider(
                indent: size.width * 0.4,
                endIndent: size.width * 0.4,
                thickness: 5,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 20),
              const Text('Verify Code',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text(
                'Enter the 4 digits code that you received on your email.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Form(
                key: _otpformKey,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OTPInput(first: true, last: false, index: 0),
                    OTPInput(first: false, last: false, index: 1),
                    OTPInput(first: false, last: false, index: 2),
                    OTPInput(first: false, last: true, index: 3),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('If you didn\'t receive a code? '),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kPrimaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                  text: 'Continue',
                  press: () {
                    Navigator.pop(context);
                    resetPwBottomSheet(context);
                  },
                  width: 0.9, btncolor: kPrimaryColor, btntextcolor: kWhiteColor,),
            ]),
          ),
        ],
      ),
    ),
  );
}

//this for reset password popup bottom sheet
resetPwBottomSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (context) => SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.6,
                  padding: kDefaultPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Divider(
                        indent: size.width * 0.4,
                        endIndent: size.width * 0.4,
                        thickness: 5,
                        color: Colors.grey.shade300,
                      ),
                      const Text('Reset Password',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      const Text(
                        'Set the new password for your account so you can login and access all the features.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'New Password:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      InputTextField(
                        width: 0.9,
                        controller: _newpassword,
                        hintText: 'Enter password',
                        labelText: 'Password',
                      
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Confirm Password:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      InputTextField(
                        width: 0.9,
                        controller: _confirmpassword,
                        hintText: 'Enter password',
                        labelText: 'Password',
                     
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 30),
                      PrimaryButton(
                          text: 'Continue',
                          press: () {
                            Navigator.pop(context);
                          },
                          width: 0.9, btncolor: kPrimaryColor, btntextcolor: kWhiteColor),
                    ],
                  ),
                ),
              ],
            ),
          ));
}
