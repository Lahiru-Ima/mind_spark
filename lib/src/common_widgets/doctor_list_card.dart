import 'package:flutter/material.dart';

import '../constants/constants.dart';

class DoctorListCard extends StatelessWidget {
  const DoctorListCard({
    super.key,
    required this.docname,
    required this.doctype,
    required this.docimg,
  });

  final String docname;
  final String doctype;
  final String docimg;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(docimg),
          radius: size.width * 0.1,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              docname,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: kTextColor),
            ),
            Text(
              doctype,
              style: const TextStyle(color: kTextColor, fontSize: 14),
            ),
            const Row(
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
            )
          ],
        ),
      ],
    );
  }
}
