import 'package:flutter/material.dart';
import '../../common_widgets/primary_button.dart';
import '../../constants/constants.dart';
import '../../utils/onbording_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  late PageController _controller;

  List<Map<String, String>> onbordingData = [
    {
      "text": "Schedule Appointment",
      "subtext":
          "Patients can take an appointments \nand therapist can confirm their requests",
      "image": "assets/images/onboarding_1.png"
    },
    {
      "text": "Online Payment",
      "subtext": "Patients can do the online payments \neasily.",
      "image": "assets/images/onboarding_2.png"
    },
    {
      "text": "Video Conference",
      "subtext": "Meet your patient or doctor through the \nvideo conference.",
      "image": "assets/images/onboarding_3.png"
    },
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onbordingData.length,
                  itemBuilder: (context, index) => OnbordingContent(
                    text: onbordingData[index]['text'].toString(),
                    subtext: onbordingData[index]['subtext'].toString(),
                    image: onbordingData[index]['image'].toString(),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onbordingData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                      text: currentPage == onbordingData.length - 1
                          ? "Continue"
                          : "Let's get start",
                      press: () {
                        if (currentPage == onbordingData.length - 1) {
                          Navigator.pushNamed(context, '/account_type_screen');
                        }
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      },
                      width: 0.9,
                      btncolor: kPrimaryColor,
                      btntextcolor: kWhiteColor,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/account_type_screen');
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 5,
      width: currentPage == index ? 13 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
