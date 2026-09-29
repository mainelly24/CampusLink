import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const Color burgundy = Color(0xFF7A1F3D);
  static const Color beige = Color(0xFFF5EBDD);
  static const Color lightBeige = Color(0xFFE8D8C3);
  static const Color darkText = Color(0xFF252525);
  static const Color greyText = Color(0xFF6F6862);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,

      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: burgundy,
          ),
        ),
        title: const Text(
          'About CampusLink',
          style: TextStyle(
            color: burgundy,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: burgundy,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.school_rounded,
                color: lightBeige,
                size: 48,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'CampusLink',
              style: TextStyle(
                color: burgundy,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Connect. Discover. Grow.',
              style: TextStyle(
                color: greyText,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 30),

            _infoCard(
              title: 'About CampusLink',
              text:
                  'CampusLink is a student-focused platform designed to help students discover opportunities and resources that can support their education and career development.',
            ),

            _infoCard(
              title: 'Our Mission',
              text:
                  'Our mission is to make opportunities easier for students to discover, explore and save in one convenient place.',
            ),

            _infoCard(
              title: 'What You Can Find',
              text:
                  'Students can explore scholarships, internships, jobs, training programs and other useful opportunities.',
            ),

            const SizedBox(height: 20),

            const Text(
              'Version 1.0.0',
              style: TextStyle(
                color: greyText,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required String title,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: darkText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              color: greyText,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}