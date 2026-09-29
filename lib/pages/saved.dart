import 'package:flutter/material.dart';

import 'opportunity_details.dart';
import 'save_manager.dart';
import 'opportunities.dart';
import 'profile.dart';
import 'home.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  static const Color burgundy = Color(0xFF7A1F3D);
  static const Color beige = Color(0xFFF5EBDD);
  static const Color lightBeige = Color(0xFFE8D8C3);
  static const Color darkText = Color(0xFF252525);
  static const Color greyText = Color(0xFF6F6862);

  void openOpportunity(SavedOpportunity opportunity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OpportunityDetailsPage(
          title: opportunity.title,
          category: opportunity.category,
          icon: opportunity.icon,
          description: opportunity.description,
        ),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  void removeOpportunity(SavedOpportunity opportunity) {
    SaveManager.removeOpportunity(opportunity.title);

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: burgundy,
        content: Text(
          '${opportunity.title} removed from saved',
        ),
      ),
    );
  }

  void navigateTo(int index) {
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
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final savedOpportunities = SaveManager.savedOpportunities;

    return Scaffold(
      backgroundColor: beige,

      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,

        title: const Text(
          'Saved Opportunities',
          style: TextStyle(
            color: burgundy,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),

      body: savedOpportunities.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border_rounded,
                    size: 70,
                    color: burgundy,
                  ),

                  SizedBox(height: 15),

                  Text(
                    'No saved opportunities',
                    style: TextStyle(
                      color: darkText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Opportunities you save will appear here.',
                    style: TextStyle(
                      color: greyText,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: savedOpportunities.length,

              itemBuilder: (context, index) {
                final opportunity =
                    savedOpportunities[index];

                return GestureDetector(
                  onTap: () {
                    openOpportunity(opportunity);
                  },

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
                            borderRadius:
                                BorderRadius.circular(16),
                          ),

                          child: Icon(
                            opportunity.icon,
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
                                opportunity.title,
                                style: const TextStyle(
                                  color: darkText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                opportunity.category,
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

                        IconButton(
                          onPressed: () {
                            removeOpportunity(
                              opportunity,
                            );
                          },

                          icon: const Icon(
                            Icons.bookmark_rounded,
                            color: burgundy,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        selectedItemColor: burgundy,
        unselectedItemColor: greyText,

        onTap: navigateTo,

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
}