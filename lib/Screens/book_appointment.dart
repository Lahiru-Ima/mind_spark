import 'package:flutter/material.dart';
import 'package:mind_spark/src/common_widgets/primary_button.dart';
import 'package:table_calendar/table_calendar.dart';

import '../src/common_widgets/alert_box.dart';
import '../src/constants/constants.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focuseday) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        foregroundColor: kTextColor,
        title: const Text(
          'Book Appointments',
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TableCalendar(
              rowHeight: 48,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              focusedDay: today,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              firstDay: DateTime.utc(2020, 10, 16),
              lastDay: DateTime.utc(2030, 10, 16),
              onDaySelected: _onDaySelected,
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                      ),
                      child: const Text('9 a.m - 10 a.m'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                      ),
                      child: const Text('10 a.m - 11 a.m'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: kTextColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                      ),
                      child: const Text(' 2 p.m -  3 p.m'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: kTextColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                      ),
                      child: const Text(' 3 p.m -  4 p.m'),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            PrimaryButton(
                text: 'Book Appointment',
                press: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (ctx) => AlertBox(
                      title: 'Appointment Successful',
                      subtitle:
                          'Your appointment was send to doctorand still wait for conformation.',
                      btntext: 'Home',
                      press: () {
                        Navigator.pushNamed(context, '/home_screen');
                      },
                    ),
                  );
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
