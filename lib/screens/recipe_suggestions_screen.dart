// Recipe Suggestions Screen
import 'package:flutter/material.dart';

class RecipeSuggestionsScreen extends StatelessWidget {
  const RecipeSuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Suggestions')),
      body: Center(child: Text('Recipe Suggestions Here')),
    );
  }
}
