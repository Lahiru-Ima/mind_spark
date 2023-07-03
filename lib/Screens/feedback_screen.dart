import 'package:flutter/material.dart';

import '../src/constants/constants.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.2),
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 60,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Thank for purchasing',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Give your rate to the your therapist',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_border_outlined,
                        color: kPrimaryColor,
                        size: 35,
                      ),
                      Icon(Icons.star_border_outlined,
                          color: kPrimaryColor, size: 35),
                      Icon(Icons.star_border_outlined,
                          color: kPrimaryColor, size: 35),
                      Icon(Icons.star_border_outlined,
                          color: kPrimaryColor, size: 35),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: comment,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Comment',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: size.height * 0.07,
            width: double.infinity,
            color: kPrimaryColor,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Go back to home',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  Text(
                    'Review',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
