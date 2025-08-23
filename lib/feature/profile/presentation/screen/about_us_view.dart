import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181727),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181727),
        title: const Text("About Us", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF232138),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "SceneHub is an innovative app for movie lovers. Our mission is to bring you the latest and greatest in entertainment.",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
