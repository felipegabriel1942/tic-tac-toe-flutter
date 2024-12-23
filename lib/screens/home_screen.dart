import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text('Start Game!'),
          onPressed: () {
            Navigator.pushNamed(context, '/game');
          },
        ),
      ),
    );
  }
}
