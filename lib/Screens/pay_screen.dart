import 'package:flutter/material.dart';
import 'package:mind_spark/src/common_widgets/primary_button.dart';

import '../src/constants/constants.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final TextEditingController _cardname = TextEditingController();
  final TextEditingController _cardnumber = TextEditingController();
  final TextEditingController _cardexpire = TextEditingController();
  final TextEditingController _cardcvc = TextEditingController();

  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        foregroundColor: kTextColor,
        title: const Text(
          'Payment',
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  CardBox(
                      width: 0.9,
                      hinttext: 'Card Holder Name',
                      controller: _cardname),
                  const SizedBox(height: 20),
                  CardBox(
                      width: 0.9,
                      hinttext: 'Credit Card Number',
                      controller: _cardnumber),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardBox(
                          width: 0.4,
                          hinttext: 'Expiration',
                          controller: _cardexpire),
                      CardBox(
                          width: 0.4,
                          hinttext: 'CVC Code',
                          controller: _cardcvc),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Save the details',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: toggleSwitch,
                  activeColor: kPrimaryColor,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Total Amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Fee'), Text('Rs. 500')],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Charges'), Text('Rs. 1500')],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Discount'), Text('Rs. 200')],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rs. 3500',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 40),
            PrimaryButton(
                text: 'Pay',
                press: () {
                  Navigator.pushNamed(context, '/feedback_screen');
                },
                width: 0.9,
                btncolor: kPrimaryColor,
                btntextcolor: kWhiteColor)
          ],
        ),
      ),
    );
  }
}

class CardBox extends StatelessWidget {
  const CardBox(
      {super.key,
      required this.width,
      required this.hinttext,
      required this.controller});

  final double width;
  final String hinttext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * width,
      height: size.height * 0.06,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
