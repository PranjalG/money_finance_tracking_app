import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const EmailTextField({
    super.key,
    required this.label,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.black,
          )
        ),
        const SizedBox(),
        TextFormField(
          cursorColor: const Color(0xFF5264F9),
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 26,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
