import 'package:flutter/material.dart';

class SmallGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? isLoading;

  const SmallGradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: GestureDetector(
        onTap: isLoading! ? null : onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
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
                  right: -130,
                  top: -120,
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
                  right: -54,
                  top: -154,
                  child: Container(
                    width: 180,
                    height: 180,
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
                      color: Color(0xAA20E2D7),
                    ),
                  ),
                ),
                Center(
                  child: isLoading!
                      ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 2.5,
                  )
                      : Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
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
