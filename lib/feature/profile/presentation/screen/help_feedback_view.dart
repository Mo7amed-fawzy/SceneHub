import 'package:flutter/material.dart';

class HelpFeedbackPage extends StatelessWidget {
  const HelpFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181727),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181727),
        title: const Text(
          "Help & Feedback",
          style: TextStyle(color: Colors.white),
        ),
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
            "For help and feedback, contact support@yourapp.com or fill out the feedback form.",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
