import 'package:flutter/material.dart';

import '../src/constants/constants.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        foregroundColor: kTextColor,
        title: const Text(
          'Reviews',
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage('images/doctor1.jpg'),
                  radius: size.width * 0.06,
                ),
                const SizedBox(width: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Pallavi Shekar',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: kTextColor),
                    ),
                    Text('Consultant'),
                  ],
                ),
              ],
            ),
            const Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: kPrimaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kPrimaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kPrimaryColor,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: kPrimaryColor,
                        ),
                        SizedBox(width: 20),
                        Text(
                          '11/06/2023',
                          style: TextStyle(color: kSecondaryColor),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 5),
            const Text('Nice therapist I ever had met'),
            const Divider(
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
