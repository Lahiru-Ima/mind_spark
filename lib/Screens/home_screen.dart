import 'package:flutter/material.dart';
import 'package:mind_spark/src/utils/home_drawer.dart';
import '../src/common_widgets/doctor_card.dart';
import '../src/common_widgets/doctor_list_card.dart';
import '../src/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {});
    _selectedIndex = index;
    if (_selectedIndex == 0) {
      Navigator.pushReplacementNamed(context, '/home_screen');
    } else if (_selectedIndex == 1) {
      Navigator.pushNamed(context, '/appointment_screen');
    } else if (_selectedIndex == 2) {
      Navigator.pushNamed(context, '/find_doc_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: kPrimaryColor,
        title: const Text('Hello Lahiru'),
        titleTextStyle: const TextStyle(
            color: kTextColor, fontSize: 22, fontWeight: FontWeight.bold),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/my_notification');
                },
                child: const Icon(Icons.notifications)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.account_circle_sharp),
          ),
        ],
      ),
      drawer: const Drawer(
        child: HomeDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_sharp),
            label: 'Find',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: kSecondaryColor,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Upcoming schedule',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(color: kExtraColor),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const DoctorCard(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Find your therapist",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/find_doc_screen');
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(color: kExtraColor),
                  ),
                )
              ],
            ),
            const Text(
              'Favorite therapist',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            const DoctorListCard(
                docname: 'Dr. Pallavi Shekar',
                doctype: 'Consultant | City Hospital',
                docimg: 'assets/images/doctor4.jpg'),
            const SizedBox(height: 20),
            const DoctorListCard(
                docname: 'Dr. Kumar Sinha',
                doctype: 'Consultant | Asiri Hospital',
                docimg: 'assets/images/doctor2.jpg'),
            const SizedBox(height: 20),
            const DoctorListCard(
                docname: 'Dr. Pallavi Shekar',
                doctype: 'Consultant | City Hospital',
                docimg: 'assets/images/doctor1.jpg'),
          ]),
        ),
      ),
    );
  }
}
