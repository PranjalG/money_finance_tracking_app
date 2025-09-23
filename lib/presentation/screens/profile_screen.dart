import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4960F9),
      body: Stack(
        children: [
          // Content
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Profile Picture
                const Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/300"), // demo image
                    backgroundColor: Colors.white,
                  ),
                ),

                const SizedBox(height: 40),

                // Form Fields
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFormField("Username", "Emma_ashley"),
                        _buildFormField("First Name", "Emma"),
                        _buildFormField("Last Name", "Ashley"),
                        _buildFormField("Date of Birth", "01-01-1990"),
                      ],
                    ),
                  ),
                ),

                // Complete Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check,
                        size: 20,
                      ),
                      label: const Text(
                        "Update",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildFormField(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              const Divider(color: Colors.white54, thickness: 1),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.check,
            color: Colors.pinkAccent,
          ),
        ),
      ],
    ),
  );
}
