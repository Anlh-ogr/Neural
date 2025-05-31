import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'login.dart';

// for Timer function
import 'dart:async'; 


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Logger _logger = Logger();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    Timer(const Duration(seconds: 2), (){
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'img/logo.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              _logger.e('Error loading logo: $error');
              return const Icon(Icons.error, size: 50, color: Colors.red);
            }          
          ),
        ),
      )
    );
  }
}