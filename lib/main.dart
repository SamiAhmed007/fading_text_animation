import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAnimation(),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true;
  bool _showFrame = false; // New boolean to control frame

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void toggleFrame(bool value) {
    setState(() {
      _showFrame = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Text Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggleVisibility,
          child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Container(
              decoration: _showFrame
                  ? BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    )
                  : null,
              child: const Text(
                'Hello, Flutter!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SwitchListTile(
        title: Text('Show Frame'),
        value: _showFrame,
        onChanged: toggleFrame,
      ),
    );
  }
}
