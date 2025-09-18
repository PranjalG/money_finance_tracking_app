import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  final double? iconSize;
  final double? verticalPadding;

  const SmallButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.iconSize,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.078,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 34, vertical: verticalPadding ?? 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xFF4960F9),
            width: 1,
          ),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Color(0xFF4960F9),
              ),
            ),
            Icon(
              icon ?? Icons.arrow_forward,
              color: const Color(0xFF4960F9),
              size: iconSize ?? 18,
            ),
          ],
        ),
      ),
    );
  }
}
