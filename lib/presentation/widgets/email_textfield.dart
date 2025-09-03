import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final String label;
  final String? val;
  final ValueChanged<String> onChanged;

  const EmailTextField({
    super.key,
    required this.label,
    required this.val,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: val,
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          cursorColor: const Color(0xFF5264F9),
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF5264F9), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            hintText: "Enter your email",
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
