import 'package:flutter/material.dart';
import 'package:mind_spark/src/common_widgets/primary_button.dart';

import '../constants/constants.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userimg,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.starttime,
    required this.endtime,
  });

  final String userimg;
  final String title;
  final String subtitle;
  final String date;
  final String starttime;
  final String endtime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.24,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor,
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
              CircleAvatar(
                backgroundImage: AssetImage(userimg),
                radius: size.width * 0.08,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kTextColor),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: kTextColor, fontSize: 17),
                  )
                ],
              ),
            ],
          ),
          const Divider(color: kSecondaryColor),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date: $date',
                style: const TextStyle(color: kTextColor),
              ),
              Text(
                'Time: $starttime - $endtime',
                style: const TextStyle(color: kTextColor),
              )
            ],
          ),
          const SizedBox(height: 15),
          PrimaryButton(
              text: 'Join your counselling',
              press: () {},
              width: 0.8,
              btncolor: kPrimaryColor,
              btntextcolor: kWhiteColor)
        ]),
      ),
    );
  }
}
