// Paywall Screen
import 'package:flutter/material.dart';

class PaywallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upgrade to Premium')),
      body: Center(child: Text('Paywall and subscription options here.')),
    );
  }
}
