import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    String greeting = "Hello Bhargav";

    return Material(
      color: Colors.deepOrange,
      child: Center(
        child: Text(
          greeting,
          style: TextStyle(
            fontSize: 40,
            color: greeting.contains("Bhargav") ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}