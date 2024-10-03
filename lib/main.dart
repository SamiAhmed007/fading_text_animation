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
  bool _showFrame = false;
  bool _showImage = true; // New boolean to control image visibility

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

  void toggleImageVisibility() {
    setState(() {
      _showImage = !_showImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Text & Image Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: toggleVisibility,
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: _showFrame
                      ? BoxDecoration(
                          border: Border.all(color: Colors.blueAccent, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  child: const Text(
                    'Hello, Flutter!',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _showImage
                ? Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage('assets/img2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            title: Text('Show Frame'),
            value: _showFrame,
            onChanged: toggleFrame,
          ),
          SwitchListTile(
            title: Text('Show Image'),
            value: _showImage,
            onChanged: (bool value) {
              toggleImageVisibility();
            },
          ),
        ],
      ),
    );
  }
}
