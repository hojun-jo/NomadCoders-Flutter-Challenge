import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _barDuration = Duration(seconds: 1);

  bool _isBackgroundBlack = false;

  @override
  void initState() {
    super.initState();
    _runAnimation();
  }

  void _runAnimation() {
    Future.delayed(_barDuration, () {
      _toggleBackground();
      _runAnimation();
    });
  }

  void _toggleBackground() {
    if (_isBackgroundBlack) {
      _isBackgroundBlack = false;
    } else {
      _isBackgroundBlack = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _isBackgroundBlack ? Colors.black : Colors.white,
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            children: [
              Container(
                child:
                    _isBackgroundBlack
                        ? Container(color: Colors.red)
                        : Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
              ),
              AnimatedAlign(
                alignment:
                    _isBackgroundBlack
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                duration: _barDuration,
                child: Container(
                  color: _isBackgroundBlack ? Colors.white : Colors.black,
                  width: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
