import 'package:flutter/material.dart';
import 'package:mind_spark/src/common_widgets/primary_button.dart';

import '../src/constants/constants.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        foregroundColor: kTextColor,
        title: const Text(
          'Doctor Profile',
          style: TextStyle(color: kTextColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('images/doctor4.jpg'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 33,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Viraj Sankalpa',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kTextColor),
                ),
                SizedBox(height: 10),
                Text(
                  'Counsultant | City Hospital Kandy',
                  style: TextStyle(color: kTextColor, fontSize: 14),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text('45 reviews')
                      ],
                    ),
                    Text(
                      'Review',
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kTextColor),
                ),
                SizedBox(height: 10),
                Text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an  printer took a galley of type and scrambled it to make a type specimen .It has survived not only five centuries, but also the leap into electronic  essentially unchanged. It was in the 1960s with the release of Letraset sheets containing and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(height: 1.8),
                ),
                SizedBox(height: 10),
                Text(
                  'Read more',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(height: 20),
            PrimaryButton(
                text: 'Book Appointment',
                press: () {
                  Navigator.pushNamed(context, '/book_appointment');
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
