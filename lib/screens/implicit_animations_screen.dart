import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() =>
      _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  bool _visibleA = true;
  bool _visibleB = true;
  void _triggerA() {
    setState(() {
      _visibleA = !_visibleA;
    });
  }

  void _triggerB() {
    setState(() {
      _visibleB = !_visibleB;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: ColorTween(
                begin: Colors.pink,
                end: Colors.cyan,
              ),
              curve: Curves.bounceInOut,
              duration: const Duration(
                milliseconds: 1500,
              ),
              builder: (context, value, child) {
                return Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/4f/Dash%2C_the_mascot_of_the_Dart_programming_language.png',
                  color: value,
                  colorBlendMode: BlendMode.colorBurn,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _triggerB,
              child: const Text('Go!'),
            ),
          ],
        ),
      ),
    );
  }
}
