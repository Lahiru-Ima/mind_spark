import 'package:flutter/material.dart';
import 'package:mind_spark/src/common_widgets/primary_button.dart';

import '../constants/constants.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.24,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 33,
            color: kShadowColor,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/doctor_profile');
                },
                child: CircleAvatar(
                  backgroundImage:
                      const AssetImage('assets/images/doctor4.jpg'),
                  radius: size.width * 0.08,
                ),
              ),
              const SizedBox(width: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Pallavi Shekar',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    'Consultant',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date: 10/06/2023',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Time: 10.00 a.m - 11.00 a.m',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 15),
          PrimaryButton(
              text: 'Join your counselling',
              press: () {},
              width: 0.8,
              btncolor: kWhiteColor,
              btntextcolor: kPrimaryColor)
        ]),
      ),
    );
  }
}
