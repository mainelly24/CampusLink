import 'package:flutter/material.dart';
import 'opportunities.dart';
import 'saved.dart';
import 'profile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const Color burgundy = Color(0xFF7A1F3D);
  static const Color beige = Color(0xFFF5EBDD);
  static const Color lightBeige = Color(0xFFE8D8C3);
  static const Color darkText = Color(0xFF252525);
  static const Color greyText = Color(0xFF6F6862);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: burgundy,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Hello, Student 👋',
              style: TextStyle(
                color: darkText,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Find opportunities and take your next step.',
              style: TextStyle(
                color: greyText,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 25),

            // ================= EXPLORE BANNER =================
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const OpportunitiesPage(),
                  ),
                );
              },

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: burgundy,
                  borderRadius: BorderRadius.circular(22),
                ),

                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Icon(
                      Icons.explore_rounded,
                      color: lightBeige,
                      size: 38,
                    ),

                    SizedBox(height: 15),

                    Text(
                      'Explore Opportunities',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Discover scholarships, internships, jobs and training programs.',
                      style: TextStyle(
                        color: lightBeige,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ================= CATEGORIES =================
            const Text(
              'Categories',
              style: TextStyle(
                color: darkText,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            GridView.count(
              crossAxisCount: 2,

              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),

              crossAxisSpacing: 12,
              mainAxisSpacing: 12,

              // Smaller cards
              childAspectRatio: 1.25,

              children: [
                _categoryCard(
                  context,
                  Icons.school_outlined,
                  'Scholarships',
                  'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=600',
                ),

                _categoryCard(
                  context,
                  Icons.work_outline,
                  'Internships',
                  'https://images.unsplash.com/photo-1521737711867-e3b97375f902?w=600',
                ),

                _categoryCard(
                  context,
                  Icons.business_center_outlined,
                  'Jobs',
                  'https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=600',
                ),

                _categoryCard(
                  context,
                  Icons.laptop_mac_outlined,
                  'Training',
                  'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600',
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ================= VIEW ALL BUTTON =================
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const OpportunitiesPage(),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: burgundy,
                  foregroundColor: Colors.white,
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),

                child: const Text(
                  'View All Opportunities',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        type: BottomNavigationBarType.fixed,

        selectedItemColor: burgundy,
        unselectedItemColor: greyText,

        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const OpportunitiesPage(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const SavedPage(),
              ),
            );
          }

          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ProfilePage(),
              ),
            );
          }
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

  // ================= CATEGORY CARD =================
  Widget _categoryCard(
    BuildContext context,
    IconData icon,
    String title,
    String imageUrl,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const OpportunitiesPage(),
          ),
        );
      },

      child: Container(
        height: 145,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(16),

          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withValues(alpha: 0.06),

              blurRadius: 8,

              offset: const Offset(0, 3),
            ),
          ],
        ),

        clipBehavior: Clip.antiAlias,

        child: Stack(
          children: [
            // ================= IMAGE =================
            Positioned.fill(
              child: Image.network(
                imageUrl,

                fit: BoxFit.cover,

                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    color: lightBeige,

                    child: Center(
                      child: Icon(
                        icon,
                        color: burgundy,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
            ),

            // ================= DARK OVERLAY =================
            Positioned.fill(
              child: Container(
                color:
                    Colors.black.withValues(alpha: 0.40),
              ),
            ),

            // ================= CARD TEXT =================
            Positioned(
              left: 15,
              right: 15,
              bottom: 14,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 25,
                  ),

                  const SizedBox(height: 5),

                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}