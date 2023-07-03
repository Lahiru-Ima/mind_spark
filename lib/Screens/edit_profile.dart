import 'package:flutter/material.dart';
import 'package:mind_spark/src/common_widgets/input_text_field.dart';

import '../src/constants/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        foregroundColor: kTextColor,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            backgroundImage: const AssetImage('assets/images/profile.jpg'),
            radius: size.width * 0.15,
          ),
          OutlinedButton(
              onPressed: () {}, child: const Text('Change profile photo')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: size.height * 0.4,
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
              child: Form(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    InputTextField(
                        width: 0.8,
                        hintText: 'Enter full name',
                        labelText: 'Full name',
                        controller: _fullname),
                    InputTextField(
                        width: 0.8,
                        hintText: 'Enter email',
                        labelText: 'Email',
                        controller: _email),
                    InputTextField(
                        width: 0.8,
                        hintText: 'Enter phone number',
                        labelText: 'Phone number',
                        controller: _phonenumber),
                    InputTextField(
                        width: 0.8,
                        hintText: 'Enter address',
                        labelText: 'Address',
                        controller: _address)
                  ],
                ),
              )),
            ),
          ),
          Container(
            height: size.height * 0.07,
            width: double.infinity,
            color: kPrimaryColor,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Next',
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
