import 'package:flutter/material.dart';

class MediumGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const MediumGradientButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4960F9),
                  Color(0xFF1937FE),
                ],
              ),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  right: -30,
                  bottom: 30,
                  child: Container(
                    width: 177,
                    height: 177,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 0.8, 1],
                        colors: [
                          Color(0xFF9500FF),
                          Color(0xFFC72FF8),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -50,
                  top: 40,
                  child: Container(
                    width: 236,
                    height: 236,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.8],
                        colors: [
                          Color(0xFF5264F9),
                          Color(0xFF3AF9EF),
                        ],
                      ),
                      color: Color(0x7620E2D7), // cyan with transparency
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
