import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? val;
  final ValueChanged<String> onChanged;
  final bool? isPasswordField;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  const CustomTextField({
    super.key,
    required this.label,
    required this.val,
    required this.onChanged,
    this.isPasswordField = false,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: val,
          focusNode: focusNode,
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            color: Color(0xFF5264F9),
          ),
          obscureText: isPasswordField ?? false,
          textInputAction: textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black87,
            ),
            border: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF5264F9),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 4,
            ),
            hintText: "Enter $label",
          ),
          onChanged: onChanged,
          onFieldSubmitted: (_) {
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            } else {
              FocusScope.of(context).unfocus();
            }
          },
        ),
      ],
    );
  }
}
