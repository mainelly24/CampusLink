import 'package:flutter/material.dart';
import 'login.dart';
import 'reg.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EBDD),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 25,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CampusLink
              const Text(
                'CampusLink',
                style: TextStyle(
                  color: Color(0xFF7A1F3D),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 75),

              // Heading
              const Text(
                'Discover.',
                style: TextStyle(
                  color: Color(0xFF7A1F3D),
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                'Connect.',
                style: TextStyle(
                  color: Color(0xFF7A1F3D),
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                'Grow.',
                style: TextStyle(
                  color: Color(0xFF252525),
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'Your gateway to opportunities, resources, '
                'and connections that help you move forward.',
                style: TextStyle(
                  color: Color(0xFF6F6862),
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 35),

              // Feature card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  color: const Color(0xFF7A1F3D),
                  borderRadius: BorderRadius.circular(25),
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Built for students.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Designed for opportunity.',
                      style: TextStyle(
                        color: Color(0xFFE8D8C3),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 56,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7A1F3D),
                    foregroundColor: Colors.white,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Registration button
              SizedBox(
                width: double.infinity,
                height: 56,

                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RegistrationPage(),
                      ),
                    );
                  },

                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF7A1F3D),

                    side: const BorderSide(
                      color: Color(0xFF7A1F3D),
                      width: 1.5,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Center(
                child: Text(
                  'A student platform for your next step.',
                  style: TextStyle(
                    color: Color(0xFF6F6862),
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}