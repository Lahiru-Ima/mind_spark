import 'package:flutter/material.dart';

class OTPInput extends StatefulWidget {
  const OTPInput(
      {super.key,
      required this.first,
      required this.last,
      required this.index});
  final bool first;
  final bool last;
  final int index;
  @override
  State<OTPInput> createState() => _OTPInputState();
}

late final bool first;
late final bool last;
late final int index;

class _OTPInputState extends State<OTPInput> {
  List<String?> otp = List<String?>.filled(4, '0');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.0,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextFormField(
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return '';
            } else {
              return null;
            }
          },
          autofocus: true,
          onChanged: (value) {
            otp[index] = value;
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          textAlign: TextAlign.center,
          showCursor: false,
          readOnly: false,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(), //hide the input length count
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.red),
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 2, color: Colors.black12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 2, color: Colors.cyan),
            ),
          ),
        ),
      ),
    );
  }
}
