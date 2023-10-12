import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/explicit_animations_screen.dart';
import 'package:flutter_animation/screens/implicit_animations_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _goToPage(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const ImplicitAnimationsScreen(),
                );
              },
              child: const Text('Implicit Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const ExplicitAnimationScreen(),
                );
              },
              child: const Text('Explicit Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
