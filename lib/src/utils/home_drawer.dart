import 'package:flutter/material.dart';
import 'package:mind_spark/src/features/authentication/Services/auth_service.dart';
import 'package:mind_spark/src/constants/constants.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: kPrimaryColor,
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Lahiru Munasinghe',
                  style: TextStyle(
                    fontSize: 22,
                    color: kTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'lahiru.sl24@gmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/edit_profile');
          },
        ),
        ListTile(
          leading: const Icon(Icons.reviews),
          title: const Text(
            'Reviews',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/review');
          },
        ),
        ListTile(
          leading: const Icon(Icons.wallet),
          title: const Text(
            'My Wallet',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/pay_screen');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text(
            'Settings',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.arrow_back),
          title: const Text(
            'Logout',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () async {
            await AuthServices().signOut();
            Navigator.pushNamed(context, '/sign_in_screen');
          },
        )
      ],
    );
  }
}
