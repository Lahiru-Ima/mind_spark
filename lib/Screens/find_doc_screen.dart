import 'package:flutter/material.dart';

import '../src/common_widgets/doctor_list_card.dart';
import '../src/constants/constants.dart';

class FindDocScreen extends StatefulWidget {
  const FindDocScreen({super.key});

  @override
  State<FindDocScreen> createState() => _FindDocScreenState();
}

class _FindDocScreenState extends State<FindDocScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        foregroundColor: kTextColor,
        title: const Text(
          'Find Therapist',
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.06,
                child: SearchBar(
                  controller: searchController,
                  hintText: 'Search your doctor',
                  trailing: const [
                    Icon(
                      Icons.search,
                      color: kSecondaryColor,
                    )
                  ],
                  hintStyle: const MaterialStatePropertyAll(
                    TextStyle(color: kSecondaryColor, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const DoctorListCard(
                  docname: 'Dr. Pallavi Shekar',
                  doctype: 'Consultant | City Hospital',
                  docimg: 'assets/images/doctor1.jpg'),
              const SizedBox(height: 20),
              const DoctorListCard(
                  docname: 'Dr. Kumar Sinha',
                  doctype: 'Consultant | Asiri Hospital',
                  docimg: 'assets/images/doctor2.jpg'),
              const SizedBox(height: 20),
              const DoctorListCard(
                  docname: 'Dr. Himashi Disanayake',
                  doctype: 'Consultant | General Hospital ',
                  docimg: 'assets/images/doctor3.jpg'),
              const SizedBox(height: 20),
              const DoctorListCard(
                  docname: 'Dr. Prakash Guptha',
                  doctype: 'Consultant | Kegalle Hospital',
                  docimg: 'assets/images/doctor4.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
