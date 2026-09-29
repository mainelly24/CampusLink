import 'package:flutter/material.dart';
import 'home.dart';
import 'opportunities.dart';
import 'saved.dart';
import 'about.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color burgundy = Color(0xFF7A1F3D);
  static const Color beige = Color(0xFFF5EBDD);
  static const Color lightBeige = Color(0xFFE8D8C3);
  static const Color darkText = Color(0xFF252525);
  static const Color greyText = Color(0xFF6F6862);

  void navigateTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OpportunitiesPage(),
        ),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SavedPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,

      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: burgundy,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // PROFILE HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: burgundy,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: lightBeige,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: burgundy,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Nelly',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Student',
                    style: TextStyle(
                      color: lightBeige,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // PERSONAL INFORMATION
            _sectionTitle('Personal Information'),

            const SizedBox(height: 12),

            _profileItem(
              Icons.person_outline,
              'Full Name',
              'Nelly',
            ),

            _profileItem(
              Icons.email_outlined,
              'Email',
              'nelly@example.com',
            ),

            _profileItem(
              Icons.school_outlined,
              'University',
              'Catholic University Institute of Buea',
            ),

            _profileItem(
              Icons.computer_outlined,
              'Field of Study',
              'Software Engineering',
            ),

            const SizedBox(height: 20),

            // ACCOUNT
            _sectionTitle('Account'),

            const SizedBox(height: 12),

            _actionItem(
              context,
              Icons.bookmark_outline,
              'Saved Opportunities',
              'View your saved opportunities',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedPage(),
                  ),
                );
              },
            ),

            _actionItem(
              context,
              Icons.notifications_none,
              'Notifications',
              'Manage your notifications',
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: burgundy,
                    content: Text(
                      'Notifications settings coming soon.',
                    ),
                  ),
                );
              },
            ),

            _actionItem(
              context,
              Icons.settings_outlined,
              'Settings',
              'Manage your account settings',
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: burgundy,
                    content: Text(
                      'Settings coming soon.',
                    ),
                  ),
                );
              },
            ),

            _actionItem(
              context,
              Icons.info_outline,
              'About CampusLink',
              'Learn more about the app',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // LOGOUT
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text(
                          'Are you sure you want to logout?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: burgundy,
                              ),
                            ),
                          ),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  backgroundColor: burgundy,
                                  content: Text(
                                    'Logged out successfully.',
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: burgundy,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.logout,
                  color: burgundy,
                ),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    color: burgundy,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: burgundy,
                  side: const BorderSide(
                    color: burgundy,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: burgundy,
        unselectedItemColor: greyText,
        onTap: (index) {
          navigateTo(context, index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            activeIcon: Icon(Icons.bookmark),
            label: 'Saved',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: darkText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget _profileItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: lightBeige,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: burgundy,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: greyText,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    color: darkText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _actionItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: lightBeige,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: burgundy,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: darkText,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: greyText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: greyText,
            ),
          ],
        ),
      ),
    );
  }
}