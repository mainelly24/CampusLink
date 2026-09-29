import 'package:flutter/material.dart';

import 'opportunity_details.dart';
import 'saved.dart';
import 'profile.dart';


class OpportunitiesPage extends StatefulWidget {
  const OpportunitiesPage({super.key});

  @override
  State<OpportunitiesPage> createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage> {
  static const Color burgundy = Color(0xFF7A1F3D);
  static const Color beige = Color(0xFFF5EBDD);
  static const Color lightBeige = Color(0xFFE8D8C3);
  static const Color darkText = Color(0xFF252525);
  static const Color greyText = Color(0xFF6F6862);

  String selectedCategory = 'All';

  final List<Map<String, dynamic>> opportunities = [
    {
      'title': 'Software Engineering Internship',
      'type': 'Internship',
      'category': 'Technology',
      'icon': Icons.code_rounded,
      'description':
          'Explore software engineering internship opportunities and gain practical experience in programming and software development.',
    },
    {
      'title': 'International Student Scholarship',
      'type': 'Scholarship',
      'category': 'Education',
      'icon': Icons.school_rounded,
      'description':
          'Discover scholarship opportunities that can help students pursue their academic goals.',
    },
    {
      'title': 'Junior UI/UX Designer',
      'type': 'Job',
      'category': 'Design',
      'icon': Icons.design_services_rounded,
      'description':
          'Discover entry-level design opportunities where you can develop your UI/UX design skills and build professional experience.',
    },
    {
      'title': 'Digital Skills Bootcamp',
      'type': 'Training',
      'category': 'Technology',
      'icon': Icons.laptop_mac_rounded,
      'description':
          'Develop practical digital skills through training programs covering technology and modern workplace skills.',
    },
    {
      'title': 'Young Leaders Mentorship',
      'type': 'Mentorship',
      'category': 'Leadership',
      'icon': Icons.groups_rounded,
      'description':
          'Connect with mentors and develop leadership, communication and professional skills.',
    },
  ];

  List<Map<String, dynamic>> get filteredOpportunities {
    if (selectedCategory == 'All') {
      return opportunities;
    }

    return opportunities.where((opportunity) {
      return opportunity['type'] == selectedCategory;
    }).toList();
  }

  void openOpportunity(Map<String, dynamic> opportunity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OpportunityDetailsPage(
          title: opportunity['title'],
          category: opportunity['category'],
          icon: opportunity['icon'],
          description: opportunity['description'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,

      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        title: const Text(
          'Explore Opportunities',
          style: TextStyle(
            color: burgundy,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Find your next opportunity',
              style: TextStyle(
                color: darkText,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Discover opportunities that can help you grow your career.',
              style: TextStyle(
                color: greyText,
                fontSize: 14,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search opportunities...',
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: burgundy,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Categories',
              style: TextStyle(
                color: darkText,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _categoryChip('All'),
                  _categoryChip('Scholarship'),
                  _categoryChip('Internship'),
                  _categoryChip('Job'),
                  _categoryChip('Training'),
                  _categoryChip('Mentorship'),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Available Opportunities',
              style: TextStyle(
                color: darkText,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            ...filteredOpportunities.map(
              (opportunity) => _opportunityCard(opportunity),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: burgundy,
        unselectedItemColor: greyText,

        onTap: (index) {
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SavedPage(),
              ),
            );
          }

          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
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

  Widget _categoryChip(String title) {
    final isSelected = selectedCategory == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },

      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: isSelected ? burgundy : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),

        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : burgundy,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _opportunityCard(
    Map<String, dynamic> opportunity,
  ) {
    return GestureDetector(
      onTap: () => openOpportunity(opportunity),

      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),

        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,

              decoration: BoxDecoration(
                color: lightBeige,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Icon(
                opportunity['icon'],
                color: burgundy,
                size: 28,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    opportunity['title'],
                    style: const TextStyle(
                      color: darkText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '${opportunity['type']} • ${opportunity['category']}',
                    style: const TextStyle(
                      color: greyText,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'View opportunity →',
                    style: TextStyle(
                      color: burgundy,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: burgundy,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}