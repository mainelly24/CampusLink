import 'package:flutter/material.dart';
import 'save_manager.dart';

class OpportunityDetailsPage extends StatefulWidget {
  final String title;
  final String category;
  final IconData icon;
  final String description;

  const OpportunityDetailsPage({
    super.key,
    required this.title,
    required this.category,
    required this.icon,
    required this.description,
  });

  @override
  State<OpportunityDetailsPage> createState() =>
      _OpportunityDetailsPageState();
}

class _OpportunityDetailsPageState
    extends State<OpportunityDetailsPage> {
  static const Color burgundy = Color(0xFF7A1F3D);
  static const Color beige = Color(0xFFF5EBDD);
  static const Color lightBeige = Color(0xFFE8D8C3);
  static const Color darkText = Color(0xFF252525);
  static const Color greyText = Color(0xFF6F6862);

  bool get isSaved => SaveManager.isSaved(widget.title);

  void toggleSave() {
    final currentlySaved = isSaved;

    setState(() {
      if (currentlySaved) {
        SaveManager.removeOpportunity(widget.title);
      } else {
        SaveManager.saveOpportunity(
          SavedOpportunity(
            title: widget.title,
            category: widget.category,
            icon: widget.icon,
            description: widget.description,
          ),
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: burgundy,
        content: Text(
          currentlySaved
              ? 'Opportunity removed from saved'
              : 'Opportunity saved successfully',
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

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: burgundy,
          ),
        ),

        title: const Text(
          'Opportunity Details',
          style: TextStyle(
            color: burgundy,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: burgundy,
                borderRadius: BorderRadius.circular(22),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    width: 65,
                    height: 65,

                    decoration: BoxDecoration(
                      color: lightBeige,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Icon(
                      widget.icon,
                      color: burgundy,
                      size: 32,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.category,
                    style: const TextStyle(
                      color: lightBeige,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'About this opportunity',
              style: TextStyle(
                color: darkText,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              widget.description,
              style: const TextStyle(
                color: greyText,
                fontSize: 15,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            // Information card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Why consider this opportunity?',
                    style: TextStyle(
                      color: darkText,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    'This opportunity can help you gain experience, '
                    'develop useful skills, build your network, and '
                    'take another step toward your career goals.',
                    style: TextStyle(
                      color: greyText,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Save button
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: toggleSave,

                style: ElevatedButton.styleFrom(
                  backgroundColor: burgundy,
                  foregroundColor: Colors.white,
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(
                      isSaved
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                    ),

                    const SizedBox(width: 10),

                    Text(
                      isSaved
                          ? 'Remove from Saved'
                          : 'Save Opportunity',

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}