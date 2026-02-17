import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        drawer: CustomDrawer(),
      ),
      drawer: CustomDrawer(),
      body: const Center(
        child: Text(
          'About Screen',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF2D5016),
          ),
        ),
      ),
    );
  }
}