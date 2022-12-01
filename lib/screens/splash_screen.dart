import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Pedagodino/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            // logo here
            Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            //Center(
            //child: CircularProgressIndicator(
            //valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            //),
            //)
          ],
        ),
      ),
    );
  }
}
