import 'package:flutter/material.dart';

class SavedOpportunity {
  final String title;
  final String category;
  final IconData icon;
  final String description;

  SavedOpportunity({
    required this.title,
    required this.category,
    required this.icon,
    required this.description,
  });
}

class SaveManager {
  static final List<SavedOpportunity> savedOpportunities = [];

  static bool isSaved(String title) {
    return savedOpportunities.any(
      (opportunity) => opportunity.title == title,
    );
  }

  static void saveOpportunity(
    SavedOpportunity opportunity,
  ) {
    if (!isSaved(opportunity.title)) {
      savedOpportunities.add(opportunity);
    }
  }

  static void removeOpportunity(String title) {
    savedOpportunities.removeWhere(
      (opportunity) => opportunity.title == title,
    );
  }
}