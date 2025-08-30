// Pantry Screen
import 'package:flutter/material.dart';

class PantryScreen extends StatelessWidget {
  const PantryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Pantry')),
      body: Center(child: Text('Pantry List Here')),
    );
  }
}
