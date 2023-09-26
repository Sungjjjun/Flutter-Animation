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
            AnimatedAlign(
              alignment: _visibleA ? Alignment.center : Alignment.centerRight,
              duration: const Duration(
                milliseconds: 500,
              ),
              child: AnimatedOpacity(
                opacity: _visibleA ? 1 : 0,
                duration: const Duration(
                  milliseconds: 500,
                ),
                child: SizedBox(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  child: Container(
                    color: Colors.amber,
                    child: const Text(
                      'Animated Align & Opacity',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _triggerA,
              child: const Text('Go!'),
            ),
            const SizedBox(
              height: 30,
            ),
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 800,
              ),
              height: size.width * 0.4,
              width: size.width * 0.4,
              transformAlignment: Alignment.center,
              transform: Matrix4.rotationZ(
                _visibleB ? 0 : 1,
              ),
              decoration: BoxDecoration(
                color: _visibleB ? Colors.red : Colors.blue,
                borderRadius: BorderRadius.circular(
                  _visibleB ? 0 : 100,
                ),
              ),
              child: const Text(
                'Animated Container',
                textAlign: TextAlign.center,
              ),
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
